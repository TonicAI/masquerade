using System;
using System.IO;
using System.Net;
using PgMaskingProxy.Helpers;
using PgMaskingProxy.Models;

namespace PgMaskingProxy
{
    public class Program
    {
        static void Main(string[] args)
        {
            var t = new PostgresDataMasker();
            t.Start();
        }
    }
}
