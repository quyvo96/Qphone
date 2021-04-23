<%@page import="models.Adver"%>
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
                </span> Quản Lý Quảng Cáo
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
                               		if(request.getAttribute("adver") != null){
                                		Adver adver = (Adver)request.getAttribute("adver");
                                		int id = adver.getId();
                                		String name = adver.getName();
                                		String web = adver.getWeb();
                                		String picture = adver.getPicture();
                              %>
                                <form role="form" method="post" enctype="multipart/form-data" id="form_adver" action="<%=request.getContextPath()%>/admin/adver/edit?id=<%=id%>">

                                    <div class="form-group">
                                        <label for="name">Tên quảng cáo</label>
                                        <input type="text" id="name" value="<%=name%>" name="name" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                    
                                        <label for="picture">Hình ảnh</label>
                                        	<%
                                        		if(!"".equals(picture)){
                                        			
                                        		
                                        	%>
											<div><img width="200px" height="200px" src="<%=request.getContextPath() %>/uploads/<%=picture%>" alt="<%=picture%>"/></div>
											<%}else{
											%>
											Không có hình ảnh
											<%} %>
                                        <input type="file" name="picture" />
                                    </div>
                                    <div class="form-group">
                                        <label for="preview">Website</label>
                                        <textarea id="preview" class="form-control" rows="3" name="web"><%=web%></textarea>
                                    </div>
                                    <button type="submit" name="submit" class="btn btn-success btn-md">Sửa</button>
                                </form>
                                <%} %>
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