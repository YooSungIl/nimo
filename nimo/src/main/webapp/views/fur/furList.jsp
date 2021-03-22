<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="nimo" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
      				<a class="nav-link active" href="/nimo/fur/nimo/furList">의자</a>
    			</li>
   				<li class="nav-item">
      				<a class="nav-link" href="/nimo/fur/nimo/furListBed">침대</a>
    			</li>
  			</ul>
		</nav>
	
  	<section class="ftco-section ftco-no-pb">
  	<div class="container">
  		<div class="row justify-content-center pb-5">
          	<div class="col-md-7 heading-section text-center ftco-animate">
          		<span class="subheading">nimo</span>
           		<h2>의자 골라골라</h2>
          	</div>
          	
      	</div>
       
        <form class="form-inline" action="/nimo/fur/nimo/furList?pagenum=${ pagenum }&price=${ price }">
        <c:choose>
        	<c:when test="${ price eq 1 }">
        		<a href="/nimo/fur/nimo/furList?pagenum=${ p }&price=2&search=${ search }" class="btn-custom">가격순 <span class="fa fa-long-arrow-down"></span></a>
        	</c:when>
        	<c:otherwise>
        		<a href="/nimo/fur/nimo/furList?pagenum=${ p }&price=1&search=${ search }" class="btn-custom">가격순 <span class="fa fa-long-arrow-up"></span></a>
        	</c:otherwise>
        </c:choose>
    		<input class="form-control" type="text" value="${ search }" name="search">
    		<button class="btn btn-success" type="submit">Search</button>
    		
  		</form>
        <hr>
					
					<div class="row" id="li">
					<c:forEach var="c" items="${ list }">
					<c:set var="image_main" value="${fn:split(c.fur_image,',')[0]}" />
						<div class="col-md-3 d-flex">
							<div class="product ftco-animate">
								<div class="img d-flex align-items-center justify-content-center" style="background-image: url(/nimo/resources/furImages/${ image_main });">
									<div class="desc">
										<p class="meta-prod d-flex">
											<a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-shopping-bag"></span></a>
											&nbsp;&nbsp;<a href="/nimo/fur/nimo/furDetail?fur_code=${ c.fur_code }" class="d-flex align-items-center justify-content-center"><span class="flaticon-visibility"></span></a>
										</p>
									</div>
								</div>
								<div class="text text-center">
									<c:if test="${ c.fur_option ne '1' }">
									<span class="sale">Sale</span>
									</c:if>
									<span class="category">${ c.fur_category }</span>
									<h2>${ c.fur_name }</h2>
									<c:choose>
										<c:when test="${ c.fur_option ne '1' }">
											<c:set var="dis" value="${ c.fur_option }" />
											<fmt:formatNumber value="${dis}" type="number" var="numberType" />
											<p class="mb-0"><span class="price price-sale"><fmt:formatNumber value="${c.fur_price}" pattern="#,###,###" /></span>
											<span class="price"><fmt:formatNumber value="${c.fur_price *dis}" pattern="#,###,###" />원</span></p>
										</c:when>
										<c:otherwise>
											<p class="mb-0"><span class="price"><fmt:formatNumber value="${c.fur_price}" pattern="#,###,###" />원</span></p>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</c:forEach>
					</div>
					<c:set var="n" value="${ pagenum }" />
					<ul class="pagination justify-content-center">
						<c:if test="${n ne page.startpage}">
							<li class="page-item"><a class="page-link" href="/nimo/fur/nimo/furList?pagenum=${ n -1 }&price=${ price }&search=${ search }">Prev</a></li>
						</c:if>
						<c:if test="${n eq page.startpage}">
							<li class="page-item"><a class="page-link" disabled>Prev</a></li>
						</c:if>
						<c:forEach var="p" begin="${ page.startpage }" end="${ page.endpage }" step="1">
    						<c:choose>
    							<c:when test="${ p eq n }">
    								<li class="page-item active"><a class="page-link" >${ p } </a></li>
    							</c:when>
    							<c:otherwise>
    								<li class="page-item"><a class="page-link" href="/nimo/fur/nimo/furList?pagenum=${ p }&price=${ price }&search=${ search }">${ p } </a></li>
    							</c:otherwise>
    						</c:choose>
  						</c:forEach>
  						<c:if test="${n ne page.endpage}">
  							<li class="page-item"><a class="page-link" href="/nimo/fur/nimo/furList?pagenum=${ n +1 }&price=${ price }&search=${ search }">Next</a></li>
  						</c:if>
  						<c:if test="${n eq page.endpage}">
  							<li class="page-item"><a class="page-link" disabled>Next</a></li>
  						</c:if>
  					</ul><br>
  					
  			
 	</div>
 	</section>
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
 <!--  <script>

  	$.ajax({
  		type :'POST',
  		url : "/nimo/fur/nimo/furList?pagenum=${ p }&price=${ price }&search=${ search }",
  		data : serData,
  		dataType : "json",
  		success : function(obj) {
  			showList(obj);
  		},
  		complete : function(xhr,status) {
  			
  		},
  		error : function(xhr,status,error) {
  			console.log(error)
  		}
  	});
  	
  	function showList(obj) {
  		var div = document.querySelector('#li');
  	}
  </script> -->
    
  </body>
</html>