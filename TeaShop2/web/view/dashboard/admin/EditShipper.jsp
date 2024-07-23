<%-- 
    Document   : EditShipper.jsp
    Created on : Jul 23, 2024, 5:15:09 PM
    Author     : Huyen Tranq
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
        <meta name="author" content=""/>
        <title>Admin Management</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <style>
            .form-container {
                display: flex;
                justify-content: center;
                align-items: center;
                height: calc(100vh - 56px); /* Adjust height based on your navbar height */
            }
            .form-horizontal {
                width: 100%;
                max-width: 900px; /* Adjust the max-width as needed */
                margin: 0 auto;
            }
            .increase-font {
                font-size: 18px;
            }
            .input-like-p {
                background: transparent;
                border: none;
                outline: none;
                padding: 0;
                font-family: inherit;
                font-size: inherit;
                cursor: text;
            }
        </style>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand ps-3" href="staffmanager">Quản lý Nhân viên</a>
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group"></div>
            </form>
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="home">Home</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <jsp:include page="../../common/admin/sidebarAdmin.jsp"></jsp:include>
                <div class="dashboard-wrapper">
                    <div class="dashboard-ecommerce">
                        <div class="container-fluid dashboard-content">
                            <div class="form-container">
                                <form id="switchForm" action="editShipper" class="form-horizontal" method="post" enctype="multipart/form-data">
                                    <fieldset>
                                        <legend>Staff Information</legend>
                                        <section style="background-color: #eee;">
                                            <div class="container py-5">
                                                <div class="row">
                                                    <div class="col">
                                                        <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                                                            <ol class="breadcrumb mb-0">
                                                                <li class="breadcrumb-item"><a href="shippermanager">Shipper Manager</a></li>
                                                                <li class="breadcrumb-item active" aria-current="page">Edit Shipper Profile</li>
                                                            </ol>
                                                        </nav>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-4">
                                                        <div class="card mb-4">
                                                            <div class="card-body text-center">
                                                                <img id="previewImg1" src="${acc.avartar}" alt="avatar"
                                                                 class="rounded-circle img-fluid" style="width: 250px; height: 250px" readonly="">
                                                            <h5 class="my-3 increase-font">${acc.user_name}</h5>
                                                            <input id="filebutton1" name="img" class="input-file" type="file" onchange="displayImage(this, 'previewImg1')" readonly="">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-8">
                                                    <div class="card mb-4">
                                                        <div class="card-body increase-font">
                                                            <div class="row">
                                                                <div class="col-sm-3">
                                                                    <p class="mb-0">Tên người dùng</p>
                                                                </div>
                                                                <div class="col-sm-9">
                                                                    <input type="text" value="${acc.user_name}" name="name" class="input-like-p" readonly="">
                                                                </div>
                                                            </div>
                                                            <hr>
                                                            <div class="row">
                                                                <div class="col-sm-3">
                                                                    <p class="mb-0">Email</p>
                                                                </div>
                                                                <div class="col-sm-9">
                                                                    <input type="text" value="${acc.email}" name="email" class="input-like-p" readonly="">
                                                                </div>
                                                            </div>
                                                            <hr>
                                                            <div class="row">
                                                                <div class="col-sm-3">
                                                                    <p class="mb-0">Số điện thoại</p>
                                                                </div>
                                                                <div class="col-sm-9">
                                                                    <input type="text" value="${acc.phone_number}" name="phone" class="input-like-p" readonly="">
                                                                </div>
                                                            </div>
                                                            <hr>
                                                            <div class="row">
                                                                <div class="col-sm-3">
                                                                    <p class="mb-0">Giới tính</p>
                                                                </div>
                                                                <div class="col-sm-9">
                                                                    <input type="text" value="${acc.gender}" name="gender" class="input-like-p" readonly="">
                                                                </div>
                                                            </div>
                                                            <hr>
                                                            <div class="row">
                                                                <div class="col-sm-3">
                                                                    <p class="mb-0">Địa chỉ</p>
                                                                </div>
                                                                <div class="col-sm-9">
                                                                    <input class="input-like-p" type="text" value="${acc.address}" name="address" readonly="">
                                                                </div>
                                                            </div>
                                                            <hr>
                                                            <div class="row">
                                                                <div class="col-sm-3">
                                                                    <p class="mb-0">Role</p>
                                                                </div>
                                                                <div class="col-sm-9">
                                                                    <select class="input-like-p" name="role">
                                                                        <option value="1" ${'Admin' eq acc.role_name ? "selected" : ""}>Admin</option>   
                                                                        <option value="4" ${'Shipper' eq acc.role_name ? "selected" : ""}>Shipper</option>                                                         
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <hr>
                                                            <div class="row">
                                                                <div class="col-sm-3">
                                                                    <p class="mb-0">Status</p>
                                                                </div>
                                                                <div class="col-sm-9" style="display: flex">                                                           
                                                                    <select class="input-like-p" name="status">
                                                                        <option value="1" ${'Active' eq acc.status_name ? "selected" : ""}>Active</option>   
                                                                        <option value="2" ${'Inactive' eq acc.status_name ? "selected" : ""}>Inactive</option>   
                                                                    </select>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="col-md-8 col-md-offset-4">
                                                                        <button id="singlebutton" name="singlebutton" class="btn btn-primary">CHỈNH SỬA</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid px-4">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">Tea Shop - Admin Management</div>
                    </div>
                </div>
            </footer>
        </div>
        <script>
            function displayImage(input, imgId) {
                var preview = document.getElementById(imgId);
                var file = input.files[0];
                var reader = new FileReader();
                reader.onloadend = function () {
                    preview.src = reader.result;
                }

                if (file) {
                    reader.readAsDataURL(file);
                } else {
                    preview.src = "";
                }
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/datatables-simple-demo.js"></script>
        <script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
        <!-- bootstap bundle js -->
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
        <!-- slimscroll js -->
        <script src="assets/vendor/slimscroll/jquery.slimscroll.js"></script>
        <!-- main js -->
        <script src="assets/libs/js/main-js.js"></script>
        <!-- chart chartist js -->
        <script src="assets/vendor/charts/chartist-bundle/chartist.min.js"></script>
        <!-- sparkline js -->
        <script src="assets/vendor/charts/sparkline/jquery.sparkline.js"></script>
        <!-- morris js -->
        <script src="assets/vendor/charts/morris-bundle/raphael.min.js"></script>
        <script src="assets/vendor/charts/morris-bundle/morris.js"></script>
        <!-- chart c3 js -->
        <script src="assets/vendor/charts/c3charts/c3.min.js"></script>
        <script src="assets/vendor/charts/c3charts/d3-5.4.0.min.js"></script>
        <script src="assets/vendor/charts/c3charts/C3chartjs.js"></script>
        <script src="assets/libs/js/dashboard-ecommerce.js"></script>
    </body>
</html>
