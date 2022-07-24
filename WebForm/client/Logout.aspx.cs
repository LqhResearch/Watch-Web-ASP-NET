using System;

namespace WebForm.client
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["Username"] = null;
                Session["Fullname"] = null;
                Session["Email"] = null;
                Session["Permission"] = null;
                Response.Redirect("/client/");
            }
        }
    }
}