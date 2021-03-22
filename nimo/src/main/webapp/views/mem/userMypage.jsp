<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<c:set var="nimo" value="${pageContext.request.contextPath}" />
<%@page import="kr.co.nimo.member.user.UserVO"%>
<%
	UserVO user = (UserVO) request.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>

<title>Liquor Store - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- default header name is X-CSRF-TOKEN -->
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
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

<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">

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

.logo>img {
	margin-top: -5px;
}

.logo img {
	height: 60px;
}

.center {
	margin: 0 auto !important;
	width: 50% !important;
	height: 50px !important;
}

@media ( max-width : 767.98px) {
	.center {
		margin: 0 auto !important;
		width: 80% !important;
		height: 50px !important;
	}
}

.tCenter {
	text-align: center !important;
}

.user_label {
	width: 50%;
	margin: 0 auto !important;
	text-align: left !important;
} @media (max-width: 767.98px) {
	.user_label {
	margin: 0 auto !important;
	width: 80% !important;
} }

</style>

<script type="text/javascript">
	function updateBtn() {
		alert("내 정보 수정을 위해 비밀번호 인증 부탁드립니다");
		self.location = "userPwdCheck";

	}
</script>
<script type="text/javascript">
	function btnClick(formName) {
		formName.submit();
	};
</script>

</head>
<body>


	<!-- header -->
	<%@ include file="/views/header.jsp"%>


	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-xl-8 ftco-animate">

					<div class="col-md-12 p-3 tCenter">
						<form name="myPageForm" action="userPwdCheck" method="post"
							id="myPage">
							<s:csrfInput />
							<h3 class="mb-4 billing-heading">My page</h3>
							<fieldset>
								<div class="form-group">
									<label for="inputID" class="user_label">아이디</label> <input type="text"
										class="form-control center" id="inputID" name="id"
										value="${ user.getId() }" disabled>
								</div>
								<div class="form-group">
									<label for="InputName" class="user_label">이름</label> <input type="text"
										class="form-control center" id="InputName" name="name"
										value="${ user.getName() }" disabled>
								</div>
								<div class="form-group">
									<label for="InputAddress" class="user_label">주소</label> <input type="text"
										class="form-control center" id="InputAddress" name="address"
										value="${  user.getAddress() }" disabled>
								</div>
								<div class="form-group">
									<label for="InputTel" class="user_label">휴대전화 번호</label> <input type="text"
										class="form-control center" id="InputTel" name="phone"
										value="${  user.getPhone() }" disabled>
								</div>
								<div class="form-group">
									<button type="button" class="btn btn-primary py-3 px-4 col-md-6 center" title="내정보 수정"
										onclick="updateBtn()">수정</button>
								</div>
							</fieldset>
						</form>
						<div>
					장바구니
					<button type="button" class="btn btn-primary"
						onclick="javascipt:location.href='.'">더 보기</button>
				</div>
				<div>
					구매내역
					<button type="button" class="btn btn-primary"
						onclick="javascipt:location.href='.'">더 보기</button>
				</div>
				<div>
					탈퇴하시겠습니까?
					<button type="button" class="btn btn-primary"
						onclick="javascipt:location.href='${nimo}/userDeleteCheck?id=${ user.id }'">탈퇴</button>
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


</body>
</html>