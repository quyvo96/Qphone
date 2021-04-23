<%@page import="models.ColorPhone"%>
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
<%
if(request.getAttribute("phone") != null){
	Phone phone = (Phone)request.getAttribute("phone");
	String name = phone.getName();
	int idPhone = phone.getId();
%>
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title">
                <span class="page-title-icon bg-gradient-primary text-white mr-2">
                  <i class="mdi mdi-cellphone-dock"></i>
                </span>Màu Sắc: <%=name%>
              </h3>
            </div>
        <br/>
        <hr />
        <div class="row">
            <div class="col-md-12">
                <!-- Form Elements -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
	                        <%if(request.getAttribute("colors") != null){
								ColorPhone colors = (ColorPhone)request.getAttribute("colors");
								int id = colors.getId();
								String color = colors.getColor();
								String picture = colors.getPicture();
							%>
                            <div class="col-md-12">
                                <form role="form" method="post" enctype="multipart/form-data" id="form_song" action="<%=request.getContextPath()%>/admin/color/edit?id=<%=id%>&idPhone=<%=idPhone%>">
                                    <div class="form-group">
                                        <label for="name">Màu</label>
                                        <input type="text" id="color" value="<%=color%>" name="color" class="form-control" />
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
                                        <input type="file" name="picture" value="<%=picture%>"/>
                                    </div>
                                     <div class="form-group">
                                        <label for="picture">Id điện thoại</label>
                                        <input type="text" readonly="readonly"  id="idPhone" value="<%=idPhone %>" name="idPhone" class="form-control" />
                                    </div>
                                    <button type="submit" name="submit" class="btn btn-success btn-md">Sửa</button>
                                </form>
                            </div>
                            <%} %>
                        </div>
                    </div>
                </div>
                <!-- End Form Elements -->
            </div>
        </div>

          </div>
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
<%} %>
<script>
    document.getElementById("index").classList.add('active-menu');
</script>
<%@ include file="/templates/admin/inc/footer.jsp" %>