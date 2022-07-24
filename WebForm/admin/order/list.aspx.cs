using System;
using System.Data;

namespace WebForm.admin.order
{
    public partial class list : System.Web.UI.Page
    {
        OrderService.OrderServiceSoapClient order = new OrderService.OrderServiceSoapClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["edit-id"] != null)
                {
                    string id = Request.QueryString["edit-id"];
                    DataRow row = order.GetTableByID(id).Rows[0];
                    txtID_Edit.Text = row["OrderID"].ToString();
                    ddlStatus_Edit.SelectedValue = row["Status"].ToString();
                }

                Initial();
            }
        }

        public void Initial()
        {
            rptList.DataSource = order.GetTable();
            rptList.DataBind();
        }
        public static string ObjToVnd(object ojb) => Convert.ToInt32(ojb).ToString("C0", System.Globalization.CultureInfo.GetCultureInfo("vi-vn"));

        public static string FormatDate(object obj) => obj.ToString() != "" ? Convert.ToDateTime(obj.ToString()).ToString("dd/MM/yyyy HH:mm:ss") : "";

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (order.Update(txtID_Edit.Text, ddlStatus_Edit.SelectedValue))
                Initial();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }
    }
}