using System.Data;
using System.Web.Services;

namespace WebService
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]

    public class ProductService : System.Web.Services.WebService
    {
        [WebMethod]
        public DataTable GetTableByID(string id)
        {
            string sql = "SELECT * FROM Product WHERE ProductID = " + id;
            DataTable dt = SQLQuery.ExecuteQuery(sql);
            dt.TableName = "Product";
            return dt;
        }

        [WebMethod]
        public DataTable GetTable()
        {
            string sql = "SELECT * FROM Product, Trademark WHERE Product.TrademarkID = Trademark.TrademarkID";
            DataTable dt = SQLQuery.ExecuteQuery(sql);
            dt.TableName = "Product";
            return dt;
        }

        [WebMethod]
        public DataTable Search(string keyword)
        {
            string sql = "SELECT * FROM Product, Trademark WHERE Product.TrademarkID = Trademark.TrademarkID AND Product.ProductID LIKE '" + keyword + "' OR ProductName LIKE N'%" + keyword + "%'";
            DataTable dt = SQLQuery.ExecuteQuery(sql);
            dt.TableName = "Product";
            return dt;
        }

        [WebMethod]
        public bool Add(string name, string price, string percentSales, string thumbnail, string color, string trademarkID)
        {
            string sql = "INSERT INTO Product (ProductName, Price, PercentSales, Thumbnail, Color, TrademarkID) VALUES (N'" + name + "', " + price + ", " + percentSales + ", N'" + thumbnail + "', N'" + color + "', " + trademarkID + ")";
            return SQLQuery.ExecuteNonQuery(sql) > 0;
        }

        [WebMethod]
        public bool Update(string id, string name, string price, string percentSales, string thumbnail, string color, string trademarkID)
        {
            string sub_sql = "";
            if (thumbnail != "")
                sub_sql = ", Thumbnail = N'" + thumbnail + "'";

            string sql = "UPDATE Product SET ProductName = N'" + name + "', Price = " + price + ", PercentSales = " + percentSales + ", Color = N'" + color + "'" + sub_sql + ", TrademarkID = " + trademarkID + " WHERE ProductID = " + id;
            return SQLQuery.ExecuteNonQuery(sql) > 0;
        }

        [WebMethod]
        public bool Delete(string id)
        {
            string sql = "DELETE Product WHERE ProductID = " + id;
            return SQLQuery.ExecuteNonQuery(sql) > 0;
        }
    }
}
