<%@page import="daos.ColorPhoneDAO"%>
<%@page import="java.sql.Timestamp"%>
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
<%
@SuppressWarnings("unchecked")
Order getOrderCart = (Order)request.getAttribute("getOrderCart");
if(getOrderCart != null){
	int id_order = getOrderCart.getId_order();
	String name = getOrderCart.getName();
	int number_phone = getOrderCart.getNumberPhone();
	String addres = getOrderCart.getAddres();
	double sum_price = getOrderCart.getSum_price();
	String other = getOrderCart.getOther();
	Timestamp date = getOrderCart.getDate_create();

%>
      <div class="container-fluid " style="margin-top: 100px">
        <!-- partial:partials/_sidebar.html -->
        <!-- partial -->
        <div class="content-wrapper" style="margin:20px 5% 0 5%; width: 90%;">
        	<h4 style="color: blue;">Thanh Toán</h4>
        	<h5 style="color: blue;"><%=date %></h5>
        <hr/>
			<div style="margin-top: 20px"></div>
            <table  class="table table-striped table-bordered table-hover" id="dataTables-example" >
                                <thead class="table-info">
                                    <tr>
                                        <th >Mã đơn hàng</th>
                                        <th >Tên người nhận</th>
                                        <th >Số điện thoại</th>
                                        <th >Địa chỉ</th>
                                        <th >Giá(USD)</th>
                                        <th style="width: 200px" >Thanh Toán</th>
                                    </tr>
                                </thead>
                                <tbody>
                                   <tr>
                                        <td class="center"><%=id_order %>
                                        </td>
                                        <td class="center"><%=name %></td>
                                        <td class="center"><%=number_phone %></td>
                                        <td class="center"> <%=addres%></td>
                                        <td class="center" id="pricePay"><%=sum_price%></td>
                                        <td class="center">
                                        	<div style="width: 200px"><div id="paypal-button" ></div>
                                        	<script src="https://www.paypalobjects.com/api/checkout.js"></script>
                                        	</div>
                                        	<button class="btn btn-success btn-md" onclick="return byHand()">Trả sau</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td >Thông tin Thêm
                                        </td>
                                        <td colspan="5"><%=other %>
                                        </td>
                                    </tr>
                                   <tr >
                                        <td colspan="6">Chi Tiết >>>
                                        </td>
                                    </tr>
                                <%
                              double sum = 0;
                              List<OrderDetail> listorderdetail = (List<OrderDetail>)request.getAttribute("listorderdetail");
                              if(listorderdetail != null && listorderdetail.size() > 0){
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
                                    </tr>
                               <% }}%>
                                </tbody>
        	</table>

		</div>
      </div>
	<%}%>
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
<%@ include file="/templates/public/inc/footer.jsp" %>