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
                </span> Quản Lý Sản Phẩm
              </h3>
            </div>
        <hr />
        <%int idCat = (Integer)request.getAttribute("idCat"); %>
        <div class="template-demo">
        	<%if(idCat==0){
        		%>
        		<a href="<%=request.getContextPath()%>/quan-ly/dien-thoai.html?idCat=0">
        			<button type="button" class="btn btn-primary btn-md">Tất Cả</button>
        		</a>
        	<%}else{
        	%>
        		<a href="<%=request.getContextPath()%>/quan-ly/dien-thoai.html?idCat=0">
        			<button type="button" class="btn btn-outline-primary btn-md">Tất Cả</button>
        		</a>
        	<%
        	} 
			if(request.getAttribute("listCat") != null){
				List<Category> cat = (List<Category>)request.getAttribute("listCat");
				if(cat.size() > 0){
					for(Category c : cat){
						int id = c.getId();
						String catName1 = c.getName();	
        				if(idCat==id){
        	%>
        	   <a href="<%=request.getContextPath()%>/quan-ly/dien-thoai.html?idCat=<%=id%>">
        			<button type="button" class="btn btn-primary btn-md"><%=catName1%></button>
        		</a>
        	<%}else{
        	%>
        	<a href="<%=request.getContextPath()%>/quan-ly/dien-thoai.html?idCat=<%=id%>">
        		<button type="button" class="btn btn-outline-primary btn-md"><%=catName1%></button>
        	</a>
        	<%}}}} %>
        </div>
        <hr/>
        <br/>
        <div class="row">
            <div class="col-md-12">
                <!-- Advanced Tables -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div >
                            <div class="row">
                                <div class="col-sm-6">
                                    <a href="<%=request.getContextPath()%>/admin/phone/add" class="btn btn-success btn-md">Thêm</a>
                                </div>
                                <div class="col-sm-6" style="text-align: right;">

						            <form class="d-flex align-items-center h-100" action="<%=request.getContextPath() %>/admin/phone/index">
						              <div class="input-group">
						                <input type="text" class="form-control bg-transparent border-4" placeholder="Tìm kiếm" name="sname">
						                <input type="submit" name="search" value="Tìm kiếm" class="btn btn-warning btn-sm mdi mdi-magnify" style="float:right" />
						              </div>
						            </form>
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
                            <hr/>

                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Hãng sản xuất</th>
                                        <th>Tên điện thoại</th>
                                        <th>Giá cả (USD)</th>
                                        <th>Màu sắc_Hình ảnh</th>
                                        <th>Cấu hình</th>
                                        <th width="160px">Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                	List<Phone> listphone = (List<Phone>)request.getAttribute("listphone");
                                	if(request.getAttribute("listphone") != null){
                                		
                                		if(listphone.size() > 0){
                                			for(Phone p : listphone){
                                				int id = p.getId();
                                				String phoneName = p.getName();
                                				String catName = p.getCat().getName();
                                				double price = p.getPrice();
                                				String urlEdit = request.getContextPath() + "/quan-ly/dien-thoai/sua-dien-thoai-" + id+".html";
                                				String urlDel = request.getContextPath() + "/admin/phone/del?id=" + id ;
                                				String urlColor = request.getContextPath() + "/admin/color/index?id=" + id ;
                                			
                                				String urlConfi = request.getContextPath() + "/admin/confi/index?id=" + id ;
    
                                %>
                                    <tr>
                                        <td><%=id %></td>
                                        <td class="center"><%=catName %></td>
                                        <td class="center"><%=phoneName %></td>
                                        <td class="center"><%=price %></td>
                                        <td class="center">
                                        	<a href="<%=urlColor%>" title="" class="btn btn-primary btn-sm"><i class="mdi mdi-image-filter-vintage"></i>Cài đặt</a>
                                        </td>
                                        <td class="center"><a href="<%=urlConfi%>" title="" class="btn btn-primary btn-sm"><i class="mdi mdi-image-filter-vintage"></i>Cài đặt</a></td>
                                        <td class="center">
                                            <a href="<%=urlEdit%>" title="" class="btn btn-primary btn-sm"><i class="mdi mdi-image-filter-vintage"></i> Sửa</a>
                                            <a href="<%=urlDel%>" title="" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn xóa không!')"><i class="mdi mdi-window-close"></i> Xóa</a>
                                        </td>
                                    </tr>
                                <%}}} %>
                                </tbody>
                            </table>
                            </div>
                            <hr/>
                            <%
                            
                            	int numerOfPages = (Integer)request.getAttribute("numerOfPages");
                            	int numerOfItems = (Integer)request.getAttribute("numerOfItems");
                            	int currentPage = (Integer)request.getAttribute("currentPage");
                            	if(listphone != null && listphone.size()>0){
                            		
                            %>

                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="dataTables_info" id="dataTables-example_info" style="margin-top:27px">Hiển thị từ 1 đến <%=GlobalConstants.NUMBER_PER_PAGE %> của các sản phẩm.</div>
                                </div>
                                <div class="col-sm-6" style="text-align: right;">
                                    <div class="btn-group" role="group" aria-label="Basic example">
                                    <%
                                        	
                                      if(currentPage > 1){
                                      String urlSlugBack = request.getContextPath()+ "/quan-ly/dien-thoai/trang-"+(currentPage-1)+"-"+(idCat)+".html";
                                     %>
			                            <a href="<%=urlSlugBack%>"><button type="button" class="btn btn-outline-secondary btn-sm" onclick="" >Trang trước</button></a>
                                     <%
                            			}	
                                        for(int i = 1; i<=numerOfPages; i++){
                                        String urlSlug = request.getContextPath()+ "/quan-ly/dien-thoai/trang-"+i+"-"+(idCat)+".html";
                                        if(currentPage == i){
                                      %>
			                            <a href="<%=urlSlug%>"><button type="button" class="btn btn-outline-secondary btn-sm"><%=currentPage%></button></a>
			                           <%}else{ %>
			                            <a href="<%=urlSlug%>"><button type="button" class="btn btn-outline-secondary btn-sm"><%=i%></button></a>
                                         <%
                                         }}
                                        	if(currentPage < numerOfPages){
                                        		String urlSlugNext = request.getContextPath()+ "/quan-ly/dien-thoai/trang-"+(currentPage+1)+"-"+(idCat)+".html";
                                         
                                         %>
                                         	<a href="<%=urlSlugNext%>"><button type="button" class="btn btn-outline-secondary btn-sm">Trang tiếp</button></a>
                                           
                                        <%} %>
			                          </div>
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