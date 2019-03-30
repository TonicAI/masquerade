using System;

namespace PgMaskingProxy.Helpers
{
    //helper methods for writing integers in little endian representation
    public static class EndianHelpers
    {
        public static byte[] ToBigE(int data)
        {
            var temp = BitConverter.GetBytes(data);
            if(BitConverter.IsLittleEndian)
            {
                Array.Reverse(temp);
            }
            return temp;
        }

        public static byte[] ToBigE(ushort data)
        {
            var temp = BitConverter.GetBytes(data);
            if(BitConverter.IsLittleEndian)
            {
                Array.Reverse(temp);
            }
            return temp;
        }

        public static uint SwapEndianness(uint x)
        {
            return ((x & 0x000000ff) << 24) +
                ((x & 0x0000ff00) << 8) +
                ((x & 0x00ff0000) >> 8) +
                ((x & 0xff000000) >> 24);
        }


        public static ushort SwapEndianness(ushort x)
        {
            return (ushort)( (x>>8) | (x<<8) );
        }
    }
}
