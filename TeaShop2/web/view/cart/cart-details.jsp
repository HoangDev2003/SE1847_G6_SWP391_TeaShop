<%-- 
    Document   : cart-details
    Created on : May 27, 2024, 6:03:28 PM
    Author     : HuyTD
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="entity.CartDetails, java.util.Enumeration"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
                            <a href="${pageContext.request.contextPath}/shop" class="nav-item nav-link">Shop</a>

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
                            <%
                int count = 0;
                Enumeration<String> em = session.getAttributeNames();
                while (em.hasMoreElements()) {
                    String key = em.nextElement();

                    if (key.startsWith("cartItem")) {
                        count++;
                    }
                } 
                            %>
                            <a href="CartDetails?service=showcart" class="position-relative me-4 my-auto">
                                <i class="fa fa-shopping-bag fa-2x" style="color: orange;"></i>
                                <%if(count>0){%>
                                <span class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1" style="top: -5px; left: 15px; height: 20px; min-width: 20px;"><%=count%></span>
                                <%}%>
                            </a>
                            <% 
    Integer accountId = (Integer) session.getAttribute("accountId");
    if (accountId != null) {
                            %>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link" data-bs-toggle="dropdown" style="color: black;">
                                    <i class="fas fa-user fa-2x" style="color: black;"></i>
                                </a>
                                <div class="dropdown-menu m-0 bg-secondary rounded-0">
                                    <a href="userprofile" class="dropdown-item">Thông tin</a>
                                    <a href="MyOrder" class="dropdown-item">Đơn hàng</a>
                                </div>
                            </div>
                            <% 
                                } else { 
                            %>
                            <a href="login"><i class="fas fa-user fa-2x" style="color: black;"></i></a>
                                <% 
                                    } 
                                %>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->

        <!-- cart-details Start-->
        <div class="container-fluid fruite py-5">
            <div class="container py-5">            
                <div class="row g-4">
                    <div class="col-lg-12">
                        <h1 class="mb-4"></h1>
                        <div class="row g-4">
                            <div class="col-6"></div>
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
                                <div class="col-lg-6">
                                    <div class="row g-4 justify-content-center">
                                        <c:if test="${empty cartInfo}">
                                            <div class="col-md-12 col-lg-12 col-xl-12 mb-4">
                                                <div class="p-4 border border-secondary rounded">
                                                    <p>Giỏ hàng của bạn hiện không có sản phẩm nào.</p>
                                                    <p><a href="shop" class="btn border border-secondary rounded-pill px-3 text-primary">Chọn sản phẩm</a></p>
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:forEach var="cartItem" items="${cartInfo}" varStatus="status">
                                            <div class="col-md-12 col-lg-12 col-xl-12 mb-4">
                                                <div class="p-4 border border-secondary rounded">
                                                    <div class="row">
                                                        <div class="col-md-4 col-lg-4 col-xl-4">
                                                            <p><img src="${cartItem.product.image}" class="img-fluid w-100" alt="" width="50" height="50"></p>
                                                        </div>
                                                        <div class="col-md-8 col-lg-8 col-xl-8">
                                                            <p>ID sản phẩm: ${cartItem.product.product_id}</p>
                                                            <p>Tên sản phẩm: ${cartItem.product.product_name}</p>
                                                            <p>Giá tiền: <fmt:formatNumber value="${cartItem.product.price}" type="number" groupingUsed="true"/> đồng</p>
                                                            <form>
                                                                <p>Số lượng:
                                                                <div class="quantity-input">
                                                                    <button type="button" onclick="decreaseQuantity(${cartItem.product.product_id})">-</button>
                                                                    <input id="quantity-${cartItem.product.product_id}" type="number" name="quantity" value="${cartItem.quantity}" onchange="updateQuantity(this.value, ${cartItem.product.product_id})">
                                                                    <button type="button" onclick="increaseQuantity(${cartItem.product.product_id})">+</button>
                                                                </div>
                                                                </p>
                                                            </form>

                                                            <style>
                                                                .quantity-input {
                                                                    display: flex;
                                                                    align-items: center;
                                                                }

                                                                .quantity-input button {
                                                                    padding: 5px;
                                                                    width: 30px;
                                                                    height: 30px;
                                                                    border-radius: 50%; /* Makes the buttons circular */
                                                                    font-size: 1em;
                                                                    cursor: pointer;
                                                                    border: 1px solid #ccc;
                                                                    background-color: #f0f0f0;
                                                                    margin: 0 5px; /* Adds spacing between buttons */
                                                                }

                                                                .quantity-input input {
                                                                    width: 60px; /* Adjust the width as needed */
                                                                    padding: 5px;
                                                                    text-align: center;
                                                                    margin-right: 10px;
                                                                    margin-left: 10px;/* Adjust spacing between input and buttons */
                                                                }
                                                            </style>

                                                            <script>
                                                                function updateQuantity(quantity, productId) {

                                                                    if (quantity > 999) {
                                                                        quantity = 999;
                                                                    } else if (quantity < 1) {
                                                                        quantity = 1;
                                                                    }

                                                                    $.ajax({
                                                                        url: 'CartDetails',
                                                                        type: 'POST',
                                                                        data: {
                                                                            quantity: quantity,
                                                                            product_id: productId,
                                                                            service: 'updateQuantity'
                                                                        },
                                                                        success: function (response) {
                                                                            console.log('Success:', response);

                                                                            // Format total price with commas every 3 digits
                                                                            let formattedPrice = numberWithCommas(response.totalPrice);
                                                                            // Update the total price dynamically
                                                                            $('#total-price-' + productId).text('Tổng tiền: ' + formattedPrice + ' đồng');

                                                                            // Format total cart amount with commas every 3 digits
                                                                            let formattedCartAmount = numberWithCommas(response.totalCartAmount);
                                                                            // Update the total cart amount dynamically
                                                                            $('#total-cart-amount').text('Tổng tiền hóa đơn: ' + formattedCartAmount + ' đồng');
                                                                        },
                                                                        error: function (xhr, status, error) {
                                                                            console.error('Error:', error);
                                                                        }
                                                                    });
                                                                }

                                                                function numberWithCommas(x) {
                                                                    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                                                }
                                                                function decreaseQuantity(productId) {
                                                                    var inputElement = document.getElementById('quantity-' + productId);
                                                                    var currentValue = parseInt(inputElement.value);
                                                                    if (!isNaN(currentValue) && currentValue > 1) {
                                                                        var newValue = currentValue - 1;
                                                                        inputElement.value = newValue;
                                                                        updateQuantity(newValue, productId);
                                                                    }
                                                                }

                                                                function increaseQuantity(productId) {
                                                                    var inputElement = document.getElementById('quantity-' + productId);
                                                                    var currentValue = parseInt(inputElement.value);
                                                                    if (!isNaN(currentValue) && currentValue < 999) {
                                                                        var newValue = currentValue + 1;
                                                                        inputElement.value = newValue;
                                                                        updateQuantity(newValue, productId);
                                                                    }
                                                                }
                                                            </script>
                                                            <form action="CartDetails" method="post" id="topping-form-${status.index}">
                                                                <p>Toppings:</p>
                                                                <c:forEach var="topping" items="${toppingList}">
                                                                    <div>
                                                                        <input type="checkbox" name="topping_names" value="${topping}" id="topping-${status.index}-${topping}"
                                                                               <c:forEach var="selectedTopping" items="${cartItem.topping}">
                                                                                   <c:if test="${selectedTopping.topping_name == topping}">checked</c:if>
                                                                               </c:forEach>
                                                                               >
                                                                        <label for="topping-${status.index}-${topping}">${topping}</label>
                                                                    </div>
                                                                </c:forEach>
                                                                <input type="hidden" name="product_id" value="${cartItem.product.product_id}">
                                                                <input type="hidden" name="service" value="updateTopping">
                                                                <button type="submit">Update Toppings</button>
                                                            </form>
                                                            <p id="total-price-${cartItem.product.product_id}">Tổng tiền: <fmt:formatNumber value="${cartItem.product.price * cartItem.quantity}" type="number" groupingUsed="true"/> đồng</p>

                                                            <p><a href="CartDetails?service=delete&product_id=${cartItem.product.product_id}" class="btn border border-secondary rounded-pill px-3 text-primary">Xóa sản phẩm</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="row g-4 justify-content-center"> 
                                        <div class="col-md-6 col-lg-6 col-xl-12">
                                            <div class="p-4 border border-secondary rounded">
                                                <p id="total-cart-amount">Tổng tiền hóa đơn: <fmt:formatNumber value="${totalCartAmount}" type="number" groupingUsed="true"/> đồng</p>

                                                <c:if test="${not empty cartInfo}">
                                                    <p><a href="shop" class="btn border border-secondary rounded-pill px-3 text-primary">Chọn thêm sản phẩm</a></p>
                                                    <p><a href="CartDetails?service=selectpayment" class="btn border border-secondary rounded-pill px-3 text-primary">Thanh toán</a></p>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- cart-details End-->        

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
