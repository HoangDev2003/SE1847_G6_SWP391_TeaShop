<%-- 
    Document   : pay-on-delivery
    Created on : May 27, 2024, 6:03:28 PM
    Author     : HuyTD
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Fruitables - Vegetable Website Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet"> 

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
                        <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i> <a href="#" class="text-white">123 Street, New York</a></small>
                        <small class="me-3"><i class="fas fa-envelope me-2 text-secondary"></i><a href="#" class="text-white">Email@Example.com</a></small>
                    </div>
                    <div class="top-link pe-2">
                        <a href="#" class="text-white"><small class="text-white mx-2">Privacy Policy</small>/</a>
                        <a href="#" class="text-white"><small class="text-white mx-2">Terms of Use</small>/</a>
                        <a href="#" class="text-white"><small class="text-white ms-2">Sales and Refunds</small></a>
                    </div>
                </div>
            </div>
            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">
                    <a href="index.html" class="navbar-brand"><h1 class="text-primary display-6"></h1></a>
                    <h1 class="text-primary display-6">Dreamy Coffee</h1>

                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>


                    </button>
                    <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                        <div class="navbar-nav mx-auto">
                            <a href="${pageContext.request.contextPath}/home" class="nav-item nav-link">Home</a>
                            <a href ="${pageContext.request.contextPath}/blog" class="nav-item nav-link">Blog</a>
                            <a href="${pageContext.request.contextPath}/shop" class="nav-item nav-link active">Shop</a>

                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                                <div class="dropdown-menu m-0 bg-secondary rounded-0">
                                    <a href="cart.jsp" class="dropdown-item">Cart</a>
                                    <a href="chackout.jsp" class="dropdown-item">Checkout</a>
                                    <a href="testimonial.jsp" class="dropdown-item">Testimonial</a>
                                    <a href="404.jsp" class="dropdown-item">404 Page</a>
                                </div>
                            </div>
                            <a href="contact.jsp" class="nav-item nav-link">Contact</a>
                        </div>
                        <div class="d-flex m-3 me-0">
                            <button class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4" data-bs-toggle="modal" data-bs-target="#searchModal"><i class="fas fa-search text-primary"></i></button>
                            <a href="CartDetails?service=showcart" class="position-relative me-4 my-auto">
                                <i class="fa fa-shopping-bag fa-2x"></i>
                                <span class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1" style="top: -5px; left: 15px; height: 20px; min-width: 20px;">3</span>
                            </a>
                            <a href="#" class="my-auto">
                                <i class="fas fa-user fa-2x"></i>
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->

        <!-- Modal Search Start -->
        <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-fullscreen">
                <div class="modal-content rounded-0">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body d-flex align-items-center">
                        <div class="input-group w-75 mx-auto d-flex">
                            <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                            <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Search End -->

        <!-- pay-via-online Start-->
        <div class="container-fluid fruite py-5">
            <div class="container py-5">            
                <div class="row g-4">
                    <div class="col-lg-12">
                        <h1 class="mb-4"></h1>
                        <div class="row g-4">
                            <div class="col-xl-3">
                                <form action="shop" method="GET">
                                    <div class="input-group w-100 mx-auto d-flex">

                                        <input type="hidden" name="search" value="searchByName">
                                        <input type="text" class="form-control p-3" name="keyword" placeholder="keywords" aria-describedby="search-icon-1">
                                        <span id="search-icon-1" class="input-group-text p-3" onclick="return this.closest('form').submit()"><i class="fa fa-search"></i></span>
                                    </div>
                                </form>

                            </div>
                            <div class="col-6"></div>
                            <div class="col-xl-3">
                                <div class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">
                                    <label for="sort">Sắp xếp theo:</label>
                                    <select name="sort" id="sort" onchange="sortBy()" class="border-0 form-select-sm bg-light me-3">
                                        <option value="product_id" <c:if test="${param.sort == null || param.sort == 'product_id'}">selected</c:if>>None</option>
                                        <option value="create_at" <c:if test="${param.sort == 'create_at'}">selected</c:if>>Sản phẩm mới nhất</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row g-4">
                                <div class="col-lg-3">
                                    <div class="row g-4">
                                        <div class="col-lg-12">
                                            <div class="mb-3">
                                                <h4>Loại sản phẩm</h4>
                                            <c:forEach items="${listCategory}" var="cate">
                                                <ul class="list-unstyled fruite-categorie">
                                                    <li>
                                                        <div class="d-flex justify-content-between fruite-name">
                                                            <a href="shop?search=category&category_id=${cate.category_id}"><i class="fas fa-apple-alt me-2"></i>${cate.category_name}</a>

                                                        </div>
                                                    </li>
                                                </ul>
                                            </c:forEach>
                                        </div>
                                    </div>

                                    <div class="container">
                                        <div class="col-lg-12">
                                            <h4 class="mb-3">Sản phẩm nổi bật</h4>
                                            <c:forEach items="${listSpecialProduct}" var="special">
                                                <div class="d-flex align-items-center mb-4 p-3 border rounded shadow-sm product-card">
                                                    <div class="rounded me-4" style="width: 100px; height: 100px; overflow: hidden;">
                                                        <img src="${special.image}" class="img-fluid rounded" alt="${special.product_name}">
                                                    </div>
                                                    <div>
                                                        <h6 class="mb-2">${special.product_name}</h6>
                                                        <div class="d-flex mb-2 text-warning">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                        <div class="d-flex mb-2">
                                                            <h5 class="fw-bold me-2">${special.price}</h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-lg-9">
                                <div class="row g-4 justify-content-center"> 
                                    <form id="paymentForm" action="PaymentResult" method="post" onsubmit="return validateForm()">
                                        <h2>Thanh toán bằng tiền mặt</h2>
                                        <div class="col-md-12 col-lg-12 col-xl-12 mb-4">
                                            <div class="p-4 border border-secondary rounded">
                                                <p>Họ và tên:</p>
                                                <input type="text" id="fullname" name="fullname" value="${fullname}">   
                                            </div>
                                        </div>
                                        <div class="col-md-12 col-lg-12 col-xl-12 mb-4">
                                            <div class="p-4 border border-secondary rounded">
                                                <p>Địa chỉ nhận hàng:</p>
                                                <input type="text" id="address" name="address" value="${address}">   
                                            </div>
                                        </div>
                                        <div class="col-md-12 col-lg-12 col-xl-12 mb-4">
                                            <div class="p-4 border border-secondary rounded">
                                                <p>Số điện thoại:</p>
                                                <input type="text" id="phonenumber" name="phonenumber" value="${phonenumber}">   
                                            </div>
                                        </div>
                                        <div class="col-md-12 col-lg-12 col-xl-12 mb-4">
                                            <div class="p-4 border border-secondary rounded">
                                                <p>Tổng tiền hóa đơn: ${totalCartAmount} đồng</p>
                                            </div>
                                        </div>
                                        <input type="hidden" name="amount" value="${totalCartAmount}">
                                        <input type="hidden" name="service" value="cash-on-delivery">
                                        <button type="submit" class="btn border border-secondary rounded-pill px-3 text-primary">Xác nhận thanh toán</button>
                                    </form>

                                    <script>
                                        function validateForm() {
                                            // Regex patterns
                                            const namePattern = /^[a-zA-ZÀ-ỹ]+\s+[a-zA-ZÀ-ỹ]+(?:\s+[a-zA-ZÀ-ỹ]+)*$/;
                                            const addressPattern = /^.{1,250}$/;
                                            const phonePattern = /^\d{10}$/;

                                            // Form values
                                            const fullname = document.getElementById('fullname').value.trim();
                                            const address = document.getElementById('address').value.trim();
                                            const phonenumber = document.getElementById('phonenumber').value.trim();

                                            // Validate name
                                            if (!namePattern.test(fullname) || fullname.length < 1 || fullname.length > 50) {
                                                alert("Họ và tên chỉ chứa chữ cái và phải có dấu cách ở giữa.");
                                                return false;
                                            }

                                            // Validate address
                                            if (!addressPattern.test(address)) {
                                                alert("Địa chỉ nhận hàng phải dài từ 1 đến 250 ký tự.");
                                                return false;
                                            }

                                            // Validate phone number
                                            if (!phonePattern.test(phonenumber)) {
                                                alert("Số điện thoại phải là số chứa đúng 10 chữ số.");
                                                return false;
                                            }

                                            return true;
                                        }
                                    </script>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- pay-via-online End-->        

        <!-- Footer Start -->
        <jsp:include page="../common/homePage/footer-start.jsp"></jsp:include>
            <!-- Footer End -->  

            <!-- JavaScript Libraries-->
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