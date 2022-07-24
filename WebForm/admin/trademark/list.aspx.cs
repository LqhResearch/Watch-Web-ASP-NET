using System;
using System.Data;

namespace WebForm.admin.trademark
{
    public partial class list : System.Web.UI.Page
    {
        TrademarkService.TrademarkServiceSoapClient trademark = new TrademarkService.TrademarkServiceSoapClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["edit-id"] != null)
                {
                    string id = Request.QueryString["edit-id"];
                    DataRow row = trademark.GetTableByID(id).Rows[0];
                    txtID_Edit.Text = row["TrademarkID"].ToString();
                    txtName_Edit.Text = row["TrademarkName"].ToString();
                }

                if (Request.QueryString["del-id"] != null)
                {
                    string id = Request.QueryString["del-id"];
                    trademark.Delete(id);
                }

                Initial();
            }
        }

        private void Initial()
        {
            rptList.DataSource = trademark.GetTable();
            rptList.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (trademark.Add(txtName_Add.Text))
                Initial();
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (trademark.Update(txtID_Edit.Text, txtName_Edit.Text))
                Response.Redirect("list.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            DataTable dt = trademark.Search(txtSearch.Text);
            rptList.DataSource = dt;
            rptList.DataBind();

            lblList.Text = dt.Rows.Count == 0 ? "<tr class='text-center'><td colspan='100%'><i>Không có dữ liệu</i></td></tr>" : "";
        }
    }
}