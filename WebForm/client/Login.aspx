<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebForm.client.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>QVY Shop</title>
    <link href="/assets/img/favicon.ico" rel="icon" />
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="images/icons/favicon.ico" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/vendor/login/vendor/bootstrap/css/bootstrap.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/vendor/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/vendor/login/vendor/animate/animate.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/vendor/login/vendor/css-hamburgers/hamburgers.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/vendor/login/vendor/select2/select2.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/vendor/login/css/util.css" />
    <link rel="stylesheet" type="text/css" href="/vendor/login/css/main.css" />
    <!--===============================================================================================-->
</head>
<body>
    <form id="form1" runat="server">
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <div class="login100-pic js-tilt" data-tilt="">
                        <img src="/vendor/login/images/img-01.png" alt="IMG" />
                    </div>

                    <div class="login100-form validate-form">
                        <span class="login100-form-title">Đăng nhập</span>

                        <div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
                            <asp:TextBox ID="txtUsername" CssClass="input100" runat="server"></asp:TextBox>
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-envelope" aria-hidden="true"></i>
                            </span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate="Password is required">
                            <asp:TextBox ID="txtPassword" CssClass="input100" TextMode="Password" runat="server"></asp:TextBox>
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-lock" aria-hidden="true"></i>
                            </span>
                        </div>

                        <asp:Label ID="lblMessage" runat="server"></asp:Label>

                        <div class="container-login100-form-btn">
                            <asp:Button ID="btnLogin" CssClass="login100-form-btn" runat="server" Text="Đăng nhập" OnClick="btnLogin_Click" />
                        </div>

                        <div class="text-center p-t-12">
                            <span class="txt1">Quên</span>
                            <a class="txt2" href="#">Tên đăng nhập / Mật khẩu?</a>
                        </div>

                        <div class="text-center p-t-136">
                            <a class="txt2" href="#">Đăng ký tài khoản mới
							    <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <!--===============================================================================================-->
    <script src="/vendor/login/vendor/jquery/jquery-3.2.1.min.js"></script>
    <!--===============================================================================================-->
    <script src="/vendor/login/vendor/bootstrap/js/popper.js"></script>
    <script src="/vendor/login/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
    <script src="/vendor/login/vendor/select2/select2.min.js"></script>
    <!--===============================================================================================-->
    <script src="/vendor/login/vendor/tilt/tilt.jquery.min.js"></script>
    <script>
        $('.js-tilt').tilt({
            scale: 1.1
        })
    </script>
    <!--===============================================================================================-->
    <script src="/vendor/login/js/main.js"></script>
</body>
</html>
