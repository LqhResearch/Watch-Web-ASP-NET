using System;
using System.Data;
using System.IO;

namespace WebForm.admin.product
{
    public partial class list : System.Web.UI.Page
    {
        TrademarkService.TrademarkServiceSoapClient trademark = new TrademarkService.TrademarkServiceSoapClient();
        ProductService.ProductServiceSoapClient product = new ProductService.ProductServiceSoapClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["edit-id"] != null)
                {
                    string id = Request.QueryString["edit-id"];
                    DataRow row = product.GetTableByID(id).Rows[0];
                    txtID_Edit.Text = row["ProductID"].ToString();
                    txtName_Edit.Text = row["ProductName"].ToString();
                    txtPrice_Edit.Text = row["Price"].ToString();
                    txtPercentSales_Edit.Text = row["PercentSales"].ToString();
                    txtColor_Edit.Text = row["Color"].ToString();
                    ddlTrademark_Edit.SelectedValue = row["TrademarkID"].ToString();
                }

                if (Request.QueryString["del-id"] != null)
                {
                    string id = Request.QueryString["del-id"];
                    product.Delete(id);
                }

                Initial();
            }
        }

        private void Initial()
        {
            rptList.DataSource = product.GetTable();
            rptList.DataBind();

            ddlTrademark_Add.DataSource = trademark.GetTable();
            ddlTrademark_Add.DataValueField = "TrademarkID";
            ddlTrademark_Add.DataTextField = "TrademarkName";
            ddlTrademark_Add.DataBind();

            ddlTrademark_Edit.DataSource = trademark.GetTable();
            ddlTrademark_Edit.DataValueField = "TrademarkID";
            ddlTrademark_Edit.DataTextField = "TrademarkName";
            ddlTrademark_Edit.DataBind();
        }

        public static string ObjToVnd(object ojb) => Convert.ToInt32(ojb).ToString("C0", System.Globalization.CultureInfo.GetCultureInfo("vi-vn"));

        private bool CheckFileType(string fileName)
        {
            string ext = Path.GetExtension(fileName);
            switch (ext.ToLower())
            {
                case ".gif":
                    return true;
                case ".png":
                    return true;
                case ".jpg":
                    return true;
                case ".jpeg":
                    return true;
                default:
                    return false;
            }
        }

        public string UploadFile()
        {
            string fileName = "";
            if (Page.IsValid && fThumbnail_Add.HasFile && CheckFileType(fThumbnail_Add.FileName))
            {
                fileName = "/uploads/" + fThumbnail_Add.FileName;
                string filePath = MapPath(fileName);
                fThumbnail_Add.SaveAs(filePath);
            }
            if (Page.IsValid && fThumbnail_Edit.HasFile && CheckFileType(fThumbnail_Edit.FileName))
            {
                fileName = "/uploads/" + fThumbnail_Edit.FileName;
                string filePath = MapPath(fileName);
                fThumbnail_Edit.SaveAs(filePath);
            }
            return fileName;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (product.Add(txtName_Add.Text, txtPrice_Add.Text, txtPercentSales_Add.Text, UploadFile(), txtColor_Add.Text, ddlTrademark_Add.SelectedValue))
                Initial();
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (product.Update(txtID_Edit.Text, txtName_Edit.Text, txtPrice_Edit.Text, txtPercentSales_Edit.Text, UploadFile(), txtColor_Edit.Text, ddlTrademark_Edit.SelectedValue))
                Response.Redirect("list.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            DataTable dt = product.Search(txtSearch.Text);
            rptList.DataSource = dt;
            rptList.DataBind();

            lblList.Text = dt.Rows.Count == 0 ? "<tr class='text-center'><td colspan='100%'><i>Không có dữ liệu</i></td></tr>" : "";
        }
    }
}