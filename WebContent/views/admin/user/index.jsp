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
                  <i class="mdi mdi-cellphone-dock"></i>
                </span> Quản Lý Người Dùng
              </h3>
            </div>
        <hr />
        <div class="row">
            <div class="col-md-12">
                <!-- Advanced Tables -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div>
                               <%
					            	if(session.getAttribute("userInfo") != null){
					            		User userInfor = (User)session.getAttribute("userInfo");
					            		int id_role = userInfor.getUserRole().getId();
					            		String nameuser = userInfor.getUserName();
					            		if(id_role == 1){
					            			
					            %>
                            <div class="row">
                                <div class="col-sm-6">
                                    <a href="<%=request.getContextPath()%>/quan-ly/nguoi-dung/them-nguoi-dung.html" class="btn btn-success btn-md">Thêm</a>
                                </div>
                            </div>
                            <%
					            		}
		                        int numerOfPages = (Integer)request.getAttribute("numerOfPages");
		                        int numerOfItems = (Integer)request.getAttribute("numerOfItems");
		                        int currentPage = (Integer)request.getAttribute("currentPage");
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
                                        <th>Tên đăng nhập</th>
                                        <th>Họ tên</th>
                                        <th>Chức vụ</th>
                                        <th width="160px">Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                	@SuppressWarnings("unchecked")
	                                List<User> users = (List<User>)request.getAttribute("users");
	                                	if(users != null && users.size() > 0){
	                                		for(User user: users){
	                                			int id = user.getId();
	                                			String userName = user.getUserName();
	                                			String password = user.getPassword();
	                                			String fullName = user.getFullName();
	                                			int role = user.getUserRole().getId();
	                                			String name_role = user.getUserRole().getRole();
	                                			String urlEdit = request.getContextPath() + "/quan-ly/nguoi-dung/sua-nguoi-dung-" + id+".html";
	                                			String urlDel = request.getContextPath() + "/admin/user/del?id=" + id;

                                %>

                                    <tr>
                                        <td><%=id %></td>
                                        <td class="center"><%=userName %></td>
                                        <td class="center"><%=fullName %></td>
                                        <td class="center"><%=name_role %></td>
                                        <td class="center">
                                        	<%
                                        		if(id_role == 1 || (id_role == 2 && role == 2)){
                                        	%>
                                            <a href="<%=urlEdit %>" title="" class="btn btn-primary btn-sm"><i class="mdi mdi-image-filter-vintage"></i> Sửa</a>
                                            <%
                                            		if(id_role == 1 && role != 1){	
                                            %>
                                            <a href="<%=urlDel %>" title="" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn xóa không!')"><i class="mdi mdi-window-close"></i> Xóa</a>
                                        	<%}} %>
                                        </td>
                                    </tr>
                               <% }%>
                                </tbody>
                            </table>
                            <hr/>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="dataTables_info" id="dataTables-example_info" style="margin-top:27px"></div>
                                </div>
                                <div class="col-sm-6" style="text-align: right;">
                                    <div class="btn-group" role="group" aria-label="Basic example">
                                    <%
                                        	
                                      if(currentPage > 1){
                                      String urlSlugBack = request.getContextPath()+ "/quan-ly/nguoi-dung/trang-"+(currentPage-1)+".html";
                                     %>
			                            <a href="<%=urlSlugBack%>"><button type="button" class="btn btn-outline-secondary btn-sm" onclick="" >Trang trước</button></a>
                                     <%
                            			}	
                                        for(int i = 1; i<=numerOfPages; i++){
                                        String urlSlug = request.getContextPath()+ "/quan-ly/nguoi-dung/trang-"+i+".html";
                                        if(currentPage == i){
                                      %>
			                            <a href="<%=urlSlug%>"><button type="button" class="btn btn-outline-secondary btn-sm"><%=currentPage%></button></a>
			                           <%}else{ %>
			                            <a href="<%=urlSlug%>"><button type="button" class="btn btn-outline-secondary btn-sm"><%=i%></button></a>
                                         <%
                                         }}
                                        	if(currentPage < numerOfPages){
                                        		String urlSlugNext = request.getContextPath()+ "/quan-ly/nguoi-dung/trang-"+(currentPage+1)+".html";
                                         
                                         %>
                                         	<a href="<%=urlSlugNext%>"><button type="button" class="btn btn-outline-secondary btn-sm">Trang tiếp</button></a>
                                           
                                        <%} %>
			                          </div>
                            </div>
                            </div>
                            <%}} %>
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