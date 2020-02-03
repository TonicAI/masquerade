using System;
using System.Collections.Generic;
using System.Data.Common;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading;
using Newtonsoft.Json.Linq;
using Npgsql;
using PgMaskingProxy.Helpers;
using PgMaskingProxy.Maskers;
using PgMaskingProxy.Models;

namespace PgMaskingProxy
{
    public class PostgresDataMasker
    {
        private TcpProxy _tcpProxy;

        private readonly PostgresBackendStateMachine _pgStateMachine;

        private ConfigState _state;
        private ConfigState _nextState;

        private readonly FileSystemWatcher _fileWatcher = new FileSystemWatcher();
        private bool _configHasChanged = false;
        public PostgresDataMasker()
        {
            DbProviderFactories.RegisterFactory("Npgsql", Npgsql.NpgsqlFactory.Instance);
            _pgStateMachine = new PostgresBackendStateMachine(this.shouldModifyTable, this.modifyDataRow);
            _fileWatcher.Path = Directory.GetCurrentDirectory();
            _fileWatcher.Filter="config.json";
            _fileWatcher.NotifyFilter = NotifyFilters.LastWrite;
            _fileWatcher.Changed += (s,e) => {
                _configHasChanged = true;
            };
            _fileWatcher.EnableRaisingEvents = true;
            loadState();
        }

        private void loadState()
        {
            Console.WriteLine("Starting Proxy...");

            while(true)
            {
                try
                {
                    _nextState = new ConfigState();
                    _nextState._maskingModel = ConfigHelper.populateMaskingModel();
                    _nextState._oidToTableSchemaName = ConfigHelper.populateTableOidsMapper();
                    _nextState._nonSystemTableOids = ConfigHelper.populateNonSystemTableOids(_nextState._oidToTableSchemaName);
                    _nextState._oidToDataType = ConfigHelper.populateDataTypeOids();
                    _nextState._keyedColumns = ConfigHelper.populateAllPksAndFks();
                    _state = _nextState;
                    _nextState = null;
                    break;
                }
                catch(Exception ex)
                {
                    Console.WriteLine(ex.ToString());
                    Console.WriteLine("Failed to start.  This is most likely because we failed to connect to your database to run some preliminary queries.  Ensure the db_connection_details in config.json are correct and that your database is reachable from this machine.   Trying again 5 seconds...");
                    Thread.Sleep(5000);
                }
            }
        }

        public void Start()
        {
            if(!File.Exists("config.json"))
            {
                Console.WriteLine("Cannot find config.json");
                throw new Exception("Cannot find config.json");
            }

            var j = JObject.Parse(File.ReadAllText("config.json"));

            int proxyPort = (int)j["proxy_port"];
            string proxySourceIp = (string)j["proxy_source_ip"];

            if(String.IsNullOrEmpty(proxySourceIp))
            {
              proxySourceIp = "127.0.0.1";
            }

            var dbDetails = (JObject)j["db_connection_details"];
            string dbIp = (string)dbDetails["ip"];
            int dbPort = (int)dbDetails["port"];
            string db = (string)dbDetails["database"];
            string user = (string)dbDetails["user"];

            Console.WriteLine("Proxy Running:");
            Console.WriteLine($"\tProxy Port: {proxyPort}");
            Console.WriteLine($"\tDatabase Details: {user}@{dbIp}:{dbPort}/{db}");
            _tcpProxy = new TcpProxy(_pgStateMachine.ProcessBuffer, _pgStateMachine.SetStateToInitial);
            _tcpProxy.Start(new IPEndPoint(IPAddress.Parse(proxySourceIp), proxyPort), new IPEndPoint(IPAddress.Parse(dbIp), dbPort));
        }

        private Func<string,string> getMaskingFunction(uint tableOid, uint dataTypeOid, string columnName)
        {
            if(_configHasChanged)
            {
                loadState();
                _configHasChanged = false;
            }
            (string table, string schema) = _state._oidToTableSchemaName[tableOid];
            var maskedColumn = _state._maskingModel.MaskedColumns.FirstOrDefault(x=>x.ColumnName==columnName && x.TableName == table && x.SchemaName == schema);
            if(maskedColumn!=null)
            {
                return maskedColumn.MaskingFunction;
            }

            var dataType = Enum.GetName(typeof(PostgresDataTypes), _state._oidToDataType[dataTypeOid]);
            var maskedDataType = _state._maskingModel.MaskedDataTypes.FirstOrDefault(x=>x.DataType==dataType);
            if(maskedDataType!=null)
            {
                return maskedDataType.MaskingFunction;
            }

            return (s) => s;
        }

        private MemoryStream modifyDataRow(DataRowMessage dataRow, RowDescriptionMessage rowDescription)
        {
            Func<string,string> maskingFunction;
            var ms = new MemoryStream();
            ms.Write(EndianHelpers.ToBigE(dataRow.NumFields));

            int i = 0;
            foreach(var f in dataRow.DataRowFields)
            {
                uint tableOid = rowDescription.FieldDescriptions[i].ObjectId;
                string columnName = rowDescription.FieldDescriptions[i].FieldName;
                uint dataTypeOid = rowDescription.FieldDescriptions[i].DataTypeObjectId;

                //If the column vale is null or we are preserving keyed column values and the column is either a primary or foreign key.
                if(f.ColumnValueLength==-1 || (_state._maskingModel.PreserveKeys && _state.isColumnKeyed(tableOid, columnName) ) )
                {
                    ms.Write(EndianHelpers.ToBigE(f.ColumnValueLength));
                    ms.Write(f.ColumnValue);
                }
                else
                {
                    maskingFunction = getMaskingFunction(tableOid, dataTypeOid, columnName);
                    string rowValue = System.Text.Encoding.UTF8.GetString(f.ColumnValue);
                    byte[] newBytes = System.Text.Encoding.UTF8.GetBytes(maskingFunction(rowValue));
                    byte[] newLength = EndianHelpers.ToBigE(newBytes.Length);
                    ms.Write(newLength);
                    ms.Write(newBytes);
                }
                i++;
            }
            return ms;
        }

        public bool shouldModifyTable(uint oid)
        {
            return _state._nonSystemTableOids.Contains(oid);
        }

        private class ConfigState
        {
            public DataMaskingModel _maskingModel { get; set; }
            public Dictionary<uint, (string table, string schema)> _oidToTableSchemaName { get; set; }
            public HashSet<ColumnModel> _keyedColumns { get; set; }
            public Dictionary<uint, PostgresDataTypes> _oidToDataType { get; set; }
            public HashSet<uint> _nonSystemTableOids { get; set; }

            public bool isColumnKeyed(uint tableOid, string columnName)
            {
                return _keyedColumns.Contains(new ColumnModel {Column=columnName, Table = _oidToTableSchemaName[tableOid].table, Schema = _oidToTableSchemaName[tableOid].schema});
            }
        }
    }
}
