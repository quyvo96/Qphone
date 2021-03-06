<%@page import="models.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
            <%
            	if(session.getAttribute("userInfo") != null){
            		User userInfor = (User)session.getAttribute("userInfo");
            		String fullName = userInfor.getFullName();
            %>
  <body>
    <div class="container-scroller">
      <!-- partial:partials/_navbar.html -->
      <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
          <a class="navbar-brand brand-logo" href="index.html"><img src="<%=request.getContextPath()%>/resources/admin/assets/images/logo.svg" alt="logo" /></a>
          <a class="navbar-brand brand-logo-mini" href="#"><img src="<%=request.getContextPath()%>/resources/admin/assets/images/logo-mini.svg" alt="logo" /></a>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-stretch">
          <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
            <span class="mdi mdi-menu"></span>
          </button>
          <ul class="navbar-nav navbar-nav-right">
            <li class="nav-item nav-profile dropdown">
              <a class="nav-link" id="profileDropdown" href="#" aria-expanded="false">
                <div class="nav-profile-img">
                  <img src="<%=request.getContextPath()%>/resources/admin/assets/images/faces/face1.jpg" alt="image">
                  <span class="availability-status online"></span>
                </div>
                <div class="nav-profile-text">
                  <p class="mb-1 text-black"><%=fullName%></p>
                </div>
              </a>
            </li>
            <li class="nav-item d-none d-lg-block full-screen-link">
              <a class="nav-link">
                <i class="mdi mdi-fullscreen" id="fullscreen-button"></i>
              </a>
            </li>
            <li class="nav-item nav-logout d-none d-lg-block">
                <a class="dropdown-item" href="<%=request.getContextPath()%>/trang-chu.html">
                  <i class="mdi mdi-forward mr-2 text-primary"></i> Website </a>
              </a>
              </a>
            </li>
            <li class="nav-item nav-settings d-none d-lg-block">
                <a class="dropdown-item" href="<%=request.getContextPath()%>/auth/logout">
                  <i class="mdi mdi-logout mr-2 text-primary"></i> ????ng Xu???t </a>
              </a>
            </li>
          </ul>
          <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
            <span class="mdi mdi-menu"></span>
          </button>
        </div>
      </nav>
      <%} %>