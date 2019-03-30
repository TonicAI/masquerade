using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;

namespace PgMaskingProxy.Helpers
{
    public static class NextShortExtension
    {
        public static short NextShort(this System.Random rnd) {
            byte[] buffer = new byte[2];
            rnd.NextBytes(buffer);
            return BitConverter.ToInt16(buffer);
        }
    }
}
