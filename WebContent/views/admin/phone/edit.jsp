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
                </span> Quản Lý Sản Phẩm
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
                             		int id = (int)request.getAttribute("id");
                               		if(request.getAttribute("phone") != null){
                                		Phone phone = (Phone)request.getAttribute("phone");
                                		String name = phone.getName();
                                		double price = phone.getPrice();
                                		int id_cat = phone.getCat().getId();
                                		String preview_text = phone.getPreview_text(); 
                                		String name_cat = phone.getCat().getName();
                                		String description_text = phone.getDescription_text();
                              %>
                                <form role="form" method="post" action="<%=request.getContextPath()%>/admin/phone/edit?id=<%=id%>">

                                    <div class="form-group">
                                        <label for="name">Tên điện thoại</label>
                                        <input type="text" id="name" value="<%=name%>" name="name" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="preview_text">Tóm tắt</label>
                                        <input type="text" id="preview_text" value="<%=preview_text%>" name="preview_text" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="category">Hãng sản xuất</label>

                                        <select id="category" name="category" class="form-control">
                                        <option value="<%=id_cat%>"><%=name_cat%></option>
                                	<%
	                            		if(request.getAttribute("categories") != null){
	                            			
	                            			List<Category> categories = (List<Category>)request.getAttribute("categories");
	                            			if(categories.size() > 0){
	                            				for(Category cat : categories){
	                            					int catId = cat.getId();
	                            					String catName = cat.getName();
                                	%>
	                                        <option value="<%=catId%>"><%=catName%></option>
	                                        <%}}} %>
                                        </select>
                                    
                                    </div>
                                    <div class="form-group">
                                        <label for="preview">Giá cả</label>
                                        <input type="text" id="price" value="<%=price%>" name="price" class="form-control" />

                                    </div>
                                     <div class="form-group">
                                        <label for="description_text">Mô tả</label>
                                        <textarea class="form-control" id="description_text" name="description_text" rows="4" cols="50"><%=description_text%></textarea>
                                        
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