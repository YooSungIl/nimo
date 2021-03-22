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


<link href="https://fonts.googleapis.com/css2?family=Spectral:ital,wght@0,200;0,300;0,400;0,500;0,700;0,800;1,200;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="${nimo}/resources/css/animate.css">

<link rel="stylesheet" href="${nimo}/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${nimo}/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${nimo}/resources/css/magnific-popup.css">

<link rel="stylesheet" href="${nimo}/resources/css/flaticon.css">
<link rel="stylesheet" href="${nimo}/resources/css/style.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');

.logo_center {
	text-align: center;
	margin-bottom: 40px;
	vertical-align: middle;
}

.logo {
	color: #000;
	font-size: 30px;
	margin: 0 auto !important;
	font-family: 'Jua', sans-serif !important;
}

.logo > img {
	margin-top: -5px;
}

.logo img {
	height: 40px;
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

.user_label {
	width: 50%;
	margin: 0 auto !important;
	text-align: left !important;
} @media (max-width: 767.98px) {
	.user_label {
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
	margin: 0 10px;
}

.signText {
	font-size: 14px;
	padding: 30px 0 0 0;
}

#btn_sns {
	width: 50px;
	height: 50px;
}

hr {
	margin: 10px 25%;
}

</style>
</head>
<body>
	
	<!-- 회원가입 -->
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-8 ftco-animate">
				
					<div class="logo_center">
						<a href="${nimo}" class="logo"><img alt="nimo_logo" src="${nimo}/resources/images/nimo_logo.png" /> NIMO</a>
						<h3 class="mb-4 billing-heading">회원가입</h3>
					</div>
					
					<!-- SNS Login -->
					<div class="signCenter signText">
						SNS계정으로 간단하게 로그인/회원가입
					</div><hr/>
					<!-- 카카오 로그인 -->
					<div class="form-group signCenter">
						<a id="custom-login-btn" href="javascript:kakao()">
							<span><img src="${nimo}/resources/images/kakaolink_btn_small.png" id="btn_sns"/></span></a>
						<span id="naverIdLogin"></span>
						<a href="javascript:init()">
							<span><img src="${nimo}/resources/images/btn_google_light_normal_ios.svg" id="btn_sns" /></span></a>
					</div>
					<!-- SNS Login END-->
					
					<div class="signCenter signText">
						이메일로 회원가입
					</div><hr/>

					<!-- join form -->
					<form action="join" class="billing-form" method="post">
						<s:csrfInput />
						<div class="row align-items-end tCenter">

							<!-- 아이디 -->
							<div class="col-md-12">
								<div class="form-group">
									<label for="join_id" class="user_label">아이디</label> <input type="text"
										class="form-control center" id="join_id" name="id"
										placeholder="이메일 주소를 입력해주세요." idCheck="N">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group">
									<div id="checkMsg_id" class="msg"></div>
								</div>
							</div>
							<div class="w-100"></div>

							<!-- 비밀번호 -->
							<div class="col-md-12">
								<div class="form-group">
									<label for="join_pwd" class="user_label">비밀번호</label> <input type="password"
										class="form-control center" id="join_pwd" name="pwd" maxlength="24"
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
									<label for="join_pwdChk" class="user_label">비밀번호 확인</label> <input type="password"
										class="form-control center" id="join_pwdChk" name="pwdC"
										maxlength="24" placeholder="비밀번호를 한 번 더 입력해주세요." />
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group">
									<div id="checkMsg_pwdC" class="msg"></div>
								</div>
							</div>
							<div class="w-100"></div>

							<!-- 이름 -->
							<div class="col-md-12">
								<div class="form-group">
									<label for="join_name" class="user_label">이름</label> <input type="text"
										class="form-control center" id="join_name" name="name"
										placeholder="이름을 입력해주세요." maxlength="10"/>
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group">
									<div id="checkMsg_name" class="msg"></div>
								</div>
							</div>
							<div class="w-100"></div>

							<!-- 전화번호 -->
							<div class="col-md-12">
								<div class="form-group">
									<label for="join_phone" class="user_label">전화번호</label> <input type="text"
										class="form-control center" id="join_phone" name="phone"
										placeholder="-를 제외하고 입력해주세요." maxlength="11">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group">
									<div id="checkMsg_phone" class="msg"></div>
								</div>
							</div>
							<div class="w-100"></div>

							
							<div class="col-md-12">
								<div class="form-group">
									<label for="join_addr_btn" class="user_label">주소</label>
									<input type="text" class="form-control center" id="join_addr_address"
										name="address_road" placeholder="도로명 주소" readonly />
									<input type="text" class="form-control center" id="join_addr_jibun"
									 	placeholder="지번 주소" readonly />
									 <input type="button" class="btn btn-primary py-2 px-4 col-md-6"
										id="join_addr_btn" value="주소 찾기" />
								</div>
							</div>
							
							<div class="col-md-12">
								<div class="form-group">
									<span id="guide" name="guide" style="color:#999;display:none"></span>
								</div>
							</div>
							
							<div class="col-md-12">
								<div class="form-group">
									<div id="checkMsg_postcode" class="msg"></div>
								</div>
							</div>
							
							<div class="col-md-12">
								<div class="form-group">
									<input type="text" class="form-control center" id="join_addr_detail"
										name="address_detail" placeholder="상세주소" />
								</div>
							</div>
							
							<div class="col-md-12">
								<div class="form-group">
									<div id="checkMsg_address" class="msg"></div>
								</div>
							</div>

							<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
							<div id="layer"
							style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
								<img src="//t1.daumcdn.net/postcode/resource/images/close.png" 
								style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
								id="closeDaumPostcode" alt="닫기 버튼" />
							</div>

							
							
							<!-- 가입 버튼 -->
							<div class="col-md-12">
								<div class="form-group">
									<input type="submit"
										class="btn btn-primary py-3 px-4 col-md-6 joinAsk"
										value="회원가입" />
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<p>이미 아이디가 있으신가요? <a href="login">로그인</a></p>
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
	
	
	<script src="${nimo}/resources/js/user/naver2.js"></script>
</body>
</html>