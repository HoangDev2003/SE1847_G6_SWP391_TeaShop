
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>TeaShop - Website Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet"> 
        <!-- Template Stylesheet -->

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="${pageContext.request.contextPath}/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    </head>

    <body>

        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar start -->
        <div class="container-fluid fixed-top">

            <div class="container topbar bg-primary d-none d-lg-block">    
                <div class="d-flex justify-content-between">
                    <div class="top-info ps-2">
                        <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i> <a href="#" class="text-white">Tân Xã, Thạch Hòa, Thạch Thất, Hòa Lạc</a></small>
                        <small class="me-3"><i class="fas fa-envelope me-2 text-secondary"></i><a href="#" class="text-white">huydxhe172399@fpt.edu.vn</a></small>
                    </div>

                </div>
            </div>

            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">
                    <a href="home" class="navbar-brand"><h1 class="text-primary display-6"  >Dreamy Coffee</h1></a>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                        <div class="navbar-nav mx-auto">
                            <a href="home.jsp" class="nav-item nav-link active">Home</a>
                            <a href ="blog" class="nav-item nav-link">Blog</a>
                            <a href="shop" class="nav-item nav-link">Shop</a>
                            <a href="product-detail" class="nav-item nav-link">Shop Detail</a>
                            <!--                            <div class="nav-item dropdown">
                                                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                                                            <div class="dropdown-menu m-0 bg-secondary rounded-0">
                                                                <a href="cart.jsp" class="dropdown-item">Cart</a>
                                                                <a href="chackout.jsp" class="dropdown-item">Chackout</a>
                                                                <a href="testimonial.jsp" class="dropdown-item">Testimonial</a>
                                                                <a href="404.jsp" class="dropdown-item">404 Page</a>
                                                            </div>
                                                        </div>-->
                            <a href="contact" class="nav-item nav-link">Contact</a>
                        </div>
                        <div class="d-flex m-3 me-0">
                            <a href="cart" class="position-relative me-4 my-auto">
                                <i class="fa fa-shopping-bag fa-2x"></i>
                                <!--                                <span class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1" style="top: -5px; left: 15px; height: 20px; min-width: 20px;">  </span>-->
                            </a>
                            <a href="login" class="my-auto">
                                <i class="fas fa-user fa-2x"></i>
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>

        <!-- Navbar end -->     




        <!-- Hero header Start -->
        <div class="container-fluid py-5 mb-5 hero-header">
            <div class="container-fluid py-5 ">
                <div class="row g-5 align-items-center">

                    <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                        <div class="carousel-inner py-5" role="listbox">
                            <div class="carousel-item active rounded">
                                <img src="${pageContext.request.contextPath}/img/anh1.jpg" class=" w-100 h-100 bg-secondary rounded" alt=" slide1">
                            </div>
                            <div class="carousel-item  rounded">
                                <img src="${pageContext.request.contextPath}/img/anh2.jpg" class=" w-100 h-100 bg-secondary rounded" alt=" slide2">
                            </div>
                            <div class="carousel-item  rounded">
                                <img src="${pageContext.request.contextPath}/img/anh3.jpg" class=" w-100 h-100 bg-secondary rounded" alt=" slide3">
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselId" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>

                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselId" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>

                        </button>
                    </div>

                </div>
            </div>
        </div><!--
        <!-- Hero header End -->

        <!-- Hero Start -->
        <div class="container-fluid py-1 mb-3 hero-header">
            <div class="container py-1">
                <div class="row g-5 align-items-center">
                    <div class="col-md-12 col-lg-7">
                        <h4 class="mb-3 text-secondary">Cà Phê Tự Hào: Niềm Kiêu Hãnh Của Việt Nam</h4>
                        <h1 class="mb-1 text-primary">
                            Hạt cà phê vàng óng, căng tròn: Nổi bật trên nền xanh mướt của những đồi chè, những trái cà phê chín mọng như những viên ngọc quý, mang theo niềm tự hào về một thức uống đã làm say mê biết bao con người.

                        </h1>


                    </div>
                    <div class="col-md-12 col-lg-5">
                        <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active rounded">
                                    <img src="${pageContext.request.contextPath}/img/anhtuhaovn2.jpg" class="img-fluid w-100 h-100 bg-secondary rounded" alt="First slide">

                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero End -->
        
        <!-- Featurs start -->
        <div class="container-fluid service py-5 ">
            <div class="container py-1">
                <div class="row g-4 justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <a href="#">
                            <div class="service-item bg-secondary rounded border border-secondary">
                                <img src="img/olongnhietdoi.jpg" class="img-fluid rounded-top w-100" alt="">
                                <div class=" rounded-bottom">
                                    <div class=" bg-primary text-center p-4 rounded">
                                        <h5 class="text-white">Trà trái cây</h5>

                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-4">
                        <a href="#">
                            <div class="service-item bg-dark rounded border border-dark">
                                <img src="img/capheden.jpg" class="img-fluid rounded-top w-100" alt="">
                                <div class=" rounded-bottom">
                                    <div class=" text-center p-4 rounded">
                                        <h5 class="text-primary">Cà phê</h5>

                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-4">
                        <a href="#">
                            <div class="service-item bg-primary rounded border border-primary">
                                <img src="img/olongvalisua.jpg" class="img-fluid rounded-top w-100" alt="">
                                <div class="rounded-bottom">
                                    <div class=" bg-secondary text-center p-4 rounded">
                                        <h5 class="text-white">Trà sữa</h5>

                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Featurs End -->
        
        <!-- Dreamy Coffee
 Shop Start-->
        <div class="container-fluid fruite py-3">
            <div class="container py-5">
                <div class="tab-class text-center">

                    <div class=" text-start navbar-nav ">
                        <h1>CÁC DÒNG SẢN PHẨM NỔI BẬT</h1>
                    </div>


                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane fade show p-0 active">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">

                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="img/olongvalisua.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;"></div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4>Ô LONG VANI SỮA </h4>

                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0">54000 </p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="img/phuvan.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;"></div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4>PHÙ VÂN </h4>

                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0">33000 </p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="img/olongtrungbong.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;"></div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4>Ô LONG TRỨNG </h4>

                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0">40000 </p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="img/olongsuaphela.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;"></div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4>Ô LONG SỮA </h4>

                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0">45000 </p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="img/olongnhaisua.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;"></div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4>Ô LONG NHÀI SỮA </h4>

                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0">30000 </p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="img/phanxipang.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;"></div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4>PHAN XI PANG </h4>

                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0">33000 </p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="img/khoiblao.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;"></div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4>KHÓI B'LAO </h4>

                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0">45000 </p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="img/tam.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;"></div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4>TẤM </h4>

                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0">45000 </p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
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
            </div>
        </div>
        <!-- Dreamy Coffee
 Shop End-->


        <!-- Fact Start -->
        <div class="container-fluid py-2">
            <div class="container">
                <div class="bg-light p-5 rounded">
                    <div class="row g-4 justify-content-center">
                        <div class="col-md-6 col-lg-6 col-xl-3">
                            <div class="counter bg-white rounded p-5">
                                <i class="fa fa-users text-secondary"></i>
                                <h4>KHÁCH HÀNG HÀI LÒNG</h4>
                                <h1>2003</h1>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-xl-3">
                            <div class="counter bg-white rounded p-5">
                                <i class="fa fa-users text-secondary"></i>
                                <h4>CHẤT LƯỢNG DỊCH VỤ</h4>
                                <h1>99%</h1>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-xl-3">
                            <div class="counter bg-white rounded p-5">
                                <i class="fa fa-users text-secondary"></i>
                                <h4>GIẤY CHỨNG NHẬN CHẤT LƯỢNG</h4>
                                <h1>10</h1>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-xl-3">
                            <div class="counter bg-white rounded p-5">
                                <i class="fa fa-users text-secondary"></i>
                                <h4>SẢN PHẨM CÓ SẴN</h4>
                                <h1>25</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Fact Start -->


        <!-- Tastimonial Start -->
        <div class="container-fluid testimonial py-5">
            <div class="container py-5">
                <div class="testimonial-header text-center">
                    <div class="container topbar bg-primary d-none d-lg-block">
                        <div class="d-flex justify-content-between">
                            <div class="top-info ps-2">
                                <h4 class="text-primary">FEEDBACK </h4>
                            </div>

                        </div>
                    </div>

                    <h1 class="display-5 mb-5 text-dark">Khách hàng của chúng tôi nói!!</h1>
                </div>
                <div class="owl-carousel testimonial-carousel">
                    <div class="testimonial-item img-border-radius bg-light rounded p-4 ">
                        <div class="position-relative ">
                            <i class="fa fa-quote-right fa-2x text-secondary position-absolute " style="bottom: 30px; right: 0;"></i>

                            <div class="d-flex align-items-center flex-nowrap ">
                                <div class="bg-secondary rounded">
                                    <img src="img/clien1.jpg" class="img-fluid rounded" style="width: 100px; height: 100px;" alt="">
                                </div>
                                <div class="ms-4 d-block">
                                    <h4 class="text-dark">N.X Hoàng</h4>
                                    <p class="m-0 pb-3">Giao hàng nhanh, nước ngon ạ</p>
                                    <div class="d-flex pe-5">
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="testimonial-item img-border-radius bg-light rounded p-4">
                        <div class="position-relative">
                            <i class="fa fa-quote-right fa-2x text-secondary position-absolute" style="bottom: 30px; right: 0;"></i>

                            <div class="d-flex align-items-center flex-nowrap">
                                <div class="bg-secondary rounded">
                                    <img src="img/clien2.jpg" class="img-fluid rounded" style="width: 100px; height: 100px;" alt="">
                                </div>
                                <div class="ms-4 d-block">
                                    <h4 class="text-dark">P.X Hoà</h4>
                                    <p class="m-0 pb-3">Nước ngon , dịch vụ tốt xứng đáng 6 sao nếu có</p>
                                    <div class="d-flex pe-5">
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- Tastimonial End -->


        <!-- Footer Start -->
        <jsp:include page="../common/homePage/footer-start.jsp"></jsp:include>
            <!-- Footer End -->



            <!-- JavaScript Libraries -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="${pageContext.request.contextPath}/lib/easing/easing.min.js"></script>
        <script src="${pageContext.request.contextPath}/lib/waypoints/waypoints.min.js"></script>
        <script src="${pageContext.request.contextPath}/lib/lightbox/js/lightbox.min.js"></script>
        <script src="${pageContext.request.contextPath}/lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Javascript -->
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
    </body>

</html>
