using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using PgMaskingProxy.Enums;
using PgMaskingProxy.Helpers;
using PgMaskingProxy.Models;

namespace PgMaskingProxy
{
    //Keep track of all bytes coming from backend and maintains a state machine.
    public class PostgresBackendStateMachine
    {

        private bool waitingForStartOfMessage;
        private BackEndMessageType currentMessageType;

        private MemoryStream messageContents;

        private bool waitingForMessageLength;
        private int msgLengthBufferIdx;
        private byte[] msgLengthBuffer;
        private int msgLength;


        private bool waitingToProcessMessage;

        private bool shouldSkipBytesAtBeginningOfNextReadBuffer;
        private int numberOfBytesToSkipAtBeginning;

        private RowDescriptionMessage currentRowDescription;
        Func<uint,bool> _shouldModifyTable;
        Func<DataRowMessage, RowDescriptionMessage, MemoryStream> _modifyDataRow;

        public PostgresBackendStateMachine(Func<uint,bool> shouldModifyTable, Func<DataRowMessage, RowDescriptionMessage, MemoryStream> modifyDataRow)
        {
            this.SetStateToInitial();
            _modifyDataRow = modifyDataRow;
            _shouldModifyTable = shouldModifyTable;
        }

        public MemoryStream ProcessBuffer(byte[] buffer, int length)
        {
            MemoryStream dataToSendBack = null;  //is only non-null when we've received a complete message.
            int i = 0;
            if(shouldSkipBytesAtBeginningOfNextReadBuffer)
            {
                if(numberOfBytesToSkipAtBeginning>length)
                {
                    messageContents.Write(buffer, 0, length);
                    numberOfBytesToSkipAtBeginning-=length;
                    i=length;
                }
                else
                {
                    messageContents.Write(buffer, 0, numberOfBytesToSkipAtBeginning);
                    if(dataToSendBack==null)
                    {
                        dataToSendBack = new MemoryStream();
                    }
                    var processMessageResult = processCompleteMessage();
                    dataToSendBack.Write(processMessageResult.buffer,0,processMessageResult.length);

                    i+=numberOfBytesToSkipAtBeginning;
                    shouldSkipBytesAtBeginningOfNextReadBuffer = false;
                    numberOfBytesToSkipAtBeginning = 0;
                }
            }

            while(i<length)
            {
                byte b = buffer[i];

                if(waitingForStartOfMessage)
                {
                    messageContents.WriteByte(b);
                    currentMessageType = identifyBackEndMessage(b);
                    waitingForStartOfMessage = false;
                    waitingForMessageLength = true;
                    i++;
                }
                else if(waitingForMessageLength)
                {
                    msgLengthBuffer[msgLengthBufferIdx] = buffer[i];
                    msgLengthBufferIdx++;
                    i++;
                    if(msgLengthBufferIdx==msgLengthBuffer.Length)
                    {
                        messageContents.Write(msgLengthBuffer);
                        msgLength = getMessageLength(msgLengthBuffer);
                        msgLength-=4; //since message length includes the 4 bytes we just read.
                        waitingForMessageLength = false;
                        waitingToProcessMessage = true;
                        msgLengthBufferIdx = 0;
                    }
                }
                else if(waitingToProcessMessage)
                {
                    if(length-i>=msgLength)
                    {
                        messageContents.Write(buffer, i, msgLength);
                        if(dataToSendBack==null)
                        {
                            dataToSendBack = new MemoryStream();
                        }
                        var processedMessageResult = processCompleteMessage();
                        dataToSendBack.Write(processedMessageResult.buffer,0,processedMessageResult.length);
                        i+=msgLength;
                    }
                    else
                    {
                        messageContents.Write(buffer, i, length-i);
                        shouldSkipBytesAtBeginningOfNextReadBuffer = true;
                        numberOfBytesToSkipAtBeginning = msgLength-(length-i);
                        i=length;
                    }
                    waitingToProcessMessage = false;
                    waitingForStartOfMessage = true;
                }
            }
            return dataToSendBack;
        }

        //guaranteed that buffer will contain complete message
        private (byte[] buffer, int length) processCompleteMessage()
        {
            messageContents.Seek(0,SeekOrigin.Begin);
            long l = messageContents.Length;
            var buf = messageContents.GetBuffer();
            messageContents.Dispose();
            messageContents = new MemoryStream();
            if(currentMessageType==BackEndMessageType.DataRow)
            {
                if(currentRowDescription.ShouldModify)
                {
                    var t = handleDataRow(buf, msgLength);
                    return (t, t.Length);
                }
            }
            else if(currentMessageType==BackEndMessageType.RowDescription)
            {
                handleRowDescription(buf, 5, msgLength);
            }
            return (buf, (int)l);
        }

        private byte[] addMsgTypeAndLengthToUnmodifiedMessage()
        {
            byte[] buf = new byte[5];
            buf[0] = (byte)currentMessageType;
            BitConverter.GetBytes(msgLength).CopyTo(buf,1);
            return buf;
        }

