namespace WebService
{
    public class Encryption
    {
        [System.Obsolete]
        public static string EncodeSHA1(string str)
        {
            return System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(str.Trim(), "SHA1");
        }
    }
}