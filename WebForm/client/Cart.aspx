<%@ Page Title="" Language="C#" MasterPageFile="~/client/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="WebForm.client.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Giỏ hàng</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Cart Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-lg-12 table-responsive mb-5">
                <table class="table table-light table-borderless table-hover text-center mb-0">
                    <thead class="thead-dark">
                        <tr>
                            <th>Tên sản phẩm</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Thành tiền</th>
                            <th>Xóa</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                        <asp:Repeater ID="rptList" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td class="align-middle">
                                        <img src="<%# Eval("Thumbnail") %>" alt="" style="width: 50px;">
                                        <%# Eval("ProductName") %>
                                    </td>
                                    <td class="align-middle"><%# ObjToVnd(Eval("Price")) %></td>
                                    <td class="align-middle">
                                        <div class="input-group quantity mx-auto" style="width: 100px;">
                                            <div class="input-group-btn">
                                                <button class="btn btn-sm btn-primary btn-minus">
                                                    <i class="fa fa-minus"></i>
                                                </button>
                                            </div>
                                            <input type="text" class="form-control form-control-sm bg-secondary border-0 text-center" value="<%# Eval("Quantity") %>">
                                            <div class="input-group-btn">
                                                <button class="btn btn-sm btn-primary btn-plus">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="align-middle"><%# ObjToVnd(Convert.ToInt32(Eval("Price")) * Convert.ToInt32(Eval("Quantity"))) %></td>
                                    <td class="align-middle">
                                        <a class="btn btn-sm btn-danger" href="?action=delete&id=<%# Eval("ProductID") %>"><i class="fa fa-times"></i></a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="container-fluid d-flex align-items-center justify-content-center">
        <asp:Button ID="btnCreateOrder" CssClass="btn btn-success" runat="server" Text="Tạo đơn hàng" OnClick="btnCreateOrder_Click" />
    </div>
    <!-- Cart End -->
</asp:Content>
