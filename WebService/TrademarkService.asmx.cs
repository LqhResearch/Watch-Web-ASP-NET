using System.Data;
using System.Web.Services;

namespace WebService
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]

    public class TrademarkService : System.Web.Services.WebService
    {
        [WebMethod]
        public DataTable GetTableByID(string id)
        {
            string sql = "SELECT * FROM Trademark WHERE TrademarkID = " + id;
            DataTable dt = SQLQuery.ExecuteQuery(sql);
            dt.TableName = "Trademark";
            return dt;
        }

        [WebMethod]
        public DataTable GetTable()
        {
            string sql = @"SELECT Trademark.TrademarkID, TrademarkName, COUNT(*) as Number
                            FROM Trademark, Product
                            WHERE Trademark.TrademarkID = Product.TrademarkID
                            GROUP BY Trademark.TrademarkID, TrademarkName";
            DataTable dt = SQLQuery.ExecuteQuery(sql);
            dt.TableName = "Trademark";
            return dt;
        }

        [WebMethod]
        public DataTable Search(string keyword)
        {
            string sql = "SELECT * FROM Trademark WHERE TrademarkID LIKE '%" + keyword + "%' OR TrademarkName LIKE '%" + keyword + "%'";
            DataTable dt = SQLQuery.ExecuteQuery(sql);
            dt.TableName = "Trademark";
            return dt;
        }

        [WebMethod]
        public bool Add(string name)
        {
            string sql = "INSERT INTO Trademark (TrademarkName) VALUES (N'" + name + "')";
            return SQLQuery.ExecuteNonQuery(sql) > 0;
        }

        [WebMethod]
        public bool Update(string id, string name)
        {
            string sql = "UPDATE Trademark SET TrademarkName = N'" + name + "' WHERE TrademarkID = " + id;
            return SQLQuery.ExecuteNonQuery(sql) > 0;
        }

        [WebMethod]
        public bool Delete(string id)
        {
            string sql = "DELETE Trademark WHERE TrademarkID = " + id;
            return SQLQuery.ExecuteNonQuery(sql) > 0;
        }
    }
}
