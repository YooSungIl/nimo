<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="kr.co.nimo.showroom.ShowRoomVO"%>
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
					<c:forEach items="${showRoomDetail_Furs}" var="showRoomDetail_Furs">
						<div class="row detailrow">
							<div class="col-md-6">
								<img src="${showRoomDetail_Furs.fur_image}" class="img-fluid"
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
																	data-type="minus">
																	<i class="fa fa-minus"></i>
																</button>
															</span> <input type="text" id="quantity" name="quantity"
																class="quantity form-control input-number" value="1"
																min="1" max="100"> <span
																class="input-group-btn ml-2">
																<button type="button" class="quantity-right-plus btn"
																	data-type="plus">
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

	<%@ include file="../footer.jsp"%>

	<script>
	$(document).ready(function() {

		var quantitiy = 1;
		
		$('.quantity-right-plus').click(function(e) {

			e.preventDefault();

			var quantity = parseInt($('#quantity').val());

			if (quantity < 100) {
				$('#quantity').val(quantity + 1);
				$('#quantity2').val(quantity + 1);
			}
			document.getElementById('chong').innerText=quantity + 1
		});

		$('.quantity-left-minus').click(function(e) {

			e.preventDefault();

			var quantity = parseInt($('#quantity').val());

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
			document.getElementById('chong').val() = price * quantity ;
			
		});
		
	});
	
	</script>

</body>
</html>