        private byte[] handleDataRow(byte[] buffer, int messageLength)
        {
            var dataRow = new DataRowMessage();

            int offset = 5; //1 byte for message type and 4 bytes for the int32 that states the length.
            ushort numFields = EndianHelpers.SwapEndianness(BitConverter.ToUInt16(buffer, 5));
            dataRow.NumFields = numFields;
            if(numFields!=0)
            {
                dataRow.DataRowFields = new List<DataRowField>(numFields);
            }
            offset+=2;
            for(int i = 0; i < numFields; i++)
            {
                var dataRowField = new DataRowField();
                int columnValueLength = IPAddress.NetworkToHostOrder(BitConverter.ToInt32(buffer, offset));
                dataRowField.ColumnValueLength = columnValueLength;
                offset+=4;
                if(columnValueLength!=-1)
                {
                    dataRowField.ColumnValue = new byte[columnValueLength];
                    Buffer.BlockCopy(buffer, offset, dataRowField.ColumnValue, 0, columnValueLength);
                    var colValue = Encoding.ASCII.GetString(buffer, offset, columnValueLength);
                    offset+=columnValueLength;
                }
                dataRow.DataRowFields.Add(dataRowField);
            }
            var modifiedResultStream = _modifyDataRow(dataRow,currentRowDescription);
            modifiedResultStream.Seek(0,SeekOrigin.Begin);
            var message = new byte[modifiedResultStream.Length+5];
            message[0]=buffer[0];

            var newLength = EndianHelpers.ToBigE((int)modifiedResultStream.Length+4);
            message[1]=newLength[0];
            message[2]=newLength[1];
            message[3]=newLength[2];
            message[4]=newLength[3];
            modifiedResultStream.Read(message, 5, (int)modifiedResultStream.Length);
            return message;
        }
        private void handleRowDescription(byte[] buffer, int offset, int messageLength)
        {
            ushort numFields = EndianHelpers.SwapEndianness(BitConverter.ToUInt16(buffer, offset));
            offset+=2;
            currentRowDescription = new RowDescriptionMessage();
            currentRowDescription.NumFields = numFields;
            currentRowDescription.FieldDescriptions = new List<RowDescriptionField>();
            for(int i = 0; i < numFields; i++)
            {
                RowDescriptionField df = new RowDescriptionField();
                int z = offset;
                while(buffer[z]!=0)
                {
                    z++;
                }

                string fieldName = Encoding.ASCII.GetString(buffer, offset, z-offset);
                offset = z+1; //we add 1 because string will end with a null.
                df.FieldName = fieldName;

                uint objectId = EndianHelpers.SwapEndianness(BitConverter.ToUInt32(buffer, offset));
                offset+=4;
                df.ObjectId = objectId;

                ushort attrId = EndianHelpers.SwapEndianness(BitConverter.ToUInt16(buffer, offset));
                offset+=2;
                df.AttrId = attrId;

                uint dataTypeObjectId = EndianHelpers.SwapEndianness(BitConverter.ToUInt32(buffer, offset));
                offset+=4;
                df.DataTypeObjectId = dataTypeObjectId;

                ushort dataTypeSize = EndianHelpers.SwapEndianness(BitConverter.ToUInt16(buffer, offset));
                offset+=2;
                df.DataTypeSize = dataTypeSize;

                uint typeModifier = EndianHelpers.SwapEndianness(BitConverter.ToUInt32(buffer, offset));
                offset+=4;
                df.TypeModifier = typeModifier;

                ushort formatCode = EndianHelpers.SwapEndianness(BitConverter.ToUInt16(buffer, offset));
                offset+=2;
                df.FormatCode = formatCode;

                currentRowDescription.FieldDescriptions.Add(df);
            }
            var shouldModify = _shouldModifyTable(currentRowDescription.FieldDescriptions.First().ObjectId);
            currentRowDescription.ShouldModify = shouldModify;
        }

        private int getMessageLength(byte[] buffer)
        {
            return (int)EndianHelpers.SwapEndianness(BitConverter.ToUInt32(buffer));
        }

        private BackEndMessageType identifyBackEndMessage(byte b)
        {
            if(Enum.IsDefined(typeof(BackEndMessageType), (int)b))
            {
                return (BackEndMessageType)b;
            }
            else
            {
                throw new Exception($"Unknown backend message type: {b}");
            }
        }

        public void SetStateToInitial()
        {
            waitingForStartOfMessage = true;
            messageContents = new MemoryStream();
            waitingForMessageLength = false;
            msgLengthBufferIdx = 0;
            msgLengthBuffer = new byte[4];
            msgLength = -1;
            waitingToProcessMessage = false;
            shouldSkipBytesAtBeginningOfNextReadBuffer = false;
            numberOfBytesToSkipAtBeginning = 0;
            currentRowDescription = null;
        }
    }
}
