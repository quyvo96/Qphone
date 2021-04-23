<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
          <footer class="footer">
            <div class="container-fluid clearfix">
              <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © bootstrapdash.com 2020</span>
              <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"> Free <a  href="<%=request.getContextPath()%>/resources/public/https://www.bootstrapdash.com/bootstrap-admin-template/" target="_blank">Bootstrap admin templates </a> from Bootstrapdash.com</span>
            </div>
          </footer>
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
	<script>
	var slideIndex = 1;
	showSlides(slideIndex);
	
	function plusSlides(n) {
	  showSlides(slideIndex += n);
	}
	
	function currentSlide(n) {
	  showSlides(slideIndex = n);
	}
	
	function showSlides(n) {
	  var i;
	  var slides = document.getElementsByClassName("mySlides");
	  var dots = document.getElementsByClassName("dot1");
	  if (n > slides.length) {slideIndex = 1}    
	  if (n < 1) {slideIndex = slides.length}
	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = "none";  
	  }
	  for (i = 0; i < dots.length; i++) {
	      dots[i].className = dots[i].className.replace(" active1", "");
	  }
	  slides[slideIndex-1].style.display = "block";  
	  dots[slideIndex-1].className += " active1";
	}
	</script>
	<script >
							function selectOnlyThis(id,sum) {
							    for (var i = 1;i <= sum; i++)
							    {
							        document.getElementById("check"+i).checked = false;
							    }
							    document.getElementById(id).checked = true;
							}
							function cart(id_phone){
								//alert(id_phone);
								//Handling Ajax
								var color = $('.color1:checked').val();
								var numphone = $("#numphone1").val();
	
								$.ajax({
									url: '<%=request.getContextPath()%>/detail',
									type: 'POST',
									cache: false,
									data: {
										"id_phone" : id_phone,
										"numphone" : numphone,
										"color" : color,
									},
									success: function(data){
										$("#cart").html(data);	
									},
									error: function (){
										alert('Có lỗi xảy ra');
									}
								});
								return false;
								
								
							}
							function byHand(){
								var r = confirm("Cảm ơn bạn  đã mua sản phẩm chủa Shop!\nChúng tôi sẽ giao hàng sớm cho bạn.\nVui lòng nhấn 'OK' để xác nhận đơn hàng.");
								  
								if (r == true) {
									window.location.href="http://localhost:8080/qphone/order/pay/hand";
								  } else {
								    window.location.href="http://localhost:8080/qphone/order/cart";
								  }
							}
	</script >

    <script>
    	function showView(id_show){
	    	document.getElementById("show"+id_show).style.display = 'block';
	        
	    };
    	function hideView(id_hide){
	    	document.getElementById("show"+id_hide).style.display = 'none';
	        
	    };
    </script>
	<script>
	  paypal.Button.render({
	    // Configure environment
	    
	    env: 'sandbox',
	    client: {
	      sandbox: 'AXIqf17XkbuVy-RVonlEZsdU18-MbU5rxKN-jzf-zemxvUqHfsZGLQlpcd6pJhs0OOUPYEcnzTedDve4',
	      production: 'demo_production_client_id'
	    },
	    // Customize button (optional)
	    locale: 'en_US',
	    style: {
	      size: 'small',
	      color: 'gold',
	      shape: 'pill',
	    },
	
	    // Enable Pay Now checkout flow (optional)
	    commit: true,
	
	    // Set up a payment
		payment: function(data, actions) {
			var pricePay = $("#pricePay").text();
			return actions.payment.create({
			    transactions: [{
			      amount: {
			        total: pricePay,
			        currency: 'USD'
			      }
		    }]
		  });
		},
	    // Execute the payment
	    onAuthorize: function(data, actions) {
	      return actions.payment.execute().then(function() {
	        // Show a confirmation message to the buyer
			var r = confirm("Cảm ơn bạn  đã mua sản phẩm chủa Shop!\nChúng tôi sẽ giao hàng sớm cho bạn.\nVui lòng nhấn 'OK' để xác nhận đơn hàng.");
			if (r == true) {
				window.location.href="http://localhost:8080/qphone/order/pay/paypal";
			} else {
				window.location.href="http://localhost:8080/qphone/order/cart";
			}
	      });
	    }
	  }, '#paypal-button');
	  </script>
	  <script type="text/javascript">

		$(document).ready(function () {
			$('#sendemail').validate({
				rules: {
					"name": {
						required: true,
						minlength:2,
						maxlength:32,
					},
					"email": {
						email: true,
						required: true,
						minlength:2,
						
					},
					"website": {
						url: true,
						
					},
				},
				messages: {
				  "name": {
					required: "Vui lòng nhập Tên ",
					minlength: " Nhập tối thiểu 6 ký tự",
					maxlength: "Nhập tối đa 32 kí tự",
				  },
				  "email": {
					required: "Vui lòng nhập emali",
					minlength: " Nhập tối thiểu 6 ký tự",
					email:"Vui lòng nhập đúng định dạng",
				  },
				  "website": {
						url:"Vui lòng nhập đúng định dạng",
					  },
				},
			});
		});
	
	</script>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="<%=request.getContextPath()%>/resources/admin/assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="<%=request.getContextPath()%>/resources/public/assets/vendors/chart.js/Chart.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="<%=request.getContextPath()%>/resources/public/assets/js/off-canvas.js"></script>
    <script src="<%=request.getContextPath()%>/resources/public/assets/js/hoverable-collapse.js"></script>
    <script src="<%=request.getContextPath()%>/resources/public/assets/js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="<%=request.getContextPath()%>/resources/public/assets/js/dashboard.js"></script>
    <script src="<%=request.getContextPath()%>/resources/public/assets/js/todolist.js"></script>
    <!-- End custom js for this page -->

  </body>
</html>