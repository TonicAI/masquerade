//A bunch of different masking functions that operate on columns with a certain data type in a reasonable way.
using System;
using PgMaskingProxy.Helpers;

namespace PgMaskingProxy.Maskers
{
    //a set of simple maskers mostly used for different data types.
    static public class SimpleMaskers
    {
        private static Random _rng = new Random();
        private static DateTime minDate = new DateTime(1950,1,1);
        private static DateTime maxDate = DateTime.Today;

        static public string MaskBigInt(string val)
        {
            long v = Int64.Parse(val);
            long n = _rng.NextLong(0,v+1);
            return v<0 ? (-1*n).ToString() : n.ToString();
        }

        static public string MaskInteger(string val)
        {
            int v = Int32.Parse(val);
            int n = _rng.Next(v+1);
            return v<0 ? (-1*n).ToString() : n.ToString();
        }

        static public string MaskTinyInt(string val)
        {
            short v = Int16.Parse(val);
            int n = _rng.Next(v+1);
            return v<0 ? (-1*n).ToString() : n.ToString();
        }

        static public string MaskBit(string val)
        {
            return _rng.NextDouble()>0.5 ? "1" : "0";
        }

        static public string MaskBoolean(string val)
        {
            return (_rng.NextDouble()>0.5).ToString();
        }

        static public string MaskUuid(string val)
        {
            return Guid.NewGuid().ToString();
        }

        static public string MaskDouble(string val)
        {
            return (double.Parse(val)*_rng.NextDouble()).ToString();
        }

        static public string MaskDate(string val)
        {
            long ticks = (maxDate-minDate).Ticks;
            long r = _rng.NextLong(0,ticks);
            return minDate.AddTicks(r).ToString("yyyy-MM-dd");
        }

        static public string MaskTime(string val)
        {
            long r = _rng.NextLong(0,TimeSpan.TicksPerDay);
            var newTime = new TimeSpan(r);
            return newTime.ToString(@"hh\:mm\:ss");
        }

        static public string MaskTimeStamp(string val)
        {
            long ticks = (maxDate-minDate).Ticks;
            long r = _rng.NextLong(0,ticks);
            return minDate.AddTicks(r).ToString("yyyy-MM-dd HH:mm:ss");
        }
    }
}
