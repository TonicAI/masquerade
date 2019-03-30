//Returns the same value back.
namespace PgMaskingProxy.Maskers
{
    static public class IdentityMasker
    {
        //Leave the value unchanged.  Useful for when there is a masking function applied to all columns of a given data type but you would like to avoid masking on a particular column.
        static public string Identity(string value)
        {
            return value;
        }
    }
}
