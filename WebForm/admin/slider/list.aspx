<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="list.aspx.cs" Inherits="WebForm.admin.slider.list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Slider</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin/Default.aspx"><i class="fas fa-home"></i></a></li>
                <li class="breadcrumb-item active">Slider</li>
            </ol>
        </div>
    </section>

    <div class="modal fade" id="modal-add">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-primary">
                    <h4 class="modal-title">Thêm slider</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Tên slider</label>
                        <asp:TextBox ID="txtName_Add" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Ảnh</label>
                        <asp:FileUpload ID="fThumbnail_Add" CssClass="form-control" runat="server" />
                    </div>
                    <div class="form-group">
                        <label>Mô tả</label>
                        <asp:TextBox ID="txtDesc_Add" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Trạng thái</label>
                        <asp:DropDownList ID="ddlStatus_Add" CssClass="form-control" runat="server">
                            <asp:ListItem Value="1">Hiển thị</asp:ListItem>
                            <asp:ListItem Value="0">Ẩn</asp:ListItem>
                        </asp:DropDownList>
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
                    <h4 class="modal-title">Cập nhật slider</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Mã slider</label>
                        <asp:TextBox ID="txtID_Edit" CssClass="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Tên slider</label>
                        <asp:TextBox ID="txtName_Edit" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Ảnh</label>
                        <asp:FileUpload ID="fThumbnail_Edit" CssClass="form-control" runat="server" />
                    </div>
                    <div class="form-group">
                        <label>Mô tả</label>
                        <asp:TextBox ID="txtDesc_Edit" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Trạng thái</label>
                        <asp:DropDownList ID="ddlStatus_Edit" CssClass="form-control" runat="server">
                            <asp:ListItem Value="1">Hiển thị</asp:ListItem>
                            <asp:ListItem Value="0">Ẩn</asp:ListItem>
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
                                <th>Mã slider</th>
                                <th>Tên slider</th>
                                <th>Ảnh</th>
                                <th>Mô tả</th>
                                <th>Trạng thái</th>
                                <th width="112">Công cụ</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptList" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("SliderID") %></td>
                                        <td><%# Eval("SliderName") %></td>
                                        <td>
                                            <a href="<%# Eval("Thumbnail") %>" target="_blank">
                                                <img width="100" src="<%# Eval("Thumbnail") %>" alt="<%# Eval("SliderName") %>" />
                                            </a>
                                        </td>
                                        <td><%# Eval("Description") %></td>
                                        <td><%# Convert.ToInt32(Eval("Status")) == 0 ? "<span class='badge badge-warning'>Ẩn</span>" : "<span class='badge badge-primary'>Hiển thị</span>" %></td>
                                        <td>
                                            <a href="?edit-id=<%# Eval("SliderID") %>" class="btn btn-warning"><i class="fas fa-pencil-alt"></i></a>
                                            <a href="?del-id=<%# Eval("SliderID") %>" class="btn btn-danger"><i class="fas fa-trash-alt"></i></a>
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
