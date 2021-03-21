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
						alt="Colorlib Template"></a>
				</div>
				<div class="col-md-12 tab-wrap" id="livingProduct">
					<h3>${showDetail.show_name}</h3>
					<h4>${showDetail.show_category}</h4>
					<p>${showDetail.show_detail}</p>
				</div>

				<div class="row mt-5">
					<c:forEach items="${showRoomDetail_Furs}" var="showRoomDetail_Furs">
						<div class="row detailrow">
							<div class="col-md-6">
								<img src="/nimo/resources/images/showImages/b/${showRoomDetail_Furs.fur_image}" class="img-fluid"
									alt="Colorlib Template">
									
							</div>
							<div class="col-md-6">
								<div class="tab-content bg-light" id="v-pills-tabContent">
									<div class="tab-pane fade show active" id="v-pills-1">
										<div class="p-4">
											<h5 class="mb-4">${showRoomDetail_Furs.fur_name}</h5>
											<h5 class="price">${showRoomDetail_Furs.fur_price}</h5>
											<p>${showRoomDetail_Furs.fur_subdetail1_1}</p>
											<h5 class="mb-4"></h5>

											<div class="row">
												<div class="col-lg-6 product-details pl-md-12 ftco-animate">
													<div class="row mt-4">
														<div class="input-group col-md- d-flex mb-3">
															<span class="input-group-btn mr-2">
																<button type="button" class="quantity-left-minus btn"
																	data-type="minus" data-field="">
																	<i class="fa fa-minus"></i>
																</button>
															</span> <input type="text" id="quantity" name="quantity"
																class="quantity form-control input-number" value="1"
																min="1" max="100"> <span
																class="input-group-btn ml-2">
																<button type="button" class="quantity-right-plus btn"
																	data-type="plus" data-field="">
																	<i class="fa fa-plus"></i>
																</button>
															</span>
														</div>
													</div>
													<div class="col-md-12">
														<div class="form-group mt-4"></div>
													</div>
													<p>
														<a href="#" class="btn btn-primary py-3 px-5 mr-2">추가</a>
													</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="table-wrap">
					<table class="table">
						<thead class="thead-primary">
							<tr>
								<th>&nbsp;</th>
								<th>&nbsp;</th>
								<th>Product</th>
								<th>Price</th>
								<th>Quantity</th>
								<th>total</th>
								<th>&nbsp;</th>
							</tr>
						</thead>
						<c:forEach items="${showRoomDetail_Furs}" var="showRoomDetail_Furs">
							<tbody>
								<tr class="alert" role="alert">
									<td><label class="checkbox-wrap checkbox-primary">
											<input type="checkbox" checked> <span
											class="checkmark"></span>
									</label></td>
									<td>
										<div class="img" style="background-image: url(images/prod-1.jpg);"></div>
									</td>
									<td>
										<div class="email">
											<span>${showRoomDetail_Furs.fur_name}</span>
											<span>${showRoomDetail_Furs.fur_subdetail1_1}</span>
										</div>
									</td>
									<td class="pr">${showRoomDetail_Furs.fur_price}</td>
									<td class="quantity">
										<div class="input-group">
											<input type="text" id="quantity2" name="quantity"
												class="quantity form-control input-number" value="1" min="1"
												max="100">
										</div>
									</td>
									<td class="chong"></td>
									<td>
										<button type="button" class="close" data-dismiss="alert"
											aria-label="Close">
											<span aria-hidden="true"><i class="fa fa-close"></i></span>
										</button>
									</td>
								</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row justify-content-end">
				<div class="col col-lg-5 col-md-6 mt-5 cart-wrap ftco-animate">
					<div class="cart-total mb-3">
						<h3 class="tototal">Cart Totals</h3>
						<hr>
						<p class="d-flex total-price">
							<span>Total</span> <span>$17.60</span>
						</p>
					</div>
					<p class="text-center">
						<a href="checkout.html" class="btn btn-primary py-3 px-4">Proceed
							to Checkout</a>
					</p>
				</div>
			</div>
		</div>
	</section>

	<%@ include file="footer.jsp"%>

	<script>
	$(document).ready(function() {

		var quantitiy = 1;
		
		$('.quantity-right-plus').click(function(e) {

			// Stop acting like a button
			e.preventDefault();
			// Get the field name
			var quantity = parseInt($('#quantity').val());

			// If is not undefined
			if (quantity < 100) {
				$('#quantity').val(quantity + 1);
				$('#quantity2').val(quantity + 1);
			}
			document.getElementById('chong').innerText=quantity + 1
			// Increment

		});

		$('.quantity-left-minus').click(function(e) {
			// Stop acting like a button
			e.preventDefault();
			// Get the field name
			var quantity = parseInt($('#quantity').val());

			// If is not undefined

			// Increment
			if (quantity > 1) {
				$('#quantity').val(quantity - 1);
				$('#quantity2').val(quantity - 1);
			}
			document.getElementById('chong').innerText=quantity + 1
		});
		
		$('.quantity').keydown(function(e) {
			
			var quantity = parseInt($('#quantity2').val());
			var price = $('#pr').val();
			$('#quantity').val(quantity);
			document.getElementById('chong').innerText= price * quantity ;
			
		});
		
	});
	
	</script>

</body>
</html>