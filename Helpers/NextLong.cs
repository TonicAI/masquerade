using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;

namespace PgMaskingProxy.Helpers
{
    public static class NextLongExtension
    {
        public static long NextLong(this System.Random rnd) {
            byte[] buf = new byte[8];
            rnd.NextBytes(buf);
            return BitConverter.ToInt64(buf);
        }

        public static long NextLong(this System.Random rnd, long min, long max) {
            //Working with ulong so that modulo works correctly with values > long.MaxValue
            ulong uRange = (ulong)(max - min);

            //Prevent a modolo bias; see https://stackoverflow.com/a/10984975/238419
            //for more information.
            //In the worst case, the expected number of calls is 2 (though usually it's
            //much closer to 1) so this loop doesn't really hurt performance at all.
            ulong ulongRand;
            do
            {
                byte[] buf = new byte[8];
                rnd.NextBytes(buf);
                ulongRand = (ulong)BitConverter.ToInt64(buf, 0);
            } while (ulongRand > ulong.MaxValue - ((ulong.MaxValue % uRange) + 1) % uRange);

            return (long)(ulongRand % uRange) + min;
        }
    }
}
