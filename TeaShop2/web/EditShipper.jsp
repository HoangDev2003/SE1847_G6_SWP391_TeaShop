<%-- 
    Document   : EditShipper.jsp
    Created on : Jul 12, 2024, 2:43:53 AM
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
                                <a class="nav-link active" href="shippermanager" >
                                    <i class="fas fa-fw fa-chart-pie"></i>
                                    Shipper Manager
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
                    <form id="switchForm"  action="editShipper" class="form-horizontal" method="post" enctype="multipart/form-data">
                        <fieldset>
                            <!-- Form Name -->
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

                                                    <h5 class="my-3 increase-font" >${acc.user_name}</h5>
                                                    <input id="filebutton1" name="img" class="input-file" type="file" onchange="displayImage(this, 'previewImg1')" readonly="">
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

