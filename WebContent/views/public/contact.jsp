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
        	<h4 style="color: blue;">Gửi liên hệ đến chúng tôi</h3>
        <hr/>
			<div style="margin-top: 20px"></div>
		      <div class="clr"></div>
		      <p>Khi bạn có thắc mắc, vui lòng gửi liên hệ, chúng tôi sẽ phản hồi trong thời gian sớm nhất.</p>
		    <div >

		      <form action="<%=request.getContextPath()%>/lien-he.html" method="post" id="sendemail">
		        <ol>
		          <li>
		            <label for="name">Họ tên (required)</label>
		            <input id="name" value="" name="name" class="text" />
		          </li>
		          <li>
		            <label for="email">Email (required)</label>
		            <input id="email" value="" name="email" class="text" />
		          </li>
		          <li>
		            <label for="website">Website</label>
		            <input id="website" value="" name="website" class="text" />
		          </li>
		          <li>
		            <label for="message">Nội dung</label>
		            <textarea id="message" name="message" rows="4" cols="50"></textarea>
		          </li>
		          <li>
		            <button type="submit" name="submit" class="btn btn-success btn-md">Liên Hệ</button>
		            <div class="clr"></div>
		          </li>
		        </ol>
		      </form>
		                            <%
		                            	if(request.getParameter("msg")!=null){
		                            		String msg = request.getParameter("msg");
		                            		if(GlobalConstants.SUCCESS.equals(msg)){
		                            %>
			                            <div class="alert alert-success" role="alert">
										  <h4 style="color: blue;">Giử phản hồi thành công!</h4>
										</div>
		                            	
		                            <% 
		                            		}else{
		                             %>
		                                <div class="alert alert-danger" role="alert">
										  <h4 style="color: red;">Giử phản hồi thất bại!</h4>
										</div>
		                                <% 
		                            	}}
		                            
		                            %>
		    </div>
		</div>
		</div>
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
<%@ include file="/templates/public/inc/footer.jsp" %>