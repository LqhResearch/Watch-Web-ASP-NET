<%@ Page Title="" Language="C#" MasterPageFile="~/client/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebForm.client.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Trang chủ</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Carousel Start -->
    <div class="container-fluid mb-3">
        <div class="row px-xl-5">
            <div class="col-lg-12">
                <div id="header-carousel" class="carousel slide carousel-fade mb-30 mb-lg-0" data-ride="carousel">
                    <div class="carousel-inner">
                        <asp:Repeater ID="rptSliderList" runat="server">
                            <ItemTemplate>
                                <div class="carousel-item position-relative" style="height: 430px;">
                                    <img class="position-absolute w-100 h-100" src="<%# Eval("Thumbnail") %>" style="object-fit: cover;">
                                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                        <div class="p-3" style="max-width: 700px;">
                                            <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown"><%# Eval("SliderName") %></h1>
                                            <p class="mx-md-5 px-5 animate__animated animate__bounceIn"><%# Eval("Description") %></p>
                                            <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp" href="#">Mua ngay</a>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <a class="carousel-control-prev" href="#header-carousel" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#header-carousel" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- Carousel End -->

    <!-- Featured Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                    <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0">Đảm bảo chất lượng</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                    <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
                    <h5 class="font-weight-semi-bold m-0">Miễn phí vận chuyển</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                    <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0">14 ngày hoàn trả</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                    <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0">Hỗ trợ 24/7</h5>
                </div>
            </div>
        </div>
    </div>
    <!-- Featured End -->

    <!-- Categories Start -->
    <div class="container-fluid pt-5">
        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Thương hiệu</span></h2>
        <div class="row px-xl-5 pb-3">
            <asp:Repeater ID="rptCategoryList" runat="server">
                <ItemTemplate>
                    <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                        <a class="text-decoration-none" href="#">
                            <div class="cat-item d-flex align-items-center mb-4" style="height: 100px;">
                                <div class="flex-fill pl-3">
                                    <h6><%# Eval("TrademarkName") %></h6>
                                    <small class="text-body"><%# Eval("Number") %> đồng hồ</small>
                                </div>
                            </div>
                        </a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <!-- Categories End -->

    <!-- Products Start -->
    <div class="container-fluid pt-5 pb-3">
        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Đồng hồ</span></h2>
        <div class="row px-xl-5">
            <asp:Repeater ID="rptProductList" runat="server">
                <ItemTemplate>
                    <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                        <div class="product-item bg-light mb-4">
                            <div class="product-img position-relative overflow-hidden">
                                <img class="img-fluid w-100" src="<%# Eval("Thumbnail") %>" style="height: 325px;" alt="">
                                <div class="product-action">
                                    <% if (Convert.ToInt32(Session["Permission"]) == 2)
                                        { %>
                                    <a class="btn btn-outline-dark btn-square" href="/client/Cart.aspx?action=add&id=<%# Eval("ProductID") %>"><i class="fa fa-shopping-cart"></i></a>
                                    <% } %>
                                    <a class="btn btn-outline-dark btn-square" href="#"><i class="far fa-heart"></i></a>
                                    <a class="btn btn-outline-dark btn-square" href="#"><i class="fa fa-sync-alt"></i></a>
                                    <a class="btn btn-outline-dark btn-square" href="#"><i class="fa fa-search"></i></a>
                                </div>
                            </div>
                            <div class="text-center py-4">
                                <a class="h6 text-decoration-none" href="/client/Detail.aspx?id=<%# Eval("ProductID") %>"><%# Eval("ProductName") %></a>
                                <div class="d-flex align-items-center justify-content-center mt-2">
                                    <h5><%# PriceSales(Eval("Price"), Eval("PercentSales")) %></h5>
                                    <h6 class="text-muted ml-2"><del><%# ObjToVnd(Eval("Price")) %></del></h6>
                                </div>
                                <div class="d-flex align-items-center justify-content-center mb-1">
                                    <small class="fa fa-star text-primary mr-1"></small>
                                    <small class="fa fa-star text-primary mr-1"></small>
                                    <small class="fa fa-star text-primary mr-1"></small>
                                    <small class="fa fa-star text-primary mr-1"></small>
                                    <small class="fa fa-star text-primary mr-1"></small>
                                    <small>(99)</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <!-- Products End -->

    <!-- Vendor Start -->
    <div class="container-fluid py-5">
        <div class="row px-xl-5">
            <div class="col">
                <div class="owl-carousel vendor-carousel">
                    <div class="bg-light p-4">
                        <img src="/vendor/home/img/vendor-1.jpg" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="/vendor/home/img/vendor-2.jpg" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="/vendor/home/img/vendor-3.jpg" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="/vendor/home/img/vendor-4.jpg" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="/vendor/home/img/vendor-5.jpg" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="/vendor/home/img/vendor-6.jpg" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="/vendor/home/img/vendor-7.jpg" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="/vendor/home/img/vendor-8.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Vendor End -->

    <script>
        var firstSlider = document.querySelector(".carousel-inner .carousel-item");
        firstSlider.classList.add("active");
    </script>
</asp:Content>
