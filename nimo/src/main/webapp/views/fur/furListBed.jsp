<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="nimo" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
  <head>
    <title>Liquor Store - Free Bootstrap 4 Template by Colorlib</title>
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

    <meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

  	<style>
  		#aaa { top:60px; }
  	</style>
  </head>
  <body>
    <!-- header -->
	<%@ include file="/views/header.jsp" %>
	
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top" id="aaa">
  			<ul class="navbar-nav">
    			<li class="nav-item">
      				<a class="nav-link" href="/nimo/fur/nimo/furList">의자</a>
    			</li>
   				<li class="nav-item">
      				<a class="nav-link active" href="/nimo/fur/nimo/furListBed">침대</a>
    			</li>
  			</ul>
  			<form class="form-inline my-2 my-lg-0" action="/action_page.php">
    			<input class="form-control mr-sm-2" type="text" placeholder="Search">
    			<button class="btn btn-success" type="submit">Search</button>
  			</form>
		</nav>
	<br><br><br>
  	<div class="container">
  		<div class="row justify-content-center pb-5">
          				<div class="col-md-7 heading-section text-center ftco-animate">
          					<span class="subheading">nimo</span>
           					<h2>침대 골라골라</h2>
          				</div>
        			</div>
					
					<div class="row">
					<c:forEach var="c" items="${ list }">
						<div class="col-md-3 d-flex">
							<div class="product ftco-animate">
								<div class="img d-flex align-items-center justify-content-center" style="background-image: url(/nimo/resources/furImages/${ c.fur_image });">
									<div class="desc">
										<p class="meta-prod d-flex">
											<a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-shopping-bag"></span></a>
											&nbsp;&nbsp;<a href="/nimo/fur/nimo/furDetail?fur_num=${ c.fur_num }" class="d-flex align-items-center justify-content-center"><span class="flaticon-visibility"></span></a>
										</p>
									</div>
								</div>
								<div class="text text-center">
									<span class="sale">Sale</span>
									<span class="category">의자</span>
									<h2>다크 스마트 의자</h2>
									<p class="mb-0"><span class="price price-sale">${ c.fur_price }원</span> <span class="price">40000원</span></p>
								</div>
							</div>
						</div>
					</c:forEach>
					</div>
 	</div>
	<!-- footer ----------------------------------------------------------->
   <%@ include file="/views/footer.jsp" %>
  
  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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
    
  </body>
</html>