using System.Data;
using System.Web.Services;

namespace WebService
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]

    public class SliderService : System.Web.Services.WebService
    {
        [WebMethod]
        public DataTable GetTableByID(string id)
        {
            string sql = "SELECT * FROM Slider WHERE SliderID = " + id;
            DataTable dt = SQLQuery.ExecuteQuery(sql);
            dt.TableName = "Slider";
            return dt;
        }

        [WebMethod]
        public DataTable GetTable()
        {
            string sql = "SELECT * FROM Slider";
            DataTable dt = SQLQuery.ExecuteQuery(sql);
            dt.TableName = "Slider";
            return dt;
        }

        [WebMethod]
        public DataTable GetTableActive()
        {
            string sql = "SELECT * FROM Slider WHERE Status = 1";
            DataTable dt = SQLQuery.ExecuteQuery(sql);
            dt.TableName = "Slider";
            return dt;
        }

        [WebMethod]
        public DataTable Search(string keyword)
        {
            string sql = "SELECT * FROM Slider WHERE SliderID LIKE '%" + keyword + "%' OR SliderName LIKE '%" + keyword + "%' OR Description LIKE '%" + keyword + "%'";
            DataTable dt = SQLQuery.ExecuteQuery(sql);
            dt.TableName = "Slider";
            return dt;
        }

        [WebMethod]
        public bool Add(string name, string thumbnail, string desc, string status)
        {
            string sql = "INSERT INTO Slider (SliderName, Thumbnail, Description, Status) VALUES (N'" + name + "', N'" + thumbnail + "', N'" + desc + "', " + status + ")";
            return SQLQuery.ExecuteNonQuery(sql) > 0;
        }

        [WebMethod]
        public bool Update(string id, string name, string thumbnail, string desc, string status)
        {
            string sub_sql = "";
            if (thumbnail != "")
                sub_sql = ", Thumbnail = N'" + thumbnail + "'";

            string sql = "UPDATE Slider SET SliderName = N'" + name + "', Status = " + status + ", Description = N'" + desc + "' " + sub_sql + " WHERE SliderID = " + id;
            return SQLQuery.ExecuteNonQuery(sql) > 0;
        }

        [WebMethod]
        public bool Delete(string id)
        {
            string sql = "DELETE Slider WHERE SliderID = " + id;
            return SQLQuery.ExecuteNonQuery(sql) > 0;
        }
    }
}
