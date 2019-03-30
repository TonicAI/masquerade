using System.Data.Common;
using Npgsql;

namespace PgMaskingProxy.Helpers
{
    public static class ConnectionGetter
    {
        public static NpgsqlConnection GetDbConnection(string database, int port, string host, string username, string password, bool requireSsl = false)
        {
            var dbProviderFactory = DbProviderFactories.GetFactory("Npgsql");
            var connectionStringBuilder = dbProviderFactory.CreateConnectionStringBuilder();
            connectionStringBuilder.Add("Database", database);
            connectionStringBuilder.Add("Port", port);
            connectionStringBuilder.Add("Host", host);
            connectionStringBuilder.Add("Password", password);
            connectionStringBuilder.Add("Username", username);
            connectionStringBuilder.Add("SslMode", requireSsl ? SslMode.Require : SslMode.Disable);
            connectionStringBuilder.Add("TrustServerCertificate", true);
            connectionStringBuilder.Add("Pooling", true);

            var connection = dbProviderFactory.CreateConnection() as NpgsqlConnection;
            connection.ConnectionString = connectionStringBuilder.ToString();
            return connection;
        }
    }
}
