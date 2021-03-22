<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="kr.co.nimo.showroom.ShowRoomVO"%>
<c:set var="nimo" value="${pageContext.request.contextPath}" />
<c:set var="showDetail" value="${showRoomDetail_ShowRoom}" />
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
			<div class="row">
				<div class="col-md-12 tab-wrap">
					<a href="${showDetail.show_img}" class="image-popup prod-img-bg"><img
						src="${showDetail.show_img}" class="img-fluid"
						alt="Colorlib Template" name="show_img"></a>
				</div>
				<div class="col-md-12 tab-wrap" id="livingProduct">
					<h5 style="margin-top: .5rem;">쇼룸 이름</h5>
					<input type="text" class="quantity form-control input-number"
						name="show_name" value="${showDetail.show_name}" style="margin-bottom: .5rem;">
					<h5>카테고리</h5>
					<input type="text" class="quantity form-control input-number"
						name="show_category" value="${showDetail.show_category}" style="margin-bottom: .5rem;">
					<h5>쇼룸 설명</h5>
					<textarea name="show_detail" style="margin-bottom: .5rem;">${showDetail.show_detail}</textarea>
					<input type="button" value="수정" class="btn btn-primary py-3 px-5" id="showup">
				</div>

				<div class="row mt-5">
					<c:forEach items="${showRoomDetail_Furs}" var="showRoomDetail_Furs">
						<div class="row detailrow">
							<div class="col-md-6">
								<img name="furn_img" src="${showRoomDetail_Furs.fur_image}" class="img-fluid"
									alt="Colorlib Template">
							</div>
							<div class="col-md-6">
								<div class="tab-content bg-light" id="v-pills-tabContent">
									<div class="tab-pane fade show active" id="v-pills-1">
										<div class="p-4">
											<h5>가구 이름</h5>
											<input type="text" class="quantity form-control input-number"
												name="furn_name" value="${showRoomDetail_Furs.fur_name}" style="margin-bottom: .5rem;">
											<h5>가구 가격</h5>
											<input type="text" class="quantity form-control input-number"
												name="furn_price" value="${showRoomDetail_Furs.fur_price}" style="margin-bottom: .5rem;">
											<h5>가구 설명</h5>
											<textarea name="furn_detail">${showRoomDetail_Furs.fur_subdetail1_1}</textarea>
											<h5>가구 수량</h5>
											<input type="text" class="quantity form-control input-number"
												name="furn_quantity" value="${showRoomDetail_Furs.fur_quantity}" style="margin-bottom: .5rem;">
											<input type="button" value="수정" class="btn btn-primary py-3 px-5" id="furnup">
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>
	<div class="row justify-content-end">
		<div class="col col-lg-5 col-md-6 mt-5 ftco-animate">
			<div style="margin-bottom: .9rem;">
				<a href="adShowRoomIndex.ni" class="btn btn-primary py-3 px-5">완료</a>
				<a href="adShowRoomDelete.ni?show_name=${showDetail.show_name}"
					class="btn btn-primary py-3 px-5">삭제</a>
			</div>
		</div>
	</div>
	<%@ include file="../footer.jsp"%>
	<script>
	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');
	$(document).ready(function() {
		$('input').click(function(e) {
			if ($(this).attr('id') == 'showup') {
				$.ajax({
					url : "adShowUpdate.ni",
					data : {
						"show_name" : $('input[name=show_name]').val(),
						"show_category" : $('input[name=show_category]').val(),
						"show_detail" : $('textarea[name=show_detail]').val(),
						"show_img" : $('img[name=show_img]').attr("src")	
					},
					dataType : "json",
					type : "post",
					beforeSend : function(xhr) {
						xhr.setRequestHeader(header, token);
					},
					success : function(data) { 
						console.log("okok");
						location.reload();
					}	
				});
			} else {
				$.ajax({
					url : "adFurnUpdate.ni",
					data : {
						"show_name" : $('input[name=show_name]').val(),
						"furn_name" : $('input[name=furn_name]').val(),
						"furn_price" : $('input[name=furn_price]').val(),
						"furn_detail" : $('textarea[name=furn_detail]').val(),
						"furn_quantity" : $('input[name=furn_quantity]').val(),
						"furn_img" : $('img[name=furn_img]').attr("src")	
					},
					dataType : "json",
					type : "post",
					beforeSend : function(xhr) {
						xhr.setRequestHeader(header, token);
					},
					success : function(data) {
						console.log("okok");
					}
				});
			}
		});
	});
	</script>
</body>
</html>