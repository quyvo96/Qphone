<%@page import="models.StatusPay"%>
<%@page import="daos.StatusPayDAO"%>
<%@page import="daos.StatusDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="models.Order"%>
<%@page import="models.Status"%>
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
                </span> Quản Lý Đơn Hàng
              </h3>
            </div>
        <hr />
        <%int idOrder = (Integer)request.getAttribute("idOrder"); %>
        <div class="template-demo">
        	<%if(idOrder==0){
        		%>
        		<a href="<%=request.getContextPath()%>/quan-ly/don-hang.html?idOrder=0">
        			<button type="button" class="btn btn-primary btn-md">Tất Cả</button>
        		</a>
        	<%}else{
        	%>
        		<a href="<%=request.getContextPath()%>/quan-ly/don-hang.html?idOrder=0">
        			<button type="button" class="btn btn-outline-primary btn-md">Tất Cả</button>
        		</a>
        	<%
        	} 
			if(request.getAttribute("listStatus") != null){
				List<Status> listStatus = (List<Status>)request.getAttribute("listStatus");
				if(listStatus.size() > 0){
					for(Status s : listStatus){
						int id = s.getId_status();
						String statusName1 = s.getName_status();	
        				if(idOrder==id){
        	%>
        	   <a href="<%=request.getContextPath()%>/quan-ly/don-hang.html?idStatus=<%=id%>">
        			<button type="button" class="btn btn-primary btn-md"><%=statusName1%></button>
        		</a>
        	<%}else{
        	%>
        	<a href="<%=request.getContextPath()%>/quan-ly/don-hang.html?idStatus=<%=id%>">
        		<button type="button" class="btn btn-outline-primary btn-md"><%=statusName1%></button>
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
                                <div class="col-sm-6" style="text-align: right;">

						            <form class="d-flex align-items-center h-100" action="<%=request.getContextPath() %>/admin/order/index">
						              <div class="input-group">
						                <input type="text" class="form-control bg-transparent border-4" placeholder="Mã đơn hàng" name="idOrder">
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
                                        <th>Người Nhận</th>
                                        <th>Số điện thoại</th>
                                        <th>Giá cả(USD)</th>
                                        <th>Trạng thái</th>
                                        <th>Thanh toán</th>
                                        <th>Ngày đặt hàng</th>
                                        <th width="160px">Xử lý</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                	List<Order> listorder = (List<Order>)request.getAttribute("listorder");
                                	if(request.getAttribute("listorder") != null){
                                		
                                		if(listorder.size() > 0){
                                			for(Order o : listorder){
                                				int id_order = o.getId_order();
                                				String name = o.getName();
                                				int numberPhone = o.getNumberPhone();
                                				double price = o.getSum_price();
                                				Timestamp date = o.getDate_create();
                                				int id_status = o.getStatus();
                                				int id_pay = o.getStatus_pay();
                                				StatusDAO statusDAO = new StatusDAO();
                                				Status status = statusDAO.getById(id_status);
                                				String name_status = status.getName_status();
                                				StatusPayDAO statusPayDAO = new StatusPayDAO();
                                				StatusPay statusPay = statusPayDAO.getById(id_pay);
                                				String name_Pay = statusPay.getName_pay();
                                						
                                				String urlEdit = request.getContextPath() + "/quan-ly/don-hang/chi-tiet-" + id_order+".html";
    
                                %>
                                    <tr>
                                        <td><%=id_order %></td>
                                        <td class="center"><%=name %></td>
                                        <td class="center"><%=numberPhone %></td>
                                        <td class="center"><%=price %></td>
                                        <td class="center" style="color: blue"><%=name_status %></td>
                                        <td class="center">
                                        	<%if(id_pay == 1){
                                        	%>
                                        		<div style="color: red"><%=name_Pay %></div>
                                        	<%}else{
                                        		%>
                                        		<div style="color: blue"><%=name_Pay %></div>
                                        	<%}%>
                                        	
                                        </td>
                                        <td class="center"><%=date %></td>
                                        <td class="center">
                                            <a href="<%=urlEdit%>" title="" class="btn btn-primary btn-sm"><i class="mdi mdi-image-filter-vintage"></i> Chi Tiết</a>
                                           
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
                            	if(listorder != null && listorder.size()>0){
                            		
                            %>

                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="dataTables_info" id="dataTables-example_info" style="margin-top:27px">Hiển thị từ 1 đến <%=GlobalConstants.NUMBER_PER_PAGE %> của các sản phẩm.</div>
                                </div>
                                <div class="col-sm-6" style="text-align: right;">
                                    <div class="btn-group" role="group" aria-label="Basic example">
                                    <%
                                        	
                                      if(currentPage > 1){
                                      String urlSlugBack = request.getContextPath()+ "/quan-ly/don-hang/trang-"+(currentPage-1)+"-"+(idOrder)+".html";
                                     %>
			                            <a href="<%=urlSlugBack%>"><button type="button" class="btn btn-outline-secondary btn-sm" onclick="" >Trang trước</button></a>
                                     <%
                            			}	
                                        for(int i = 1; i<=numerOfPages; i++){
                                        String urlSlug = request.getContextPath()+ "/quan-ly/don-hang/trang-"+i+"-"+(idOrder)+".html";
                                        if(currentPage == i){
                                      %>
			                            <a href="<%=urlSlug%>"><button type="button" class="btn btn-outline-secondary btn-sm"><%=currentPage%></button></a>
			                           <%}else{ %>
			                            <a href="<%=urlSlug%>"><button type="button" class="btn btn-outline-secondary btn-sm"><%=i%></button></a>
                                         <%
                                         }}
                                        	if(currentPage < numerOfPages){
                                        		String urlSlugNext = request.getContextPath()+ "/quan-ly/don-hang/trang-"+(currentPage+1)+"-"+(idOrder)+".html";
                                         
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