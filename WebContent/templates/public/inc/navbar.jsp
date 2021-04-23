<%@page import="models.Category"%>
<%@page import="java.util.List"%>
<%@page import="models.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
      <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row" style="margin-top: 70px; background-color: #FED101;z-index: 1; height: 50px">
        <div class="navbar-menu-wrapper d-flex align-items-stretch">
	        <div class="btn-group" role="group" aria-label="Basic example">
		        <a href="<%=request.getContextPath()%>/trang-chu.html">
			        <button style="height: 50px;color: black" type="button" class="btn btn-gradient-warning btn-md">Trang Chủ</button>
			    </a>
                                <%
                                	@SuppressWarnings("unchecked")
                                	List<Category> listCat = (List<Category>)request.getAttribute("listCat");
                                	if(listCat != null && listCat.size() > 0){
                                		for(Category category: listCat){
                                			int id = category.getId();
                                			String name = category.getName();
                                			String urlCat = request.getContextPath() + "/cat?idCat="+id;

                                %>
                <a href="<%=urlCat%>">
		        	<button style="height: 50px;color: black" type="button" class="btn btn-gradient-warning"><%=name%></button>
		        </a>
		        <%}} %>
	        </div>
        </div>
      </nav>