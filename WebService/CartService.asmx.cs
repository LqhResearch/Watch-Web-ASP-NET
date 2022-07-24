using System;
using System.Data;
using System.Web.Services;

namespace WebService
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    public class CartService : System.Web.Services.WebService
    {
        [WebMethod]
        public DataTable GetTable(string username)
        {
            string sql = "SELECT * FROM Cart, Product WHERE Cart.ProductID = Product.ProductID AND Username = N'" + username + "'";
            DataTable dt = SQLQuery.ExecuteQuery(sql);
            dt.TableName = "Cart";
            return dt;
        }

        [WebMethod]
        public bool Add(string username, string productID, string quantity)
        {
            string sql = @"IF NOT EXISTS (SELECT * FROM Cart WHERE Username = N'" + username + @"' AND ProductID = " + productID + @") 
                            BEGIN
                               INSERT INTO Cart (Username, ProductID, Quantity) VALUES (N'" + username + @"', " + productID + @", " + quantity + @")
                            END";
            return SQLQuery.ExecuteNonQuery(sql) > 0;
        }

        [WebMethod]
        public bool Update(string username, string productID, string quantity)
        {
            string sql = @"UPDATE Cart SET Quantity = " + quantity + " WHERE Username = N'" + username + "' AND ProductID = " + productID;
            return SQLQuery.ExecuteNonQuery(sql) > 0;
        }

        [WebMethod]
        public bool Delete(string username, string productID)
        {
            string sql = @"DELETE Cart WHERE Username = N'" + username + "' AND ProductID = " + productID;
            return SQLQuery.ExecuteNonQuery(sql) > 0;
        }

        [WebMethod]
        private int TotalMoneyCart(string username)
        {
            string sql = "SELECT ISNULL(SUM(Price), 0) as Money FROM Cart, Product WHERE Cart.ProductID = Product.ProductID AND Username = N'" + username + "'";
            return Convert.ToInt32(SQLQuery.ExecuteScalar(sql));
        }

        [WebMethod]
        private string CreateOrderID()
        {
            Random rd = new Random();
            string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            int len = chars.Length;
            string str = "";
            for (int i = 1; i <= 12; i++)
                str += chars[rd.Next(0, len - 1)];
            return str;
        }

        [WebMethod]
        public bool CreateOrder(string username)
        {
            int money = TotalMoneyCart(username);
            string orderID = CreateOrderID();
            string sql = "INSERT INTO Orders (OrderID, TotalMoney, PaymentMoney, Username, Status) VALUES (N'" + orderID + "', " + money + ", " + money + ", N'" + username + "', 0)";
            if (SQLQuery.ExecuteNonQuery(sql) > 0)
            {
                DataTable dt = GetTable(username);
                foreach (DataRow row in dt.Rows)
                {
                    sql = "INSERT INTO OrderDetail (OrderID, ProductID, Quantity) VALUES ('" + orderID + "', " + row["ProductID"] + ", " + row["Quantity"] + ")";
                    SQLQuery.ExecuteNonQuery(sql);
                }

                sql = "DELETE FROM Cart WHERE Username = N'" + username + "'";
                SQLQuery.ExecuteNonQuery(sql);
            }
            return true;
        }
    }
}
