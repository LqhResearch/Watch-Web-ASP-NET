<%@ Page Title="" Language="C#" MasterPageFile="~/client/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="WebForm.client.Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Chi tiết sản phẩm</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Breadcrumb Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-12">
                <nav class="breadcrumb bg-light mb-30">
                    <a class="breadcrumb-item text-dark" href="#">Trang chủ</a>
                    <a class="breadcrumb-item text-dark" href="#">Cửa hàng</a>
                    <span class="breadcrumb-item active">Chi tiết đồng hồ</span>
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->


    <!-- Shop Detail Start -->
    <div class="container-fluid pb-5">
        <div class="row px-xl-5">
            <div class="col-lg-5 mb-30">
                <div id="product-carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner bg-light">
                        <div class="carousel-item active">
                            <asp:Image ID="imgThumbnail" CssClass="w-100 h-100" runat="server" />
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                        <i class="fa fa-2x fa-angle-left text-dark"></i>
                    </a>
                    <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                        <i class="fa fa-2x fa-angle-right text-dark"></i>
                    </a>
                </div>
            </div>

            <div class="col-lg-7 h-auto mb-30">
                <div class="h-100 bg-light p-30">
                    <asp:Label ID="lblProductName" runat="server"></asp:Label>
                    <div class="d-flex mb-3">
                        <div class="text-primary mr-2">
                            <small class="fas fa-star"></small>
                            <small class="fas fa-star"></small>
                            <small class="fas fa-star"></small>
                            <small class="fas fa-star-half-alt"></small>
                            <small class="far fa-star"></small>
                        </div>
                        <small class="pt-1">(99 lượt đánh giá)</small>
                    </div>
                    <asp:Label ID="lblPrice" runat="server"></asp:Label>
                    <div class="d-flex align-items-center mb-4 pt-2">
                        <div class="input-group quantity mr-3" style="width: 130px;">
                            <div class="input-group-btn">
                                <button class="btn btn-primary btn-minus">
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                            <input type="text" class="form-control bg-secondary border-0 text-center" value="1">
                            <div class="input-group-btn">
                                <button class="btn btn-primary btn-plus">
                                    <i class="fa fa-plus"></i>
                                </button>
                            </div>
                        </div>
                        <% if (Convert.ToInt32(Session["Permission"]) == 2)
                            { %>
                        <a href="/client/Cart.aspx?action=add&id=<%=id %>" class="btn btn-primary px-3">
                            <i class="fa fa-shopping-cart mr-1"></i>Thêm vào giỏ
                        </a>
                        <% } %>
                    </div>
                    <div class="d-flex pt-2">
                        <strong class="text-dark mr-2">Chia sẻ:</strong>
                        <div class="d-inline-flex">
                            <a class="text-dark px-2" href="#">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a class="text-dark px-2" href="#">
                                <i class="fab fa-twitter"></i>
                            </a>
                            <a class="text-dark px-2" href="#">
                                <i class="fab fa-linkedin-in"></i>
                            </a>
                            <a class="text-dark px-2" href="#">
                                <i class="fab fa-pinterest"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row px-xl-5">
            <div class="col">
                <div class="bg-light p-30">
                    <div class="nav nav-tabs mb-4">
                        <a class="nav-item nav-link text-dark active" data-toggle="tab" href="#tab-pane-1">Mô tả</a>
                        <a class="nav-item nav-link text-dark" data-toggle="tab" href="#tab-pane-2">Bình luận</a>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="tab-pane-1">
                            <h4 class="mb-3">Mô tả đồng hồ</h4>
                            <p>
                                <asp:Label ID="lblDescription" runat="server"></asp:Label>
                            </p>
                        </div>
                        <div class="tab-pane fade" id="tab-pane-2">
                            <div class="row">
                                <div class="col-md-6">
                                    <h4 class="mb-4">1 bình luận</h4>
                                    <div class="media mb-4">
                                        <img src="/assets/img/user.png" alt="Image" class="img-fluid mr-3 mt-1" style="width: 45px;">
                                        <div class="media-body">
                                            <h6>user<small> - <i>Hôm nay</i></small></h6>
                                            <div class="text-primary mb-2">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star-half-alt"></i>
                                                <i class="far fa-star"></i>
                                            </div>
                                            <p>Bình luận mẫu</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <h4 class="mb-4">Thêm một bình luận mới</h4>
                                    <small>Địa chỉ email của bạn sẽ không được công bố. Các trường bắt buộc được đánh dấu *</small>
                                    <div class="d-flex my-3">
                                        <p class="mb-0 mr-2">Đánh giá số sao * :</p>
                                        <div class="text-primary">
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="form-group">
                                            <label for="message">Nội dung bình luận *</label>
                                            <textarea id="message" cols="30" rows="5" class="form-control"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Tên bạn *</label>
                                            <input type="text" class="form-control" id="name">
                                        </div>
                                        <div class="form-group">
                                            <label for="email">Email của bạn *</label>
                                            <input type="email" class="form-control" id="email">
                                        </div>
                                        <div class="form-group mb-0">
                                            <input type="submit" value="Gửi" class="btn btn-primary px-3">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Shop Detail End -->
</asp:Content>
