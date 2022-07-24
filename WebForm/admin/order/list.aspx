<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="list.aspx.cs" Inherits="WebForm.admin.order.list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Đơn hàng</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin/Default.aspx"><i class="fas fa-home"></i></a></li>
                <li class="breadcrumb-item active">Đơn hàng</li>
            </ol>
        </div>
    </section>

    <div class="modal fade" id="modal-edit">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-warning">
                    <h4 class="modal-title">Cập nhật đơn hàng</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Mã đơn hàng</label>
                        <asp:TextBox ID="txtID_Edit" CssClass="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Trạng thái</label>
                        <asp:DropDownList ID="ddlStatus_Edit" CssClass="form-control" runat="server">
                            <asp:ListItem Value="0">Chưa thanh toán</asp:ListItem>
                            <asp:ListItem Value="1">Đã thanh toán</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-ban"></i>Hủy</button>
                    <asp:Button ID="btnEdit" CssClass="btn btn-success" runat="server" Text="Thêm" OnClick="btnEdit_Click" />
                </div>
            </div>
        </div>
    </div>

    <section class="content">
        <div class="container-fluid">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex-between">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-add">
                            <i class="fas fa-plus"></i>Thêm
                        </button>
                        <button hidden type="button" class="btn btn-warning" data-toggle="modal" data-target="#modal-edit">
                            <i class="fas fa-plus"></i>Cập nhật
                        </button>
                        <div class="input-group" style="width: 260px;">
                            <asp:TextBox ID="txtSearch" CssClass="form-control" runat="server"></asp:TextBox>
                            <div class="input-group-append">
                                <asp:Button ID="btnSearch" CssClass="btn btn-primary" runat="server" Text="Tìm" OnClick="btnSearch_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <table class="table table-bordered">
                        <thead>
                            <tr class="bg-success">
                                <th>Mã đơn hàng</th>
                                <th>Tổng đơn hàng</th>
                                <th>Tiền thanh toán</th>
                                <th>Ngày đặt hàng</th>
                                <th>Người đặt hàng</th>
                                <th>Trạng thái</th>
                                <th width="60">Công cụ</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptList" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("OrderID") %></td>
                                        <td><%# ObjToVnd(Eval("TotalMoney")) %></td>
                                        <td><%# ObjToVnd(Eval("PaymentMoney")) %></td>
                                        <td><%# FormatDate(Eval("CreatedAt")) %></td>
                                        <td><%# Eval("Username") %></td>
                                        <td><%# Convert.ToInt32(Eval("Status")) == 0 ? "<span class='badge badge-warning'>Chưa thanh toán</span>" : "<span class='badge badge-primary'>Đã thanh toán</span>" %></td>
                                        <td>
                                            <a href="?edit-id=<%# Eval("OrderID") %>" class="btn btn-warning"><i class="fas fa-pencil-alt"></i></a>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:Label ID="lblList" runat="server"></asp:Label>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>

    <script src="/template/plugins/jquery/jquery.min.js"></script>

    <script>
        $(document).ready(function () {
            function GetParameterValues(param) {
                var url = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
                for (var i = 0; i < url.length; i++) {
                    var urlparam = url[i].split('=');
                    if (urlparam[0] == param) {
                        return urlparam[1];
                    }
                }
            }

            if (GetParameterValues('edit-id')) {
                $('[data-target="#modal-edit"]').click();
            }
        });
    </script>
</asp:Content>
