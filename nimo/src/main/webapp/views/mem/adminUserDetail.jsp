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
 		function updateCheck() {
			var userUpdateForm = $('#updateForm');
			
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
			if(confirm("입력된 정보로 수정하시겠습니까?")) {
				userUpdateForm.submit();
			} else {
				return;
			}
	}
</script>
<script type="text/javascript">
	function userPwdCheck() {
		
		if($.trim($('#InputPassword1').val()) == ''){
			   alert("현재 비밀번호를 입력하세요");
			   $('#InputPassword1').focus();
			   
			   return;
		}
		if($.trim($('#InputPassword2').val()) == ''){
			   alert("비밀번호 확인을 입력하세요");
			   $('#InputPassword2').focus();
			   
			   return;
		}
		if($('#InputPassword1').val() != $('#InputPassword2').val()) {
			alert("비밀번호가 일치하지 않습니다.");
			$('#InputPassword2').focus();
			
			return;
		} 
	    else if(confirm("비밀번호 변경 하시겠습니까?")) {
	    	var header = $("meta[name='_csrf_header']").attr('content');
	    	var token = $("meta[name='_csrf']").attr('content');
	    	
	    	console.log("ajax 전");
            $.ajax({
               type: 'post',
               url: 'userResetPasswordSuccess',
               dataType: 'json',
               contentType: "application/json; charset=utf-8;",
               data: JSON.stringify({
                        id: $("#InputId").val(),
                        pwd: $("#InputPassword1").val(),
                     }), 
				beforeSend : function(xhr) {
         				xhr.setRequestHeader(header, token);
				},
               success: function(data) {
                  console.log("post 수행 후 Response 수신 성공!");
                  console.log(data);
                  
                  if(data == "1") {
                     alert("개인 정보 수정이 완료되었습니다.")
                     location.href = "adminUserDetail?id=" + '${user.getId()}' + "&page=" + '${ scri.page }' + "&perPageNum=" + '${ scri.perPageNum }'+ "&searchType=" + '${scri.searchType}' + "&keyword=" + '${scri.keyword}';
                  } else if(data == "0") {
                     alert("개인 정보 수정이 실패하였습니다.");
                     return;
                  }
               },
               error: function(e) {
                  console.log("에러 발생!");
                  console.log(e);
               }
            });
    	} else {
			return;
		}
	};
</script>
<script type="text/javascript">
function deleteCheck(){
	    
	    if(confirm("탈퇴시키겠습니까? 계정이 완전 삭제됩니다.")) {
	    	var header = $("meta[name='_csrf_header']").attr('content');
	    	var token = $("meta[name='_csrf']").attr('content');
	    	
	    	console.log("ajax 전");
            $.ajax({
               type: 'post',
               url: 'adminUserDeleteDetail', 
               dataType: 'json',
               contentType: "application/json; charset=utf-8;",
               data: JSON.stringify({
                        id: $("#InputId").val(),
                        pwd: $("#InputPassword1").val(),
                     }), 
				beforeSend : function(xhr) {
         				xhr.setRequestHeader(header, token);
				},
               success: function(data) {
                  console.log("post 수행 후 Response 수신 성공!");
                  console.log(data);
                  
                  if(data == "1") {
                     alert("ID가 삭제 되었습니다.")
                     location.href = "adminUserList?page=" + '${ scri.page }' + "&perPageNum=" + '${ scri.perPageNum }'+ "&searchType=" + '${scri.searchType}' + "&keyword=" + '${scri.keyword}';
                  } else if(data == "0") {
                     alert("ID 삭제 실패하였습니다.");
                     return;
                  }
               },
               error: function(e) {
                  console.log("에러 발생!");
                  console.log(e);
               }
            });
    	} else {
			return;
		}
	};
</script>
<%-- <script type="text/javascript">
	function deleteCheck(id) {
		if(confirm("ID : "+ id +" 탈퇴 시키겠습니까?")) {
			location.href='./adminUserDelete';	
		} else {
			return;
		}
	}
</script> --%>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
<!-- default header name is X-CSRF-TOKEN -->
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />

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


	<section class="ftco-section">
