using System;
using System.Data;

namespace WebForm.client
{
    public partial class Detail : System.Web.UI.Page
    {
        ProductService.ProductServiceSoapClient product = new ProductService.ProductServiceSoapClient();
        public static string id = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    id = Request.QueryString["id"];
                    DataRow row = product.GetTableByID(id).Rows[0];

                    imgThumbnail.ImageUrl = row["Thumbnail"].ToString();
                    lblProductName.Text = "<h3>" + row["ProductName"] + "</h3>";
                    lblPrice.Text = "<h3 class='font-weight-semi-bold mb-4'>" + ObjToVnd(row["Price"]) + "</h3>";
                    lblDescription.Text = row["Description"].ToString();
                }
            }
        }

        public static string ObjToVnd(object ojb) => Convert.ToInt32(ojb).ToString("C0", System.Globalization.CultureInfo.GetCultureInfo("vi-vn"));
    }
}