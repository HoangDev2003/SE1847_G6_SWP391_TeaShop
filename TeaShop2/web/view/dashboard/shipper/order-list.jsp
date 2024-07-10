<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>Falcon | Dashboard &amp; Web App Template</title>


    <!-- ===============================================-->
    <!--    Favicons-->
    <!-- ===============================================-->
    <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/assets/img/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/assets/img/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assets/img/favicons/favicon-16x16.png">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicons/favicon.ico">
    <link rel="manifest" href="${pageContext.request.contextPath}/assets/img/favicons/manifest.json">
    <meta name="msapplication-TileImage" content="${pageContext.request.contextPath}/assets/img/favicons/mstile-150x150.png">
    <meta name="theme-color" content="#ffffff">
    <script src="${pageContext.request.contextPath}/assets/js/config.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/overlayscrollbars/OverlayScrollbars.min.js"></script>


    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700%7cPoppins:300,400,500,600,700,800,900&amp;display=swap" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/vendors/overlayscrollbars/OverlayScrollbars.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/theme-rtl.min.css" rel="stylesheet" id="style-rtl">
    <link href="${pageContext.request.contextPath}/assets/css/theme.min.css" rel="stylesheet" id="style-default">
    <link href="${pageContext.request.contextPath}/assets/css/user-rtl.min.css" rel="stylesheet" id="user-style-rtl">
    <link href="${pageContext.request.contextPath}/assets/css/user.min.css" rel="stylesheet" id="user-style-default">
    <script>
      var isRTL = JSON.parse(localStorage.getItem('isRTL'));
      if (isRTL) {
        var linkDefault = document.getElementById('style-default');
        var userLinkDefault = document.getElementById('user-style-default');
        linkDefault.setAttribute('disabled', true);
        userLinkDefault.setAttribute('disabled', true);
        document.querySelector('html').setAttribute('dir', 'rtl');
      } else {
        var linkRTL = document.getElementById('style-rtl');
        var userLinkRTL = document.getElementById('user-style-rtl');
        linkRTL.setAttribute('disabled', true);
        userLinkRTL.setAttribute('disabled', true);
      }
    </script>
    <style>
    /* CSS tuỳ chỉnh để tối ưu hóa cho màn hình điện thoại */
    @media (max-width: 50px) {
      .card-header .row {
        flex-direction: column;
        align-items: flex-start;
      }
      .card-header .col-4, .card-header .col-8 {
        flex: 0 0 100%;
        max-width: 100%;
      }
      .card-header .col-4 h5 {
        margin-bottom: 1rem;
      }
      .card-body .table-responsive {
        overflow-x: auto;
      }
      .table th, .table td {
        white-space: nowrap;
        font-size: 0.875rem;
      }
      .table th {
        min-width: 80px;
      }
      .table th:first-child, .table td:first-child {
        width: 30px;
      }
    }
    .address {
    width: 200px; /* Giới hạn chiều rộng tối đa */
    word-wrap: break-word; /* Tự động xuống dòng khi quá chiều rộng */
    white-space: normal; /* Cho phép xuống dòng */
}
  </style>
  </head>


  <body>

    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
    <main class="main" id="top">
      <div class="container" data-layout="container">
        <script>
          var isFluid = JSON.parse(localStorage.getItem('isFluid'));
          if (isFluid) {
            var container = document.querySelector('[data-layout]');
            container.classList.remove('container');
            container.classList.add('container-fluid');
          }
        </script>
       
          <script>
            var navbarStyle = localStorage.getItem("navbarStyle");
            if (navbarStyle && navbarStyle !== 'transparent') {
              document.querySelector('.navbar-vertical').classList.add(`navbar-${navbarStyle}`);
            }
          </script>
          
          
        </nav>
        <div class="content">
          <jsp:include page="../../common/dashboard/shipper/topbar.jsp"></jsp:include>
          <div class="card mb-3" id="ordersTable" data-list='{"valueNames":["order","status","amount"],"page":10,"pagination":true}'>
  <div class="card-header">
    <div class="row flex-between-center">
      <div class="col-4 col-sm-auto d-flex align-items-center pe-0">
        <h5 class="fs-0 mb-0 text-nowrap py-2 py-xl-0">Đơn hàng</h5>
      </div>
      <div class="col-8 col-sm-auto ms-auto text-end ps-0">
        <div class="d-none" id="orders-bulk-actions">
          
        </div>
        <div id="orders-actions">
          <button class="btn ${statusOrder == 2 ? 'btn-primary' : 'btn'}" onclick="filterOrders(2)">Chờ giao hàng</button>
         
          <button class="btn ${statusOrder == 3 ? 'btn-primary' : 'btn'}" onclick="filterOrders(3)">Hoàn thành</button>
        </div>
      </div>
        <script>
           
            function filterOrders(statusOrder) {
                window.location.href = 'ship?statusOrder=' + statusOrder;
            }
        </script>
    </div>
  </div>
  <div class="card-body p-0">
    <div class="table-responsive scrollbar">
      <table class="table table-sm table-striped fs--1 mb-0 overflow-hidden">
        <thead class="bg-200 text-900">
          <tr>
            <th>
              
            </th>
            <th class="sort pe-1 align-middle white-space-nowrap" data-sort="order">Đơn hàng</th>
            
            
            
            
            <th class="sort pe-1 align-middle white-space-nowrap text-center" data-sort="status">Trạng thái</th>
            
            <th class="no-sort"></th>
          </tr>
        </thead>
        <tbody class="list" id="table-orders-body">
          <c:forEach items="${listOrders}" var="lo">
            <tr class="btn-reveal-trigger">
              <td class="align-middle" style="width: 1px;">
                
              </td>
              <td class="order py-2 align-middle white-space-nowrap" ">
                <a href="shipdetail?order_id=${lo.order_id}">
                  <strong>#${lo.order_id}</strong>
                </a> bởi <strong>${lo.full_name}</strong><br/>
                <div>${lo.formattedOrderDate}</div>
                <div>${lo.product.product_name}</div>
                <div>${lo.phone_number}</div>
                <div class="address">${lo.address}</div>
                <div>${lo.total_amount} đ</div>
                
              </td>
            
              
              <td class=" py-2 align-middle text-center fs-0 white-space-nowrap">
                <c:choose>
                  <c:when test="${lo.status.status_name == 'Chờ xác nhận'}">
                    <span class="badge badge rounded-pill d-block badge-soft-warning">
                      Chờ xác nhận<span class="ms-1 fas fa-stream" data-fa-transform="shrink-2"></span>
                    </span>
                  </c:when>
                  <c:when test="${lo.status.status_name == 'Chờ giao hàng'}">
                    <span class="badge badge rounded-pill d-block badge-soft-primary">
                      Chờ giao hàng<span class="ms-1 fas fa-redo" data-fa-transform="shrink-2"></span>
                    </span>
                  </c:when>
                  <c:when test="${lo.status.status_name == 'Hoàn thành'}">
                    <span class="badge badge rounded-pill d-block badge-soft-success">
                      Hoàn thành<span class="ms-1 fas fa-check" data-fa-transform="shrink-2"></span>
                    </span>
                  </c:when>
                  <c:otherwise>
                    <span class="badge badge rounded-pill d-block badge-soft-secondary">
                      ${lo.status.status_name}<span class="ms-1 fas fa-question-circle" data-fa-transform="shrink-2"></span>
                    </span>
                  </c:otherwise>
                </c:choose>
              </td>
              
              <td class="py-2 align-middle white-space-nowrap text-end">
                <div class="dropdown font-sans-serif position-static">
                  <button class="btn btn-link text-600 btn-sm dropdown-toggle btn-reveal" type="button" id="order-dropdown-${lo.order_id}" data-bs-toggle="dropdown" data-boundary="viewport" aria-haspopup="true" aria-expanded="false">
                    <span class="fas fa-ellipsis-h fs--1"></span>
                  </button>
                  <div class="dropdown-menu dropdown-menu-end border py-0" aria-labelledby="order-dropdown-${lo.order_id}">
                    <div class="bg-white py-2">
                      <c:forEach items="${listStatus}" var="ls">
                        <form action="ship" method="post">
                          <input type="hidden" name="action" value="updateStatus">
                          <input type="hidden" name="orderId" value="${lo.order_id}">
                          <input type="hidden" name="statusId" value="${ls.status_id}">
                          <button class="dropdown-item" type="submit">${ls.status_name}</button>
                        </form>
                      </c:forEach>
                      <!-- <div class="dropdown-divider"></div>
                      <a class="dropdown-item text-danger" href="#!">Xóa</a> -->
                    </div>
                  </div>
                </div>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
  <div class="card-footer">
    <div class="d-flex align-items-center justify-content-center">
      <button class="btn btn-sm btn-falcon-default me-1" type="button" title="Previous" data-list-pagination="prev"><span class="fas fa-chevron-left"></span></button>
      <ul class="pagination mb-0"></ul>
      <button class="btn btn-sm btn-falcon-default ms-1" type="button" title="Next" data-list-pagination="next"><span class="fas fa-chevron-right"></span></button>
    </div>
      
  </div>
