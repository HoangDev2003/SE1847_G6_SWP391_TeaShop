<%-- 
    Document   : productManagement
    Created on : Jun 18, 2024, 10:42:34 PM
    Author     : Pham Toan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Admin Management</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="productmanager">Product Management</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <c:if test="${showSearchProduct ne null}">
                <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0" action="productmanager" id="searchByName">
                    <input type="hidden" name="service" value="searchByKeywords"/>
                    <div class="input-group">
                        <input class="form-control" type="text" placeholder="Search by Keywords" aria-label="Search by Keywords" aria-describedby="btnNavbarSearch" name="keywords"
                               value="${keywords}" />
                        <button class="btn btn-primary" id="btnNavbarSearch" type="submit"><i class="fas fa-search"></i></button>
                    </div>
                </form>
            </c:if>


            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>



        <div id="layoutSidenav">
            <jsp:include page="../../common/admin/sidebarAdmin.jsp"></jsp:include>
                <div id="layoutSidenav_content">
                    <main>                   
                        <div class="container-fluid px-4">
                            <ol class="breadcrumb mb-4" style="padding-top: 24px">
                                <li class="breadcrumb-item"><a href="dashboardAdmin.jsp">Dashboard</a></li>
                                <li class="breadcrumb-item active">Product Management</li>
                            </ol>

                        <c:if test="${notFoundProduct ne null}">
                            <h4 class="font-weight-semi-bold text-uppercase mb-3 text-center">
                                ${notFoundProduct}
                            </h4>
                        </c:if>

                        <c:if test="${deleteDone ne null}">
                            <h4 class="font-weight-semi-bold text-uppercase mb-3 text-center">
                                ${deleteDone}
                            </h4>
                        </c:if>


                        <c:if test="${not empty listAllProduct}">
                            <div class="card mb-4">
                                <div class="h1">                                
                                    <a  
                                        href="addProductManager"><ion-icon name="add-circle-outline" ></ion-icon>  Add a new Product</a>                                   
                                </div>  
                            </div>

                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-table me-1"></i>
                                    Product Manager
                                </div>
                                <!--List all Product-->
                                <div class="card-body">
                                    <table id="datatablesSimple" >
                                        <thead>
                                            <tr>
                                                <th>Product ID</th>
                                                <th>Product Name</th>
                                                <th>Category</th>
                                                <th>Image</th>
                                                <th>Price</th>
                                                <th>Date</th>
                                                <th>Update</th>
                                                <th>Delete</th>   
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listAllProduct}" var="product">
                                                <tr>
                                                    <td>${product.product_id}</td>
                                                    <td>${product.product_name}</td>
                                                    <td>${product.category.category_name}</td>
                                                    <td><img src="${product.image}" style="width: 130px" /></td>
                                                        <fmt:setLocale value="vi_VN" />
                                                    <td><fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₫" /></td>
                                                    <td>${product.create_at}</td>
                                                    <td><a href="updateProductManager?service=requestUpdate&productId=${product.product_id}"><ion-icon name="create-outline"></ion-icon></a></td>
                                                    <td><a href="deleteProductManager?service=requestDelete&productId=${product.product_id}">
                                                            <ion-icon name="trash-outline"></ion-icon></a></td>
                                                </tr>  
                                            </c:forEach>
                                        </tbody>                                   
                                    </table>
                                </div>
                            </div>
                        </c:if>
                    </div>                    
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Tea Shop - Admin Management</div>
                        </div>
                    </div>
                </footer>
                <style>
                    .datatable-table
                    {

                        font-family: 'Verdana', sans-serif; /* Bạn có thể thay đổi phông chữ nếu muốn */
                        font-size: 15px; /* Thiết lập kích thước phông chữ */
                        color: #333; /* Màu sắc của chữ */
                        text-align: center; /* Căn giữa ngang */
                        vertical-align: middle; /* Căn giữa dọc */
                        padding: 10px; /* Thêm khoảng đệm cho nội dung */
                    }
                    .datatable-table th a {

                        font-family: 'Arial', sans-serif;
                        color: inherit;
                        text-align: center; /* Căn giữa ngang */
                        vertical-align: middle; /* Căn giữa dọc */
                        /*   
                        */ }
                    td ion-icon {
                        font-size: 30px;
                        color: #000;
                    }

                    .h1 {
                        padding: 20px; /* Thêm padding cho thẻ div */
                        background-color: #fff; /* Màu nền cho thẻ div */
                        text-align: center; /* Căn giữa nội dung bên trong theo chiều ngang */

                    }

                    .h1 a {
                        display: flex; /* Sử dụng flexbox */
                        align-items: center; /* Căn giữa theo chiều dọc */
                        justify-content: center; /* Căn giữa theo chiều ngang */
                        font-weight: 500;
                        font-size: 20px;
                        text-transform: uppercase;
                        text-decoration: none; /* Bỏ gạch chân */
                        color: inherit; /* Giữ nguyên màu chữ */
                        padding: 10px 20px; /* Thêm padding cho liên kết */
                        border: 2px solid #0B3649; /* Thêm viền */
                        border-radius: 8px; /* Bo tròn các góc */
                        background-color: #fff; /* Màu nền cho liên kết */
                        transition: background-color 0.3s, color 0.3s, border-color 0.3s; /* Hiệu ứng chuyển đổi */
                    }

                    .h1 a ion-icon {
                        margin-right: 8px; /* Khoảng cách giữa icon và chữ */
                        font-size: 24px; /* Kích thước icon */
                    }

                    .h1 a:hover {
                        background-color: #0B3649; /* Màu nền khi lướt chuột qua */
                        color: white; /* Màu chữ khi lướt chuột qua */
                        border-color: #0B3649; /* Màu viền khi lướt chuột qua */
                    }

                    a ion-icon {
                        font-size: 25px;
                        text-align: center; /* Căn giữa ngang */
                        vertical-align: middle; /* Căn giữa dọc */
                    }

                    .datatable-sorter::before, .datatable-sorter::after {
                        content: "";
                        height: 0;
                        width: 0;
                        position: absolute;
                        right: 4px;
                        border-left: 4px solid transparent;
                        border-right: 4px solid transparent;
                        opacity: 0.8;
                    }
                    element.style {
                        font-family: 'Arial';
                        transform: translateX(25vw);
                        width: 25%;
                        color: #00a5bb;
                    }

                </style>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/datatables-simple-demo.js"></script>
        <script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>
        <!-- Include jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>



    </body>
</html>