<div class="container">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6 p-3">
				<form name="userUpdateForm" action="./adminUserUpdateSuccess" method="post" id="updateForm">
				  <s:csrfInput />
				  <fieldset>
				    <legend class="text-center">정보수정</legend>
					<div class="form-group">
					  <label for="InputId">아이디</label>
					  <input type="text" class="form-control" id="InputId" name="id" value="${ user.getId() }" readonly>
					</div>
					<div class="form-group">
				      <label for="InputPassword1">비밀번호</label>
				      <input type="text" class="form-control" id="InputPassword1" name="pwd" value="${ user.getPwd() }" >
				    </div>
				    <div class="form-group">
				      <label for="InputPassword2">비밀번호 확인</label>
				      <input type="text" class="form-control" id="InputPassword2" placeholder="비밀번호 확인" name="pwd_check" value="" >
				      <small id="pwHelp" class="form-text text-muted">비밀번호를 한 번 더 입력해주세요.</small>
				      <button type="button" class="btn btn-primary" onclick="userPwdCheck()">비밀번호 변경</button>
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
					<div class="form-group">
        				<label for="InputStat">계정 활성화</label>
      					<select name="stat" class="form-control" id="InputStat" >
			  				<option selected="selected" disabled="disabled" >--선택--</option>
							<option value="Y" <c:if test="${ user.getStat() eq 'Y'}">selected</c:if>>Y</option>
							<option value="N" <c:if test="${ user.getStat() eq 'N'}">selected</c:if>>N</option>
						</select>
    				</div>
					<%-- <div class="form-group">
        				<label for="InputPlatform">플렛폼</label>
      					<select name="platform" class="form-control" id="InputPlatform" >
			  				<option selected="selected" disabled="disabled" >--선택--</option>
							<option value="naver" <c:if test="${ user.getPlatform() eq 'naver'}">selected</c:if>>naver</option>
							<option value="kakao" <c:if test="${ user.getPlatform() eq 'kakao'}">selected</c:if>>kakao</option>
							<option value="google" <c:if test="${ user.getPlatform() eq 'google'}">selected</c:if>>google</option>
							<option value="nimo" <c:if test="${ user.getPlatform() eq 'nimo'}">selected</c:if>>nimo</option>
						</select>
    				</div> --%>
    				<s:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_SUPER')">
					<div class="form-group">
        				<label for="InputRole">권한</label>
      					<select name="role" class="form-control" id="InputRole" >
			  				<option selected="selected" disabled="disabled" >--선택--</option>
							<option value="ROLE_USER" <c:if test="${ user.getRole() eq 'ROLE_USER'}">selected</c:if>>ROLE_USER</option>
							<option value="ROLE_ADMIN" <c:if test="${ user.getRole() eq 'ROLE_ADMIN'}">selected</c:if>>ROLE_ADMIN</option>
							<s:authorize access="hasRole('ROLE_SUPER')">
							<option value="ROLE_SUPER" <c:if test="${ user.getRole() eq 'ROLE_SUPER'}">selected</c:if>>ROLE_SUPER</option>
							</s:authorize>
						</select>
    				</div>
    				</s:authorize>
					<div class="form-group">
					  <label for="InputReg_date">가입일</label>
					  <input type="text" class="form-control" id="InputReg_date" name="reg_date" value="${ user.getReg_date() }" readonly>
					</div>
					<div class="text-center">
					  <button type="button" class="btn btn-primary" onclick="updateCheck()">수정완료</button>
					  <button type="button" class="btn btn-secondary" onclick="location.href='./adminUserList?id=${ user.getId() }&page=${ scri.page }&perPageNum=${ scri.perPageNum }&searchType=${scri.searchType}&keyword=${scri.keyword}'">뒤로</button>
					  <button type="button" class="btn btn-primary" onclick="deleteCheck()">회원탈퇴</button>
					</div>
				  </fieldset>
				</form>
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>
	
	<div>
   		장바구니
   		<button type="button" class="btn btn-primary" onclick="javascipt:location.href='.'">더 보기</button>
   	</div>
   	<div>
   		구매내역
   		<button type="button" class="btn btn-primary" onclick="javascipt:location.href='.'">더 보기</button>
   	</div>
   	<div>
   		탈퇴하시겠습니까?
   		<button type="button" class="btn btn-primary" onclick="javascipt:location.href='.'">탈퇴</button>
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