</div>
          <footer class="footer">
            <div class="row g-0 justify-content-between fs--1 mt-4 mb-3">
              <div class="col-12 col-sm-auto text-center">
                <p class="mb-0 text-600">Thank you for creating with Falcon <span class="d-none d-sm-inline-block">| </span><br class="d-sm-none" /> 2021 &copy; <a href="https://themewagon.com">Themewagon</a></p>
              </div>
              <div class="col-12 col-sm-auto text-center">
                <p class="mb-0 text-600">v3.4.0</p>
              </div>
            </div>
          </footer>
        </div>
        <div class="modal fade" id="authentication-modal" tabindex="-1" role="dialog" aria-labelledby="authentication-modal-label" aria-hidden="true">
          <div class="modal-dialog mt-6" role="document">
            <div class="modal-content border-0">
              <div class="modal-header px-5 position-relative modal-shape-header bg-shape">
                <div class="position-relative z-index-1 light">
                  <h4 class="mb-0 text-white" id="authentication-modal-label">Register</h4>
                  <p class="fs--1 mb-0 text-white">Please create your free Falcon account</p>
                </div>
                <button class="btn-close btn-close-white position-absolute top-0 end-0 mt-2 me-2" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              
            </div>
          </div>
        </div>
      </div>
    </main>
    <!-- ===============================================-->
    <!--    End of Main Content-->
    <!-- ===============================================-->


    <div class="offcanvas offcanvas-end settings-panel border-0" id="settings-offcanvas" tabindex="-1" aria-labelledby="settings-offcanvas">
      <div class="offcanvas-header settings-panel-header bg-shape">
        <div class="z-index-1 py-1 light">
          <h5 class="text-white"> <span class="fas fa-palette me-2 fs-0"></span>Settings</h5>
          <p class="mb-0 fs--1 text-white opacity-75"> Set your own customized style</p>
        </div>
        <button class="btn-close btn-close-white z-index-1 mt-0" type="button" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body scrollbar-overlay px-card" id="themeController">
        <h5 class="fs-0">Color Scheme</h5>
        <p class="fs--1">Choose the perfect color mode for your app.</p>
        <div class="btn-group d-block w-100 btn-group-navbar-style">
          <div class="row gx-2">
            <div class="col-6">
              <input class="btn-check" id="themeSwitcherLight" name="theme-color" type="radio" value="light" data-theme-control="theme" />
              <label class="btn d-inline-block btn-navbar-style fs--1" for="themeSwitcherLight"> <span class="hover-overlay mb-2 rounded d-block"><img class="img-fluid img-prototype mb-0" src="${pageContext.request.contextPath}/assets/img/generic/falcon-mode-default.jpg" alt=""/></span><span class="label-text">Light</span></label>
            </div>
            <div class="col-6">
              <input class="btn-check" id="themeSwitcherDark" name="theme-color" type="radio" value="dark" data-theme-control="theme" />
              <label class="btn d-inline-block btn-navbar-style fs--1" for="themeSwitcherDark"> <span class="hover-overlay mb-2 rounded d-block"><img class="img-fluid img-prototype mb-0" src="${pageContext.request.contextPath}/assets/img/generic/falcon-mode-dark.jpg" alt=""/></span><span class="label-text"> Dark</span></label>
            </div>
          </div>
        </div>
        <hr />
        <div class="d-flex justify-content-between">
          <div class="d-flex align-items-start"><img class="me-2" src="${pageContext.request.contextPath}/assets/img/icons/left-arrow-from-left.svg" width="20" alt="" />
            <div class="flex-1">
              <h5 class="fs-0">RTL Mode</h5>
              <p class="fs--1 mb-0">Switch your language direction </p><a class="fs--1" href="${pageContext.request.contextPath}/documentation/customization/configuration.html">RTL Documentation</a>
            </div>
          </div>
          <div class="form-check form-switch">
            <input class="form-check-input ms-0" id="mode-rtl" type="checkbox" data-theme-control="isRTL" />
          </div>
        </div>
        <hr />
        <div class="d-flex justify-content-between">
          <div class="d-flex align-items-start"><img class="me-2" src="${pageContext.request.contextPath}/assets/img/icons/arrows-h.svg" width="20" alt="" />
            <div class="flex-1">
              <h5 class="fs-0">Fluid Layout</h5>
              <p class="fs--1 mb-0">Toggle container layout system </p><a class="fs--1" href="${pageContext.request.contextPath}/documentation/customization/configuration.html">Fluid Documentation</a>
            </div>
          </div>
          <div class="form-check form-switch">
            <input class="form-check-input ms-0" id="mode-fluid" type="checkbox" data-theme-control="isFluid" />
          </div>
        </div>
        <hr />
        <div class="d-flex align-items-start"><img class="me-2" src="${pageContext.request.contextPath}/assets/img/icons/paragraph.svg" width="20" alt="" />
          <div class="flex-1">
            <h5 class="fs-0 d-flex align-items-center">Navigation Position </h5>
            <p class="fs--1 mb-2">Select a suitable navigation system for your web application </p>
            <div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" id="option-navbar-vertical" type="radio" name="navbar" value="vertical" data-page-url="${pageContext.request.contextPath}/modules/components/navs-and-tabs/vertical-navbar.html" data-theme-control="navbarPosition" />
                <label class="form-check-label" for="option-navbar-vertical">Vertical</label>
              </div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" id="option-navbar-top" type="radio" name="navbar" value="top" data-page-url="${pageContext.request.contextPath}/modules/components/navs-and-tabs/top-navbar.html" data-theme-control="navbarPosition" />
                <label class="form-check-label" for="option-navbar-top">Top</label>
              </div>
              <div class="form-check form-check-inline me-0">
                <input class="form-check-input" id="option-navbar-combo" type="radio" name="navbar" value="combo" data-page-url="${pageContext.request.contextPath}/modules/components/navs-and-tabs/combo-navbar.html" data-theme-control="navbarPosition" />
                <label class="form-check-label" for="option-navbar-combo">Combo</label>
              </div>
            </div>
          </div>
        </div>
        <hr />
        <h5 class="fs-0 d-flex align-items-center">Vertical Navbar Style</h5>
        <p class="fs--1 mb-0">Switch between styles for your vertical navbar </p>
        <p> <a class="fs--1" href="${pageContext.request.contextPath}/modules/components/navs-and-tabs/vertical-navbar.html#navbar-styles">See Documentation</a></p>
        <div class="btn-group d-block w-100 btn-group-navbar-style">
          <div class="row gx-2">
            <div class="col-6">
              <input class="btn-check" id="navbar-style-transparent" type="radio" name="navbarStyle" value="transparent" data-theme-control="navbarStyle" />
              <label class="btn d-block w-100 btn-navbar-style fs--1" for="navbar-style-transparent"> <img class="img-fluid img-prototype" src="${pageContext.request.contextPath}/assets/img/generic/default.png" alt="" /><span class="label-text"> Transparent</span></label>
            </div>
            <div class="col-6">
              <input class="btn-check" id="navbar-style-inverted" type="radio" name="navbarStyle" value="inverted" data-theme-control="navbarStyle" />
              <label class="btn d-block w-100 btn-navbar-style fs--1" for="navbar-style-inverted"> <img class="img-fluid img-prototype" src="${pageContext.request.contextPath}/assets/img/generic/inverted.png" alt="" /><span class="label-text"> Inverted</span></label>
            </div>
            <div class="col-6">
              <input class="btn-check" id="navbar-style-card" type="radio" name="navbarStyle" value="card" data-theme-control="navbarStyle" />
              <label class="btn d-block w-100 btn-navbar-style fs--1" for="navbar-style-card"> <img class="img-fluid img-prototype" src="${pageContext.request.contextPath}/assets/img/generic/card.png" alt="" /><span class="label-text"> Card</span></label>
            </div>
            <div class="col-6">
              <input class="btn-check" id="navbar-style-vibrant" type="radio" name="navbarStyle" value="vibrant" data-theme-control="navbarStyle" />
              <label class="btn d-block w-100 btn-navbar-style fs--1" for="navbar-style-vibrant"> <img class="img-fluid img-prototype" src="${pageContext.request.contextPath}/assets/img/generic/vibrant.png" alt="" /><span class="label-text"> Vibrant</span></label>
            </div>
          </div>
        </div>
        <div class="text-center mt-5"><img class="mb-4" src="${pageContext.request.contextPath}/assets/img/icons/spot-illustrations/47.png" alt="" width="120" />
          <h5>Like What You See?</h5>
          <p class="fs--1">Get Falcon now and create beautiful dashboards with hundreds of widgets.</p><a class="mb-3 btn btn-primary" href="https://themes.getbootstrap.com/product/falcon-admin-dashboard-webapp-template/" target="_blank">Purchase</a>
        </div>
      </div>
    </div><a class="card setting-toggle" href="#settings-offcanvas" data-bs-toggle="offcanvas">
      
    </a>


    <!-- ===============================================-->
    <!--    JavaScripts-->
    <!-- ===============================================-->
    <script src="${pageContext.request.contextPath}/vendors/popper/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/bootstrap/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/anchorjs/anchor.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/is/is.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/fontawesome/all.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/lodash/lodash.min.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
    <script src="${pageContext.request.contextPath}/vendors/list.js/list.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/theme.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/list.js/list.min.js"></script>

  </body>

</html>