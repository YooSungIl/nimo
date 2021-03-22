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
<head>
<title>Liquor Store - Free Bootstrap 4 Template by Colorlib</title>
<script type="text/javascript">
 		function insertCheck() {
			var adminInsertForm = $('#insertForm');
			
			if($.trim($('#InputId').val()) == ''){
				   alert("아이디를 입력하세요");
				   $('#InputId').focus();
				   
				   return;
			}
			if($.trim($('#InputPassword1').val()) == ''){
				   alert("비밀번호를 입력하세요");
				   $('#InputPassword1').focus();
				   
				   return;
			}
			if($.trim($('#InputPassword2').val()) == ''){
				   alert("비밀번호 확인란을 입력하세요");
				   $('#InputPassword2').focus();
				   
				   return;
			}
			if($('#InputPassword1').val() != $('#InputPassword2').val()) {
				alert("비밀번호가 일치하지 않습니다.");
				$('#InputPassword2').focus();
				
				return;
			}
			if($.trim($('#InputName').val()) == ''){
				   alert("이름을 입력하세요");
				   $('#InputName').focus();
				   
				   return;
			}
			if($.trim($('#InputAddress').val()) == ''){
				   alert("주소를 입력하세요");
				   $('#InputAddress').focus();
				   
				   return;
			}
			if($.trim($('#InputPhone').val()) == ''){
				   alert("휴대전화 번호를 입력하세요");
				   $('#InputPhone').focus();
				   
				   return;
			}
			if($.trim($('#InputStat').val()) == ''){
				   alert("활성화를 선택해주세요");
				   $('#InputStat').focus();
				   
				   return;
			}
			if(confirm("입력된 정보로 추가 하시겠습니까?")) {
				alert("admin 추가 완료");
				adminInsertForm.submit();
			} else {
				return;
			}
	}
</script>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
<!-- default header name is X-CSRF-TOKEN -->
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />

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
</head>
<body>

	<!-- header -->
	<%@ include file="/views/header.jsp"%>

<section class="ftco-section">
<div class="container">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6 p-3">
				<form name="adminInsertForm" action="adminInsertSuccess" method="post" id="insertForm">
				<s:csrfInput/>
				  <fieldset>
				    <legend class="text-center">관리자 추가</legend>
					<div class="form-group">
					  <label for="InputId">아이디</label>
					  <input type="text" class="form-control" id="InputId" name="id" value="" autofocus>
					</div>
				    <div class="form-group">
				      <label for="InputPassword1">비밀번호</label>
				      <input type="password" class="form-control" id="InputPassword1" name="pwd" value="" >
				    </div>
				    <div class="form-group">
				      <label for="InputPassword2">비밀번호 확인</label>
				      <input type="password" class="form-control" id="InputPassword2" name="checkPwd" value="" >
				    </div>
				    <div class="form-group">
					  <label for="InputName">이름</label>
					  <input type="text" class="form-control" id="InputName" name="name" value="" >
					</div>
				    <div class="form-group">
					  <label for="InputAddress">주소</label>
					  <input type="text" class="form-control" id="InputAddress" name="address" value="" >
					</div>
				    <div class="form-group">
					  <label for="InputPhone">휴대전화 번호</label>
					  <input type="text" class="form-control" placeholder="000-0000-0000" id="InputPhone" name="phone" value="" >
					</div>
					<div class="form-group">
        				<label for="InputStat">계정 활성화</label>
      					<select name="stat" class="form-control" id="InputStat" >
			  				<option value="Y" selected>Y</option>
			  				<option value="N">N</option>
						</select>
    				</div>

					<div class="form-group">
					  <label for="InputRole">권한</label>
					  <select name="role" class="form-control" id="InputRole" >
							<option value="ROLE_USER" >ROLE_USER</option>
							<s:authorize access="hasRole('ROLE_SUPER')">
							<option value="ROLE_ADMIN" selected>ROLE_ADMIN</option>
							<option value="ROLE_SUPER" >ROLE_SUPER</option>
							</s:authorize>
						</select>
    				</div>
					<div class="text-center">
					  <button type="button" class="btn btn-primary" onclick="insertCheck()">추가완료</button>
					  <button type="button" class="btn btn-secondary" onclick="location.href='./adminUserList?page=${ scri.page }&perPageNum=${ scri.perPageNum }&searchType=${scri.searchType}&keyword=${scri.keyword}'">목록</button>
					</div>
				  </fieldset>
				</form>
			</div>
			<div class="col-md-3"></div>
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
	<script src="${nimo}/resources/js/user/join.js"></script>

</body>
</html>