<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="list.aspx.cs" Inherits="WebForm.admin.product.list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Sản phẩm</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin/Default.aspx"><i class="fas fa-home"></i></a></li>
                <li class="breadcrumb-item active">Đồng hồ</li>
            </ol>
        </div>
    </section>

    <div class="modal fade" id="modal-add">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-primary">
                    <h4 class="modal-title">Thêm đồng hồ</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Tên đồng hồ</label>
                        <asp:TextBox ID="txtName_Add" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Giá</label>
                        <asp:TextBox ID="txtPrice_Add" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Số phầm giảm giá</label>
                        <asp:TextBox ID="txtPercentSales_Add" TextMode="Number" Text="0" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Ảnh đại diện</label>
                        <asp:FileUpload ID="fThumbnail_Add" CssClass="form-control" runat="server" />
                    </div>
                    <div class="form-group">
                        <label>Màu sắc</label>
                        <asp:TextBox ID="txtColor_Add" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Thương hiệu</label>
                        <asp:DropDownList ID="ddlTrademark_Add" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-ban"></i>Hủy</button>
                    <asp:Button ID="btnAdd" CssClass="btn btn-success" runat="server" Text="Thêm" OnClick="btnAdd_Click" />
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modal-edit">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-warning">
                    <h4 class="modal-title">Cập nhật đồng hồ</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Mã đồng hồ</label>
                        <asp:TextBox ID="txtID_Edit" CssClass="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Tên thương hiệu</label>
                        <asp:TextBox ID="txtName_Edit" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Giá</label>
                        <asp:TextBox ID="txtPrice_Edit" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Số phầm giảm giá</label>
                        <asp:TextBox ID="txtPercentSales_Edit" TextMode="Number" Text="0" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Ảnh đại diện</label>
                        <asp:FileUpload ID="fThumbnail_Edit" CssClass="form-control" runat="server" />
                    </div>
                    <div class="form-group">
                        <label>Màu sắc</label>
                        <asp:TextBox ID="txtColor_Edit" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Thương hiệu</label>
                        <asp:DropDownList ID="ddlTrademark_Edit" CssClass="form-control" runat="server"></asp:DropDownList>
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
                                <th>Mã sản phẩm</th>
                                <th>Tên sản phẩm</th>
                                <th>Giá</th>
                                <th>Giá giảm</th>
                                <th>Ảnh</th>
                                <th>Màu sắc</th>
                                <th>Thương hiệu</th>
                                <th width="112">Công cụ</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptList" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("ProductID") %></td>
                                        <td><%# Eval("ProductName") %></td>
                                        <td><%# ObjToVnd(Eval("Price")) %></td>
                                        <td><%# Eval("PercentSales") %></td>
                                        <td>
                                            <a href="<%# Eval("Thumbnail") %>" target="_blank">
                                                <img width="50" src="<%# Eval("Thumbnail") %>" alt="<%# Eval("ProductName") %>" />
                                            </a>
                                        </td>
                                        <td><%# Eval("Color") %></td>
                                        <td><%# Eval("TrademarkName") %></td>
                                        <td>
                                            <a href="?edit-id=<%# Eval("ProductID") %>" class="btn btn-warning"><i class="fas fa-pencil-alt"></i></a>
                                            <a href="?del-id=<%# Eval("ProductID") %>" class="btn btn-danger"><i class="fas fa-trash-alt"></i></a>
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
