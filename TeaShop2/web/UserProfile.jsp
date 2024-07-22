<%-- 
    Document   : UserProfile.jsp
    Created on : Jun 21, 2024, 12:15:44 AM
    Author     : Huyen Tranq
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <title>profile with data and skills - Bootdey.com</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
            body{
                margin-top:20px;
                color: #1a202c;
                text-align: left;
                background-color: #e2e8f0;
            }
            .main-body {
                padding: 15px;
            }
            .card {
                box-shadow: 0 1px 3px 0 rgba(0,0,0,.1), 0 1px 2px 0 rgba(0,0,0,.06);
            }

            .card {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 0 solid rgba(0,0,0,.125);
                border-radius: .25rem;
            }

            .card-body {
                flex: 1 1 auto;
                min-height: 1px;
                padding: 1rem;
            }

            .gutters-sm {
                margin-right: -8px;
                margin-left: -8px;
            }

            .gutters-sm>.col, .gutters-sm>[class*=col-] {
                padding-right: 8px;
                padding-left: 8px;
            }
            .mb-3, .my-3 {
                margin-bottom: 1rem!important;
            }

            .bg-gray-300 {
                background-color: #e2e8f0;
            }
            .h-100 {
                height: 100%!important;
            }
            .shadow-none {
                box-shadow: none!important;
            }

            .product__pagination {
                display: flex;
                justify-content: center;
                margin-top: 20px;
            }

            .pagination {
                display: flex;
                list-style: none;
                padding: 0;
                margin-left: 600px;
            }

            .page-item {
                margin-right: 5px;
            }

            .page-link {
                text-decoration: none;
                color: #333;
                background-color: #fff;
                border: 1px solid #ddd;
                padding: 8px 12px;
                border-radius: 4px;
            }

            .page-link:hover {
                background-color: #eee;
            }

            .page-item.active .page-link {
                background-color: black;
                color: #fff;
                border-color: #007bff;
                border-radius: 50%;
                width: 30px;
                height: 30px;
                display: flex;
                align-items: center;
                justify-content: center;

            }
            .product__item__text h6 {
                min-height: 40px; /* Set a minimum height for the product name container */
                display: flex;
                align-items: center; /* Vertically center the content */
            }

            .product__item__text h6:hover {
                white-space: normal; /* Display full text on hover */
            }
            /* Thêm lớp CSS để định dạng giá sale */
            .product__item__text .sale-price {
                color: red; /* Đặt màu để làm nổi bật giá sale */
                font-weight: bold; /* Tăng độ đậm cho giá sale */
            }

            /* Thêm lớp CSS để tạo nhãn cho giá sale */
            .product__item__text .sale-label {
                background-color: #e74c3c;
                color: #fff;
                padding: 3px 8px;
                border-radius: 5px;
                display: inline-block;
                margin-bottom: 5px;
            }

            .product__item__text h6 {
                min-height: 40px;
                display: flex;
                align-items: center;
            }

            .product__item__text h6:hover {
                white-space: normal;
            }


        </style>
    </head>
    <body>
        <div class="container">
            <div class="main-body">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="card">
                            <form id="avatarForm" action="userprofile?service=UpdateAvatar" class="form-horizontal" method="post" enctype="multipart/form-data">
                                <div class="card-body">                                  
                                    <div class="d-flex flex-column align-items-center text-center">
                                        <img id="previewImg2" src="${pageContext.request.contextPath}${a.avartar}" alt="Preview Image" style="max-width: 100%; max-height: 250px;">
                                        <input id="filebutton2" name="img" class="input-file" type="file" onchange="displayImage(this, 'previewImg2')">
                                        <input type="hidden" name="email" value="${a.email}">
                                        <div class="mt-3">
                                            <h4>${a.full_name}</h4>
                                        </div>
                                    </div>
                                    <hr class="my-4">
                                    <ul class="list-group list-group-flush">
                                        <input type="submit" value="Change">
                                    </ul>
                                    <h4 style="color: red">${updateAvtSuccess}</h4>
                                    <h4 style="color: red">${updateAvtFailed}</h4>
                                </div>
                            </form>

                           
                                    <a href="home">Home</a>
                                    <a href="logout">Log out</a>
                               
                             
                        </div>
                    </div>

                    <div class="col-lg-8">
                        <div class="card">
                            <div class="card-body">
                                <form action="userprofile?service=UpdateProfile" method="POST">
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Tên người dùng</h6>
                                        </div><div class="col-sm-9 text-secondary">
                                            <input type="text" name="name" class="form-control" value="${a.full_name}">
                                        </div>
                                    </div>
                                    <input type="hidden" name="email" value="${a.email}">
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Phone</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input type="text" name="phoneNumber" class="form-control" value="${a.phone_number}">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Email</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input name="email" class="form-control" value="${a.email}" readonly>
                                            <h9 class="mb-0">   (Bạn không thể thay đổi email của mình)</h9>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Role</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <c:if test="${a.role_id == 1}">
                                                <input name="role" class="form-control" value="Admin" >
                                            </c:if>
                                            <c:if test="${a.role_id == 2}">
                                                <input name="role" class="form-control" value="Customer" readonly />
                                            </c:if><h9 class="mb-0"> (Bạn không thể thay đổi vai trò của mình)</h9>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Address</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input type="text" name="address" class="form-control" value="${a.address}">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-3"></div>
                                        <div class="col-sm-9 text-secondary">
                                            <input type="submit" class="btn btn-primary px-4" value="Save Changes">
                                        </div>
                                    </div>
                                    <h4 style="color: red">${errorMessage}</h4>
                                </form>
                            </div>
                        </div></form>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="d-flex align-items-center mb-3">Change Password</h5>
                                        <div class="col-sm-9 text-secondary">
                                            <form action="userprofile?service=UpdatePassword" method="post">
                                                <div class="row mb-3">
                                                    <div class="col-sm-3">
                                                        <h6 class="mb-0">Old Password</h6>
                                                    </div>
                                                    <div class="col-sm-9 text-secondary">
                                                        <input type="password" class="form-control" name="oldpass" placeholder="Enter old Password" required>
                                                    </div>
                                                </div>
                                                <input type="hidden" name="email" value="${a.email}">
                                                <div class="row mb-3">
                                                    <div class="col-sm-3">
                                                        <h6 class="mb-0">New Password</h6>
                                                    </div>
                                                    <div class="col-sm-9 text-secondary">
                                                        <input class="form-control" type="password" name="newpass" placeholder="Enter new Password" required />
                                                    </div>
                                                </div> 
                                                <div class="row mb-3">
                                                    <div class="col-sm-3">
                                                        <h6 class="mb-0">Repeat new Password</h6>
                                                    </div>
                                                    <div class="col-sm-9 text-secondary">
                                                        <input type="password" class="form-control" name="re_newpass" placeholder="Repeat new password" required  />
                                                    </div>
                                                </div> 
                                                <div class="row">
                                                    <div class="col-sm-3"></div>
                                                    <div class="col-sm-9 text-secondary">
                                                        <input type="submit" class="btn btn-primary px-4" value="Save Changes">
                                                    </div>
                                                </div>  
                                                <c:if test="${not empty errorsList}">
                                                    <h4 style="color: red">
                                                        <c:forEach items="${errorsList}" var="errorEntry">
                                                            ${errorEntry.value}<br>
                                                        </c:forEach>
                                                    </h4>
                                                </c:if>
                                                <h4 style="color: red">${updateSuccess}</h4>
                                                <h4 style="color: red">${updateFailed}</h4>
                                            </form>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery.nicescroll.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/jquery.countdown.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>
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