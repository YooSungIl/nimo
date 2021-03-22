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


	<!-- 로그인 -->
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-10 ftco-animate">

					<!-- login form -->
					<form action="making" class="billing-form" method="get">

						<div class="form-group">
							<label for="login_id">아 이 디</label> <input type="text"
								class="form-control" name="id" id="login_id"
								placeholder="이메일 주소를 입력해주세요." />
						</div>


						<div class="form-group">
							<label for="login_pwd">비밀 번호</label> <input type="password"
								class="form-control" name="pwd" id="login_pwd"
								placeholder="비밀번호를 입력해주세요." />
						</div>

						
						<div class="form-group">
							<input type="text" class="form-control" id="join_addr_detail"
								name="address_detail" placeholder="상세주소" />
						</div>
						<div class="form-group">
							<input type="button" class="btn btn-primary py-2 px-4 col-md-8"
								id="join_addr_btn" value="우편번호 찾기" />
						</div>
						<div class="form-group">
							<input type="submit"
								class="btn btn-primary py-3 px-4 col-md-8"
								value="로 그 인" />
						</div>

						<div class="form-group">
							<label for="join_addr_btn">주소</label> <input type="text"
								class="form-control" id="join_addr_postcode"
								name="address_postcode" placeholder="우편번호" readonly />
						</div>



						<div class="form-group">
							<input type="text" class="form-control" id="join_addr_address"
								name="address_road" placeholder="도로명 주소" readonly />

						</div>


						<div class="form-group">
							<input type="text" class="form-control" id="join_addr_jibun"
								placeholder="지번 주소" readonly />
						</div>

						<div class="form-group">
							<span id="guide" name="guide" style="color: #999; display: none"></span>
						</div>




					
						<div class="form-group">
							<input type="text" class="form-control" id="join_addr_extra"
								name="address_extra" placeholder="참고항목" readonly />
						</div>
						
						
							<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
							<div id="layer"
							style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
								<img src="//t1.daumcdn.net/postcode/resource/images/close.png" 
								style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
								id="closeDaumPostcode" alt="닫기 버튼" />
							</div>


					</form>
					
				</div>
			</div>
			<!-- .col-md-8 -->
		</div>
	</section>


	<!-- <c:if test="${not empty msg}">
		<div class="msg">${msg}</div>
	</c:if> -->

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
	<script src="${nimo}/resources/js/main.js"></script>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${nimo}/resources/js/making.js"></script>


</body>
</html>