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
                <!-- Advanced Tables -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div >
                            <div class="row">
                                <div class="col-sm-6">
                                    <a href="<%=request.getContextPath()%>/admin/color/add?idPhone=<%=idPhone%>" class="btn btn-success btn-md">Thêm</a>
                                </div>
                                <div class="col-sm-6" style="text-align: right;">
                                	<br />
                                </div>
                            </div>
                            <%
                            	if(request.getParameter("msg")!=null){
                            		String msg = request.getParameter("msg");
                            		if(GlobalConstants.SUCCESS.equals(msg)){
                            %>
	                            <div class="alert alert-success" role="alert">
								  <h4>Xử lý thành công!</h4>
								</div>
                            	
                            <% 
                            		}else{
                             %>
                                <div class="alert alert-danger" role="alert">
								  <h4>Xử lý thất bại!</h4>
								</div>
                                <% 
                            	}}
                            
                            %>
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Màu sắc</th>
                                        <th>Hình ảnh</th>
                                        <th>Id điện thoại</th>
                                        <th width="160px">Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                	List<ColorPhone> listcolor = (List<ColorPhone>)request.getAttribute("listcolor");
                                		if(request.getAttribute("listcolor") != null){
                                		if(listcolor.size() > 0){
                                			for(ColorPhone c : listcolor){
                                				int id = c.getId();
                                				String color = c.getColor();
                                				String picture = c.getPicture();
                                				String urlEdit = request.getContextPath() + "/admin/color/edit?id=" + id +"&idPhone="+idPhone;
                                				String urlDel = request.getContextPath() + "/admin/color/del?id=" + id +"&idPhone="+idPhone;
                                %>
                                    <tr>
                                        <td><%=id %></td>
                                        <td class="center"><%=color %></td>
                                        
                                        <td class="center">
                                        	<%
                                        		if(!"".equals(picture)){
                                        			
                                        		
                                        	%>
											<img class="mb-2 rounded" width="200px" height="200px" src="<%=request.getContextPath() %>/uploads/<%=picture%>" alt="<%=picture%>"/>
											<%}else{
											%>
											Không có hình ảnh
											<%} %>
											
                                        </td>
                                        <td class="center"><%=idPhone%></td>
                                        <td class="center">
                                            <a href="<%=urlEdit%>" title="" class="btn btn-primary btn-sm"><i class="mdi mdi-image-filter-vintage"></i> Sửa</a>
                                            <a href="<%=urlDel%>" title="" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn xóa không!')"><i class="mdi mdi-window-close"></i> Xóa</a>
                                        </td>
                                    </tr>
                                <%}}} %>
                                </tbody>
                            </table>
                        </div>
						
                    </div>
                </div>
                <!--End Advanced Tables -->
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