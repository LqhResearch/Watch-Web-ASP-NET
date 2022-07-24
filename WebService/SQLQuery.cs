using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace WebService
{
    public class SQLQuery
    {
        static string connectionString = @"Data Source=DESKTOP-D2G2B8C\LAB3D;Initial Catalog=Watch;Integrated Security=True";

        /// <summary>
        /// Truy vấn trả về một DataTable, phù hợp thực hiện các truy vấn như Select.
        /// </summary>
        public static DataTable ExecuteQuery(string query, object[] parameters = null)
        {
            DataTable dt = new DataTable();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);
                try
                {
                    if (parameters != null)
                    {
                        string[] listPara = query.Split(' ');
                        int i = 0;
                        foreach (string item in listPara)
                            if (item.Contains('@'))
                            {
                                string tmp = item;
                                if (item[item.Length - 1] == ',')
                                    tmp = item.Remove(item.Length - 1);
                                command.Parameters.AddWithValue(tmp, parameters[i]);
                                i++;
                            }
                    }
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(dt);
                }
                catch (System.Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    connection.Close();
                }
            }
            return dt;
        }

        /// <summary>
        /// Truy vấn phù hợp thực hiện các truy vấn như Insert, Update, Delete.
        /// </summary>
        public static int ExecuteNonQuery(string query, object[] parameters = null)
        {
            int data = 0;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);
                try
                {
                    if (parameters != null)
                    {
                        string[] listPara = query.Split(' ');
                        int i = 0;
                        foreach (string item in listPara)
                            if (item.Contains('@'))
                            {
                                string tmp = item;
                                if (item[item.Length - 1] == ',')
                                    tmp = item.Remove(item.Length - 1);
                                command.Parameters.AddWithValue(tmp, parameters[i]);
                                i++;
                            }
                    }
                    data = command.ExecuteNonQuery();
                }
                catch (SqlException ex)
                {
                    throw ex;
                }
                finally
                {
                    connection.Close();
                }
            }
            return data;
        }

        /// <summary>
        /// Trả về một giá trị duy nhất - ở hàng đầu tiên, cột đầu tiên
        /// </summary>
        public static object ExecuteScalar(string query, object[] parameters = null)
        {
            object data = 0;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);
                try
                {
                    if (parameters != null)
                    {
                        string[] listPara = query.Split(' ');
                        int i = 0;
                        foreach (string item in listPara)
                            if (item.Contains('@'))
                            {
                                string tmp = item;
                                if (item[item.Length - 1] == ',')
                                    tmp = item.Remove(item.Length - 1);
                                command.Parameters.AddWithValue(tmp, parameters[i]);
                                i++;
                            }
                    }
                    data = command.ExecuteScalar();
                }
                catch (System.Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    connection.Close();
                }
            }
            return data;
        }

        /// <summary>
        /// Kiểm tra khoá chính có tồn tại hay không?
        /// </summary>
        /// <returns></returns>
        public static bool HasExistPrimaryKey(string tableName, string primaryKeyName, object primaryKeyValue)
        {
            bool check = false;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "";
                double doubleValue = 0.0;
                try
                {
                    if (double.TryParse(primaryKeyValue.ToString(), out doubleValue))
                    {
                        // Sử dụng cho các trường hợp là số: int, float, ...
                        query = @"select " + primaryKeyName + " from " + tableName + " where " + primaryKeyName + " = " + primaryKeyValue;
                    }
                    else
                    {
                        // Sử dụng cho các trường hợp là kí tự hoặc ngày: nvarchar, varchar, date, time, datetime
                        query = @"select " + primaryKeyName + " from " + tableName + " where " + primaryKeyName + " = N'" + primaryKeyValue + "'";
                    }
                    SqlCommand command = new SqlCommand(query, connection);
                    if (command.ExecuteScalar() != null)
                        check = true;
                }
                catch (System.Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    connection.Close();
                }
            }
            return check;
        }

        /// <summary>
        /// Lấy bảng từ cơ sở dữ liệu
        /// </summary>
        /// <param name="tableName"></param>
        /// <returns></returns>
        public DataTable GetTable(string tableName)
        {
            DataTable dt = new DataTable();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"select * from " + tableName;
                SqlCommand command = new SqlCommand(query, connection);
                try
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(dt);
                }
                catch (System.Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    connection.Close();
                }
            }
            return dt;
        }
    }
}