<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@page import="org.springframework.ui.Model"%>
<%@page import="org.springframework.ui.ModelMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.co.nimo.showroom.ShowRoomVO" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>쇼룸 거실 상세</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css2?family=Spectral:ital,wght@0,200;0,300;0,400;0,500;0,700;0,800;1,200;1,300;1,400;1,500;1,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="/nimo/resources/css/animate.css">

<link rel="stylesheet" href="/nimo/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="/nimo/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/nimo/resources/css/magnific-popup.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.min.css">


<link rel="stylesheet" href="/nimo/resources/css/flaticon.css">
<link rel="stylesheet" href="/nimo/resources/css/style.css">
</head>
<body>
	<!-- header -->
	<%@ include file="/views/header.jsp"%>

	<section class="ftco-section">
		<div class="container">
			<div class="row d-flex">
				<c:forEach items="${showRoomList}" var="showRoomList">
					<div class="col-lg-12 d-flex align-items-stretch ftco-animate">
						<div class="blog-entry d-md-flex">
							<a href="showRoomDetail.ni?show_name=${showRoomList.show_name}" class="block-20 img"
								style="background-image: url('${showRoomList.show_img}');"> </a>
							<div class="text p-4 bg-light">

								<h3 class="heading mb-3">
									<a href="showRoomDetail.ni?show_name=${showRoomList.show_name}">${showRoomList.show_name}</a>
								</h3>
								<input type="hidden" name="furns" value="${showRoomList.show_furs_code}">
								<p>${showRoomList.show_detail}</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<%@ include file="../footer.jsp"%>
	

</body>
</html>