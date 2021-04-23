<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Purple Admin</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/admin/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/admin/assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/admin/assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/admin/assets/images/favicon.ico" />
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/admin/assets/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/admin/assets/js/jquery.validate.js"></script>
  </head>
  <body>
    <div class="container-scroller">
      <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="content-wrapper d-flex align-items-center auth">
          <div class="row flex-grow">
            <div class="col-lg-4 mx-auto">
              <div class="auth-form-light text-left p-5">
                <div class="brand-logo">
                  <img src="<%=request.getContextPath()%>/resources/admin/assets/images/logo.svg">
                </div>
                <h4>Hello! let's get started</h4>
                <h6 class="font-weight-light">Sign in to continue.</h6>
                <form class="pt-3" role="form" method="post" action="<%=request.getContextPath()%>/auth/login" id="form_login">
                  <div class="form-group">
                    <input type="text" class="form-control form-control-lg"  placeholder="Username" value="" name="username">
                  </div>
                  <div class="form-group">
                    <input type="password" class="form-control form-control-lg"  placeholder="Password" value="" name="password">
                  </div>
                  <div class="mt-3">
                  	<button type="submit" name="submit" class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn">SIGN IN</button>
                  </div>
                            <%
                            	if(request.getParameter("msg")!=null){
                            		String msg = request.getParameter("msg");
                            		if(!"".equals(msg)){
                            %>
	                            <div style="color: red">
								  <h4>Đăng nhập thất bại</h4>
								</div>
                            	
                            <% 
                            		}}
                             %>
                  <div class="my-2 d-flex justify-content-between align-items-center">
                    <div class="form-check">
                      <label class="form-check-label text-muted">
                        <input type="checkbox" class="form-check-input"> Keep me signed in </label>
                    </div>
                    <a href="#" class="auth-link text-black">Forgot password?</a>
                  </div>
                  <div class="mb-2">
                  	<a href="<%=request.getContextPath() %>/trang-chu.html"><button type="button" class="btn btn-block btn-facebook auth-form-btn">Trang Chủ</button></a>
                    
                  </div>
                  <div class="text-center mt-4 font-weight-light"> Don't have an account? <a href="<%=request.getContextPath() %>/auth/register" class="text-primary">Create</a>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="<%=request.getContextPath()%>/resources/admin/assets/js/off-canvas.js"></script>
    <script src="<%=request.getContextPath()%>/resources/admin/assets/js/hoverable-collapse.js"></script>
    <script src="<%=request.getContextPath()%>/resources/admin/assets/js/misc.js"></script>
	<script type="text/javascript">
	
		$(document).ready(function () {
			
			$('#form_login').validate({
				rules: {
					"username": {
						required: true,
						minlength:2,
						maxlength:32,
					},
					"password": {
						required: true,
						minlength:2,
						
					},
	
				},
				
				messages: {
				  "username": {
					required: "Vui lòng nhập Tên đăng nhập",
					minlength: " Nhập tối thiểu 6 ký tự",
					maxlength: "Nhập tối đa 32 kí tự",
				  },
				  "password": {
					required: "Vui lòng nhập Mật khẩu",
					minlength: " Nhập tối thiểu 6 ký tự",
				  },
				},
			});
		});
		</script>
    <!-- endinject -->
  </body>
</html>