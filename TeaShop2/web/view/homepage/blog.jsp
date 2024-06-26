
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Dreamy Coffee</title>
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

<!-- Header Start -->
        <jsp:include page="../common/homePage/header-start.jsp"></jsp:include>
            <!-- Header End -->
        
        <!-- Single Page Header start -->
        <div class="container-fluid page-header bg-primary py-5">
            <h1 class="text-center text-white display-6">Blog </h1>
                        <ol class="breadcrumb justify-content-center mb-0">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item"><a href="#"> </a></li>
                            <li class="breadcrumb-item active text-white">Shop Detail</li>
                        </ol>
        </div>
        <!-- Single Page Header End -->


        <!-- Blog Start-->
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <form  action="blog" method="get">             
                    <div class="position-relative mx-auto">
                        <input class="form-control border-2 border-secondary w-75 py-3 px-4" type="text" name="search" placeholder="Search" required >
                        <button type="submit" class="btn btn-primary border-2 border-secondary py-3 px-4 position-absolute  text-center h-100" style="top: 0; right: 25%;">Search</button>
                    </div>
                </form>
                <h1 class="mb-4">Tin Tức & Sự Kiện</h1>

                <div class="row g-4">
                    <div class="col-lg-12">

                        <form action="blogdetail" method ="get">
                            <div class="row g-4">

                                <div class="col-lg-3">
                                    <div class="row g-4">
                                        <div class="col-lg-12">
                                            <div class="mb-3">
                                                <h4>Loại Bài Đăng</h4>
                                                <c:forEach items="${listCategory}" var="cate">
                                                    <ul class="list-styled fruite-categorie">
                                                        <li>
                                                            <div class="d-flex justify-content-between fruite-name">
                                                                <a href="blogdetail?bid=${cate.getCategoryID()}"><i class="fas fa-alt me-2"></i>${cate.getCategoryName()}</a>

                                                            </div>
                                                        </li>
                                                    </ul>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="mb-3">
                                                <h4>Bài viết mới</h4>
                                                <c:forEach items="${listBlog}" var="b">
                                                    <ul class="list-styled fruite-categorie">
                                                        <li>
                                                            <div class="d-flex justify-content-between fruite-name">
                                                                <a href="blogdetail?bid=${b.getId()}"><i class="fas fa-alt me-2"></i>${b.getBlog_name()}</a>
                                                           
                                                            
                                                            </div>
                                                                <i class="fas fa-alt me-2">${b.getCreated_at()}</i> 
                                                        </li>
                                                    </ul>
                                                </c:forEach>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-lg-9">
                                    <div class="row g-4 justify-content-center">
                                        <c:forEach items="${listBlog}" var="b">
                                            <div class="col-md-6 col-lg-6 col-xl-4">

                                                <div class="rounded position-relative fruite-item">
                                                    <a href="blogdetail?bid=${b.getId()}">
                                                        <div class="fruite-img">
                                                            <img src="/TeaShop/img/${b.getImg()}" class="img-fluid w-100 rounded-top" alt="">
                                                        </div>
                                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Like</div>
                                                        <div class="p-4  border-top-0  rounded-bottom">
                                                            <h4>${b.getBlog_name()}</h4>

                                                            <!--                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                                                                                
                                                                                                                <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                                                                            </div>-->
                                                        </div>
                                                    </a>
                                                </div>

                                            </div>
                                        </c:forEach>

                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
        <!-- Blog End-->


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
