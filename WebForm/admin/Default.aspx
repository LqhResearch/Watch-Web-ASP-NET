<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebForm.admin.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Trang chủ</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin/Default.aspx"><i class="fas fa-home"></i></a></li>
                <li class="breadcrumb-item active">Thống kê</li>
            </ol>
        </div>
    </section>

    <section class="content">
        <div class="container-fluid">
            Trang thống kê
        </div>
    </section>
</asp:Content>
