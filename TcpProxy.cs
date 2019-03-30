using System;
using System.IO;
using System.Net;
using System.Net.Sockets;
using PgMaskingProxy.Helpers;

namespace PgMaskingProxy
{
    public class TcpProxy
    {
        private readonly Func<byte[],int, MemoryStream> _processBytesReceivedFromDb;
        private readonly Socket _clientSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
        private Socket _dbSocket;
        private bool _inProcessOfNegotiatingSSL = false;
        Action _resetStatemachine;
        public TcpProxy(Func<byte[],int, MemoryStream> processBytesReceivedFromDb, Action resetStateMachine)
        {
            _resetStatemachine = resetStateMachine;
            _processBytesReceivedFromDb = processBytesReceivedFromDb;
        }

        //Waits for a connection from SQL Client and then listens for bytes.  Also, sets up connection to Database.
        public void Start(IPEndPoint local, IPEndPoint remote)
        {
            _clientSocket.Bind(local);
            _clientSocket.Listen(10);

            while(true)
            {
                var source = _clientSocket.Accept();
                if(_dbSocket!=null)
                {
                    _dbSocket.Close();
                }
                _dbSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
                _dbSocket.Connect(remote);
                var state = new State(source, _dbSocket);
                source.BeginReceive(state.ClientBuffer, 0, state.ClientBuffer.Length, 0, OnDataReceiveFromClient, state);
                _dbSocket.BeginReceive(state.DatabaseBuffer, 0, state.DatabaseBuffer.Length, SocketFlags.None, OnDataReceiveFromDb, state);
            }
        }

        private void OnDataReceiveFromClient(IAsyncResult result)
        {
            var state = (State)result.AsyncState;
            try
            {
                var bytesRead = state.ClientSocket.EndReceive(result);

                if (bytesRead > 0)
                {
                    //here we check to see if front end has sent an SSLRequest message.
                    //TODO: Currently, we assume the SSLRequest will come in a single buffer read.  If the message were to come in two or more reads we would miss it.
                    if(EndianHelpers.SwapEndianness(BitConverter.ToUInt32(state.ClientBuffer, 0))==8 && EndianHelpers.SwapEndianness(BitConverter.ToUInt32(state.ClientBuffer, 4))==80877103)
                    {
                        Console.WriteLine("Client has made SSLRequest.  This is not supported.");
                        _inProcessOfNegotiatingSSL = true;
                    }

                    //do nothing for now. Add logic here to parse FrontEnd requests.
                    state.DatabaseSocket.Send(state.ClientBuffer, bytesRead, SocketFlags.None);
                    state.ClientSocket.BeginReceive(state.ClientBuffer, 0, state.ClientBuffer.Length, 0, OnDataReceiveFromClient, state);
                }
            }
            catch
            {
                state.ClientSocket.Close();
                state.DatabaseSocket.Close();
                _resetStatemachine();
            }
        }

        //This is the callback for data received for both the connection from the client and to the DB.
        private void OnDataReceiveFromDb(IAsyncResult result)
        {
            var state = (State)result.AsyncState;
            try
            {
                var bytesRead = state.DatabaseSocket.EndReceive(result);

                if (bytesRead > 0)
                {
                    //if we are in process of negotiating SSL we intercept the response from the DB and send back a single byte 'N' which is the start of a NoticeResponse message and indicates DB doesnt support SSL.  Client will either then abort trying to connect or fallback to non-ssl connection depending on client, sslmode, etc.
                    if(_inProcessOfNegotiatingSSL)
                    {
                        Console.WriteLine("Responding to client SSLRequest with a NoticeResponse, indicating SSL is not supported.  Client may or may not fall back to an unsecure protocol.");
                        _inProcessOfNegotiatingSSL = false;
                        state.ClientSocket.Send(new byte[1] {78}, 0, 1, SocketFlags.None);
                    }
                    else
                    {
                        var possiblyModifiedData = _processBytesReceivedFromDb(state.DatabaseBuffer, bytesRead);
                        if(possiblyModifiedData!=null)
                        {
                            var b = possiblyModifiedData.GetBuffer();
                            var l = possiblyModifiedData.Length;
                            state.ClientSocket.Send(b, (int)l, SocketFlags.None);
                        }
                    }
                    state.DatabaseSocket.BeginReceive(state.DatabaseBuffer, 0, state.DatabaseBuffer.Length, 0, OnDataReceiveFromDb, state);
                }
            }
            catch
            {
                state.ClientSocket.Close();
                state.DatabaseSocket.Close();
                _resetStatemachine();
            }
        }

        private class State
        {
            public Socket ClientSocket { get; private set; }
            public Socket DatabaseSocket { get; private set; }
            public byte[] ClientBuffer { get; private set; }
            public byte[] DatabaseBuffer { get; private set; }

            public State(Socket clientSocket, Socket dbSocker)
            {
                ClientSocket = clientSocket;
                DatabaseSocket = dbSocker;
                ClientBuffer = new byte[32768];
                DatabaseBuffer = new byte[32768];
            }
        }
    }
}
