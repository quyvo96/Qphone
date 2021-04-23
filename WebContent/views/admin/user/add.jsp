<%@page import="models.UserRole"%>
<%@page import="models.Phone"%>
<%@page import="constants.GlobalConstants"%>
<%@page import="models.Category"%>
<%@page import="java.util.List"%>
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
                  <i class="mdi mdi-format-list-bulleted"></i>
                </span> Quản Lý Người Dùng
              </h3>
            </div>
        <hr />
        <div class="row">
            <div class="col-md-12">
                <!-- Form Elements -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12">
                                <form role="form" method="post" id="form_user" action="<%=request.getContextPath()%>/quan-ly/nguoi-dung/them-nguoi-dung.html">
                                    <div class="form-group">
                                        <label for="userName">Tên đăng nhập</label>
                                        <input type="text" id="name" value="" name="userName" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="fullName">Họ tên</label>
                                        <input type="text" id="name" value="" name="fullName" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="password">Mật Khẩu</label>
                                        <input type="password" id="name" value="" name="password" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label >Chuc Vu</label>
                                        <select id="role" name="role" class="form-control">
                                        	<%
                                        		if(request.getAttribute("listrole") != null){
                                        			
                                        			List<UserRole> listrole = (List<UserRole>)request.getAttribute("listrole");
                                        			if(listrole.size() > 0){
                                        				for(UserRole r : listrole){
                                        					int id = r.getId();
                                        					String role = r.getRole();
                                        	%>
	                                        <option value="<%=id%>"><%=role%></option>
                                        	<%}}}
                                        	%>
                                        	
                                        </select>
                                        </div>
                                    <button type="submit" name="submit" class="btn btn-success btn-md">Thêm</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Form Elements -->
            </div>
        </div>

          </div>
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
<script>
    document.getElementById("index").classList.add('active-menu');
</script>
<%@ include file="/templates/admin/inc/footer.jsp" %>