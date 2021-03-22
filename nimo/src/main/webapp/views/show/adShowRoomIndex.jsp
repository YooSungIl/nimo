<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="kr.co.nimo.showroom.ShowRoomVO"%>
<c:set var="nimo" value="${pageContext.request.contextPath}" />
<c:set var="showDetail" value="${showRoomDetail_ShowRoom}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<title>니모 관리자 인덱스</title>
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
							<a href="adShowRoomDetail.ni?show_name=${best.show_name}"
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
			<div class="row justify-content-center pb-5">
				<div class="col-md-7 heading-section text-center ftco-animate">
					<span class="subheading">니모의 쇼룸!</span>
					<h2>니모 추천 상품!</h2>
				</div>
			</div>
			<div class="row">
				<c:forEach items="${recommendShowRoom}" var="recommend">
					<div class="col-md-4 d-flex">
						<div class="product ftco-animate">
							<a href="adShowRoomDetail.ni?show_name=${recommend.show_name}"
									class="img d-flex align-items-center justify-content-center"
									style="background-image: url('${recommend.show_img}');"> </a>
							<div class="text text-center">
								<span class="sale">강력추천</span> <span class="category">${recommend.show_category}</span>
								<h2>${recommend.show_name}</h2>
								<p class="mb-0">
									<span>${recommend.show_detail}</span>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="row justify-content-center pb-5">
				<div class="col-md-7 heading-section text-center ftco-animate">
					<span class="subheading">니모의 쇼룸!</span>
					<h2>니모 가성비 상품!</h2>
				</div>
			</div>
			<div class="row">
				<c:forEach items="${gaseongbiShowRoom}" var="gaseongbi">
					<div class="col-md-4 d-flex">
						<div class="product ftco-animate">
							<a href="adShowRoomDetail.ni?show_name=${recommend.show_name}"
									class="img d-flex align-items-center justify-content-center"
									style="background-image: url('${recommend.show_img}');"> </a>
							<div class="text text-center">
								<span class="seller">가성비</span> <span class="category">${gaseongbi.show_category}</span>
								<h2>${gaseongbi.show_name}</h2>
								<p class="mb-0">
									<span>${gaseongbi.show_detail}</span>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<%@ include file="../footer.jsp"%>
</body>
</html>