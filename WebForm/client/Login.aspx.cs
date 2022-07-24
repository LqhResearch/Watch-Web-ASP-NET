using System;
using System.Data;

namespace WebForm.client
{
    public partial class Login : System.Web.UI.Page
    {
        UserService.UserServiceSoapClient user = new UserService.UserServiceSoapClient();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            DataTable dt = user.Login(txtUsername.Text, txtPassword.Text);
            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];
                Session["Username"] = row["Username"];
                Session["Fullname"] = row["Fullname"];
                Session["Email"] = row["Email"];
                Session["Permission"] = row["PermissionID"];
                Response.Redirect("/client/");
            }
            else
                lblMessage.Text = "<div class='text-center text-danger'>Tên đăng nhập hoặc mật khẩu</div>";
        }
    }
}