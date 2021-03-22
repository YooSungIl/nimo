<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<c:set var="nimo" value="${pageContext.request.contextPath}" />
<%@page import="kr.co.nimo.member.user.UserVO"%>
<%@page import="kr.co.nimo.member.paging.*"%>
<%
	UserVO user = (UserVO)request.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function btnClick(formName) {
		formName.submit();
	};
</script>

<title>Liquor Store - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="UTF-8">
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

	<!-- header -->
	<%@ include file="/views/header.jsp"%>
	

	<section class="ftco-section">
<div class="container">
	<div class="row">
		<div class="col-md-4 p-3">
			<div id="statistics">
			  <div>
			    <h4 class="title">가입 현황 차트</h4>
			    <p class="text-left">
			    가입 현황 : <span></span>10대 20대 30대
			    </p>
			  </div>
			</div>
		</div>
		<div class="col-md-4 p-3">
			<div class="card mb-3 h-100">
			  <div class="card-body" onclick="location.href='./adminUserList'">
			    <h4 class="card-title">회원 관리</h4>
			    <p class="card-text text-right">
			    	등록 회원 : <span>${ adminUserCount }</span>명
			    </p>
			  </div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4 p-3">
			<div id="statistics">
			  <div>
			    <h4 class="title">가구 판매 현황 </h4>
			    <p class="text-left">
			    가구 판매 현황 : <span></span>개
			    </p>
			  </div>
			</div>
		</div>
		<div class="col-md-4 p-3">
			<div id="statistics">
			  <div>
			    <h4 class="title">가구 매출 현황 </h4>
			    <p class="text-left">
			    가구 매출 현황 : <span></span>원
			    </p>
			  </div>
			</div>
		</div>
		<div class="col-md-4 p-3">
			<div class="card mb-3 h-100">
			  <div class="card-body" onclick="location.href='./.ni'">
			    <h4 class="card-title">가구 상품 관리</h4>
			    <p class="card-text text-right">
			    	등록 가구 : <span></span>개
			    </p>
			  </div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4 p-3">
			<div id="statistics">
			  <div>
			    <h4 class="title">쇼룸 판매 현황 </h4>
			    <p class="text-left">
			    쇼룸 판매 현황 : <span></span>개
			    </p>
			  </div>
			</div>
		</div>
		<div class="col-md-4 p-3">
			<div id="statistics">
			  <div>
			    <h4 class="title">쇼룸 매출 현황 </h4>
			    <p class="text-left">
			    쇼룸 매출 현황 : <span></span>원
			    </p>
			  </div>
			</div>
		</div>
		<div class="col-md-4 p-3">
			<div class="card mb-3 h-100">
			  <div class="card-body" onclick="location.href='./.ni'">
			    <h4 class="card-title">쇼룸 관리</h4>
			    <p class="card-text text-right">
			    	등록 쇼룸 : <span></span>개
			    </p>
			  </div>
			</div>
		</div>
	</div>
</div>
</section>


	<!-- footer -->
	<%@ include file="/views/footer.jsp"%>

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
	
	<script src="${nimo}/resources/js/user/login.js"></script>

</body>
</html>