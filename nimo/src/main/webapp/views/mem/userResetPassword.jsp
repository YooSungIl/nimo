<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<c:set var="nimo" value="${pageContext.request.contextPath}" />
<%@page import="kr.co.nimo.member.user.UserVO"%>
<%@page
	import="org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder"%>
<%
	UserVO user = (UserVO) request.getAttribute("user");
	BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<!-- default header name is X-CSRF-TOKEN -->
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" />
<head>
<title>Liquor Store - Free Bootstrap 4 Template by Colorlib</title>
<script type="text/javascript">
	function updatePwd() {

		if ($.trim($('#InputPassword1').val()) == '') {
			alert("현재 비밀번호를 입력하세요");
			$('#InputPassword1').focus();

			return;
		} else if ($.trim($('#InputPassword2').val()) == '') {
			alert("새 비밀번호를 입력하세요");
			$('#InputPassword2').focus();

			return;
		} else if ($.trim($('#InputPassword3').val()) == '') {
			alert("새 비밀번호를 한번 더 입력해주세요");
			$('#InputPassword3').focus();

			return;
		} else if ($('#InputPassword2').val() != $('#InputPassword3').val()) {
			alert("새 비밀번호가 일치하지 않습니다.");
			$('#InputPassword3').focus();

			return;

		} else {
			var header = $("meta[name='_csrf_header']").attr('content');
			var token = $("meta[name='_csrf']").attr('content');

			console.log("ajax 전");
			console.log($("#InputId").val());
			console.log($("#InputPassword1").val());
			$.ajax({
				type : 'post',
				url : 'userResetPasswordSuccess',
				dataType : 'json',
				contentType : "application/json; charset=utf-8;",
				data : JSON.stringify({
					id : $("#InputId").val(),
					pwd : $("#InputPassword1").val(),
					new_pwd : $("#InputPassword2").val()
				}),
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token);
				},
				success : function(data) {
					console.log("post 수행 후 Response 수신 성공!");
					console.log(data);
					
					if (data == -1) {
						alert("현재 비밀번호가 일치하지 않습니다.");
						$('#InputPassword1').focus();
						return;
					} else {
						if (confirm("비밀번호 변경 하시겠습니까?")) {
							if (data == 1) {
								alert("개인 정보 수정이 완료되었습니다.\n다시 로그인 해주시기 바랍니다!")
								$("#checkForm").submit();
							} else if (data == 0) {
								alert("개인 정보 수정이 실패하였습니다.");
								return;
							}
						} else {
							return;
						}
					}
				},
				error : function(request, status, error) {
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		} else {
			return;
		}
	};
</script>
<script type="text/javascript">
	function btnClick(formName) {
		formName.submit();
	};
</script>

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

<link rel="stylesheet" href="${nimo}/resources/css/flaticon.css">
<link rel="stylesheet" href="${nimo}/resources/css/style.css">
</head>
<body>

	<!-- header -->
	<%@ include file="/views/header.jsp"%>

	<s:authentication property="principal.authorities" var="role" />
	<label>&nbsp;id : ${ id } </label>
	<label>&nbsp;id : ${ role } </label>

	<div class="container">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6 p-3">
				<form name="pwdCheckForm" action="logout" method="post"
					id="checkForm">
					<s:csrfInput />
					<fieldset>
						<legend class="text-center">비밀번호 변경</legend>
						<div class="form-group">
							<input type="hidden" class="form-control" id="InputId" name="id"
								value="${ id }">
						</div>
						<div class="form-group">
							<label for="InputPassword1">현재 비밀번호</label> <input
								type="password" class="form-control" placeholder="현재 비밀번호"
								id="InputPassword1" name="pwdOld" value="${ pwd }" autofocus>
							<small id="pwHelp" class="form-text text-muted">개인정보 보호를
								위해 비밀번호를 다시 한 번 입력해주세요.</small>
						</div>
						<div class="form-group">
							<label for="InputPassword2">새 비밀번호</label> <input type="password"
								class="form-control" id="InputPassword2" placeholder="새 비밀번호"
								name="pwd" value="">
						</div>
						<div class="form-group">
							<label for="InputPassword3">새 비밀번호 확인</label> <input
								type="password" class="form-control" id="InputPassword3"
								placeholder="새 비밀번호 확인" name="pwd_check" value="">
						</div>
						<div class="text-center">
							<button type="button" class="btn btn-primary"
								onclick="updatePwd()">완료</button>
							<button type="button" class="btn btn-secondary"
								onclick="location.href='./userUpdateForm'">취소</button>
						</div>
					</fieldset>
				</form>
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>

	<!-- footer ----------------------------------------------------------->
	<footer class="ftco-footer">
		<div class="container">
			<div class="row mb-5">
				<div class="col-sm-12 col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2 logo">
							<a href="#">Liquor <span>Store</span></a>
						</h2>
						<p>Far far away, behind the word mountains, far from the
							countries.</p>
						<ul class="ftco-footer-social list-unstyled mt-2">
							<li class="ftco-animate"><a href="#"><span
									class="fa fa-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="fa fa-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="fa fa-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-12 col-md">
					<div class="ftco-footer-widget mb-4 ml-md-4">
						<h2 class="ftco-heading-2">My Accounts</h2>
						<ul class="list-unstyled">
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>My
									Account</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Register</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Log
									In</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>My
									Order</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-12 col-md">
					<div class="ftco-footer-widget mb-4 ml-md-4">
						<h2 class="ftco-heading-2">Information</h2>
						<ul class="list-unstyled">
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>About
									us</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Catalog</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Contact
									us</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Term
									&amp; Conditions</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-12 col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Quick Link</h2>
						<ul class="list-unstyled">
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>New
									User</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Help
									Center</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Report
									Spam</a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Faq's</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-12 col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Have a Questions?</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon fa fa-map marker"></span><span
									class="text">203 Fake St. Mountain View, San Francisco,
										California, USA</span></li>
								<li><a href="#"><span class="icon fa fa-phone"></span><span
										class="text">+2 392 3929 210</span></a></li>
								<li><a href="#"><span
										class="icon fa fa-paper-plane pr-4"></span><span class="text">info@yourdomain.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container-fluid px-0 py-5 bg-black">
			<div class="container">
				<div class="row">
					<div class="col-md-12">

						<p class="mb-0" style="color: rgba(255, 255, 255, .5);">
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made with <i
								class="fa fa-heart color-danger" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib.com</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>



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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="${nimo}/resources/js/google-map.js"></script>
	<script src="${nimo}/resources/js/main.js"></script>

	<script src="${nimo}/resources/js/userLogin.js"></script>

</body>
</html>