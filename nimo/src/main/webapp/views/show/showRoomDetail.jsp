<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="kr.co.nimo.showroom.ShowRoomVO"%>
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

<link rel="stylesheet" href="/nimo/resources/css/animate.css">

<link rel="stylesheet" href="/nimo/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="/nimo/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/nimo/resources/css/magnific-popup.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.min.css">


<link rel="stylesheet" href="/nimo/resources/css/flaticon.css">
<link rel="stylesheet" href="/nimo/resources/css/style.css">
</head>
<body>
	<!-- header -->
	<%@ include file="/views/header.jsp"%>

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
					<c:forEach items="${showRoomDetail_Furs}" var="showRoomDetail_Furs" varStatus="status">
						<div class="row detailrow">
							<div class="col-md-6">
								<img src="${showRoomDetail_Furs.fur_image}" class="img-fluid"
									alt="Colorlib Template" name="fur_img${status.index}">
									
							</div>
							<div class="col-md-6">
								<div class="tab-content bg-light" id="v-pills-tabContent">
									<div class="tab-pane fade show active" id="v-pills-1">
										<div class="p-4">
											<h5 class="mb-4" name="fur_name${status.index}">${showRoomDetail_Furs.fur_name}</h5>
											<h5 class="price" name="fur_price${status.index}">${showRoomDetail_Furs.fur_price}</h5>
											<p name="fur_detail${status.index}">${showRoomDetail_Furs.fur_subdetail1_1}</p>
											<h5 class="mb-4"></h5>

											<div class="row">
												<div class="col-lg-6 product-details pl-md-12 ftco-animate">
													<div class="row mt-4">
														<div class="input-group col-md- d-flex mb-3">
															<span class="input-group-btn mr-2">
																<button type="button" name="m${status.index}" class="quantity-left-minus btn" data-type="minus">
																	<i class="fa fa-minus"></i>
																</button>
															</span>
															<input type="text" id="quantity" name="quantity${status.index}" class="quantity form-control input-number" value="1" min="1" max="100">
															<span class="input-group-btn ml-2">
																<button type="button" name="p${status.index}" class="quantity-right-plus btn" data-type="plus">
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
								<th>Product</th>
								<th>Price</th>
								<th>Quantity</th>
								<th>total</th>
							</tr>
						</thead>
						<c:forEach items="${showRoomDetail_Furs}" var="showRoomDetail_Furs" varStatus="status">
							<tbody>
								<tr class="alert" role="alert" id="jang${status.index}">
									<td>
										<div class="img" style="background-image: url(${showRoomDetail_Furs.fur_image});"></div>
									</td>
									<td>
										<div class="email">
											<span>${showRoomDetail_Furs.fur_name}</span>
											<span>${showRoomDetail_Furs.fur_subdetail1_1}</span>
										</div>
									</td>
									<td id="price${status.index}">${showRoomDetail_Furs.fur_price}</td>
									<td class="quantity">
										<div class="input-group">
											<input type="text" name="quantityB${status.index}" class="quantityB form-control input-number" value="1">
										</div>
									</td>
									<td id="chong${status.index}">${showRoomDetail_Furs.fur_price}</td>
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
						<c:forEach items="${showRoomDetail_Furs}" var="showRoomDetail_Furs" varStatus="status">
							<p class="d-flex total-price">
								<span id="furName${status.index}">${showRoomDetail_Furs.fur_name}</span> <span id="furPrice${status.index}">${showRoomDetail_Furs.fur_price}</span>
							</p>
						</c:forEach>
						<hr>
						<p class="d-flex total-price">
							<span>Total</span> <span id="furPriceTotal"></span>
						</p>
					</div>
					<p class="text-center">
						<a href="checkout.html" class="btn btn-primary py-3 px-4">구매 하기</a>
					</p>
				</div>
			</div>
		</div>
	</section>

	<%@ include file="../footer.jsp"%>

	<script>
	window.onload = function() {
		console.log("asd");
		var total = 0;
		<c:forEach items="${showRoomDetail_Furs}" var="showRoomDetail_Furs" varStatus="status">
			total += ${showRoomDetail_Furs.fur_price}
		</c:forEach>
		console.log(total);
		
		document.getElementById('furPriceTotal').innerText = total;
	};
	
	$(document).ready(function() {

		var quantity = 1;
			
		$('.quantity-right-plus').click(function(e) {
			
			e.preventDefault();

			var button = $(this).attr('name');
			
			var downQuantity = button.substr(1,2);
					
			quantity = parseInt($("input[name='quantity"+downQuantity+"']").val());
			
			if (quantity != 0) {
				
				if (quantity < 100) {
					$("input[name='quantity"+downQuantity+"']").val(quantity + 1);
					$("input[name='quantityB"+downQuantity+"']").val(quantity + 1);
				}
					
				quantity = parseInt($("input[name='quantity"+downQuantity+"']").val());
				var wonlaePrice =  document.getElementById('price'+downQuantity).innerText;
				document.getElementById('chong'+downQuantity).innerText = wonlaePrice * quantity;
				document.getElementById('furPrice'+downQuantity).innerText = wonlaePrice * quantity;
				
			} else {
				
				document.getElementById( 'jang'+downQuantity ).setAttribute( 'style', 'display: on;' );
				document.getElementById( 'furPrice'+downQuantity ).setAttribute( 'style', 'display: on;' );
				$("input[name='quantity"+downQuantity+"']").val(quantity + 1);
				$("input[name='quantityB"+downQuantity+"']").val(quantity + 1);
				quantity = parseInt($("input[name='quantity"+downQuantity+"']").val());
				var wonlaePrice =  document.getElementById('price'+downQuantity).innerText;
				document.getElementById('chong'+downQuantity).innerText = wonlaePrice * quantity;
				document.getElementById('furPrice'+downQuantity).innerText = wonlaePrice * quantity;
			}
			
			
			
	
		});
		
		
		$('.quantity-left-minus').click(function(e) {
			
			e.preventDefault();
			
			var button = $(this).attr('name');
			
			var downQuantity = button.substr(1,2);
			
			quantity = parseInt($("input[name='quantity"+downQuantity+"']").val());
			
			if (quantity >= 0) {
				$("input[name='quantity"+downQuantity+"']").val(quantity - 1);
				$("input[name='quantityB"+downQuantity+"']").val(quantity - 1);
			}
			
			quantity = parseInt($("input[name='quantity"+downQuantity+"']").val());
			
			if (quantity != 0) {
				var chongPrice = document.getElementById('chong'+downQuantity).innerText;
				var wonlaePrice =  document.getElementById('price'+downQuantity).innerText;
				document.getElementById('chong'+downQuantity).innerText = chongPrice - wonlaePrice;
				document.getElementById('furPrice'+downQuantity).innerText = chongPrice - wonlaePrice;
			} else {
				document.getElementById( 'jang'+downQuantity ).setAttribute( 'style', 'display: none;' );
				document.getElementById( 'furName'+downQuantity ).setAttribute( 'style', 'display: none;' );
				document.getElementById( 'furPrice'+downQuantity ).setAttribute( 'style', 'display: none;' );
				
			}
			
		});
		
		$('.quantityB').keydown(function(e) {

			var quantityB = $(this).attr('name');
			var su = quantityB.substr(9,2);
			var tityB = $(this).val();
			var wonlaePrice =  document.getElementById('price'+su).innerText;
			
			if (quantity != 0) {
				$("input[name='quantity"+su+"']").val(tityB);
				document.getElementById('chong'+su).innerText = wonlaePrice * tityB;
				document.getElementById('furPrice'+su).innerText = wonlaePrice * tityB;
				document.getElementById('chong'+su).innerText = wonlaePrice * tityB;
			} else {
				document.getElementById( 'jang'+downQuantity ).setAttribute( 'style', 'display: none;' );
				document.getElementById( 'furName'+downQuantity ).setAttribute( 'style', 'display: none;' );
				document.getElementById( 'furPrice'+downQuantity ).setAttribute( 'style', 'display: none;' );
			}
		});
		
	});
	
	</script>

</body>
</html>