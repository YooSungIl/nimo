<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<c:set var="nimo" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>Liquor Store - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<!-- default header name is X-CSRF-TOKEN -->
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" />

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
@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');

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

.center {
	margin: 0 auto !important;
	width: 50% !important;
	height: 50px !important;
}  @media (max-width: 767.98px) {
	.center {
	margin: 0 auto !important;
	width: 80% !important;
	height: 50px !important;
} }

.tCenter {
	text-align: center !important;
}

.msg {
	width: 50%;
	margin: 0 auto !important;
	text-align: left !important;
} @media (max-width: 767.98px) {
	.msg {
	margin: 0 auto !important;
	width: 80% !important;
} }

.search_label {
	width: 50%;
	margin: 0 auto !important;
	text-align: left !important;
} @media (max-width: 767.98px) {
	.search_label {
	margin: 0 auto !important;
	width: 80% !important;
} }

</style>

</head>
<body>

	<!-- 비밀번호 찾기 -->
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-10 ftco-animate">
				
					<div class="logo_center">
						<a href="${nimo}" class="logo"><img alt="nimo_logo" src="${nimo}/resources/images/nimo_logo.png" /> NIMO</a>
					</div>
				
					<!-- pwdSearch form -->
					<form action="pwdSearch" class="billing-form" method="post" id="findPwdForm">
						<s:csrfInput/>
						<div class="row align-items-end tCenter">
							
							<div class="col-md-12">
								<div class="form-group">
									<label for="search_id" class="search_label">아 이 디</label> 
									<input type="text" class="form-control center" name="id" id="search_id" placeholder="이메일 주소를 입력해주세요." />
								</div>
							</div>
							<div class="w-100"></div>
							
							<div class="col-md-12">
								<div class="form-group">
									<label for="search_phone"  class="search_label">전화번호</label> 
									<input type="text" class="form-control center" name="phone" id="search_phone" placeholder="-를 제외하고 입력해주세요." />
								</div>
							</div>
							
							<div class="col-md-12">
								<div class="form-group">
									<div id="checkMsg_id" class="msg"></div>
								</div>
							</div>
							
							<div class="col-md-12">
								<div class="form-group">
									<input type="button" class="btn btn-primary py-3 px-4 col-md-6 authSMS" value="인증번호 받기" />
								</div>
							</div>
							<div class="w-100"></div>
							
							
							<div class="col-md-12">
								<div class="form-group">
									<div id="authChk" style="display: none;">
										<input type="text" class="form-control center" name="phone" id="authCode" placeholder="인증번호를 입력하세요." />
									</div>
								</div>
							</div>
							
							<div class="col-md-12">
								<div class="form-group">
									<div id="authChkBtn" style="display: none;">
										<input type="button" class="btn btn-primary py-3 px-4 col-md-6 authSMSChk" value="확인" />
									</div>
								</div>
							</div>
							
							<div class="col-md-12">
								<div class="form-group">
									<input type="submit" class="btn btn-primary py-3 px-4 col-md-6 pwdSearchAsk" value="비밀번호 찾기" disabled="true" />
								</div>
							</div>
						</div>
					</form>
					<!-- login form END -->
					
				</div>
			</div>
			<!-- .col-md-8 -->
		</div>
	</section>
	
	
	<!-- <c:if test="${not empty msg}">
		<div class="msg">${msg}</div>
	</c:if> -->


	<!-- footer -->
	<%@ include file="/views/footer.jsp" %>
	
	
	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>

	<script src="${nimo}/resources/js/user/search_pwd.js"></script>
	

</body>
</html>