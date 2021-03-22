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
<!--     민 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  	민  -->
  	<style>
 	.carousel-inner img {width: 100%; height: 100%;}
 	body {position: relative;}
 	#aaa {text-decoration: line-through; color: #cccccc; text-align:right;}
 	#ccc {float:right;}
 	.bg-target {z-index: 0 !important;}
  	</style>
  </head>
  <body data-spy="scroll" data-target=".navbar" data-offset="50">
   
   	<!-- header -->
	<%@ include file="/views/header.jsp" %>
	
	
		<section class="ftco-section ftco-no-pb">
		<div class="container"><br><br>
			<div class="row">
				<div class="col-sm-12 col-md">
					<div id="demo" class="carousel slide" data-ride="carousel">
 						<!-- Indicators -->
  						<ul class="carousel-indicators">
  							<c:forTokens items="${ detail.fur_image }" delims="," var="image" varStatus="s">
  							<c:if test="${ s.first }">
    						<li data-target="#demo" data-slide-to="${ s.index }" class="active"></li>
    						</c:if>
    						<c:if test="${ not s.first }">
    						<li data-target="#demo" data-slide-to="${ s.index }"></li>
    						</c:if>
    						</c:forTokens>
  						</ul>
  						
  
  						<!-- The slideshow -->
  						<div class="carousel-inner">
  							<c:forTokens items="${ detail.fur_image }" delims="," var="image" varStatus="s">
    						<c:if test="${ s.first }">
    						<div class="carousel-item active">
    							<img src="/nimo/resources/furImages/${ image }">
    						</div>
    						</c:if>
    						<c:if test="${ not s.first }">
    						<div class="carousel-item">
    							<img src="/nimo/resources/furImages/${ image }">
    						</div>	
    						</c:if>
    						</c:forTokens>
  						</div>
  
  						<!-- Left and right controls -->
  						<c:forTokens items="${ detail.fur_image }" delims="," var="image" varStatus="s">
  							<c:if test="${ s.index eq 1 }">
  							<a class="carousel-control-prev" href="#demo" data-slide="prev">
    							<span class="carousel-control-prev-icon"></span>
  							</a>
  							<a class="carousel-control-next" href="#demo" data-slide="next">
    							<span class="carousel-control-next-icon"></span>
  							</a>
  							</c:if>
  						</c:forTokens>
 
					</div><br>
					<div class="imgs_wrap">
   						<c:forTokens items="${ detail.fur_image }" delims="," var="image" varStatus="s">
   							<c:if test="${ s.first }">
   								<img data-target="#demo" data-slide-to="${ s.index }" class="active" src="/nimo/resources/furImages/${ image }" width="19%">
   							</c:if>
   							<c:if test="${ not s.first }">
   								<img data-target="#demo" data-slide-to="${ s.index }" src="/nimo/resources/furImages/${ image }" width="19%">
   							</c:if>
   						</c:forTokens>
   					</div><br><br>
				</div>
				<div class="col-md-6 wrap-about pl-md-5 ftco-animate">
					<form id="order">
					<div class="heading-section">
						<h1 class="mb-4">${ detail.fur_name }</h1>
						<p class="year">
						<c:set var="dis" value="${ detail.fur_option }" />
						<fmt:formatNumber value="${dis}" type="number" var="numberType" />
						<c:choose>
							<c:when test="${ dis eq '1' }">
								<strong class="number"><fmt:formatNumber value="${detail.fur_price}" pattern="#,###,###" /> 원</strong>
	            			</c:when>
	            			<c:when test="${ dis eq '0.9' }">
	            				<span>10% 할인가!! </span>
	            				<span id="aaa"><fmt:formatNumber value="${detail.fur_price}" pattern="#,###,###" /></span>
	            				<strong class="number" data-number="${ detail.fur_price *dis }">0</strong>
	            				<span>원</span>
	            			</c:when>
	            			<c:when test="${ dis eq '0.7' }">
	            				<span>30% 할인가!! </span>
	            				<span id="aaa"><fmt:formatNumber value="${detail.fur_price}" pattern="#,###,###" /></span>
	            				<strong class="number" data-number="${ detail.fur_price *dis }">0</strong>
	            				<span>원</span>
	            			</c:when>
	            			<c:when test="${ dis eq '0.5' }">
	            				<span>50% 할인가!! </span>
	            				<span id="aaa"><fmt:formatNumber value="${detail.fur_price}" pattern="#,###,###" /></span>
	            				<strong class="number" data-number="${ detail.fur_price *dis }">0</strong>
	            				<span>원</span>
	            			</c:when >
	            		</c:choose>
	            		</p><hr>
	            		<select class="form-control" id="selectBox">
	            			<option value="option0">사이즈</option>
	 						<option value="option1">small</option>
	 						<option value="option2">medium</option>
	 						<option value="option3">large</option>
	            		</select><hr>
	            	<div class="layer1" style="display:none">
	            		${ detail.fur_name } - small
	            		<button type='button' class='close'  onclick='del(1);' >
							<span aria-hidden='true'><i class='fa fa-close'></i></span>
						</button><br><br>
						<div>
						<div class="form-check-inline col-6">
	            			<span class="input-group-btn mr-2">
								<button type="button" class="quantity-left-minus btn" data-type="minus" onclick="minus(1)">
									<i class="fa fa-minus"></i>
								</button>
							</span>
							<input type="text" id="quantity1" name="quantity1" class="quantity form-control input-number" value="0" min="0" max="100">
							<span class="input-group-btn ml-2">
								<button type="button" class="quantity-right-plus btn" data-type="plus" onclick="plus(1)">
									<i class="fa fa-plus"></i>
								</button>
							</span>
						</div>
						<div class="form-check-inline col-5" style="float:right;">
							<input type="hidden" id="price1" value="0">
							<input type="text" id="pri1" class="form-control" value="0" disabled>
							<span>원</span>
						</div>
						</div>
						
						<hr>							
	            	</div>
	            	<div class="layer2" style="display:none">
	            		${ detail.fur_name } - medium
	            		<button type='button' class='close'  onclick='del(2);' >
							<span aria-hidden='true'><i class='fa fa-close'></i></span>
						</button><br><br>
						<div>
						<div class="form-check-inline col-6">
	            			<span class="input-group-btn mr-2">
								<button type="button" class="quantity-left-minus btn" data-type="minus" onclick="minus(2)">
									<i class="fa fa-minus"></i>
								</button>
							</span>
							<input type="text" id="quantity2" name="quantity1" class="quantity form-control input-number" value="0" min="0" max="100">
							<span class="input-group-btn ml-2">
								<button type="button" class="quantity-right-plus btn" data-type="plus" onclick="plus(2)">
									<i class="fa fa-plus"></i>
								</button>
							</span>
						</div>
						<div class="form-check-inline col-5" style="float:right;">
							<input type="hidden" id="price2" value="0">
							<input type="text" id="pri2" class="form-control" value="0" disabled>
							<span>원</span>
						</div>
						</div>
						
						<hr>							
	            	</div>
	            	<div class="layer3" style="display:none">
	            		${ detail.fur_name } - large
	            		<button type='button' class='close'  onclick='del(3);' >
							<span aria-hidden='true'><i class='fa fa-close'></i></span>
						</button><br><br>
						<div>
						<div class="form-check-inline col-6">
	            			<span class="input-group-btn mr-2">
								<button type="button" class="quantity-left-minus btn" data-type="minus" onclick="minus(3)">
									<i class="fa fa-minus"></i>
								</button>
							</span>
							<input type="text" id="quantity3" name="quantity3" class="quantity form-control input-number" value="0" min="0" max="100">
							<span class="input-group-btn ml-2">
								<button type="button" class="quantity-right-plus btn" data-type="plus" onclick="plus(3)">
									<i class="fa fa-plus"></i>
								</button>
							</span>
						</div>
						<div class="form-check-inline col-5" style="float:right;">
							<input type="hidden" id="price3" value="0">
							<input type="text" id="pri3" class="form-control" value="0" disabled>
							<span>원</span>
						</div>
						</div>
						
						<hr>							
	            	</div>
	            	<div class="layer4">
	            		<div class="form-check-inline col-6">
	            			총 구매 금액 <br><br>
	            			<input type="hidden" id="total" value=''>
	            		</div>
	            		<div class="form-check-inline col-5" style="float:right;">
	            			<input type="text" id="totalpri" class="form-control" value='0' disabled>원
	            		</div><hr>	
	      			</div>
	            	</div>
						<input class="form-control" type="button" value="구매하기"><br>
						<input class="form-control" type="button" value="장바구니">
					</form>
				</div>
			</div>
		</div>
		</section>
		<section class="ftco-section ftco-no-pb">
         <div class="container">
            <div class="row justify-content-center mb-5">
          		<div class="col-md-7 heading-section text-center ftco-animate">
            		<h2>연관 상품들</h2>
         		</div>
        	</div>
            <div class="row">
               <div class="col-lg-2 col-md-4  col-6">
                  <div class="sort w-100 text-center ftco-animate">
                     <div class="img" style="background-image: url(${nimo}/resources/images/kind-1.jpg);"></div>
                     <h3>Brandy</h3>
                  </div>
               </div>
               <div class="col-lg-2 col-md-4 col-6">
                  <div class="sort w-100 text-center ftco-animate">
                     <div class="img" style="background-image: url(${nimo}/resources/images/kind-2.jpg);"></div>
                     <h3>Gin</h3>
                  </div>
               </div>
               <div class="col-lg-2 col-md-4 col-6">
                  <div class="sort w-100 text-center ftco-animate">
                     <div class="img" style="background-image: url(${nimo}/resources/images/kind-3.jpg);"></div>
                     <h3>Rum</h3>
                  </div>
               </div>
               <div class="col-lg-2 col-md-4 col-6">
                  <div class="sort w-100 text-center ftco-animate">
                     <div class="img" style="background-image: url(${nimo}/resources/images/kind-4.jpg);"></div>
                     <h3>Tequila</h3>
                  </div>
               </div>
               <div class="col-lg-2 col-md-4 col-6">
                  <div class="sort w-100 text-center ftco-animate">
                     <div class="img" style="background-image: url(${nimo}/resources/images/kind-5.jpg);"></div>
                     <h3>Vodka</h3>
                  </div>
               </div>
               <div class="col-lg-2 col-md-4 col-6">
                  <div class="sort w-100 text-center ftco-animate">
                     <div class="img" style="background-image: url(${nimo}/resources/images/kind-6.jpg);"></div>
                     <h3>Whiskey</h3>
                  </div>
               </div>

            </div>
         </div><br><br><br>
      	</section>
		
 			<nav class="navbar navbar-expand-sm ftco-navbar-light bg-target">  
  			<ul class="navbar-nav">
    			<li class="nav-item">
     				<a class="nav-link" href="#section1">제품상세</a>
    			</li>
    			<li class="nav-item">
      				<a class="nav-link" href="#section2">교환 / 환불</a>
    			</li>
    			<li class="nav-item">
      				<a class="nav-link" href="#section3">리 뷰</a>
    			</li>
  			</ul>
			</nav>
		<section class="ftco-section ftco-no-pb">
		<div class="container">
			<div id="section1" class="container-fluid bg-muted" style="padding-top:70px;padding-bottom:70px">
  				<div class="row justify-content-center mb-5">
          			<div class="col-md-7 heading-section text-center ftco-animate">
             			<span class="subheading">행복을 만드는 nimo</span>
            			<h2>제품 상세</h2>
         			</div>
        		</div>
        					<c:if test="${ detail.fur_subimage1 ne null }">
        					<div class="row mb-5">
								<div class="col-sm-12 col-md">
             						<div class="carousel-inner">
             							<img src="${nimo}/resources/furImages/${ detail.fur_subimage1 }">
                					</div>
                				</div>
                				<div class="col-sm-12 col-md">
              						<div class="text p-4 bg-light">
                						<h3 class="heading mb-3">${ detail.fur_subdetail1_1 }</h3>
                						<p>${ detail.fur_subdetail1_2 }</p>
              						</div>
            					</div>
         					</div>
         					</c:if>
         					
         					<c:if test="${ detail.fur_subimage2 ne null }">
         					<div class="row mb-5">
								<div class="col-sm-12 col-md">
             						<div class="carousel-inner">
             							<img src="${nimo}/resources/furImages/${ detail.fur_subimage2 }">
                					</div>
                				</div>
                				<div class="col-sm-12 col-md">
              						<div class="text p-4 bg-light">
                						<h3 class="heading mb-3">${ detail.fur_subdetail2_1 }</h3>
                						<p>${ detail.fur_subdetail2_2 }</p>
              						</div>
            					</div>
         					</div>
         					</c:if>
         					
         					<c:if test="${ detail.fur_subimage3 ne null }">
         					<div class="row mb-5">
								<div class="col-sm-12 col-md">
             						<div class="carousel-inner">
             							<img src="${nimo}/resources/furImages/${ detail.fur_subimage3 }">
                					</div>
                				</div>
                				<div class="col-sm-12 col-md">
              						<div class="text p-4 bg-light">
                						<h3 class="heading mb-3">${ detail.fur_subdetail3_1 }</h3>
                						<p>${ detail.fur_subdetail3_2 }</p>
              						</div>
            					</div>
         					</div>
         					</c:if>
  							
  				
			</div>
			<div id="section2" class="container-fluid bg-warning" style="padding-top:70px;padding-bottom:70px">
  				<div class="row justify-content-center mb-5">
          			<div class="col-md-7 heading-section text-center ftco-animate">
            			<h2>교환 / 환불 규정</h2>
            			<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
         				<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
         			</div>
        		</div>
			</div>
			<div id="section3" class="container-fluid bg-muted" style="padding-top:70px;padding-bottom:70px">
				<div class="row justify-content-center mb-5">
          			<div class="col-md-7 heading-section text-center ftco-animate">
            			<h2>리 뷰</h2>
            			<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
         			</div>
        		</div>
			</div>
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
  <script>
  $('#selectBox').change(function() {
		var state = jQuery('#selectBox option:selected').val();
		if ( state == 'option1' ) {
			$(".layer1").show();
		}  else if ( state == 'option2' ) {
			$(".layer2").show();
		} else if ( state == 'option3' ) {
			$(".layer3").show();
		}
		
	});
  </script>
  <script>
  	function del(num) {
  		$(".layer" + num).hide();
  		$("#quantity" + num).val('0');
  		$('#price' + num).val('0');
  		$('#pri' + num).val('0');
  		prizero(num);
  	}
  </script>
  <script>
  	window.onpageshow = function(event) {
  		if (event.persisted) {
  			del(1);
  			del(2);
  			del(3);
  		}
  	}
  </script>
  <script>
  function plus(num) {
	  var totalprice = parseInt($('#price1').val()) + parseInt($('#price2').val()) + parseInt($('#price3').val());
	  var quantity = parseInt($('#quantity' + num).val());
	  quantity = quantity + 1;
	  $('#quantity' + num).val(quantity);
	  var price = parseInt(${detail.fur_price * dis});
	  $('#price' + num).val(parseInt($('#price' + num).val()) + price);
	  $('#pri' + num).val(FormatNumber(parseInt($('#price' + num).val())));
	  totalprice = totalprice + price;
	  $('#total').val(totalprice);
	  $('#totalpri').val(FormatNumber(totalprice));
  }
  function minus(num) {
	  var totalprice = parseInt($('#price1').val()) + parseInt($('#price2').val()) + parseInt($('#price3').val());
	  var quantity = parseInt($('#quantity' + num).val());
	  if (quantity > 0) {
	  quantity = quantity - 1;
	  $('#quantity' + num).val(quantity);  
	  var price = parseInt(${detail.fur_price * dis});
	  $('#price' + num).val(parseInt($('#price' + num).val()) - price);
	  $('#pri' + num).val(FormatNumber(parseInt($('#price' + num).val())));
	  totalprice = totalprice - price;
	  $('#total').val(totalprice);
	  $('#totalpri').val(FormatNumber(totalprice));
	  }
  }
  </script>
  <script>
  function FormatNumber(num) {
	  var str = String(num);
	  var re = /(-?[0-9]+)([0-9]{3})/;

	  while (re.test(str)) {
	   str = str.replace(re, "$1,$2");
	  }
	  return str;
  }
  </script>
  <script>
  function prizero(num) {
	  var totalprice = parseInt($('#price1').val()) + parseInt($('#price2').val()) + parseInt($('#price3').val());
	  $('#total').val(totalprice);
	  $('#totalpri').val(totalprice);
  }
  
  </script>
  
  </body>
</html>