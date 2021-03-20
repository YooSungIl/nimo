<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<script type="text/javascript">
function showAdd(){
	var showForm = document.showAdd;
	var show_img = showForm.show_img.src;
	var show_name = showForm.show_name.value;
	var show_category = showForm.show_category.value;
	var show_detail = showForm.show_detail.value;
	
	if(!show_img || !show_name || !show_category || !show_detail) {
		alery("이미지와 쇼이름, 쇼카테고리, 쇼설명을 입력해 주세요.")
	} else {
		showForm.submit();
	}
}
</script>
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
	<form  action="/nimo/adShowRoom/showRoomInsert.ni" method="post" name="showAdd">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 mb-5 ftco-animate">
						<input type='file' id="imgInput" style="display: none;"> <input
							type='hidden' name="show_img_input"> <img
							id="image_section" class="img-fluid" name="show_img"
							src="${nimo}/resources/images/du/plus.jpg" />
				</div>
				<div class="col-md-12 tab-wrap" id="livingProduct">
					<h5>쇼룸 이름</h5>
					<input type="text" class="col-md-12" name="show_name" placeholder="쇼룸 이름을 써주세요" style="margin-bottom:20px;">
					<h5>쇼룸 카테고리</h5>
					<input type="text" class="col-md-12" name="show_category" placeholder="쇼룸 카테고리를 써주세요" style="margin-bottom:20px;">
					<h5>쇼룸 설명</h5>
					<textarea type="text" row="10" cols="50" class="col-md-12" name="show_detail" placeholder="쇼룸 설명해 주세요" ></textarea>
					<input type='hidden' name="furn_code">
				</div>

				<div class="row mt-5" id="furnplus">
					<div class="row detailrow">
						<div class="col-md-6">
								<input type='file' id="furn_img_input" style="display: none;">
								<input type='hidden' name="furn_img_hidden">
								<img id="image_furn" class="img-fluid" src="${nimo}/resources/images/du/plus.jpg" style="width:100;height:100%;" />
						</div>
						<div class="col-md-6">
							<div class="tab-content bg-light" id="v-pills-tabContent">
								<div class="tab-pane fade show active" id="v-pills-1"
									role="tabpanel" aria-labelledby="day-1-tab">
									<div class="p-4" id="textField-1" 	>
										<h5 style="margin-left:20px;">가구 이름</h5>
										<input type="text" style="margin:20px; width: 95%;" placeholder="가구 이름 써주세요" name="furn-name">
										<h5 style="margin-left:20px;">가구 가격</h5>
										<input type="text" style="margin:20px; width: 95%;" placeholder="가구 가격 써주세요" name="furn-price">
										<h5 style="margin-left:20px;">가구 설명</h5>
										<textarea style="margin:20px;width:95%;height:40%;" placeholder="가구 설명 써주세요" name="furn-detail"></textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="row justify-content-center">
						<div class="col-md-4">
							<button type="button" class="btn btn-primary d-block"
								id="furnPlus">가구추가</button>
						</div>
						<div class="col-md-4">
							<input type="button" class="btn btn-primary d-block" onclick="showAdd()" value="쇼룸추가"/>
						</div>
						<div class="col-md-4">
							<a href="#" class="btn btn-primary d-block">취소</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		</form>
	</section>

	<%@ include file="footer.jsp"%>
	
	<script type="text/javascript">
		var index = 2;
		var imgId;
		var su;
		function readURL1(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
	
				reader.onload = function(e) {
					$('#image_section').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			} else {
				console.log("nonono~");
			}
		}
		
		$("#imgInput").change(function() {
			readURL1(this);
		});

		
		function readURL2(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
	
				reader.onload = function(e) {
					console.log(imgId);
					$('#'+imgId).attr('src', e.target.result);
					$.ajax({
						url : "/nimo/adShowRoom/furnInfo.ni",
						data : {
							"fur_image" : input.files[0].name
						},
						dataType : "json",
						type : "POST",
						success : function(data) {
							console.log("ajax"+su);
							if (su != 0) {
								console.log("input[type=text][name=furn-name" + su + "]");
								$("input[type=text][name=furn-name" + su + "]").val(data.data.fur_name);
								$("input[type=text][name=furn-price" + su + "]").val(data.data.fur_price);
								$("textarea[name=furn-detail" + su + "]").val(data.data.fur_subdetail1_1);
							} else {
								$("input[type=text][name=furn-name]").val(data.data.fur_name);
								$("input[type=text][name=furn-price]").val(data.data.fur_price);
								$("textarea[name=furn-detail]").val(data.data.fur_subdetail1_1);
							}
						}
					});
				}
				reader.readAsDataURL(input.files[0]);
			} else {
				console.log("nonono~");
			}
		}
		
		$("#furn_img_input").change(function() {
			console.log("cl1");
			readURL2(this);
		});
				
		$(document).on('click', 'img', function(e) {
			imgId = $(this).attr('id');
			console.log(imgId);
			if (imgId == 'image_furn') {
				e.preventDefault();
				su = 0;
				$('#furn_img_input').click();
			} else if (imgId == 'image_section') {
				e.preventDefault();
				$('#imgInput').click();
			} else {
				e.preventDefault();
				su = imgId.charAt(imgId.length-1);
				console.log(su);
				$('#furn_img_input').click();
			}
		});
		$('#furnPlus')
				.click(
						function(e) {
							console.log("asd");

							$.ajax({
										url : "/nimo/adShowRoom/showRoomInsert.ni",
										success : function(data) {
											var str = "<div class='row detailrow'>";
											str += "<div class='col-md-6'>";
											str += "<input type='file' id='furn_img_input"+index+"' style='display: none;'>";
											str += "<input type='hidden' name='furn_img_hidden"+index+"'>";
											str += "<img id='image_furn"+ index + "' class='img-fluid' src='${nimo}/resources/images/du/plus.jpg' style='width:100;height:100%;'/>";
											str += "</div>";
											str += "<div class='col-md-6'><div class='tab-content bg-light' id='v-pills-tabContent'>";
											str += "<div class='tab-pane fade show active' id='v-pills-1' role='tabpanel' aria-labelledby='day-1-tab'>";
											str += "<div class='p-4' id='textField-1'>";
											str += "<h5 style='margin-left:20px;'>가구 이름</h5>";
											str += "<input type='text' style='margin:20px; width: 95%;' placeholder='가구 이름 써주세요' name='furn-name"+index+"'>";
											str += "<h5 style='margin-left:20px;'>가구 가격</h5>";
											str += "<input type='text' style='margin:20px; width: 95%;' placeholder='가구 가격 써주세요' name='furn-price"+index+"'>";
											str += "<h5 style='margin-left:20px;'>가구 설명</h5>";
											str += "<textarea style='margin:20px;width:95%;height:40%;' placeholder='가구 설명 써주세요' name='furn-detail"+index+"'></textarea>";
											str += "</div></div></div></div></div>";
											$("#furnplus").append(str);
											
											console.log(str);
										}
									});
								index++;
						});
	</script>
</body>
</html>