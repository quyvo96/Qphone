<%@page import="models.Confi"%>
<%@page import="daos.ColorPhoneDAO"%>
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
	ColorPhoneDAO colorDAO = new ColorPhoneDAO();
	int numcolor = (Integer)request.getAttribute("numcolor");

	if(request.getAttribute("phone") != null){
		Phone phone = (Phone)request.getAttribute("phone");
		int id_phone = phone.getId();
		String namePhone = phone.getName();
		double price = phone.getPrice();
		String picture = "UnPicture.jpg";
		String title = phone.getPreview_text();
		String content = phone.getDescription_text();
		try{
			ColorPhone color = colorDAO.getPiturePhone(id_phone);
			picture = color.getPicture();
		}catch(Exception e){
		}

%>
      <div class="container-fluid " style="margin-top: 100px">
        <!-- partial:partials/_sidebar.html -->
        <!-- partial -->
        <div class="content-wrapper" style="margin:20px 5% 0 5%; width: 90%;">
        	<h3 style="color: blue;">Điện thoại <%=namePhone %></h3>
        <hr/>
			<div style="margin-top: 20px"></div>
			<table style="width:100%;">
			    <tbody>
			        <tr>

			            <td rowspan="4" style=" width:30%; height:400px">
							<img class="mb-2 rounded" width="80%" height="70%" src="<%=request.getContextPath()%>/uploads/<%=picture%>"/>
						</td>
						<td rowspan="4" style=" width:40%; height:400px">	
							<table style="width:100%;">
							  <tr style="">
								<%
								
					            List<ColorPhone> listcolor = (List<ColorPhone>)request.getAttribute("listcolor");
					            if(request.getAttribute("listcolor") != null){
					                if(listcolor.size() > 0){
					                	int num = 0;
					                	for(ColorPhone c : listcolor){
					                		num++;
					                		int idcolor = c.getId();
					                		String color = c.getColor();
					                		String picturecolor = c.getPicture();
					                		String checkColor = "check" + num;
								%>
							    <td style="height: 100px; width: 20%">
								    <img class="mb-2 rounded" width="50px" height="50px" src="<%=request.getContextPath()%>/uploads/<%=picturecolor%>"/>
								    <br/>
								    <input type="checkbox" value="<%=color%>" class="color1" id="<%=checkColor%>" onclick="selectOnlyThis(this.id, <%=listcolor.size()%>)">
								    <%=color%>
							    </td>
							    <%}}} %>
							  </tr>
							  <tr style="height: 100px">
							    <td colspan="<%=numcolor%>">
							    	<p>Chọn số lượng: </p>
							    	<input style="width: 100px" type="number" id="numphone1" value="1" class="form-control" />
							    </td>
							  </tr>
							  <tr style="height: 100px">
							    <td colspan="<%=numcolor%>">
							    <h2 style="color: blue;"><%=price%> $</h2>
							    </td>
							  </tr>
							  <tr style="height: 100px">
							    <td colspan="<%=numcolor%>">
				                    <div class="template-demo">
				                    <a href="javasccript:void(0)" title="" onclick="return cart(<%=id_phone %>)" >
				                      <button  style="width: 45%" type="button" class="btn btn-success btn-fw">Thêm vào giỏ hàng</button>
				                    </a>
				                    <a href="javasccript:void(0)" title="" onclick="return video()" >
				                      <button style="width: 45%" type="button" class="btn btn-success btn-fw">Mua Ngay</button>
				                    </a>
				                    </div>
							    </td>
							</table>
							</td>
				<%
				if(request.getAttribute("confi") != null){
					Confi confi = (Confi)request.getAttribute("confi");
					String screen = confi.getScreen();
					String operating_system = confi.getOperating_system();
					String rear_camera = confi.getRear_camera();
					String front_camera = confi.getFront_camera();
					String cpu = confi.getCpu();
					String ram = confi.getRam();
					String internal_memory = confi.getInternal_memory();
					String sim = confi.getSim();
					String pin = confi.getPin();
				
				%>

			        
						<td rowspan="4" style=" width:40%; height:400px">	
							<table style="width:100%;">
						<tr style=" width:30%; height:50px">
							<td>
								<span style="color: blue ;margin: 0 0 0 10px">Màn hình:</span>
							</td>
							<td>
								<span ><%=screen%></span>
							</td>

						</tr>
						<tr style=" width:30%; height:50px">
							<td>
								<span style="color: blue ;margin: 0 0 0 10px">Hệ điều hành:</span>
							</td>
							<td>
								<span><%=operating_system%></span>
							</td>

						</tr>
						<tr style=" width:30%; height:50px">
							<td>
								<span style="color: blue ;margin: 0 0 0 10px">Camera sau:</span>
							</td>
							<td>
								<span><%=rear_camera%></span>
							</td>

						</tr>
						<tr style=" width:30%; height:50px">
							<td>
								<span style="color: blue ;margin: 0 0 0 10px">CPU:</span>
							</td>
							<td>
								<span><%=cpu%></span>
							</td>

						</tr>
						<tr style=" width:30%; height:50px">
							<td>
								<span style="color: blue ;margin: 0 0 0 10px">RAM:</span>
							</td>
							<td>
								<span><%=ram%></span>
							</td>

						</tr>
						<tr style=" width:30%; height:50px">
							<td>
								<span style="color: blue ;margin: 0 0 0 10px">Bộ nhớ trong:</span>
							</td>
							<td>
								<span><%=internal_memory%></span>
							</td>

						</tr>
						<tr style=" width:30%; height:50px">
							<td>
								<span style="color: blue ;margin: 0 0 0 10px">Thẻ Sim:</span>
							</td>
							<td>
								<span><%=sim%></span>
							</td>

						</tr>
						<tr style=" width:30%; height:50px">
							<td>
								<span style="color: blue ;margin: 0 0 0 10px">Dung lượng pin:</span>
							</td>
							<td>
								<span><%=pin%></span>
							</td>

						</tr>
							</table>
							</td>
			        <%} %>
			    </tbody>
			</table>
			<hr/>
			<div>
				<h3><%=title%></h3>
				<span><%=content %></span>
			</div>
		</div>
      </div>
	<%}%>
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
<%@ include file="/templates/public/inc/footer.jsp" %>