<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<c:set var="nimo" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- default header name is X-CSRF-TOKEN -->
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
@import url('https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR&display=swap');

.logo_center {
	text-align: center;
	margin-bottom: 40px;
	vertical-align: middle;
}

.logo {
	color: #000;
	font-size: 40px;
	margin: 0 auto !important;
	font-family: 'Jua', sans-serif !important;
}

.logo > img {
	margin-top: -5px;
}

.logo img {
	height: 60px;
}

</style>
</head>
<body>
	<!-- nav -->
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand logo" href="${nimo}"><img alt="nimo_logo" src="${nimo}/resources/images/nimo_logo.png" /><span>NIMO</span></a>
			<div class="order-lg-last btn-group">
			
				<s:authorize access="isAnonymous()">
					<ul class="navbar-nav ml-n1">
						<li class="nav-item active"><a href="${nimo}/login" class="nav-link">로그인</a></li>
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
				</s:authorize>
				<s:authorize access="isAuthenticated()">
				<s:authentication property="principal.username" var="id" />
					<ul class="navbar-nav ml-n1">
					<li class="nav-item active">${id } 님 환영합니다.</li>
						<li class="nav-item active"><a href="javascript:logout();" class="nav-link">로그아웃</a></li>
						<li>|</li>
						<s:authorize access="hasRole('ROLE_USER')">
							<li class="nav-item"><a href="userMypage" class="nav-link">마이페이지</a></li>
						</s:authorize>
						<s:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUPER')">
							<li class="nav-item"><a href="about.html" class="nav-link">관리자페이지</a></li>
						</s:authorize>
						<li class="nav-item"><a href="#"
							class="btn-cart dropdown-toggle dropdown-toggle-split"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<span class="flaticon-shopping-bag"></span>
								<div class="d-flex justify-content-center align-items-center">
									<small>3</small>
								</div>
						</a></li>
					</ul>
					<form id="logout" action="${nimo}/logout" method="post">
						<s:csrfInput/>
					</form>
				</s:authorize>
					
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
					<li class="nav-item active dropdown"><a href="/nimo/showRoom/showRoomIndex.ni" class="nav-link">쇼 룸</a></li>
					<li class="nav-item"><a href="${nimo}/fur/nimo/furList" class="nav-link">모든 상품</a></li>
					<s:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_SUPER')">
						<li class="nav-item"><a href="${nimo}/adminUserList" class="nav-link">회원 관리</a></li>
						<li class="nav-item"><a href="#" class="nav-link">매출 관리</a></li>
					</s:authorize>
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Products</a>
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
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<script src="https://apis.google.com/js/api:client.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="${nimo}/resources/js/user/logout.js"></script>
</body>
</html>