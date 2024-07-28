<%-- 
    Document   : PostDetail
    Created on : Feb 27, 2024, 1:41:48 PM
    Author     : Acer
--%>

<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>MKT Page</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet"/>
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            img{
                width: 200px;
                height: 150px;
            }
            table {
                border-collapse: collapse;
            }
            td {
                border: 1px solid black;
                padding: 10px;
            }
            .title {
                font-weight: bold;
            }
        </style>
    </head>
    <body class="sb-nav-fixed">
        
        
        <div id="layoutSidenav">
  <jsp:include page="../../common/admin/sidebarAdmin.jsp"></jsp:include>

            <div id="layoutSidenav_content">
                <main>
                    <div class="blog__content" style="display: flex;
                         justify-content: center;
                         align-items: center;">
                        <table>
                            <tr>
                                <td class="title">Tiêu đề</td>
                                <td>${requestScope.blog.getBlog_name()}</td>
                            </tr>
                           
                            <tr>
                                <td class="title">Ảnh</td>
                                <td><img src="${requestScope.blog.getImg()}" alt="${requestScope.blog.getBlog_name()}"></td>
                            </tr>
                            <tr>
                                <td class="title">Ngày đăng</td>
                                <td><span class="date">${requestScope.blog.getCreated_at()}</span></td>
                            </tr>
                             <tr>
                                <td class="title">Nội dung</td>
                                <td>${requestScope.blog.getContent()}</td>
                            </tr>
                            
                        </table>
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
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>


