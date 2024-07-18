<%-- 
    Document   : shipperManagement.jsp
    Created on : Jul 5, 2024, 2:44:12 AM
    Author     : Huyen Tranq
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <a class="navbar-brand ps-3" href="index.html">Quản lý Shipper</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0" action="searchUser">
                <div class="input-group">
                    <input class="form-control" type="text" name="search" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
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
                        <li><a class="dropdown-item" href="home">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <jsp:include page="../../common/admin/sidebarAdmin.jsp"></jsp:include>
                <div id="layoutSidenav_content">
                    <main>
                        <div style="margin-top: 20px" class="container-fluid px-4">

                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                <li class="breadcrumb-item active">Quản lý Shipper</li>
                            </ol>

                            <div class="filter1">
                                <form action="filtershipper">
                                    <div class="filter" style="display: flex; align-items: center;">
                                        <a class="texta" style="color: #454444f7; margin-right: 10px;">Filter:</a>
                                        <select name="gender" style="margin-right: 10px;">
                                            <option>Giới tính</option>
                                            <option value="Female" ${'Female' == gender ? "selected" : ""}>Female</option>        
                                        <option value="Male" ${'Male' == gender ? "selected" : ""}>Male</option>   
                                    </select>                                                                   
                                    <select name="status" style="margin-right: 10px;">
                                        <option>Status</option>
                                        <c:forEach items="${listas}" var="s">
                                            <option value="${s.getStatus_id()}" ${s.getStatus_id() == status ? "selected" : ""}>${s.getStatus_name()}</option>                  
                                        </c:forEach>
                                    </select>
                                    <input type="submit" value="Filter"/>                                              
                                </div>
                            </form>                             
                        </div>
                        <div style="margin-left: 15px; margin-bottom: 20px; margin-top: 20px">
                            <a href="adduser"><button type="button" class="btn btn-danger">Add Shipper</button> </a>
                        </div>
                        <form action="searchShipper">
                            <input type="search" name="search" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" style="max-width: 95%" />
                        </form>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Bảng dữ liệu shipper
                            </div>
                            <form action="shippermanager">
                                <div class="card-body">
                                    <table id="datatablesSimple">
                                        <thead>
                                            <tr>
                                                <th>Họ Tên</th>
                                                <th>Giới tính</th>
                                                <th>Email</th>
                                                <th>Số điện thoại</th>
                                                <th>Role</th>
                                                <th>Status</th>
                                                <th>Chỉnh sửa</th>
                                            </tr>
                                        </thead>                                           
                                        <tbody>
                                            <c:forEach items="${listShipper}" var="lp">
                                                <tr>                                                 
                                                    <td>${lp.user_name}</td>
                                                    <td>${lp.gender}</td>
                                                    <td>${lp.email}</td>
                                                    <td>${lp.phone_number}</td>
                                                    <td>${lp.role_name}</td>
                                                    <td>${lp.status_name}</td>
                                                    <td><a href="editShipper?id=${lp.account_id}">Edit</a>
                                                        <a href="deleteshipper?id=${lp.account_id}">Delete</a></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>

                                </div>
                            </form>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/datatables-simple-demo.js"></script>
    </body>
</html>


