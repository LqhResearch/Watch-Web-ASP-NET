using System.Data;
using System.Web.Services;

namespace WebService
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    public class UserService : System.Web.Services.WebService
    {
        [WebMethod]
        [System.Obsolete]
        public DataTable Login(string username, string password)
        {
            string sql = "SELECT Username, Fullname, Email, PermissionID FROM Users WHERE Username = N'" + username + "' AND Password = '" + Encryption.EncodeSHA1(password) + "'";
            DataTable dt = SQLQuery.ExecuteQuery(sql);
            dt.TableName = "Users";
            return dt;
        }
    }
}
