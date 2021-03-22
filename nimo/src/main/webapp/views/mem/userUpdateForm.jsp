<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<c:set var="nimo" value="${pageContext.request.contextPath}" />
<%@page import="kr.co.nimo.member.user.UserVO"%>
<%
	UserVO user = (UserVO)request.getAttribute("user");
%>
<!DOCTYPE html>
<html>	
<meta charset="UTF-8">
  <head>
    <title>Liquor Store - Free Bootstrap 4 Template by Colorlib</title>
<script type="text/javascript">
	function btnClick(formName) {
		formName.submit();
	};
</script>
<%-- <script type="text/javascript">
	function deleteCheck(id) {
		if(confirm("ID : "+ id +" 님 정말 탈퇴 하시겠습니까?")) {
			location.href='./userDelete';
		} else {
			return;
		}
	}
</script> --%>
<script type="text/javascript">	
		function btnP_click() { 
			alert('비밀번호 변경 페이지로 이동합니다'); 
			location.href='userResetPassword';
			}  
</script>
<script type="text/javascript">	
		function btnDel_click() { 
			alert('탈퇴를 위해 비밀번호 인증 페이지로 이동합니다.'); 
			location.href='userDeleteCheck';
			}  
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
	<%@ include file="/views/header.jsp" %>
	
	<s:authentication property="principal.authorities" var="role" />
	<label>&nbsp;id : ${ id } </label>
	<label>&nbsp;id : ${ role } </label>

<div class="container">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6 p-3">
				<form name="memberModifyForm" action="userUpdateSuccess" method="post" id="modifyForm">
				  <s:csrfInput />
				  <fieldset>
				    <legend class="text-center">내정보 수정</legend>
					<div class="form-group">
					  <label for="inputId">아이디</label>
					  <input type="text" class="form-control" id="inputId" name="id" value="${ user.getId() }" readonly>
					</div>
 				    <div class="form-group">
				      <input type="hidden" class="form-control" id="InputPassword1" name="pwd" value="${ user.getPwd() }" readonly >
				    </div>
				    <div class="form-group">
					  <label for="InputName">이름</label>
					  <input type="text" class="form-control" id="InputName" name="name" value="${ user.getName() }" >
					</div>
				    <div class="form-group">
					  <label for="InputAddress">주소</label>
					  <input type="text" class="form-control" id="InputAddress" name="address" value="${ user.getAddress() }" >
					</div>
				    <div class="form-group">
					  <label for="InputPhone">휴대전화 번호</label>
					  <input type="text" class="form-control" id="InputPhone" name="phone" value="${ user.getPhone() }" >
					</div>
					<%-- <div class="form-group">
					  <label for="InputStat">계정 활성화</label>
					  <input type="text" class="form-control" id="InputStat" name="stat" value="${ user.getStat() }" readonly>
					</div>
					<div class="form-group">
					  <label for="InputPlatform">플렛폼</label>
					  <input type="text" class="form-control" id="InputPlatform" name="platform" value="${ user.getPlatform() }" readonly>
					</div>
					<div class="form-group">
					  <label for="InputRole">권한</label>
					  <input type="text" class="form-control" id="InputRole" name="role" value="${ user.getRole() }" readonly>
					</div>
					<div class="form-group">
					  <label for="InputReg_date">가입일</label>
					  <input type="text" class="form-control" id="InputReg_date" name="reg_date" value="${ user.getReg_date() }" readonly>
					</div> --%>
					<div class="text-center">
					  <button type="submit" class="btn btn-primary">완료</button>
					  <button type="button" class="btn btn-secondary" onclick="javascipt:location.href='./userMypage';">취소</button>
					  <input type="button" id="btnP" class="btn btn-primary" onclick="btnP_click()" value="비밀번호 변경" />
					  <button type="button" class="btn btn-primary" onclick="btnDel_click()">탈퇴/비활성화</button>
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
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="${nimo}/resources/js/google-map.js"></script>
	<script src="${nimo}/resources/js/main.js"></script>
	
	<script src="${nimo}/resources/js/userLogin.js"></script>

</body>
</html>