<%-- 
    Document   : AddUser.jsp
    Created on : Jun 20, 2024, 10:23:49 PM
    Author     : Huyen Tranq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*, javax.servlet.http.*" %>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
        <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/libs/css/style.css">
        <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
        <link rel="stylesheet" href="assets/vendor/charts/chartist-bundle/chartist.css">
        <link rel="stylesheet" href="assets/vendor/charts/morris-bundle/morris.css">
        <link rel="stylesheet" href="assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="assets/vendor/charts/c3charts/c3.css">
        <link rel="stylesheet" href="assets/vendor/fonts/flag-icon-css/flag-icon.min.css">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <title>Concept - Bootstrap 4 Admin Dashboard Template</title>

        <style>

            .increase-font {
                font-size: 18px; /* ??t k�ch th??c font ch? mong mu?n */
            }
            .active-icon {
                width: 25px;
                filter: drop-shadow(0 0 5px #007bff); /* �p d?ng hi?u ?ng drop shadow m�u xanh */
            }
            .inactive-icon {
                width: 25px;
                filter: drop-shadow(0 0 5px #6c757d); /* �p d?ng hi?u ?ng drop shadow m�u x�m */
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

    </style>
</head>

<body>
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
    <div class="dashboard-main-wrapper">
        <!-- ============================================================== -->
        <!-- navbar -->
        <!-- ============================================================== -->
        <div class="dashboard-header">
            <nav class="navbar navbar-expand-lg bg-white fixed-top">
                <a class="navbar-brand" href="index.html">Concept</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto navbar-right-top">
                        <li class="nav-item">
                            <div id="custom-search" class="top-search-bar">
                                <input class="form-control" type="text" placeholder="Search..">
                            </div>
                        </li>
                        <li class="nav-item dropdown notification">
                            <a class="nav-link nav-icons" href="#" id="navbarDropdownMenuLink1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-fw fa-bell"></i> <span class="indicator"></span></a>

                    </ul>
                    </li>

                    <li class="nav-item dropdown nav-user">
                        <a class="nav-link nav-user-img" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="assets/images/avatar-1.jpg" alt="" class="user-avatar-md rounded-circle"></a>
                        <div class="dropdown-menu dropdown-menu-right nav-user-dropdown" aria-labelledby="navbarDropdownMenuLink2">
                            <div class="nav-user-info">
                                <h5 class="mb-0 text-white nav-user-name">John Abraham </h5>
                                <span class="status"></span><span class="ml-2">Available</span>
                            </div>
                            <a class="dropdown-item" href="#"><i class="fas fa-user mr-2"></i>Account</a>
                            <a class="dropdown-item" href="#"><i class="fas fa-cog mr-2"></i>Setting</a>
                            <a class="dropdown-item" href="#"><i class="fas fa-power-off mr-2"></i>Logout</a>
                        </div>
                    </li>
                    </ul>
                </div>
            </nav>
        </div>
        <!-- ============================================================== -->
        <!-- end navbar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- left sidebar -->
        <!-- ============================================================== -->
        <div class="nav-left-sidebar sidebar-dark">
            <div class="menu-list">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="d-xl-none d-lg-none" href="#">Dashboard</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav flex-column">
                            <li class="nav-divider">
                                Menu
                            </li>


                            <li class="nav-item">
                                <a class="nav-link active" href="usermanager" >
                                    <i class="fas fa-fw fa-chart-pie"></i>
                                    User Manager
                                </a>
                            </li>


                    </div>
                </nav>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- end left sidebar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- wrapper  -->
        <!-- ============================================================== -->
        <div class="dashboard-wrapper">
            <div class="dashboard-ecommerce">
                <div class="container-fluid dashboard-content">
                    <form id="switchForm"  action="adduser" class="form-horizontal" method="post">
                        <fieldset>
                            <!-- Form Name -->
                            <legend>Thêm người dùng </legend>

                            <section style="background-color: #eee;">
                                <div class="container py-5">
                                    <div class="row">
                                        <div class="col">
                                            <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                                                <ol class="breadcrumb mb-0">

                                                    <li class="breadcrumb-item active" aria-current="page">User Profile</li>
                                                </ol>
                                            </nav>
                                        </div>
                                    </div>

                                    <div class="row">

                                        <div class="col-lg-4">
                                            <div class="card mb-4">
                                                <div class="card-body text-center">
                                                    <img id="previewImg1" src="" alt="avatar"
                                                         class="rounded-circle img-fluid" style="width: 250px; height: 250px">

                                                    <h5 class="my-3 increase-font" ></h5>
                                                    <input id="filebutton1" name="img" class="input-file" type="file" onchange="displayImage(this, 'previewImg1')">
                                                    <div class="d-flex justify-content-center mb-2">

                                                    </div>
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
                                                            <input type="text"  name="name" value="${name}" class="input-like-p" required/>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <p class="mb-0">Email</p>
                                                        </div>
                                                        <div class="col-sm-9">
                                                            <input type="text"  name="email" value="${email}" class="input-like-p" required/>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <p class="mb-0">Mật khẩu</p>
                                                        </div>
                                                        <div class="col-sm-9">
                                                            <input type="text"  name="pass" value="${pass}"  class="input-like-p" required/>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <p class="mb-0">Số điện thoại</p>
                                                        </div>
                                                        <div class="col-sm-9">
                                                            <input type="text"  name="phone" value="${phone}" class="input-like-p" required/>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <p class="mb-0">Giới tính</p>
                                                        </div>
                                                        <div class="col-sm-9">
                                                            <select name="gender" class="input-like-p">
                                                                <option value="Male" required="">Male</option>
                                                                <option value="Female" required="">Female</option>                                                          
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <p class="mb-0">Địa chỉ</p>
                                                        </div>
                                                        <div class="col-sm-9">
                                                            <input class="input-like-p" type="text"  name="address" value="${address}" required/>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <p class="mb-0">Role</p>
                                                        </div>
                                                        <div class="col-sm-9">
                                                            <select class="input-like-p" name="role">
                                                                <option value="1" required="">Admin</option>                                                                  
                                                                <option value="3" required="">Staff</option>   
                                                                <option value="4" required="">Shipper</option>      
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
                                                                <option value="1" required="">Active</option>   
                                                                <option value="2" required="">Inactive</option>  
                                                            </select>


                                                        </div>
                                                        <div class="form-group">
                                                            <div class="col-md-8 col-md-offset-4">
                                                                <button id="singlebutton" name="singlebutton" class="btn btn-primary">Thêm</button>
                                                            </div>
                                                        </div>
                                                        <p>${mess}</p>
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

    <!-- ============================================================== -->
    <!-- footer -->
    <!-- ============================================================== -->
    <div class="footer">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                    Copyright � 2018 Concept. All rights reserved. Dashboard by <a href="https://colorlib.com/wp/">Colorlib</a>.
                </div>
                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                    <div class="text-md-right footer-links d-none d-sm-block">
                        <a href="javascript: void(0);">About</a>
                        <a href="javascript: void(0);">Support</a>
                        <a href="javascript: void(0);">Contact Us</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

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


</body>

</html>
