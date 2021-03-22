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

.newing_label {
	width: 50%;
	margin: 0 auto !important;
	text-align: left !important;
} @media (max-width: 767.98px) {
	.newing_label {
	margin: 0 auto !important;
	width: 80% !important;
} }

</style>
</head>
<body>

	<!-- 새 비밀번호 입력 -->
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-10 ftco-animate">
				
					<div class="logo_center">
						<a href="${nimo}" class="logo"><img alt="nimo_logo" src="${nimo}/resources/images/nimo_logo.png" /> NIMO</a>
						<h3 class="mb-4 billing-heading">새 비밀번호 생성</h3>
					</div>

					<!-- newPwd form -->
					<form action="newPwd" class="billing-form" method="post">
						<s:csrfInput />
						<div class="row align-items-end tCenter">


							<!-- 새 비밀번호 -->
							<div class="col-md-12">
								<div class="form-group">
									<label for="new_pwd" class="newing_label">비밀번호</label> <input type="password"
										class="form-control center" id="new_pwd" name="pwd" maxlength="24"
										placeholder="8~24자(영문,숫자,특수문자 조합)로 입력해주세요." />
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group">
									<div id="checkMsg_pwd" class="msg"></div>
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group">
									<label for="new_pwdChk" class="newing_label">비밀번호 확인</label> <input type="password"
										class="form-control center" id="new_pwdChk" name="pwdC"
										maxlength="24" placeholder="비밀번호를 한 번 더 입력해주세요." />
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group">
									<div id="checkMsg_pwdC" class="msg"></div>
								</div>
							</div>


							<!-- 변경 버튼 -->
							<div class="col-md-12">
								<div class="form-group">
									<input type="submit"
										class="btn btn-primary py-3 px-4 col-md-6 newPwdAsk"
										value="변경하기" />
								</div>
							</div>
						</div>
					</form>
					<!-- join form END -->
				</div>
				<!-- .col-md-8 -->
			</div>
		</div>
	</section>


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


	<script src="${nimo}/resources/js/user/pwd_newing.js"></script>


</body>
</html>