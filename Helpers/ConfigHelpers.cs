using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Newtonsoft.Json.Linq;
using Npgsql;

namespace PgMaskingProxy.Helpers
{
    static public class ConfigHelper
    {
        static public DataMaskingModel populateMaskingModel()
        {
            if(!File.Exists("config.json"))
            {
                Console.WriteLine("Cannot find config.json");
                throw new Exception("Cannot find config.json");
            }
            var j = JObject.Parse(File.ReadAllText("config.json"));
            return (j["masking_options"] as JObject).ToObject<DataMaskingModel>();
        }

        static public Dictionary<uint, PostgresDataTypes> populateDataTypeOids()
        {
            if(!File.Exists("config.json"))
            {
                throw new Exception("Cannot find config.json");
            }

            var result = new Dictionary<uint, PostgresDataTypes>();

            var j = JObject.Parse(File.ReadAllText("config.json"));
            var dbDetails = (JObject)j["db_connection_details"];
            string host = (string)dbDetails["ip"];
            int port = (int)dbDetails["port"];
            string user = (string)dbDetails["user"];
            string password = (string)dbDetails["password"];
            string database = (string)dbDetails["database"];
            bool requireSsl = dbDetails.ContainsKey("requireSsl") ? (bool)dbDetails["requireSsl"] : false;

            using(NpgsqlConnection conn =  ConnectionGetter.GetDbConnection(database, port, host, user, password, requireSsl))
            {
                conn.Open();

                var cmd = conn.CreateCommand();
                var dataTypes = Enum.GetNames(typeof(PostgresDataTypes));
                var selectQuery = string.Join(",",dataTypes.Select(x=>x.Replace("_"," ")).Select(x=>$"'{x}'::regtype::oid as \"{x}\""));
                cmd.CommandText = $@"select
                                        {selectQuery};";
                using (var reader = cmd.ExecuteReader())
                {
                    reader.Read();
                    int i = 0;
                    foreach(string dataType in dataTypes)
                    {
                        result.Add((uint)reader.GetValue(i), Enum.Parse<PostgresDataTypes>(dataType));
                        i++;
                    }
                }
            }
            return result;
        }

        static public HashSet<uint> populateNonSystemTableOids(Dictionary<uint, (string table, string schema)> oidToTableSchemaName)
        {
            return new HashSet<uint>(oidToTableSchemaName.Keys.ToList());
        }

        static public Dictionary<uint, (string table, string schema)> populateTableOidsMapper()
        {
            if(!File.Exists("config.json"))
            {
                Console.WriteLine("Cannot find config.json");
                throw new Exception("Cannot find config.json");
            }

            var result = new Dictionary<uint, (string table, string schema)>();

            var j = JObject.Parse(File.ReadAllText("config.json"));
            var dbDetails = (JObject)j["db_connection_details"];
            string host = (string)dbDetails["ip"];
            int port = (int)dbDetails["port"];
            string user = (string)dbDetails["user"];
            string password = (string)dbDetails["password"];
            string database = (string)dbDetails["database"];
            bool requireSsl = dbDetails.ContainsKey("requireSsl") ? (bool)dbDetails["requireSsl"] : false;

            using(NpgsqlConnection conn =  ConnectionGetter.GetDbConnection(database, port, host, user, password, requireSsl))
            {
                conn.Open();

                var cmd = conn.CreateCommand();
                cmd.CommandText = @"select c.oid as obj_id, c.relname as table,n.nspname as schema from pg_class as c
                                        JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace
                                        where n.nspname not in ('information_schema') and n.nspname not like 'pg_%' and c.relkind in ('r','m','v');";
                using (var reader = cmd.ExecuteReader())
                {
                    while(reader.Read())
                    {
                        uint oid = Convert.ToUInt32(reader.GetValue(0));
                        string table = (string)reader.GetValue(1);
                        string schema = (string)reader.GetValue(2);
                        result.Add(oid, (table,schema));
                    }
                }
            }
            return result;
        }

        static public HashSet<ColumnModel> populateAllPksAndFks()
        {
            if(!File.Exists("config.json"))
            {
                Console.WriteLine("Cannot find config.json");
                throw new Exception("Cannot find config.json");
            }

            var j = JObject.Parse(File.ReadAllText("config.json"));
            var dbDetails = (JObject)j["db_connection_details"];
            string host = (string)dbDetails["ip"];
            int port = (int)dbDetails["port"];
            string user = (string)dbDetails["user"];
            string password = (string)dbDetails["password"];
            string database = (string)dbDetails["database"];
            bool requireSsl = dbDetails.ContainsKey("requireSsl") ? (bool)dbDetails["requireSsl"] : false;

            var result = new HashSet<ColumnModel>();
            using(NpgsqlConnection conn =  ConnectionGetter.GetDbConnection(database, port, host, user, password, requireSsl))
            {
                conn.Open();
                var cmd = conn.CreateCommand();
                cmd.CommandText = @"SELECT
                                        t.table_schema AS schema_of_table,
                                        t.table_name AS table_name,
                                        c.column_name AS column_name,
                                        coalesce(bool_or(constraint_type IN ('PRIMARY KEY', 'FOREIGN KEY')), FALSE) AS is_key_column
                                    FROM
                                        information_schema.columns AS c
                                    JOIN
                                        information_schema.tables AS t ON t.table_schema = c.table_schema AND t.table_name = c.table_name
                                    LEFT JOIN
                                        information_schema.key_column_usage AS kc
                                            ON kc.table_schema = c.table_schema AND kc.table_name = c.table_name AND kc.column_name = c.column_name
                                    LEFT JOIN
                                        information_schema.table_constraints AS tc
                                            ON tc.constraint_schema = kc.constraint_schema AND tc.constraint_name = kc.constraint_name
                                    WHERE
                                        t.table_schema NOT IN ('information_schema', 'pg_catalog')
                                        AND t.table_type = 'BASE TABLE'
                                    GROUP BY 1, 2, 3;";


                using (var reader = cmd.ExecuteReader())
                {
                    while(reader.Read())
                    {
                        var schema = (string)reader.GetValue(0);
                        var table = (string)reader.GetValue(1);
                        var column = (string)reader.GetValue(2);
                        var isKey = (bool)reader.GetValue(3);
                        if(isKey)
                        {
                            result.Add(new ColumnModel {Column = column, Schema = schema, Table = table});
                        }
                    }
                }
            }
            return result;
        }
    }
}
