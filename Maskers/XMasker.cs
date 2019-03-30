//Replaces all characters with the character 'x'
namespace PgMaskingProxy.Maskers
{
    static public class XMasker
    {
        //Replaces all characters with 'x'.
        static public string MaskX(string value)
        {
            return new string('x',value.Length);
        }
    }
}
