using System;

namespace WebForm.client
{
    public partial class Cart : System.Web.UI.Page
    {
        CartService.CartServiceSoapClient cart = new CartService.CartServiceSoapClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["action"] == "add")
                {
                    string productID = Request.QueryString["id"];
                    cart.Add(Session["Username"].ToString(), productID, "1");
                }

                if (Request.QueryString["action"] == "delete")
                {
                    string productID = Request.QueryString["id"];
                    cart.Delete(Session["Username"].ToString(), productID);
                }

                rptList.DataSource = cart.GetTable(Session["Username"].ToString());
                rptList.DataBind();
            }
        }

        public static string ObjToVnd(object ojb) => Convert.ToInt32(ojb).ToString("C0", System.Globalization.CultureInfo.GetCultureInfo("vi-vn"));

        protected void btnCreateOrder_Click(object sender, EventArgs e)
        {
            cart.CreateOrder(Session["Username"].ToString());
            Response.Redirect("Cart.aspx");
        }
    }
}