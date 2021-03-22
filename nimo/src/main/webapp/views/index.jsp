<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<c:set var="nimo" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
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

<style type="text/css">

.ftco-navbar-light {
  background: transparent !important;
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  z-index: 3;
  padding: 0 0; }
  @media (max-width: 991.98px) {
    .ftco-navbar-light {
      background: #f8af48 !important;
      position: relative;
      top: 0;
      padding: 10px 15px; } }
      
</style>
</head>
<body>
	
	<!-- header -->
	<%@ include file="/views/header.jsp" %>


	<!-- 배너 -->
	<div class="hero-wrap"
		style="background-image: url('${nimo}/resources/images/living_ex2.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-8 ftco-animate d-flex align-items-end">
					<div class="text w-100 text-center">
						<h1 class="mb-4">
							Good <span>Drink</span> for Good <span>Moments</span>.
						</h1>
						<p>
							<a href="#" class="btn btn-primary py-2 px-4">Shop Now</a> <a
								href="#" class="btn btn-white btn-outline-white py-2 px-4">Read
								more</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 배너 END -->
	
	<!-- 인기 쇼룸 -->
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center pb-5">
				<div class="col-md-7 heading-section text-center ftco-animate">
					<span class="subheading">니모의 쇼룸!</span>
					<h2>니모 인기 상품!</h2>
				</div>
			</div>
			<div class="row">
				<c:forEach items="${bestShowRoom}" var="best">
					<div class="col-md-4 d-flex">
						<div class="product ftco-animate">
							<a href="showRoom/showRoomDetail.ni?show_name=${best.show_name}"
								class="img d-flex align-items-center justify-content-center"
								style="background-image: url('${best.show_img}');"> </a>
							<div class="text text-center">
								<span class="new">BEST</span> <span class="category">${best.show_category}</span>
								<h2>${best.show_name}</h2>
								<p class="mb-0">
									<span>${best.show_detail}</span>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- 인기 쇼룸 END -->

	<!-- 인기 가구 -->
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center pb-5">
				<div class="col-md-7 heading-section text-center ftco-animate">
					<span class="subheading">니모의 가구!</span>
					<h2>가구 인기 상품!</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3 d-flex">
					<div class="product ftco-animate">
						<div class="img d-flex align-items-center justify-content-center"
							style="background-image: url(${nimo}/resources/images/prod-1.jpg);">
							<div class="desc">
								<p class="meta-prod d-flex">
									<a href="#"
										class="d-flex align-items-center justify-content-center"><span
										class="flaticon-shopping-bag"></span></a> <a href="#"
										class="d-flex align-items-center justify-content-center"><span
										class="flaticon-heart"></span></a> <a href="#"
										class="d-flex align-items-center justify-content-center"><span
										class="flaticon-visibility"></span></a>
								</p>
							</div>
						</div>
						<div class="text text-center">
							<span class="sale">Sale</span> <span class="category">Brandy</span>
							<h2>Bacardi 151</h2>
							<p class="mb-0">
								<span class="price price-sale">$69.00</span> <span class="price">$49.00</span>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex">
					<div class="product ftco-animate">
						<div class="img d-flex align-items-center justify-content-center"
							style="background-image: url(${nimo}/resources/images/prod-2.jpg);">
							<div class="desc">
								<p class="meta-prod d-flex">
									<a href="#"
										class="d-flex align-items-center justify-content-center"><span
										class="flaticon-shopping-bag"></span></a> <a href="#"
										class="d-flex align-items-center justify-content-center"><span
										class="flaticon-heart"></span></a> <a href="#"
										class="d-flex align-items-center justify-content-center"><span
										class="flaticon-visibility"></span></a>
								</p>
							</div>
						</div>
						<div class="text text-center">
							<span class="seller">Best Seller</span> <span class="category">Gin</span>
							<h2>Jim Beam Kentucky Straight</h2>
							<span class="price">$69.00</span>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex">
					<div class="product ftco-animate">
						<div class="img d-flex align-items-center justify-content-center"
							style="background-image: url(${nimo}/resources/images/prod-3.jpg);">
							<div class="desc">
								<p class="meta-prod d-flex">
									<a href="#"
										class="d-flex align-items-center justify-content-center"><span
										class="flaticon-shopping-bag"></span></a> <a href="#"
										class="d-flex align-items-center justify-content-center"><span
										class="flaticon-heart"></span></a> <a href="#"
										class="d-flex align-items-center justify-content-center"><span
										class="flaticon-visibility"></span></a>
								</p>
							</div>
						</div>
						<div class="text text-center">
							<span class="new">New Arrival</span> <span class="category">Rum</span>
							<h2>Citadelle</h2>
							<span class="price">$69.00</span>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex">
					<div class="product ftco-animate">
						<div class="img d-flex align-items-center justify-content-center"
							style="background-image: url(${nimo}/resources/images/prod-4.jpg);">
							<div class="desc">
								<p class="meta-prod d-flex">
									<a href="#"
										class="d-flex align-items-center justify-content-center"><span
										class="flaticon-shopping-bag"></span></a> <a href="#"
										class="d-flex align-items-center justify-content-center"><span
										class="flaticon-heart"></span></a> <a href="#"
										class="d-flex align-items-center justify-content-center"><span
										class="flaticon-visibility"></span></a>
								</p>
							</div>
						</div>
						<div class="text text-center">
							<span class="category">Rum</span>
							<h2>The Glenlivet</h2>
							<span class="price">$69.00</span>
						</div>
					</div>
				</div>

				<div class="col-md-3 d-flex">
					<div class="product ftco-animate">
						<div class="img d-flex align-items-center justify-content-center"
							style="background-image: url(${nimo}/resources/images/prod-5.jpg);">
							<div class="desc">
								<p class="meta-prod d-flex">
									<a href="#"
										class="d-flex align-items-center justify-content-center"><span
										class="flaticon-shopping-bag"></span></a> <a href="#"
										class="d-flex align-items-center justify-content-center"><span
										class="flaticon-heart"></span></a> <a href="#"
										class="d-flex align-items-center justify-content-center"><span
										class="flaticon-visibility"></span></a>
								</p>
							</div>
						</div>
						<div class="text text-center">
							<span class="category">Whiskey</span>
							<h2>Black Label</h2>
							<span class="price">$69.00</span>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex">
					<div class="product ftco-animate">
						<div class="img d-flex align-items-center justify-content-center"
							style="background-image: url(${nimo}/resources/images/prod-6.jpg);">
							<div class="desc">
								<p class="meta-prod d-flex">
									<a href="#"
										class="d-flex align-items-center justify-content-center"><span
										class="flaticon-shopping-bag"></span></a> <a href="#"
										class="d-flex align-items-center justify-content-center"><span
										class="flaticon-heart"></span></a> <a href="#"
										class="d-flex align-items-center justify-content-center"><span
										class="flaticon-visibility"></span></a>
								</p>
							</div>
						</div>
						<div class="text text-center">
							<span class="category">Tequila</span>
							<h2>Macallan</h2>
							<span class="price">$69.00</span>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex">
					<div class="product ftco-animate">
						<div class="img d-flex align-items-center justify-content-center"
							style="background-image: url(${nimo}/resources/images/prod-7.jpg);">
							<div class="desc">
								<p class="meta-prod d-flex">
									<a href="#"
										class="d-flex align-items-center justify-content-center"><span
										class="flaticon-shopping-bag"></span></a> <a href="#"
										class="d-flex align-items-center justify-content-center"><span
										class="flaticon-heart"></span></a> <a href="#"
										class="d-flex align-items-center justify-content-center"><span
										class="flaticon-visibility"></span></a>
								</p>
							</div>
						</div>
						<div class="text text-center">
							<span class="category">Vodka</span>
							<h2>Old Monk</h2>
							<span class="price">$69.00</span>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex">
					<div class="product ftco-animate">
						<div class="img d-flex align-items-center justify-content-center"
							style="background-image: url(${nimo}/resources/images/prod-8.jpg);">
							<div class="desc">
								<p class="meta-prod d-flex">
									<a href="#"
										class="d-flex align-items-center justify-content-center"><span
										class="flaticon-shopping-bag"></span></a> <a href="#"
										class="d-flex align-items-center justify-content-center"><span
										class="flaticon-heart"></span></a> <a href="#"
										class="d-flex align-items-center justify-content-center"><span
										class="flaticon-visibility"></span></a>
								</p>
							</div>
						</div>
						<div class="text text-center">
							<span class="category">Whiskey</span>
							<h2>Jameson Irish Whiskey</h2>
							<span class="price">$69.00</span>
						</div>
					</div>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-4">
					<a href="product.html" class="btn btn-primary d-block">View All
						Products <span class="fa fa-long-arrow-right"></span>
					</a>
				</div>
			</div>
		</div>
	</section>
	<!-- 인기 가구 END -->

	<!-- footer -->
	<%@ include file="/views/footer.jsp" %>
	
	
<%-- 	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div> --%>




</body>
</html>