<%@page import="daos.ColorPhoneDAO"%>
<%@page import="models.StatusPay"%>
<%@page import="daos.StatusPayDAO"%>
<%@page import="models.Status"%>
<%@page import="daos.StatusDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="daos.OrderDetailDAO"%>
<%@page import="models.Order"%>
<%@page import="models.OrderDetail"%>
<%@page import="models.ColorPhone"%>
<%@page import="constants.GlobalConstants"%>
<%@page import="models.Phone"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<%@ include file="/templates/public/inc/navbar.jsp" %>
      <!-- partial -->

      <div class="container-fluid " style="margin-top: 100px">
        <!-- partial:partials/_sidebar.html -->
        <!-- partial -->
        <div class="content-wrapper" style="margin:20px 5% 0 5%; width: 90%;">
        	<h4 style="color: blue;">Lịch Sử Mua Hàng</h4>
        <hr/>
                            <%
                            	if(request.getParameter("msg")!=null){
                            		String msg = request.getParameter("msg");
                            		if(GlobalConstants.SUCCESS.equals(msg)){
                            %>
	                            <div class="alert alert-success" role="alert">
								  <h4>Bạn đã hủy đơn hàng! vui lòng chờ Shop xác nhận!</h4>
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
			<div style="margin-top: 20px"></div>
<%
	List<Order> listOrder = (List<Order>)request.getAttribute("listOrder");
		if(listOrder != null && listOrder.size() > 0){
%>
            <table  class="table table-bordered" id="dataTables-example" >
                                <thead class="table-info">
                                    <tr >
                                        <th >Mã đơn hàng</th>
                                        <th >Tên người nhận</th>
                                        <th >Số điện thoại</th>
                                        <th >Giá(USD)</th>
                                        <th >Tình trạng</th>
                                        <th >Ngày mua hàng</th>
                                        <th width="80px">Chi tiết</th>
                                    </tr>

                                </thead>
                                <tbody>
                               <%    		
                               	for(Order o: listOrder){
                        			int id_order = o.getId_order();
                        			String name = o.getName();
                        			int number_phone = o.getNumberPhone();
                        			String addres = o.getAddres();
                        			double sum_price = o.getSum_price();
                        			int id_status = o.getStatus();
                        			int id_pay = o.getStatus_pay();
                        			Timestamp date = o.getDate_create();
                        			StatusDAO statusDAO = new StatusDAO();
                        			Status status = statusDAO.getById(id_status);
                        			String name_status = status.getName_status();
                        			StatusPayDAO statusPayDAO = new StatusPayDAO();
                        			StatusPay statusPay = statusPayDAO.getById(id_pay);
                        			String name_pay = statusPay.getName_pay();
                        			String urlCancle = request.getContextPath() + "/order/cancle?id_order=" + id_order ;
                        		%>
                                    <tr>
                                    	<td class="center"><%=id_order %></td>
                                        <td class="center"><%=name%></td>
                                        <td class="center"><%=number_phone %></td>
                                        <td class="center"><%=sum_price%></td>
                                        <td class="center"><span style="color: blue;"><%=name_pay%>: </span><span><%=name_status%></span></td>
                                        <td class="center"><%=date%></td>
                                        <td class="center">
                                        <%if(id_status == 2 || id_status == 3){
                                        	%>
                                        	<a href="<%=urlCancle%>" title="" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn hủy đơn không!')"><i class="mdi mdi-window-close"></i> Hủy Đơn</a>
                                        <%} %>
                                            
                                            <input type="button" class="btn btn-danger btn-sm" value="chi tiết" onclick="return showView(<%=id_order%>)"/>
                                        </td>
                                    </tr>
                                    <tr  >
                                    	<td colspan="6">
										<%
											OrderDetailDAO orderdetailDAO = new OrderDetailDAO();
											List<OrderDetail> listorderdetail = orderdetailDAO.getAllHistoryByIdOrder(id_order);
												if(listorderdetail != null && listorderdetail.size() > 0){
										%>
										<div id="show<%=id_order%>" style="display: none;width: 100%;">
										            <table  class="table-warning" id="dataTables-example" style="width: 100%;">
										                                    <tr>
										                                        <td colspan="4">Chi tiết đơn hàng( <%=id_order %> )</td>
										                                        <td >
										                                        	<input type="button" class="btn btn-danger btn-sm" value="Ẩn" onclick="return hideView(<%=id_order%>)"/>
										                                        
										                                        </td>
										                                    </tr>
										
										                                <tbody>
										                               <%    		
										                               	for(OrderDetail orderdetail: listorderdetail){
										                        			int id = orderdetail.getId_detail();
										                        			String namePhone = orderdetail.getName_phone();
										                        			String color = orderdetail.getColor();
										                        			int num = orderdetail.getNumber();
										                        			double price = orderdetail.getPrice_detail();
										                        			
										                            		String picture = "UnPicture.jpg";
										                            		try{
										                            			int idPhone = orderdetail.getPhone().getId();
										                                		ColorPhoneDAO colorDAO = new ColorPhoneDAO();
										        								ColorPhone colorP = colorDAO.getPitureColorPhone(idPhone, color);
										        								picture = colorP.getPicture();
										                            		}catch(Exception e){
										                            		}
										                        		%>
										                                    <tr>
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
										                                        <td class="center"><%=namePhone %></td>
										                                        <td class="center">Màu: <%=color %></td>
										                                        <td class="center"> Số Lượng: <%=num %></td>
										                                        <td class="center">Giá: <%=num * price %> (USD)</td>
										                                    </tr>
										                                  <%} %>
										                                </tbody>
										        	</table>
										        	</div>
										        	<%} %>
                                    	</td>

                                    </tr>
                                  <%} %>
                                </tbody>
        	</table>
        	<%} %>
        	<div style="height: 200px;"></div>
		</div>
      </div>
	
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
<%@ include file="/templates/public/inc/footer.jsp" %>