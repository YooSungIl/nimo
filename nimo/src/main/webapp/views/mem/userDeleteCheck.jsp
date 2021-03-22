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
<script type="text/javascript">
function checkPwd(){
	    
	    if($.trim($('#InputPassword').val()) == ''){
			   alert("비밀번호를 입력하세요");
			   $('#InputPassword1').focus();
			   
			   return;
		} else {
			var header = $("meta[name='_csrf_header']").attr('content');
			var token = $("meta[name='_csrf']").attr('content');
	    	
			console.log("ajax 전");
			$.ajax({
				type: 'post',
				url: 'userDeleteSuccess', 
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

					if (data == -1) {
						
						alert("현재 비밀번호가 일치하지 않습니다.");
						$('#InputPassword').focus();
						return;
						
					} else {
						
						if(confirm("탈퇴하시겠습니까?/n id는 7일간 비활성화 후 완전 삭제됩니다.")) {
							
							if(data == "1") {
								
								alert("ID가 비활성화 되었습니다.")
								$("#checkForm").submit();
								
							} else if(data == "0") {
								
								alert("ID 삭제 실패하였습니다.");
								return;
								
							}
							
						} else{
							
                			return;
                			
						}
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
	 if(data == "1") {
         alert("ID가 비활성화 되었습니다.")
         $("#checkForm").submit();
      } else if(data == "0") {
         alert("ID 삭제 실패하였습니다.");
         return;
      }
</script>
<script type="text/javascript">
	function btnClick(formName) {
		formName.submit();
	};
</script>

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

.ftco-section {
	padding: 17em 0 !important;
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

</head>
<body>

	<!-- header -->
	<%@ include file="/views/header.jsp"%>
	
	
	<section class="ftco-section">
	<div class="container">
		<div class="row">
		<div class="col-xl-8 ftco-animate">
		
			<div class="col-md-12 p-3 tCenter">
				<form name="pwdCheckForm" action="logout" method="post"
					id="checkForm">
					<s:csrfInput />
					<h3 class="mb-4 billing-heading">탈퇴 인증</h3>
					<fieldset>
						<div class="form-group">
							<input type="hidden" class="form-control center" id="InputId" name="id"
								value="${ id }">
						</div>
						<div class="form-group">
							<label for="InputPassword">비밀번호</label> <input type="password"
								class="form-control center" id="InputPassword1" placeholder="비밀번호"
								name="pwd" value="" autofocus>
						</div>
						<div class="text-center">
							<button type="button" class="btn btn-primary"
								onclick="checkPwd()">완료</button>
							<button type="button" class="btn btn-secondary"
								onclick="location.href='userUpdateForm'">취소</button>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
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

</body>
</html>