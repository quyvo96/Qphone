<%@page import="daos.ColorPhoneDAO"%>
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
        	<h4 style="color: blue;">Giỏ Hàng Của Bạn</h4>
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
			<div style="margin-top: 20px"></div>
<%	
		@SuppressWarnings("unchecked")
		int id_order = (Integer)request.getAttribute("id_order");
		List<OrderDetail> listorderdetail = (List<OrderDetail>)request.getAttribute("listorderdetail");
			if(listorderdetail != null && listorderdetail.size() > 0){

%>
			<hr/>
			<form role="form" method="post" >
            <table  class="table table-striped table-bordered table-hover" id="dataTables-example" >
                                <thead class="table-info">
                                    <tr>
                                        <th colspan="6">Mã đơn hàng : <%=id_order %></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                double sum = 0;
                        		for(OrderDetail orderdetail: listorderdetail){
                        			int id = orderdetail.getId_detail();
                        			String namePhone = orderdetail.getPhone().getName();
                        			String color = orderdetail.getColor();
                        			int num = orderdetail.getNumber();
                        			double price = orderdetail.getPhone().getPrice();
                        			
                        			sum = sum + num*price;
                        			int idPhone = orderdetail.getPhone().getId();
                            		String picture = "UnPicture.jpg";
                            		try{
                                		ColorPhoneDAO colorDAO = new ColorPhoneDAO();
        								ColorPhone colorP = colorDAO.getPitureColorPhone(idPhone, color);
        								picture = colorP.getPicture();
                            		}catch(Exception e){
                            		}
                        			String urlDel = request.getContextPath() + "/order/cart/dele?id=" + id;
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
                                        <td class="center">
                                            <a href="<%=urlDel %>" title="" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn xóa không!')"><i class="mdi mdi-window-close"></i> Xóa</a>
                                        </td>
                                    </tr>
                               <% }%>
                               		<tr><td colspan="6" style="width: 100%; height: 2px;"><hr/></td></tr>
                               		<tr>		
                                        <td class="center" colspan="4" style="color:blue;font-size: 18px">Tổng Hóa Đơn:</td>
                                        <td class="center" colspan="1"style="color:blue;font-size: 18px">
                                        	<input type="text"  readonly="readonly" id="sumPirce" value="<%=sum %>" name="sumPirce"  style="width: 200px;color:blue;font-size: 18px"/>
                                        </td>
										<td class="center" colspan="1"style="color:blue;font-size: 18px">(USD)</td>
                                    </tr>
                                    <tr><td colspan="6" style="width: 100%; height: 2px;"><hr/></td></tr>
                                    <tr>		
                                        <td class="center" colspan="1" style="color:blue;font-size: 18px">Tên người nhận:</td>
                                        <td colspan="1"style="color:blue;font-size: 18px">
                                        <input type="text" id="nameUser" value="" name="nameUser" class="form-control" style="width: 200px"/>
                                        </td>
                                        <td class="center" colspan="1" style="color:blue;font-size: 18px">Số điện thoại:</td>
                                        <td colspan="1"style="color:blue;font-size: 18px">
                                        <input type="text" id="numberPhone" value="" name="numberPhone" class="form-control" style="width: 200px"/>
                                        </td>

                                    </tr>
                                    <tr>		
                                        <td class="center" colspan="1" style="color:blue;font-size: 18px">Địa chỉ:</td>
                                        <td colspan="5"style="color:blue;font-size: 18px">
                                        <input type="text" id="addres" value="" name="addres" class="form-control" style="width: 450px"/>
                                        </td>

                                    </tr>
                                    <tr>		
                                        <td class="center" colspan="1" style="color:blue;font-size: 18px">Thông tin thêm:</td>
                                        <td colspan="5"style="color:blue;font-size: 18px">
                                        <textarea id="other" name="other" rows="4" cols="50"></textarea>
                                        </td>

                                    </tr>
                                    <tr>
                                    	<td colspan="6" style="width: 100%; height: 2px;">
                                    			<button type="submit" name="submit" class="btn btn-success btn-md">Thanh Toán</button>
                                    			
                                    	</td>
                                    </tr>
                                </tbody>
        	</table>
        	</form>
	<%}else{
	%>   
	<div><h4>Chưa có sản phẩm trong giỏ hàng</h4>
		<div style="height: 300px"></div>
	</div>	
      <%} %>  	
		</div>
      </div>

          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
<%@ include file="/templates/public/inc/footer.jsp" %>