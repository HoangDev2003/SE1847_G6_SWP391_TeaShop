<%-- 
    Document   : sidebarStaff
    Created on : Jun 19, 2024, 12:05:49 PM
    Author     : Huyen Trang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div id="layoutSidenav_nav">

    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <div class="sb-sidenav-menu-heading">Core</div>
                <a class="nav-link" href="dashboardAdmin.jsp">
                    <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                    Dashboard
                </a>
                <div class="sb-sidenav-menu-heading">Interface</div>
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                    Management
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link" href="customerManagement">Quản lý khách hàng</a>
                    </nav>
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseOrderManagement" aria-expanded="false" aria-controls="collapseOrderManagement">
                            Quản lý đơn hàng
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseOrderManagement" aria-labelledby="headingOne" data-bs-parent="#collapseLayouts">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link ${current_status_id == '0' ? 'text-white' : ''}" href="Staff">
                                    Tất cả đơn hàng
                                </a>
                                <a class="nav-link ${current_status_id == '1' ? 'text-white' : ''}" href="Staff?current_status_id=1">
                                    Đơn hàng cần xác nhận
                                </a>
                                <a class="nav-link ${current_status_id == '2' ? 'text-white' : ''}" href="Staff?current_status_id=2">
                                    Đơn hàng cần làm
                                </a>
                                <a class="nav-link ${current_status_id == '3' ? 'text-white' : ''}" href="Staff?current_status_id=3">
                                    Đơn hàng cần được giao
                                </a>
                                <a class="nav-link ${current_status_id == '4' ? 'text-white' : ''}" href="Staff?current_status_id=4">
                                    Đơn hàng đã hoàn thành
                                </a>
                            </nav>
                        </div>
                    </nav>
                </div>
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                    <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                    Pages
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                            Authentication
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="login.html">Login</a>
                                <a class="nav-link" href="register.html">Register</a>
                                <a class="nav-link" href="password.html">Forgot Password</a>
                            </nav>
                        </div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                            Error
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                            <nav class="sb-sidenav-menu-nested nav">                                          
                                <a class="nav-link" href="admin404.jsp">404 Page</a>                                           
                            </nav>
                        </div>
                    </nav>
                </div>
                <div class="sb-sidenav-menu-heading">Add on</div>
                <a class="nav-link" href="chartsAdmin.jsp">
                    <div class="sb-nav-link-icon"><i class="fas fa-chart-area" ></i></div>
                    Charts
                </a>
                <a class="nav-link" href="tables.html">
                    <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                    Tables
                </a>
            </div>
        </div>

    </nav>
</div>
