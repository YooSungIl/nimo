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
	function btnClick(formName) {
		formName.submit();
	};
</script> 
 <script type="text/javascript">
	function userPwdCheck() {
		var pwdCheckForm = $('#checkForm');
		
		if($.trim($('#InputPassword1').val()) == ''){
			   alert("현재 비밀번호를 입력하세요");
			   $('#InputPassword1').focus();
			   
			   return;
		}
		if($.trim($('#InputPassword2').val()) == ''){
			   alert("새 비밀번호를 입력하세요");
			   $('#InputPassword2').focus();
			   
			   return;
		}
		if($.trim($('#InputPassword3').val()) == ''){
			   alert("새 비밀번호를 한번 더 입력해주세요");
			   $('#InputPassword3').focus();
			   
			   return;
		}
		if($('#InputPassword1').val() != '${ user.getPwd() }') {
			alert("현재 비밀번호가 일치하지 않습니다.");
			$('#InputPassword1').focus();
			
			return;
		}
		if($('#InputPassword2').val() != $('#InputPassword3').val()) {
			alert("새 비밀번호가 일치하지 않습니다.");
			$('#InputPassword2').focus();
			
			return;
		}
		
		if(confirm("비밀번호 변경 하시겠습니까?")) {
			alert("비밀번호가 변경되었습니다!\n확인 해주시기 바랍니다.");
			pwdCheckForm.submit();
		} else {
			return;
		}
	}
</script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css2?family=Spectral:ital,wght@0,200;0,300;0,400;0,500;0,700;0,800;1,200;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="${nimo}/resources/css/animate.css">
    
    <link rel="stylesheet" href="${nimo}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${nimo}/resources/css/owl.theme.default.min.css">
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
				<form name="pwdCheckForm" action="./adminUserResetPasswordSuccess" method="post" id="checkForm"> 
				  <s:csrfInput />
				  <fieldset>
				    <legend class="text-center">비밀번호 변경</legend>
				    <label for="InputId">가져온 ID</label>
				    <input type="text" name="id" value="${ user.getId() }" readonly>
				    <div class="form-group">
				      <label for="InputPassword1">현재 비밀번호</label>
				      <input type="text" class="form-control" placeholder="현재 비밀번호" id="InputPassword1" name="pwdOld" value="${ user.getPwd() }" readonly >
				      <small id="pwHelp" class="form-text text-muted">개인정보 보호를 위해 비밀번호를 다시 한 번 입력해주세요.</small>
				    </div>
				    <div class="form-group">
				      <label for="InputPassword2">새 비밀번호</label>
				      <input type="password" class="form-control" id="InputPassword2" placeholder="새 비밀번호" name="pwd" value="" autofocus >
				    </div>
				    <div class="form-group">
				      <label for="InputPassword3">새 비밀번호 확인</label>
				      <input type="password" class="form-control" id="InputPassword3" placeholder="새 비밀번호 확인" name="pwd_check" value="" >
				    </div>
					<div class="text-center">
					  <button type="button" class="btn btn-primary" onclick="userPwdCheck();">완료</button>
					  <button type="button" class="btn btn-secondary" onclick="location.href='./adminUserDetail?id=${ user.getId() }&page=${ scri.page }&perPageNum=${ scri.perPageNum }&searchType=${scri.searchType}&keyword=${scri.keyword}'">뒤로</button>
					</div>
				  </fieldset>
				</form>
			</div>
			<div class="col-md-3"></div>
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
	
	<script src="${nimo}/resources/js/userLogin.js"></script>

</body>
</html>