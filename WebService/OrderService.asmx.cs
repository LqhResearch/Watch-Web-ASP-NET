using System.Data;
using System.Web.Services;

namespace WebService
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    public class OrderService : System.Web.Services.WebService
    {
        [WebMethod]
        public DataTable GetTable()
        {
            string sql = "SELECT * FROM Orders";
            DataTable dt = SQLQuery.ExecuteQuery(sql);
            dt.TableName = "Order";
            return dt;
        }

        [WebMethod]
        public DataTable GetTableByID(string orderID)
        {
            string sql = "SELECT * FROM Orders WHERE OrderID = '" + orderID + "'";
            DataTable dt = SQLQuery.ExecuteQuery(sql);
            dt.TableName = "Orders";
            return dt;
        }

        [WebMethod]
        public bool Update(string orderID, string status)
        {
            string sql = "UPDATE Orders SET Status = " + status + " WHERE OrderID = '" + orderID + "'";
            return SQLQuery.ExecuteNonQuery(sql) > 0;
        }
    }
}
