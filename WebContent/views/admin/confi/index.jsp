<%@page import="models.Confi"%>
<%@page import="models.ColorPhone"%>
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
<%
if(request.getAttribute("phone") != null){
	Phone phone = (Phone)request.getAttribute("phone");
	String name = phone.getName();
	int idPhone = phone.getId();
%>
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title">
                <span class="page-title-icon bg-gradient-primary text-white mr-2">
                  <i class="mdi mdi-cellphone-dock"></i>
                </span>Thông Số Kỹ Thuật: <%=name%>
              </h3>
            </div>
        <br/>
        <hr />
        <div class="row">
            <div class="col-md-12">
                <!-- Form Elements -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
	                        <%if(request.getAttribute("confi") != null){
								Confi confi = (Confi)request.getAttribute("confi");
								int id = confi.getId();
								String screen = confi.getScreen();
								String operating_system = confi.getOperating_system();
								String rear_camera = confi.getRear_camera();
								String front_camera = confi.getFront_camera();
								String cpu = confi.getCpu();
								String ram = confi.getRam();
								String internal_memory = confi.getInternal_memory();
								String sim = confi.getSim();
								String pin = confi.getPin();
								int id_phone = confi.getId_phone();
							%>
                            <div class="col-md-12">
                                <form role="form" method="post" id="form_song" action="<%=request.getContextPath()%>/admin/confi/index?idPhone=<%=idPhone%>">
                                    <div class="form-group">
                                        <label for="screen">Màn hình</label>
                                        <input type="text" id="screen" value="<%=screen%>" name="screen" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="operating_system">Hệ điều hành</label>
                                        <input type="text" id="operating_system" value="<%=operating_system%>" name="operating_system" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="rear_camera">Camera sau</label>
                                        <input type="text" id="rear_camera" value="<%=rear_camera%>" name="rear_camera" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="front_camera">Camera trước</label>
                                        <input type="text" id="front_camera" value="<%=front_camera%>" name="front_camera" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="cpu">CPU</label>
                                        <input type="text" id="cpu" value="<%=cpu%>" name="cpu" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="ram">RAM</label>
                                        <input type="text" id="ram" value="<%=ram%>" name="ram" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="internal_memory">Bộ nhớ trong</label>
                                        <input type="text" id="internal_memory" value="<%=internal_memory%>" name="internal_memory" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="sim">Thẻ SIM</label>
                                        <input type="text" id="sim" value="<%=sim%>" name="sim" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="pin">Dung lượng pin</label>
                                        <input type="text" id="pin" value="<%=pin%>" name="pin" class="form-control" />
                                    </div>
                                     <div class="form-group">
                                        <label>Id điện thoại</label>
                                        <input type="text" readonly="readonly"   value="<%=idPhone %>" class="form-control" />
                                    </div>
                                    <button type="submit" name="submit" class="btn btn-success btn-md">Thay đổi</button>
                                </form>
                            </div>
                            <%} %>
                        </div>
                    </div>
                </div>
                <!-- End Form Elements -->
            </div>
        </div>

          </div>
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
<%} %>
<script>
    document.getElementById("index").classList.add('active-menu');
</script>
<%@ include file="/templates/admin/inc/footer.jsp" %>