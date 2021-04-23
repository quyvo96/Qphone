<%@page import="models.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
             <%
            	if(session.getAttribute("userInfo") != null){
            		User userInfor1 = (User)session.getAttribute("userInfo");
            		String fullName1 = userInfor1.getFullName();
            		String role = userInfor1.getUserRole().getRole();
            %>      
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
          <ul class="nav">
            <li class="nav-item nav-profile">
              <a href="#" class="nav-link">
                <div class="nav-profile-image">
                  <img src="<%=request.getContextPath()%>/resources/admin/assets/images/faces/face1.jpg" alt="profile">
                  <span class="login-status online"></span>
                  <!--change to offline or busy as needed-->
                </div>
                <div class="nav-profile-text d-flex flex-column">
                  <span class="font-weight-bold mb-2"><%=fullName1%></span>
                  <span class="text-secondary text-small"><%=role%></span>
                </div>
                <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
              </a>
            </li>
            <li class="nav-item">
              <a  class="nav-link" href="<%=request.getContextPath()%>/quan-ly/trang-chu.html">
              
                <span class="menu-title">Trang Chủ</span>
                <i class="mdi mdi-home menu-icon"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="<%=request.getContextPath()%>/quan-ly/danh-muc.html">
                <span class="menu-title">Quản Lý Danh Mục</span>
                <i class="mdi mdi-format-list-bulleted menu-icon"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="<%=request.getContextPath()%>/quan-ly/dien-thoai.html">
                <span class="menu-title">Quản Lý Sản Phẩm</span>
                <i class="mdi mdi-cellphone-dock menu-icon"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="<%=request.getContextPath()%>/quan-ly/don-hang.html">
                <span class="menu-title">Quản Lý Đơn Hàng</span>
                <i class="mdi mdi-cellphone-dock menu-icon"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="<%=request.getContextPath()%>/quan-ly/nguoi-dung.html">
                <span class="menu-title">Quản Lý Người Dùng</span>
                <i class="mdi mdi-account menu-icon"></i>
              </a>
            </li>
             <li class="nav-item">
              <a class="nav-link" href="<%=request.getContextPath()%>/quan-ly/lien-he.html">
                <span class="menu-title">Quản Lý Liên Hệ</span>
                <i class="mdi mdi-contact-mail menu-icon"></i>
              </a>
            </li>
              <li class="nav-item">
              <a class="nav-link" href="<%=request.getContextPath()%>/quan-ly/quang-cao.html">
                <span class="menu-title">Quản Lý Quảng Cáo</span>
                <i class="mdi mdi-multiplication menu-icon"></i>
              </a>
            </li>
          </ul>
        </nav>
<% } %>