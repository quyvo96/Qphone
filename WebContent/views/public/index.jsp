<%@page import="models.ColorPhone"%>
<%@page import="daos.ColorPhoneDAO"%>
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
        <div >
        
          <div class="content-wrapper" style="margin:20px 5% 0 5%; width: 90%;">
          <div style="padding:0 0 0 0;background:no-repeat center bottom;">
          <div id="slideabc">
			<div class="slideshow-container" style="background-color: blue;">
			
				<div class="mySlides fade1">
				  <img src="<%=request.getContextPath() %>/uploads/slide1.jpg" style="width:100%">
				</div>
				
				<div class="mySlides fade1">
				  <img src="<%=request.getContextPath() %>/uploads/slide2.jpg" style="width:100%">
				</div>
				
				<div class="mySlides fade1">
				  <img src="<%=request.getContextPath() %>/uploads/slide3.jpg" style="width:100%">
				</div>
				
				<a class="prev1" onclick="plusSlides(-1)">&#10094;</a>
				<a class="next1" onclick="plusSlides(1)">&#10095;</a>
			
			</div>
			<br>
			
			<div style="text-align:center">
			  <span class="dot1" onclick="currentSlide(1)"></span> 
			  <span class="dot1" onclick="currentSlide(2)"></span> 
			  <span class="dot1" onclick="currentSlide(3)"></span> 
			</div>
			</div>
			</div>
			<div style="margin-top: 20px"></div>
			<%
			
			int idpage = (Integer)request.getAttribute("idpage");
            List<Phone> listphone = (List<Phone>)request.getAttribute("listphone");
            if(request.getAttribute("listphone") != null){
                if(listphone.size() > 0){
			%>
			<table style="width:100%;">
			    <tbody>
			    <tr>
			    <%for(int a = 0; a < GlobalConstants.NUMBER_PER_PAGE ; a++){%>
			    	<td></td>
			    	<%} %>
			    </tr>
			    <%for(int i = 0; i < 2 + idpage; i++){%>
			    
			        <tr>
                        <%
								try{
									
								
                                	for(int j = GlobalConstants.NUMBER_PER_PAGE*i; j < 4 + i*4; j++){
                                		int id = listphone.get(j).getId();
                                		String phoneName = listphone.get(j).getName();
                                		double price = listphone.get(j).getPrice();
                                		String picture = "UnPicture.jpg";
                                		try{
                                    		ColorPhoneDAO colorDAO = new ColorPhoneDAO();
            								ColorPhone color = colorDAO.getPiturePhone(id);
            								picture = color.getPicture();
                                		}catch(Exception e){
                                		}
    
                        %>
			            <td style="border: 1px solid #393232; width:275px; height:300px">
			            	<a href="<%=request.getContextPath()%>/detail?id=<%=id%>" style="margin:10%">
			            	
							<img class="mb-2 rounded" width="80%" height="70%" src="<%=request.getContextPath()%>/uploads/<%=picture%>"/>

							<p style="font-weight: bold; font-size: 13px;color: black ;margin: 0 0 0 10px"><%=phoneName%></p>
							<p style="font-weight: bold; font-size: 18px;color: red; margin: 0 0 0 10px"><%=price%> $</p>
							</a>
						</td>
					<%}}catch(Exception e){
					}%>
			        </tr>
				<%}%>
			    </tbody>
			</table>
			<%}}%>
			<div class="card-body" style="padding-left: 43%">
				<a href="<%=request.getContextPath()%>/home?idpage=<%=idpage+1%>">
					<button type="button" class="btn btn-outline-primary btn-fw">Xem thêm...</button>
				</a>
			</div>
          </div>
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
<%@ include file="/templates/public/inc/footer.jsp" %>