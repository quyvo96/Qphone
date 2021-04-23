<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
<%@ include file="/templates/admin/inc/navbar.jsp" %>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->
<%@ include file="/templates/admin/inc/sidebar.jsp" %>
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title">
                <span class="page-title-icon bg-gradient-primary text-white mr-2">
                  <i class="mdi mdi-home"></i>
                </span> Trang Chủ
              </h3>
            </div>
        <%
        	int lenCat = (Integer)request.getAttribute("lenCat");
        	int lenphone = (Integer)request.getAttribute("lenphone");
        	int lenUser = (Integer)request.getAttribute("lenUser");
        %>
            <div class="row">
            
              <div class="col-md-4 stretch-card grid-margin">
              <a href="<%=request.getContextPath()%>/quan-ly/danh-muc.html" title="">
                <div class="card bg-gradient-danger card-img-holder text-white">
                
                  <div class="card-body">
                    <img src="<%=request.getContextPath()%>/resources/admin/assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                    <h3 class="font-weight-normal mb-3">Quản Lý Danh Mục<i class="mdi mdi-format-list-bulleted mdi-24px float-right"></i>
                    </h3>
                    <h2 ><%=lenCat%></h2>
                    <h6 class="card-text">Hãng Sản Xuất</h6>
                  </div>
                  
                </div>
                </a>
              </div>
              <div class="col-md-4 stretch-card grid-margin">
              <a href="<%=request.getContextPath()%>/quan-ly/dien-thoai.html" title="">
                <div class="card bg-gradient-info card-img-holder text-white">
                  <div class="card-body">
                    <img src="<%=request.getContextPath()%>/resources/admin/assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                    <h3 class="font-weight-normal mb-3">Quản Lý Điện Thoại<i class="mdi mdi-cellphone-dock mdi-24px float-right"></i>
                    </h3>
                    <h2><%=lenphone%></h2>
                    <h6 class="card-text">Điện Thoại</h6>
                  </div>
                </div>
                </a>
              </div>
              <div class="col-md-4 stretch-card grid-margin">
              <a href="<%=request.getContextPath()%>/quan-ly/nguoi-dung.html" title="">
                <div class="card bg-gradient-success card-img-holder text-white">
                  <div class="card-body">
                    <img src="<%=request.getContextPath()%>/resources/admin/assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                    <h3 class="font-weight-normal mb-3">Quản Lý Người Dùng<i class="mdi mdi-account mdi-24px float-right"></i>
                    </h3>
                    <h2 ><%=lenUser%></h2>
                    <h6 class="card-text">Người Dùng</h6>
                  </div>
                </div>
                </a>
              </div>
            </div>

          </div>
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
<script>
    document.getElementById("index").classList.add('active-menu');
</script>
<%@ include file="/templates/admin/inc/footer.jsp" %>