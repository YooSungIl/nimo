<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="nimo" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>	
<meta charset="UTF-8">
  <head>
<script type="text/javascript">
	function userLoginCheck() {
		var loginForm = $('#loginForm');
		
		if($.trim($('#inputID').val()) == ''){
			   alert("아이디를 입력하세요");
			   $('#inputID').focus();
			   
			   return;
		}
		if($.trim($('#InputPassword1').val()) == ''){
			   alert("비밀번호를 입력하세요");
			   $('#InputPassword1').focus();
			   
			   return;
		}
		
		userLoginForm.submit();
	}
</script>
    <title>Liquor Store - Free Bootstrap 4 Template by Colorlib</title>
    
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css2?family=Spectral:ital,wght@0,200;0,300;0,400;0,500;0,700;0,800;1,200;1,300;1,400;1,500;1,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="${nimo}/resources/css/animate.css">

<link rel="stylesheet" href="${nimo}/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${nimo}/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${nimo}/resources/css/magnific-popup.css">

<link rel="stylesheet" href="${nimo}/resources/css/flaticon.css">
<link rel="stylesheet" href="${nimo}/resources/css/style.css">
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="/nimo/">Liquor<span>store</span></a>
			<div class="order-lg-last btn-group">
				<ul class="navbar-nav ml-n1">
					<li class="nav-item active"><a href="login" class="nav-link">로그인</a></li>
					<li>|</li>
					<li class="nav-item"><a href="join" class="nav-link">회원가입</a></li>
					<li class="nav-item"><a href="#"
						class="btn-cart dropdown-toggle dropdown-toggle-split"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<span class="flaticon-shopping-bag"></span>
							<div class="d-flex justify-content-center align-items-center">
								<small>3</small>
							</div>
					</a></li>
				</ul>
				<div class="dropdown-menu dropdown-menu-right">
					<a class="dropdown-item text-center btn-link d-block w-100"
						href="cart.html"> View All <span
						class="ion-ios-arrow-round-forward"></span>
					</a>
				</div>
			</div>

			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-n1">
					<li class="nav-item active dropdown"><a href="index.html"
						class="nav-link">쇼 룸</a>
						<div class="wrap dropdown-menu">
							<div class="container">
								<div class="row">
									<div class="col-md-6 d-flex align-items-center">
										<p class="mb-0 phone pl-md-2">
											<a href="#" class="mr-2"><span class="fa fa-phone mr-1"></span>
												+00 1234 567</a> <a href="#"><span
												class="fa fa-paper-plane mr-1"></span> youremail@email.com</a>
										</p>
									</div>
									<div class="col-md-6 d-flex justify-content-md-end">
										<div class="social-media mr-4">
											<p class="mb-0 d-flex">
												<a href="#"
													class="d-flex align-items-center justify-content-center"><span
													class="fa fa-facebook"><i class="sr-only">Facebook</i></span></a>
												<a href="#"
													class="d-flex align-items-center justify-content-center"><span
													class="fa fa-twitter"><i class="sr-only">Twitter</i></span></a>
												<a href="#"
													class="d-flex align-items-center justify-content-center"><span
													class="fa fa-instagram"><i class="sr-only">Instagram</i></span></a>
												<a href="#"
													class="d-flex align-items-center justify-content-center"><span
													class="fa fa-dribbble"><i class="sr-only">Dribbble</i></span></a>
											</p>
										</div>
										<div class="reg">
											<p class="mb-0">
												<a href="#" class="mr-2">Sign Up</a> <a href="#">Log In</a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div></li>
					<li class="nav-item"><a href="about.html" class="nav-link">모든
							상품</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="dropdown04"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Products</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<a class="dropdown-item" href="product.html">Products</a> <a
								class="dropdown-item" href="product-single.html">Single
								Product</a> <a class="dropdown-item" href="cart.html">Cart</a> <a
								class="dropdown-item" href="checkout.html">Checkout</a>
						</div></li>
				</ul>
			</div>
		</div>
	</nav>
