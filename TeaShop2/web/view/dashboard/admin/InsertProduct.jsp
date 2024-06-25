<%-- 
    Document   : InsertProduct
    Created on : Jun 24, 2024, 11:35:56 PM
    Author     : Pham Toan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
            <a class="navbar-brand ps-3" href="index.html">Product Management</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">


                </div>
            </form>
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

        <c:if test="${InsertDone ne null}">
            <h3>
                ${InsertDone}
            </h3>
        </c:if> 
        <c:if test="${insertProduct ne null}">
            <form action="addProductManager" id="insertProduct">
                <input type="hidden" name="service" value="sendInsertDetail" />
                <div id="layoutSidenav">
                    <jsp:include page="../../common/admin/sidebarAdmin.jsp"></jsp:include>
                        <div id="layoutSidenav_content">
                            <main>                   
                                <div class="container-fluid px-4">
                                    <h1 class="mt-4">Product Management</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item"><a href="dashboardAdmin.jsp">Dashboard</a></li>
                                        <li class="breadcrumb-item active">Product Management</li>
                                    </ol>
                                    <div class="card mb-4">
                                        <div class="card-body">                                
                                            <h5>Insert a new Product!</h5>
                                        </div>
                                    </div>

                                    <div class="card mb-4">
                                        <div class="card-header">
                                            <i class="fas fa-table me-1"></i>
                                            Product Manager
                                        </div>


                                        <!--List all Product-->


                                        <div class="card-body">
                                            <table id="datatablesSimple">
                                                <thead>
                                                    <tr>
                                                        <th>Product Name</th>
                                                        <th>Category</th>
                                                        <th>Image</th>
                                                        <th>Price</th>
                                                        <th>Date</th>
                                                        <th>Description</th>
                                                    </tr>
                                                </thead>
                                                <tbody>                                       
                                                    <tr>
                                                        <td>
                                                            <input type="text" name="name" size="50" style="height: 35px"/>
                                                        </td>
                                                        <td><select name="category" style="width: 180px; height: 35px" >
                                                            <c:forEach items="${allCategorys}" var="category">
                                                                <option  value="${category.category_id}">${category.category_name}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                    <td><input type="text" name="image_url" size="40" style="height: 35px"/>
                                                    </td>
                                                    <td><input type="number" name="price" style="height: 35px"/>
                                                    </td>
                                                    <td><input type="datetime" name="create_at" style="height: 35px"/>
                                                    </td>
                                                    <td><input type="text" name="description" size="60" style="height: 35px"/>
                                                    </td>
                                                </tr>                                         
                                            </tbody>
                                        </table>
                                    </div>
                                    <button
                                        style="transform: translateX(70vw) ; width: 10%"
                                        onclick="document.getElementById('insertProduct').submit();">
                                        ADD PRODUCT
                                    </button>
                                    <div style="height: 20px"></div>
                                </div>

                            </div>                    
                        </main>
                        <footer class="py-4 bg-light mt-auto">
                            <div class="container-fluid px-4">
                                <div class="d-flex align-items-center justify-content-between small">
                                    <div class="text-muted">Tea Shop - Admin Management</div>
                                    <div>
                                        <a href="#">Privacy Policy</a>
                                        &middot;
                                        <a href="#">Terms &amp; Conditions</a>
                                    </div>
                                </div>
                            </div>
                        </footer>
                    </div>
                </div>
            </form>
        </c:if>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/datatables-simple-demo.js"></script>
    </body>
</html>


