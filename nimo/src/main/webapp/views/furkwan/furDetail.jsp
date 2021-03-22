<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="nimo" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
    <!-- 민  -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  	<!-- 민  -->
  	<style>
 	.carousel-inner img {width: 100%; height: 100%;}
 	body {position: relative;}
  	</style>
  </head>
  <body data-spy="scroll" data-target=".navbar" data-offset="50">
   	<!-- header -->
	<%@ include file="/views/header.jsp" %>
	
    	<form name="form" action="/nimo/fur/nimokwan/furUpdate" method="post" enctype="multipart/form-data">
    	<input type="hidden" name="furi" value="${ detail.fur_image }">
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
					</div>
					<p class="text-center bg-warning">이미지 2개 이상 등록</p>
   					<input multiple="multiple" type="file" id="input_imgs" name="fur_image" /><br><br>
   					<div class="imgs_wrap">
   						
   					</div><br>
				</div>
				<div class="col-sm-12 col-md">
					<p class="col-sm-12">
						<label>가구 코드 : </label><input class="form-control" name="fur_code" type="text" value="${ detail.fur_code }" />
					</p>
					<p class="col-sm-12">
						<label>가구 이름 : </label><input class="form-control" name="fur_name" type="text" value="${ detail.fur_name }" />
					</p>
					<p class="col-sm-12">
						<label>재고 수량 : </label><input class="form-control" name="fur_quantity" type="text" value="${ detail.fur_quantity }" />
					</p>
					<p class="col-sm-12">
						<label>상품 가격  : </label><input class="form-control" name="fur_price" type="text" value="${ detail.fur_price }" />
					</p>
					<p class="col-sm-12">
						<label>상품 할인  : </label>
						<select id="fur_option" class="form-control" name="fur_option">
	            			<option value="1">정가</option>
	 						<option value="0.9">10%</option>
	 						<option value="0.7">30%</option>
	 						<option value="0.5">50%</option>
	            		</select>
					</p>
				</div>
			</div>
		</div><br><br><br>
		</section>
		
 			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">  
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
        				<p class="text-center bg-secondary">상세1</p><br>
        				<input type="hidden" name="furi1" value="${ detail.fur_subimage1 }">
        				<c:choose>
        					<c:when test="${ detail.fur_subimage1 ne null }">
        					<div class="row mb-5">
								<div class="col-sm-12 col-md">
             						<div class="carousel-inner">
             							<img id="img1" src="${nimo}/resources/furImages/${ detail.fur_subimage1 }">
             							<p class="text-center bg-warning">이미지 수정</p>
             							<input type="file" id="input_img1" name="fur_subimage1" />
                					</div><br>
                				</div>
                				<div class="col-sm-12 col-md">
              						<div class="text p-4 bg-light">
                						<h3 class="heading mb-3">${ detail.fur_subdetail1_1 }</h3>
                						<textarea class="form-control bg-light" rows="17" disabled>${ detail.fur_subdetail1_2 }</textarea>
              						</div><br>
              						<p class="text-center bg-warning">헤드라인 수정</p>
                					<input type="text" class="form-control" name="fur_subdetail1_1" value="${ detail.fur_subdetail1_1 }"><br>
                					<p class="text-center bg-warning">상세설명 수정</p>
                					<textarea class="form-control" name="fur_subdetail1_2" rows="17">${ detail.fur_subdetail1_2 }</textarea><br>
            					</div>
         					</div>
         					</c:when>
         					<c:otherwise>
         						<div class="row mb-5">
									<div class="col-sm-6 col-md-6">
										<div class="img_wrap1">
   											<img id="img1" />
   										</div><br>
										<input type="file" id="input_img1" name="fur_subimage1" />
									</div>
									<div class="col-sm-12 col-md-6">
										헤드라인<br>
										<input type="text" class="form-control" name="fur_subdetail1_1"><br>
										상세 설명<br>
										<textarea class="form-control" name="fur_subdetail1_2" rows="17"></textarea>
									</div>
								</div>
         					</c:otherwise>
         				</c:choose>
  						
  						<input type="hidden" name="furi2" value="${ detail.fur_subimage2 }">
         				<p class="text-center bg-secondary">상세2</p><br>
         				<c:choose>
        					<c:when test="${ detail.fur_subimage2 ne null }">
        					<div class="row mb-5">
								<div class="col-sm-12 col-md">
             						<div class="carousel-inner">
             							<img id="img2" src="${nimo}/resources/furImages/${ detail.fur_subimage2 }">
             							<p class="text-center bg-warning">이미지 수정</p>
             							<input type="file" id="input_img2" name="fur_subimage2" />
                					</div>
                				</div>
                				<div class="col-sm-12 col-md">
              						<div class="text p-4 bg-light">
                						<h3 class="heading mb-3">${ detail.fur_subdetail2_1 }</h3>
                						<p>${ detail.fur_subdetail2_2 }</p>
              						</div><br>
              						<p class="text-center bg-warning">헤드라인 수정</p>
                					<input type="text" class="form-control" name="fur_subdetail2_1" value="${ detail.fur_subdetail2_1 }"><br>
                					<p class="text-center bg-warning">상세설명 수정</p>
                					<textarea class="form-control" name="fur_subdetail2_2" rows="5">${ detail.fur_subdetail2_2 }</textarea><br>
            					</div>
         					</div>
         					</c:when>
         					<c:otherwise>
         						<div class="row mb-5">
									<div class="col-sm-6 col-md-6">
										<div class="img_wrap2">
   											<img id="img2" />
   										</div><br>
										<input type="file" id="input_img2" name="fur_subimage2" />
									</div>
									<div class="col-sm-12 col-md-6">
										헤드라인<br>
										<input type="text" class="form-control" name="fur_subdetail2_1"><br>
										상세 설명<br>
										<textarea class="form-control" name="fur_subdetail2_2" rows="17"></textarea>
									</div>
								</div>
         					</c:otherwise>
         				</c:choose>
         				
         				<input type="hidden" name="furi3" value="${ detail.fur_subimage3 }">
         				<p class="text-center bg-secondary">상세3</p><br>
         				<c:choose>
        					<c:when test="${ detail.fur_subimage3 ne null }">
        					<div class="row mb-5">
								<div class="col-sm-12 col-md">
             						<div class="carousel-inner">
             							<img id="img3" src="${nimo}/resources/furImages/${ detail.fur_subimage3 }">
             							<p class="text-center bg-warning">이미지 수정</p>
             							<input type="file" id="input_img3" name="fur_subimage3" />
                					</div>
                				</div>
                				<div class="col-sm-12 col-md">
              						<div class="text p-4 bg-light">
                						<h3 class="heading mb-3">${ detail.fur_subdetail3_1 }</h3>
                						<p>${ detail.fur_subdetail3_2 }</p>
              						</div><br>
              						<p class="text-center bg-warning">헤드라인 수정</p>
                					<input type="text" class="form-control" name="fur_subdetail3_1" value="${ detail.fur_subdetail3_1 }"><br>
                					<p class="text-center bg-warning">상세설명 수정</p>
                					<textarea class="form-control" name="fur_subdetail3_2" rows="5">${ detail.fur_subdetail3_2 }</textarea><br>
            					</div>
         					</div>
         					</c:when>
         					<c:otherwise>
         						<div class="row mb-5">
									<div class="col-sm-6 col-md-6">
										<div class="img_wrap3">
   											<img id="img3" />
   										</div><br>
										<input type="file" id="input_img3" name="fur_subimage3" />
									</div>
									<div class="col-sm-12 col-md-6">
										헤드라인<br>
										<input type="text" class="form-control" name="fur_subdetail3_1"><br>
										상세 설명<br>
										<textarea class="form-control" name="fur_subdetail3_2" rows="17"></textarea>
									</div>
								</div>
         					</c:otherwise>
         				</c:choose>
         					
         					<div class="heading-section text-center ftco-animate">
             					<span class="subheading">행복을 만드는 nimo</span>
            						<input class="btn btn-secondary" type="submit" value="상품 수정">
            						<input class="btn btn-primary" type="button" value="상품 삭제" onclick="location.href='/nimo/fur/nimokwan/furDelete?fur_code=${ detail.fur_code }'">	
  							</div>
  									
      
  						
  				
			</div>
			<div id="section2" class="container-fluid bg-warning" style="padding-top:70px;padding-bottom:70px">
  				<div class="row justify-content-center mb-5">
          			<div class="col-md-7 heading-section text-center ftco-animate">
            			<h2>교환 / 환불 규정</h2>
         			</div>
        		</div>
  				<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  				<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
			</div>
			<div id="section3" class="container-fluid bg-muted" style="padding-top:70px;padding-bottom:70px">
				<div class="row justify-content-center mb-5">
          			<div class="col-md-7 heading-section text-center ftco-animate">
            			<h2>리 뷰</h2>
            			<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  						<p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
         			</div>
        		</div>
			</div>
		</div>
		</section>
		</form>
 		
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
 	var sel_files = [];
 	
 	$(document).ready(function() {
 		$("#input_imgs").on("change", handleImgsFilesSelect);
 		console.log("aaaaaa");
 	});
 	
 	function handleImgsFilesSelect(e) {
 		var files = e.target.files;
 		var filesArr = Array.prototype.slice.call(files);
 		$(".imgs_wrap").empty();
 		
 		filesArr.forEach(function(f) {
 			if(!f.type.match("image.*")) {
 				alert("이미지 파일만 가능합니다.");
 				return;
 			}
 			sel_files.push(f);
 			
 			var reader = new FileReader();
 			reader.onload = function(e) {
 				var img_html = "<img src=\"" + e.target.result + "\" width='20%' />";
 				$(".imgs_wrap").append(img_html);
 			}
 			reader.readAsDataURL(f);
 		});
 	}
   
  </script>
  <script>
  	var sel_file;
  	
  	$(document).ready(function() {
 		$("#input_img1").on("change", {num : '1'}, handleImgFileSelect);
 		$("#input_img2").on("change", {num : '2'}, handleImgFileSelect);
 		$("#input_img3").on("change", {num : '3'}, handleImgFileSelect);
 	});
  	
  	function handleImgFileSelect(e) {
  		console.log("aaaaaa");
 		var num = e.data.num;
  		var files = e.target.files;
 		var filesArr = Array.prototype.slice.call(files);
 		
 		filesArr.forEach(function(f) {
 			if(!f.type.match("image.*")) {
 				alert("이미지 파일만 가능합니다.");
 				return;
 			}
 			sel_file = f;
 			
 			var reader = new FileReader();
 			reader.onload = function(e) {
 				$("#img" + num).attr("src", e.target.result);
 				$("#img" + num).attr("width", '100%');
 			}
 			reader.readAsDataURL(f);
 		});
  	}
  </script>
  <script>
  $("#fur_option").val("${ detail.fur_option }");
  </script>
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
  </body>
</html>