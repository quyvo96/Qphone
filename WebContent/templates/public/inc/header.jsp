<%@page import="models.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Purple Admin</title>
    <!-- plugins:css -->
    <link rel="stylesheet"  href="<%=request.getContextPath()%>/resources/public/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet"  href="<%=request.getContextPath()%>/resources/public/assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet"  href="<%=request.getContextPath()%>/resources/public/assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon"  href="<%=request.getContextPath()%>/resources/public/assets/images/favicon.ico" />
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/public/assets/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/public/assets/js/jquery.validate.js"></script>
<style>
#slideabc{
	font-family: Verdana, sans-serif;
	 margin:0;
}

img {vertical-align: middle;}
/* Slideshow container */
#slideabc .slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}
#slideabc .slideshow-container .mySlides {display: none}

#slideabc .slideshow-container .mySlides img {vertical-align: middle;}
/* Next & previous buttons */
#slideabc .slideshow-container .prev1 {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}
#slideabc .slideshow-container .next1 {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev1:hover, .next1:hover {
  background-color: rgba(0,0,0,0.8);
}


/* The dots/bullets/indicators */
.dot1 {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active1, .dot1:hover {
  background-color: #717171;
}

/* Fading animation */
.fade1 {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade1 {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade1 {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev1, .next1 {font-size: 11px}
}
</style>
  </head>
            <%
            	String fullName = "";
            	int id_user = 0;
            	String urlCart = request.getContextPath() + "/login.html";
            	String urlRegister = request.getContextPath() + "/auth/register";
            	String urlHistory = request.getContextPath() + "/login.html";
            	if(session.getAttribute("userInfo") != null){
            		
            		User userInfor = (User)session.getAttribute("userInfo");
            		fullName = userInfor.getFullName();
            		id_user = userInfor.getUserRole().getId();
            		urlCart = request.getContextPath() + "/gio-hang.html";
            		urlHistory= request.getContextPath() + "/lich-su-mua-hang.html";
            	}
            %>
  <body>
    <div class="container-scroller" style="z-index: 999">
      <!-- partial:partials/_navbar.html -->
      <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
          <a class="navbar-brand brand-logo"  href="<%=request.getContextPath()%>/resources/public/index.html"><img src="<%=request.getContextPath()%>/resources/public/assets/images/logo.svg" alt="logo" /></a>
          <a class="navbar-brand brand-logo-mini"  href="<%=request.getContextPath()%>/resources/public/index.html"><img src="<%=request.getContextPath()%>/resources/public/assets/images/logo-mini.svg" alt="logo" /></a>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-stretch">
          <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
            <span class="mdi mdi-menu"></span>
          </button>
          <div class="search-field d-none d-md-block">
            <form class="d-flex align-items-center h-100" action="<%=request.getContextPath() %>/trang-chu.html">
              <div class="input-group">
                <div class="input-group-prepend bg-transparent">
                  <i class="input-group-text border-0 mdi mdi-magnify"></i>
                </div>
                <input type="text" class="form-control bg-transparent border-0" placeholder="Tìm Kiếm..." name="sname">
                <input type="submit" name="search" value="Tìm kiếm" class="btn btn-warning btn-sm mdi mdi-magnify" style="float:right" />
              </div>
            </form>
          </div>
          <ul class="navbar-nav navbar-nav-right">
          <%if("".equals(fullName)){
        	  %>
            <li class="nav-item nav-settings d-none d-lg-block">
                <a class="dropdown-item" href="<%=request.getContextPath()%>/login.html">
                <i class="mdi mdi-account mr-2 text-primary"></i>Đăng Nhập</a>
            </li>
          <%}else{
        	  %>
            <li class="nav-item nav-profile dropdown">
              <a class="nav-link dropdown-toggle" id="profileDropdown"  href="#" data-toggle="dropdown" aria-expanded="false">
                <div class="nav-profile-img">
                  <img src="<%=request.getContextPath()%>/resources/public/assets/images/faces/face1.jpg" alt="image">
                  <span class="availability-status online"></span>
                </div>
                <div class="nav-profile-text">
                  <p class="mb-1 text-black fullname"><%=fullName%></p>
                </div>
              </a>
              <div class="dropdown-menu navbar-dropdown" aria-labelledby="profileDropdown">
                <a class="dropdown-item"  href="#">
                  <i class="mdi mdi-cached mr-2 text-success"></i> Tải lại trang </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item"  href="#">
                  <i class="mdi mdi-account mr-2 text-primary"></i> Tài khoản </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item"  href="<%=request.getContextPath()%>/auth/logout">
                  <i class="mdi mdi-logout mr-2 text-primary"></i> Đăng xuất </a>
              </div>
            </li>
          <%} %>
            <li class="nav-item nav-settings d-none d-lg-block">
                <a class="dropdown-item" href="<%=urlCart%>">
                <%	int numCart = 0;
                	if(request.getAttribute("numCart") != null ){
                		numCart = (Integer)request.getAttribute("numCart");
                		if(numCart > 0){
                		}}
                %>
                <span id="cart" style="color: white; background-color: red;  border: 2px solid red; border-radius: 5px;"><%=numCart %></span>
               
                  <i class="mdi mdi-cart mr-2 text-primary"></i>Giỏ hàng</a>
            </li>
            
            <li class="nav-item nav-settings d-none d-lg-block">
                <a class="dropdown-item" href="<%=urlHistory%>">
                  <i class="mdi mdi-history mr-2 text-primary"></i>Lịch sử mua hàng</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown"  href="#" data-toggle="dropdown">
                <i class="mdi mdi-more"></i>
              </a>
              <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="notificationDropdown">
                <h6 class="p-3 mb-0">Hiển thị thêm</h6>
                <%if(id_user == 1 || id_user == 2){
                	%>
	                <div class="dropdown-divider"></div>
	                <a class="dropdown-item preview-item" href="<%=request.getContextPath()%>/quan-ly/trang-chu.html">
	                  <i class="mdi mdi-view-module mr-2 text-success"></i> Trang quảng lý </a>
                <%}%>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item preview-item" href="<%=request.getContextPath()%>/lien-he.html">
                  <i class="mdi mdi-account-circle mr-2 text-success"></i> Liên Hệ </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item preview-item" href="<%=urlRegister%>">
                  <i class="mdi mdi-account-circle mr-2 text-success"></i> Đăng ký tài khoản </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item preview-item" href="#">
                  <i class="mdi mdi-cached mr-2 text-success"></i> Tải lại trang </a>
                <div class="dropdown-divider"></div>
              </div>
            </li>
            <li class="nav-item d-none d-lg-block full-screen-link">
              <a class="nav-link">
                <i class="mdi mdi-fullscreen" id="fullscreen-button"></i>
              </a>
            </li>
            <li class="nav-item nav-settings d-none d-lg-block">
              <a class="nav-link"  href="#">
                <i class="mdi mdi-format-line-spacing"></i>
              </a>
            </li>
          </ul>
          <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
            <span class="mdi mdi-menu"></span>
          </button>
        </div>
      </nav>