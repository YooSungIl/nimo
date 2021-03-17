<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@page import="org.springframework.ui.Model"%>
<%@page import="org.springframework.ui.ModelMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ page import="kr.co.nimo.ShowRoomVO" %>
<%@ page import="java.util.List" %>

<c:set var="nimo" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<title>쇼룸 거실 상세</title>
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

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.min.css">


<link rel="stylesheet" href="${nimo}/resources/css/flaticon.css">
<link rel="stylesheet" href="${nimo}/resources/css/style.css">
</head>
<body>
	<div class="wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-6 d-flex align-items-center">
					<p class="mb-0 phone pl-md-2">
						<a href="#" class="mr-2"><span class="fa fa-phone mr-1"></span>
							+00 1234 567</a> <a href="#"><span class="fa fa-paper-plane mr-1"></span>
							youremail@email.com</a>
					</p>
				</div>
				<div class="col-md-6 d-flex justify-content-md-end">
					<div class="social-media mr-4">
						<p class="mb-0 d-flex">
							<a href="#"
								class="d-flex align-items-center justify-content-center"><span
								class="fa fa-facebook"><i class="sr-only">Facebook</i></span></a> <a
								href="#"
								class="d-flex align-items-center justify-content-center"><span
								class="fa fa-twitter"><i class="sr-only">Twitter</i></span></a> <a
								href="#"
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
	</div>

	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.html">Liquor <span>store</span></a>
			<div class="order-lg-last btn-group">
				<a href="#" class="btn-cart dropdown-toggle dropdown-toggle-split"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<span class="flaticon-shopping-bag"></span>
					<div class="d-flex justify-content-center align-items-center">
						<small>3</small>
					</div>
				</a>
				<div class="dropdown-menu dropdown-menu-right">
					<div class="dropdown-item d-flex align-items-start" href="#">
						<div class="img"
							style="background-image: url(${nimo}/resources/images/prod-1.jpg);"></div>
						<div class="text pl-3">
							<h4>Bacardi 151</h4>
							<p class="mb-0">
								<a href="#" class="price">$25.99</a><span class="quantity ml-3">Quantity:
									01</span>
							</p>
						</div>
					</div>
					<div class="dropdown-item d-flex align-items-start" href="#">
						<div class="img"
							style="background-image: url(${nimo}/resources/images/prod-2.jpg);"></div>
						<div class="text pl-3">
							<h4>Jim Beam Kentucky Straight</h4>
							<p class="mb-0">
								<a href="#" class="price">$30.89</a><span class="quantity ml-3">Quantity:
									02</span>
							</p>
						</div>
					</div>
					<div class="dropdown-item d-flex align-items-start" href="#">
						<div class="img"
							style="background-image: url(${nimo}/resources/images/prod-3.jpg);"></div>
						<div class="text pl-3">
							<h4>Citadelle</h4>
							<p class="mb-0">
								<a href="#" class="price">$22.50</a><span class="quantity ml-3">Quantity:
									01</span>
							</p>
						</div>
					</div>
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
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="index.html" class="nav-link">Home</a></li>
					<li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="dropdown04"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Products</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<a class="dropdown-item" href="/userShowRoom">인덱스</a>
							<a class="dropdown-item" href="/userShowRoom/livingShowRoomList.ni"> 거실 상품 리스트</a>
							<a class="dropdown-item" href="#">거실 상세</a>
							<a class="dropdown-item" href="checkout.html">Checkout</a>
						</div></li>
					<li class="nav-item active"><a href="blog.html"
						class="nav-link">Blog</a></li>
					<li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('${nimo}/resources/images/bg_2.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate mb-5 text-center">
					<p class="breadcrumbs mb-0">
						<span class="mr-2"><a href="index.html">Home <i
								class="fa fa-chevron-right"></i></a></span> <span>Blog <i
							class="fa fa-chevron-right"></i></span>
					</p>
					<h2 class="mb-0 bread">Blog</h2>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row d-flex">
				<c:forEach items="${showRoomList}" var="showRoomList">
					<div class="col-lg-12 d-flex align-items-stretch ftco-animate">
						<div class="blog-entry d-md-flex">
							<a href="showRoomDetail.ni?show_name=${showRoomList.show_name}" class="block-20 img"
								style="background-image: url('${showRoomList.show_img}');"> </a>
							<div class="text p-4 bg-light">

								<h3 class="heading mb-3">
									<a href="showRoomDetail.ni?show_name=${showRoomList.show_name}">${showRoomList.show_name}</a>
								</h3>
								<input type="hidden" name="furns" value="${showRoomList.show_furs_code}">
								<p>${showRoomList.show_detail}</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<%@ include file="footer.jsp"%>
	

</body>
</html>