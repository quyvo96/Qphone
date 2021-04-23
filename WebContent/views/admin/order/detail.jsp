<%@page import="models.OrderDetail"%>
<%@page import="daos.ColorPhoneDAO"%>
<%@page import="models.ColorPhone"%>
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
	int id_status = getOrderCart.getStatus();
	int id_pay = getOrderCart.getStatus_pay();
	StatusDAO statusDAO = new StatusDAO();
	Status status = statusDAO.getById(id_status);
	String name_status = status.getName_status();
	StatusPayDAO statusPayDAO = new StatusPayDAO();
	StatusPay statusPay = statusPayDAO.getById(id_pay);
	String name_Pay = statusPay.getName_pay();
	String name_button = "";
	if(id_status == 2){
		name_button= "Giao hàng";
	}else if(id_status == 3){
		name_button= "Hoàn thành";
	}else if(id_status == 5){
		name_button= "Xác nhận";
	}

%>
        <div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title">
                <span class="page-title-icon bg-gradient-primary text-white mr-2">
                  <i class="mdi mdi-cellphone-dock"></i>
                </span> Chi Tiêt Đơn Hàng : <%=id_order%>
              </h3>
            </div>
            <h5 style="color: blue;"><%=date %></h5>
        <hr />

   
        <div class="row">
            <div class="col-md-12">
                <!-- Advanced Tables -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div >
                            <hr/>
	<form role="form" method="post">
            <table  class="table table-striped table-bordered table-hover" id="dataTables-example" >
                                <thead class="table-info">
                                    <tr>
                                        <th >Mã đơn hàng</th>
                                        <th >Tên người nhận</th>
                                        <th >Số điện thoại</th>
                                        <th >Tình trạng</th>
                                        <th >Thanh Toán</th>
                                        <th >Giá(USD)</th>
                                        <th style="width: 200px" >Xử Lý</th>
                                    </tr>
                                </thead>
                                <tbody>
                                   <tr>
                                        <td class="center"><%=id_order %>
                                        </td>
                                        <td class="center"><%=name %></td>
                                        <td class="center"><%=number_phone %></td>
                                        <td class="center" style="color: blue"> <%=name_status%></td>
                                        <td class="center" style="color: blue"> <%=name_Pay%></td>
                                        <td class="center"><%=sum_price%></td>
                                        <td class="center">
                                        <%if("".equals(name_button)){
                                        	%>
                                        	<p style="color: blue;">Đơn đã hoàn thành</p>
                                        <%}else{
                                        	%>
                                        
                                        	<button type="submit" class="btn btn-success btn-md"><%=name_button%></button>
                                        	<%} %>
                                        </td>


                                    </tr>
                                    <tr >
                                        <td style="color: blue;">Địa chỉ:
                                        </td>
                                        <td colspan="5"><%=addres %>
                                        </td>
                                    </tr>
                                    <tr >
                                        <td style="color: blue;">Thông tin Thêm
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
                        			String urlDel = request.getContextPath() + "/cart/dele?id=" + id;
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
        	</form>
                            </div>
                            <hr/>

                    </div>
                </div>
                <!--End Advanced Tables -->
            </div>
        </div>

          </div>
          <%} %>
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
<script>
    document.getElementById("index").classList.add('active-menu');
</script>
<%@ include file="/templates/admin/inc/footer.jsp" %>