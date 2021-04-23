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
                </span> Quản Lý Danh Mục
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
                            <%
	                            
                            		if(request.getAttribute("cat")!=null){
                            			Category cat = (Category)request.getAttribute("cat");
        	                            int id = cat.getId();
        	                            String name = cat.getName();
                            		
                            %>
                                <form role="form" method="post" id="form_cat">
                                    <div class="form-group">
                                        <label for="name">Tên danh mục</label>
                                        <input type="text" id="name" value="<%=name%>" name="name" class="form-control" />
                                    </div>
                                    <button type="submit" name="submit" class="btn btn-success btn-md">Sửa</button>
                                </form>
                            <%} %>
                            </div>
                        </div>
                    </div>
                </div>
                <!--End Advanced Tables -->
            </div>
        </div>

          </div>
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
<script>
    document.getElementById("index").classList.add('active-menu');
</script>
<%@ include file="/templates/admin/inc/footer.jsp" %>