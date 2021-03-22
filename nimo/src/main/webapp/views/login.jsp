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
<!-- <meta name="google-signin-client_id" content="557243081599-c83r7c603m6te6miufs183p2entslgkb.apps.googleusercontent.com">
 -->
<!-- default header name is X-CSRF-TOKEN -->
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" />

<link href="https://fonts.googleapis.com/css2?family=Spectral:ital,wght@0,200;0,300;0,400;0,500;0,700;0,800;1,200;1,300;1,400;1,500;1,700&display=swap"
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
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
#customBtn {
	display: inline-block;
	background: white;
	color: #444;
	width: 226.57px;
	height: 49px;
	border-radius: 5px;
	border: thin solid #888;
	box-shadow: 1px 1px 1px grey;
	white-space: nowrap;
	text-align: center;
	vertical-align: middle;
}

#customBtn:hover {
	cursor: pointer;
}

span.icon {
	background:
		url('${nimo}/resources/images/btn_google_light_normal_ios.svg')
		transparent 0px 100% no-repeat;
	display: inline-block;
	vertical-align: middle;
	width: 42px;
	height: 100%;
	float: left;
}

span.buttonText {
	display: inline-block;
	text-align: center;
	vertical-align: middle;
	height: 100%;
	line-height: 47px; padding : 0;
	font-size: 14px;
	font-weight: bold;
	/* Use the Roboto font that is loaded in the <head> */
	font-family: 'Roboto', sans-serif;
	padding: 0
}

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

.signCenter {
	margin: 0 auto !important;
	width: 50% !important;
	height: 60px !important;
	text-align: center !important;
} @media (max-width: 767.98px) {
	.signCenter {
	margin: 0 auto !important;
	width: 80% !important;
	height: 50px !important;
} }

.signCenter a {
	color: #000;
}

.signText {
	font-size: 14px;
	padding: 30px 0 0 0;
}

hr {
	margin: 10px 25%;
}

.pwdSearch {
	display: inline-block;
	color: #000;
	margin: 0 10px;
}

.pwdSearch:hover {
	text-decoration: underline;
	color: #000;
}

.join {
	display: inline-block;
	color: #000;
	margin: 0 10px;
}

.join:hover {
	text-decoration: underline;
	color: #000;
}
</style>

</head>
<body>

	<!-- 로그인 -->
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-8 ftco-animate">
				
					<div class="logo_center">
						<a href="${nimo}" class="logo"><img alt="nimo_logo" src="${nimo}/resources/images/nimo_logo.png" /> NIMO</a>
					</div>
					
					<!-- login form -->
					<form action="loginProcess" class="billing-form" method="post">
						<s:csrfInput />
						<div class="row align-items-end tCenter">

							<div class="col-md-12">
								<div class="form-group">
									<input type="text" class="form-control center" name="id"
										id="login_id" placeholder="이메일" value="${id}" />
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group">
									<div id="checkMsg_id" class="msg"></div>
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group ">
									<input type="password" class="form-control center" name="pwd"
										id="login_pwd" placeholder="비밀번호" />
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<div id="checkMsg_pwd" class="msg"></div>
								</div>
							</div>
							<div class="w-100"></div>
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group">
									<c:if test="${not empty errormsg}">
										<div class="error">${errormsg}</div>
									</c:if>
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group">
									<input type="submit"
										class="btn btn-primary py-3 px-4 center loginAsk"
										value="로 그 인" />
								</div>
							</div>
						</div>
						<div class="row align-items-end tCenter">
							<div class="col-md-12">
								<div class="form-group center">
									<a href="pwdSearch" class="pwdSearch">비밀번호 변경</a>| <a
										href="join" class="join">회원가입</a>
								</div>
							</div>
						</div>
					</form><br />
					<!-- login form END -->
					
					<!-- SNS Login -->
					<div class="signCenter signText">
						SNS계정으로 간단하게 로그인/회원가입
					</div><hr/>
					<!-- 카카오 로그인 -->
					<div class="form-group signCenter">
						<a id="custom-login-btn" href="javascript:kakao()"> <img
							src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
							width="226.57px" /></a>
					</div>

					<!-- 네이버 로그인 -->
					<div class="form-group signCenter">
						<div id="naverIdLogin"></div>
					</div>

					<!-- 구글 로그인 -->
					<div class="form-group signCenter">
						<!-- <div class="g-signin2" data-onsuccess="onSignIn"></div> -->
						<div id="customBtn" class="customGPlusSignIn"><a href="javascript:init()">
							<span class="icon"></span><span class="buttonText">구글계정으로
								로그인</span></a>
						</div>
					</div>
					<!-- SNS Login END-->

				</div>
			</div>
		</div>

		<!-- .col-md-8 -->


	</section>


	<!-- <c:if test="${not empty msg}">
		<div class="msg">${msg}</div>
	</c:if> -->


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



	<script src="${nimo}/resources/js/user/naver.js"></script>
	<script>
		// SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
	</script>



</body>
</html>