<!-- END nav -->

<form name="readForm" role="form" method="get">
	<label>&nbsp;id
	<input type="text" id="id" name="id" value="${ user.id }" /></label>
</form>

<div class="container">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6 p-3">
				<form name="userLoginForm" id="loginForm" action="./loginSuccessUserMypage" method="post">
					<fieldset>
					  <legend class="text-center">유저 로그인</legend>
					  <div class="form-group">
					    <label for="inputID">아이디</label>
					    <input type="text" class="form-control" placeholder="아이디" id="inputID" name="id" autofocus>
					  </div>
				      <div class="form-group">
				        <label for="InputPassword1">비밀번호</label>
				        <input type="password" class="form-control" placeholder="비밀번호" id="InputPassword1" name="pwd">
				      </div>
					  <div class="text-center">
  					    <button type="button" class="btn btn-primary" onclick="javascript:userLoginCheck();">로그인</button>
					  </div>
					</fieldset>
				</form>
			</div>
		<div class="col-md-3"></div>
	</div>
</div>


<!-- footer ----------------------------------------------------------->
   <footer class="ftco-footer">
		<div class="container">
			<div class="row mb-5">
				<div class="col-sm-12 col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2 logo">
							<a href="#">Liquor <span>Store</span></a>
						</h2>
						<p>Far far away, behind the word mountains, far from the
							countries.</p>
						<ul class="ftco-footer-social list-unstyled mt-2">
							<li class="ftco-animate"><a href="#"><span
									class="fa fa-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="fa fa-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="fa fa-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-12 col-md">
					<div class="ftco-footer-widget mb-4 ml-md-4">
						<h2 class="ftco-heading-2">My Accounts</h2>
						<ul class="list-unstyled">
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>My
									Account</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Register</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Log
									In</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>My
									Order</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-12 col-md">
					<div class="ftco-footer-widget mb-4 ml-md-4">
						<h2 class="ftco-heading-2">Information</h2>
						<ul class="list-unstyled">
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>About
									us</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Catalog</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Contact
									us</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Term
									&amp; Conditions</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-12 col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Quick Link</h2>
						<ul class="list-unstyled">
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>New
									User</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Help
									Center</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Report
									Spam</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Faq's</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-12 col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Have a Questions?</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon fa fa-map marker"></span><span
									class="text">203 Fake St. Mountain View, San Francisco,
										California, USA</span></li>
								<li><a href="#"><span class="icon fa fa-phone"></span><span
										class="text">+2 392 3929 210</span></a></li>
								<li><a href="#"><span
										class="icon fa fa-paper-plane pr-4"></span><span class="text">info@yourdomain.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container-fluid px-0 py-5 bg-black">
			<div class="container">
				<div class="row">
					<div class="col-md-12">

						<p class="mb-0" style="color: rgba(255, 255, 255, .5);">
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made with <i
								class="fa fa-heart color-danger" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib.com</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script src="${nimo}/resources/js/jquery.min.js"></script>
	<script src="${nimo}/resources/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="${nimo}/resources/js/popper.min.js"></script>
	<script src="${nimo}/resources/js/bootstrap.min.js"></script>
	<script src="${nimo}/resources/js/jquery.easing.1.3.js"></script>
	<script src="${nimo}/resources/js/jquery.waypoints.min.js"></script>
	<script src="${nimo}/resources/js/jquery.stellar.min.js"></script>
	<script src="${nimo}/resources/js/owl.carousel.min.js"></script>
	<script src="${nimo}/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="${nimo}/resources/js/jquery.animateNumber.min.js"></script>
	<script src="${nimo}/resources/js/scrollax.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="${nimo}/resources/js/google-map.js"></script>
	<script src="${nimo}/resources/js/main.js"></script>
	
	<script src="${nimo}/resources/js/userLogin.js"></script>

</body>
</html>