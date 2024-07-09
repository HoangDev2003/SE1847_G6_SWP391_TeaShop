<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="entity.Orders" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Staff Page</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet"/>
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <style>
            img {
                width: 200px;
                height: 150px;
            }
            .checkbox-option {
                display: inline-block;
                margin-right: 10px;
            }
            .hidden {
                display: none;
            }
        </style>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <p class="navbar-brand ps-3">Nhân viên</p>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">

                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i> ${sessionScope.account.fullName}</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="userProfile">Profile</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="login">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>

        <div id="layoutSidenav">
            <div class="col-lg-2">
                <div id="layoutSidenav_nav">
                    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                        <div class="sb-sidenav-menu">
                            <div class="nav">
                                <div class="sb-sidenav-menu-heading">Menu</div>
                                <a class="nav-link ${current_status_id == '0' ? 'text-white' : ''}" href="Staff">
                                    Tất cả đơn hàng
                                </a>
                                <a class="nav-link ${current_status_id == '1' ? 'text-white' : ''}" href="Staff?current_status_id=1">
                                    Đơn hàng cần xác nhận
                                </a>
                                <a class="nav-link ${current_status_id == '2' ? 'text-white' : ''}" href="Staff?current_status_id=2">
                                    Đơn hàng cần làm
                                </a>
                            </div>
                        </div>
                        <div class="sb-sidenav-footer">
                            Nhân viên
                        </div>
                    </nav>

                </div>
            </div>
            <div class="col-lg-10 mt-5">
                <div class="mt-4">
                    <div class="container-fluid px-4">
                        <c:if test="${empty listOrders}">
                            <div class="row justify-content-center align-items-top" style="height: 100vh;">
                                <div class="col-auto">
                                    <c:choose>
                                        <c:when test="${current_status_id == 0}">
                                            <h4>Hiện tại không có đơn hàng nào</h4>
                                        </c:when>
                                        <c:when test="${current_status_id == 1}">
                                            <h4>Hiện tại không có đơn hàng nào cần xác nhận</h4>
                                        </c:when>
                                        <c:when test="${current_status_id == 2}">
                                            <h4>Hiện tại không có đơn hàng nào cần làm</h4>
                                        </c:when>
                                    </c:choose>
                                </div>
                            </div>
                        </c:if>
                        <c:choose>
                            <c:when test="${current_status_id == '0'}">
                                <h5>Số đơn hàng: ${fn:length(listOrders)}</h5>
                            </c:when>
                            <c:when test="${current_status_id == '1'}">
                                <h5>Số đơn hàng cần xác nhận: ${fn:length(listOrders)}</h5>
                            </c:when>
                            <c:when test="${current_status_id == '2'}">
                                <h5>Số đơn hàng cần làm: ${fn:length(listOrders)}</h5>
                            </c:when>
                            <c:otherwise>
                                <h5>Số đơn hàng: ${fn:length(listOrders)}</h5>
                            </c:otherwise>
                        </c:choose>

                        <c:forEach items="${listOrders}" var="p">

                            <div class="p-4 border border-secondary rounded mt-4">
                                <div class="row">
                                    <div class="col-lg-3">
                                        <p>ID hóa đơn: ${p.order_id}</p>
                                        <p>Họ và tên: ${p.full_name}</p>
                                        <p>Số điện thoại: ${p.phone_number}</p>
                                        <p>Ngày: ${p.formattedOrderDate}</p>
                                        <p>Tổng tiền hóa đơn: <fmt:formatNumber value="${p.total_amount}" type="number" groupingUsed="true"/> đồng</p>
                                    </div>
                                    <div class="col-lg-6">
                                        <p>Đơn hàng:</p>
                                        <table class="table table-striped" style="border-collapse: collapse; width: 100%;">
                                            <colgroup>
                                                <col style="width: 45%;">
                                                <col style="width: 20%;">
                                                <col style="width: 35%;">
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th style="border: 1px solid black;">Sản phẩm</th>
                                                    <th style="border: 1px solid black;">Số lượng</th>
                                                    <th style="border: 1px solid black;">Topping</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${p.orderDetails}" var="detail">
                                                    <tr>
                                                        <td style="border: 1px solid black;">${detail.product.product_name} (ID: ${detail.product.product_id})</td>
                                                        <td style="border: 1px solid black;">${detail.quantity}</td>
                                                        <td style="border: 1px solid black;">
                                                            <c:set var="toppingsList" value="" />
                                                            <c:forEach items="${detail.topping}" var="topping" varStatus="status">
                                                                <c:set var="toppingsList" value="${toppingsList}${topping.topping_name}${status.last ? '' : ', '}" />
                                                            </c:forEach>
                                                            <c:choose>
                                                                <c:when test="${empty toppingsList}">
                                                                    Không có
                                                                </c:when>
                                                                <c:otherwise>
                                                                    ${toppingsList}
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="col-lg-3">
                                        <h5>Trạng thái: ${p.status.status_name}</h5>
                                        <c:choose>
                                            <c:when test="${current_status_id == 0}">

                                                <c:choose>
                                                    <c:when test="${p.status.status_id == 1}">
                                                        <form action="Staff" method="post" onsubmit="return confirm('Bạn có chắc chắn muốn xác nhận đơn hàng?')">
                                                            <input type="hidden" name="service" value="update">
                                                            <input type="hidden" name="order_id" value="${p.order_id}">
                                                            <input type="hidden" name="current_status_id" value="${current_status_id}">
                                                            <input type="hidden" name="status_id" value="2">
                                                            <div style="display: flex; align-items: center;">
                                                                <button type="submit" class="btn border border-secondary rounded-pill px-3 confirm-green custom-btn">Xác nhận đơn hàng</button>
                                                            </div>
                                                        </form>
                                                        
                                                        <div style="display: flex; align-items: center; margin-top: 16px;">
                                                            <button type="submit" class="btn border border-secondary rounded-pill px-3 custom-btn" disabled>Đã xong đơn hàng</button>
                                                            <span style="color: red; margin-left: 10px;">Chờ xác nhận</span>
                                                        </div>
                                                    </c:when>

                                                    <c:when test="${p.status.status_id == 2}">
                                                        <div style="display: flex; align-items: center;">
                                                            <button type="submit" class="btn border border-secondary rounded-pill px-3 custom-btn" disabled>Xác nhận đơn hàng</button>
                                                            <span style="color: red; margin-left: 10px;">Đã xác nhận</span>
                                                        </div>
                                                        
                                                        <form action="Staff" method="post" onsubmit="return confirm('Bạn có chắc chắn rằng đơn hàng đã hoàn thành?')">
                                                            <input type="hidden" name="service" value="update">
                                                            <input type="hidden" name="order_id" value="${p.order_id}">
                                                            <input type="hidden" name="current_status_id" value="${current_status_id}">
                                                            <input type="hidden" name="status_id" value="3">
                                                            <div style="display: flex; align-items: center; margin-top: 16px;">
                                                                <button type="submit" class="btn border border-secondary rounded-pill px-3 custom-btn confirm-green">Đã xong đơn hàng</button>
                                                            </div>
                                                        </form>
                                                    </c:when>
                                                </c:choose>
                                            </c:when>

                                            <c:when test="${p.status.status_id == 1}">
                                                <form action="Staff" method="post" onsubmit="return confirm('Bạn có chắc chắn muốn xác nhận đơn hàng?')">
                                                    <input type="hidden" name="service" value="update">
                                                    <input type="hidden" name="order_id" value="${p.order_id}">
                                                    <input type="hidden" name="current_status_id" value="${current_status_id}">
                                                    <input type="hidden" name="status_id" value="2">
                                                    <button type="submit" class="btn border border-secondary rounded-pill px-3 custom-btn confirm-green">Xác nhận đơn hàng</button>
                                                </form>
                                                
                                            </c:when>
                                            <c:when test="${p.status.status_id == 2}">
                                                <form action="Staff" method="post" onsubmit="return confirm('Bạn có chắc chắn rằng đơn hàng đã hoàn thành?')">
                                                    <input type="hidden" name="service" value="update">
                                                    <input type="hidden" name="order_id" value="${p.order_id}">
                                                    <input type="hidden" name="current_status_id" value="${current_status_id}">
                                                    <input type="hidden" name="status_id" value="3">
                                                    <button type="submit" class="btn border border-secondary rounded-pill px-3 custom-btn confirm-green">Đã xong đơn hàng</button>
                                                </form>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                            <style>
                                .custom-btn {
                                    color: black;
                                    background-color: white;
                                    transition: background-color 0.3s ease;
                                }

                                .confirm-green:hover {
                                    background-color: #13f240;
                                    color: white;
                                }

                                .confirm-red:hover {
                                    background-color: red;
                                    color: white;
                                }
                            </style>

                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JS-->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${pageContext.request.contextPath}/js/scripts.js"></script>

    </body>
</html>
