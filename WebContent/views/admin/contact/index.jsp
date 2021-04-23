<%@page import="models.Contact"%>
<%@page import="models.Confi"%>
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
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title">
                <span class="page-title-icon bg-gradient-primary text-white mr-2">
                  <i class="mdi mdi-cellphone-dock"></i>
                </span>Liên Hệ
              </h3>
            </div>
        <br/>
        <hr />
        <div class="row">
            <div class="col-md-12">
                <!-- Advanced Tables -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div>
                            <div class="row">
                            </div>
                            <%  
                            	if(request.getAttribute("contacts") != null){
                        			List<Contact> contacts = (List<Contact>)request.getAttribute("contacts");
    		                        int numerOfPages = (Integer)request.getAttribute("numerOfPages");
    		                        int numerOfItems = (Integer)request.getAttribute("numerOfItems");
    		                        int currentPage = (Integer)request.getAttribute("currentPage");
                        	%>

                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Họ tên</th>
                                        <th>Email</th>
                                        <th>Website</th>
                                        <th>Nội dung</th>
                                        <th width="160px">Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%

                                		if(contacts.size() > 0){
                                			for(Contact c : contacts){
                                				int id = c.getId();
                                				String name = c.getName();
                                				String email = c.getEmail();
                                				String message = c.getMessage();
                                				String web = c.getWebsite();		
    
                                %>
                                    <tr>
                                        <td><%=id %></td>
                                        <td class="center"><%=name %></td>
                                        <td class="center"><%=email %></td>
                                        <td class="center"><%=web %></td>
										<td class="center"><%=message %></td>
                                        <td class="center">
                                            <a href="<%=request.getContextPath() %>/admin/contact/del?id=<%=id%>" title="" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn xóa không!')"><i class="mdi mdi-window-close"></i> Xóa</a>
                                        </td>
                                    </tr>
                                <%}} %>
                                </tbody>
                            </table>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="dataTables_info" id="dataTables-example_info" style="margin-top:27px"></div>
                                </div>
                                <div class="col-sm-6" style="text-align: right;">
                                    <div class="btn-group" role="group" aria-label="Basic example">
                                    <%
                                        	
                                      if(currentPage > 1){
                                    	  String urlSlugBack = request.getContextPath()+ "/quan-ly/lien-he/trang-"+(currentPage-1)+".html";
                                     %>
			                            <a href="<%=urlSlugBack%>"><button type="button" class="btn btn-outline-secondary btn-sm" onclick="" >Trang trước</button></a>
                                     <%
                            			}	
                                        for(int i = 1; i<=numerOfPages; i++){
                                        	String urlSlug = request.getContextPath()+ "/quan-ly/lien-he/trang-"+(i)+".html";
                                        if(currentPage == i){
                                      %>
			                            <a href="<%=urlSlug%>"><button type="button" class="btn btn-outline-secondary btn-sm"><%=currentPage%></button></a>
			                           <%}else{ %>
			                            <a href="<%=urlSlug%>"><button type="button" class="btn btn-outline-secondary btn-sm"><%=i%></button></a>
                                         <%
                                         }}
                                        	if(currentPage < numerOfPages){
                                        		String urlSlugNext = request.getContextPath()+ "/quan-ly/lien-he/trang-"+(currentPage+1)+".html";
                                         
                                         %>
                                         	<a href="<%=urlSlugNext%>"><button type="button" class="btn btn-outline-secondary btn-sm">Trang tiếp</button></a>
                                           
                                        <%} %>
			                          </div>
                            </div>
                            </div>
                            <%} %>
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