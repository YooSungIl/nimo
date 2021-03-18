<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="kr.co.nimo.ShowRoomVO"%>
<c:set var="nimo" value="${pageContext.request.contextPath}" />
<c:set var="showDetail" value="${showRoomDetail_ShowRoom}" />
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
						<small>4</small>
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
					<li class="nav-item dropdown active"><a
						class="nav-link dropdown-toggle" href="#" id="dropdown04"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Products</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<a class="dropdown-item" href="showRoom.jsp">Products</a> <a
								class="dropdown-item" href="livingShowRoom.jsp">Single
								Product</a> <a class="dropdown-item" href="cart.html">Cart</a> <a
								class="dropdown-item" href="checkout.html">Checkout</a>
						</div></li>
					<li class="nav-item	"><a href="blog.html" class="nav-link">Blog</a></li>
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
								class="fa fa-chevron-right"></i></a></span> <span><a
							href="product.html">Products <i class="fa fa-chevron-right"></i></a></span>
						<span>Products Single <i class="fa fa-chevron-right"></i></span>
					</p>
					<h2 class="mb-0 bread">Products Single</h2>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12 tab-wrap">
					<a href="${showDetail.show_img}" class="image-popup prod-img-bg"><img
						src="${showDetail.show_img}" class="img-fluid"
						alt="Colorlib Template" name="show_img"></a>
				</div>
				<div class="col-md-12 tab-wrap" id="livingProduct">
					<h5 style="margin-top: .5rem;">쇼룸 이름</h5>
					<input type="text" class="quantity form-control input-number"
						name="show_name" value="${showDetail.show_name}" style="margin-bottom: .5rem;">
					<h5>카테고리</h5>
					<input type="text" class="quantity form-control input-number"
						name="show_category" value="${showDetail.show_category}" style="margin-bottom: .5rem;">
					<h5>쇼룸 설명</h5>
					<textarea name="show_detail" style="margin-bottom: .5rem;">${showDetail.show_detail}</textarea>
					<input type="button" value="수정" class="btn btn-primary py-3 px-5" id="showup">
				</div>

				<div class="row mt-5">
					<c:forEach items="${showRoomDetail_Furs}" var="showRoomDetail_Furs">
						<div class="row detailrow">
							<div class="col-md-6">
								<img name="furn_img" src="${showRoomDetail_Furs.fur_image}" class="img-fluid"
									alt="Colorlib Template">
							</div>
							<div class="col-md-6">
								<div class="tab-content bg-light" id="v-pills-tabContent">
									<div class="tab-pane fade show active" id="v-pills-1">
										<div class="p-4">
											<h5>가구 이름</h5>
											<input type="text" class="quantity form-control input-number"
												name="furn_name" value="${showRoomDetail_Furs.fur_name}" style="margin-bottom: .5rem;">
											<h5>가구 가격</h5>
											<input type="text" class="quantity form-control input-number"
												name="furn_price" value="${showRoomDetail_Furs.fur_price}" style="margin-bottom: .5rem;">
											<h5>가구 설명</h5>
											<textarea name="furn_detail">${showRoomDetail_Furs.fur_detail}</textarea>
											<h5>가구 수량</h5>
											<input type="text" class="quantity form-control input-number"
												name="furn_quantity" value="${showRoomDetail_Furs.fur_quantity}" style="margin-bottom: .5rem;">
											<input type="button" value="수정" class="btn btn-primary py-3 px-5" id="furnup">
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>
	<div class="row justify-content-end">
		<div class="col col-lg-5 col-md-6 mt-5 ftco-animate">
			<div style="margin-bottom: .9rem;">
				<a href="adShowRoomIndex.ni" class="btn btn-primary py-3 px-5">완료</a>
				<a href="adShowRoomDelete.ni?show_name=${showDetail.show_name}"
					class="btn btn-primary py-3 px-5">삭제</a>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
	<script>
	$(document).ready(function() {
		$('input').click(function(e) {
			if ($(this).attr('id') == 'showup') {
				$.ajax({
					url : "adShowUpdate.ni",
					data : {
						"show_name" : $('input[name=show_name]').val(),
						"show_category" : $('input[name=show_category]').val(),
						"show_detail" : $('textarea[name=show_detail]').val(),
						"show_img" : $('img[name=show_img]').attr("src")	
					},
					dataType : "json",
					type : "post",
					success : function(data) { 
						console.log("okok");
					}	
				});
			} else if($(this).attr('id') == 'furnup') {
				$.ajax({
					url : "adFurnUpdate.ni",
					data : {
						"show_name" : $('input[name=show_name]').val(),
						"furn_name" : $('input[name=furn_name]').val(),
						"furn_price" : $('input[name=furn_price]').val(),
						"furn_detail" : $('textarea[name=furn_detail]').val(),
						"furn_quantity" : $('input[name=furn_quantity]').val(),
						"furn_img" : $('img[name=furn_img]').attr("src")	
					},
					dataType : "json",
					type : "post",
					success : function(data) {
						console.log("okok");
					}
				});
			} else {	
				console.log("nonono~!");
			}
		});
	});
	</script>
</body>
</html>