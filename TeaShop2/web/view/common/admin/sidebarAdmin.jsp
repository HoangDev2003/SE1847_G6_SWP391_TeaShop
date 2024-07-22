<%-- 
    Document   : sidebarAdmin
    Created on : Jun 19, 2024, 12:05:49 PM
    Author     : Pham Toan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


        <div id="layoutSidenav_nav">
            
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="chartorderday">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            <div class="sb-sidenav-menu-heading">Admin Manager</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Quản lý
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="productmanager">Quản lý Sản phẩm</a>
                                    <a class="nav-link" href="categorymanager">Quản lý Danh mục</a>                                   
                                    <a class="nav-link" href="staffmanager">Quản lý Nhân viên</a>
                                    <a class="nav-link" href="shippermanager">Quản lý Shipper</a>                                    
                                    <a class="nav-link" href="postlist">Quản lý Bài viết</a>
                                    <a class="nav-link" href="manageslide">Quản lý Slide </a>
                                </nav>
                                <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseOrderManagement" aria-expanded="false" aria-controls="collapseOrderManagement">
                            Quản lý Setting cửa hàng
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseOrderManagement" aria-labelledby="headingOne" data-bs-parent="#collapseLayouts">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="rolemanager">
                                    Quản lý Role
                                </a>
<!--                                <a class="nav-link" href="statusmanager">
                                    Quản lý Status
                                </a>-->
                                <a class="nav-link" href="toppingmanager">
                                    Quản lý Topping
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
                            <a class="nav-link" href="dashboardAdmin.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Tables
                            </a>
                        </div>
                    </div>
                   
                </nav>
            </div>
        

