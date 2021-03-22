<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<form  action="/nimo/adShowRoom/showRoomInsert.ni" method="post" name="showAdd">
	<s:csrfInput />
		<div class="container">
			<div class="row">
				<div class="col-lg-12 mb-5 ftco-animate">
						<input type='file' id="imgInput" style="display: none;"> <input
							type='hidden' name="show_img_input"> <img
							id="image_section" class="img-fluid" name="show_img"
							src="/nimo/resources/images/du/plus.jpg" />
				</div>
				<div class="col-md-12 tab-wrap" id="livingProduct">
					<h5>쇼룸 이름</h5>
					<input type="text" class="col-md-12" name="show_name" placeholder="쇼룸 이름을 써주세요" style="margin-bottom:20px;">
					<h5>쇼룸 카테고리</h5>
					<input type="text" class="col-md-12" name="show_category" placeholder="쇼룸 카테고리를 써주세요" style="margin-bottom:20px;">
					<h5>쇼룸 설명</h5>
					<textarea type="text" row="10" cols="50" class="col-md-12" name="show_detail" placeholder="쇼룸 설명해 주세요" ></textarea>
					<input type='hidden' name="furn_code">
				</div>

				<div class="row mt-5" id="furnplus">
					<div class="row detailrow">
						<div class="col-md-6">
								<input type='file' id="furn_img_input" style="display: none;">
								<input type='hidden' name="furn_img_hidden">
								<img id="image_furn" class="img-fluid" src="/nimo/resources/images/du/plus.jpg" style="width:100;height:100%;" />
						</div>
						<div class="col-md-6">
							<div class="tab-content bg-light" id="v-pills-tabContent">
								<div class="tab-pane fade show active" id="v-pills-1"
									role="tabpanel" aria-labelledby="day-1-tab">
									<div class="p-4" id="textField-1" 	>
										<h5 style="margin-left:20px;">가구 이름</h5>
										<input type="text" style="margin:20px; width: 95%;" placeholder="가구 이름 써주세요" name="furn-name">
										<h5 style="margin-left:20px;">가구 가격</h5>
										<input type="text" style="margin:20px; width: 95%;" placeholder="가구 가격 써주세요" name="furn-price">
										<h5 style="margin-left:20px;">가구 설명</h5>
										<textarea style="margin:20px;width:95%;height:40%;" placeholder="가구 설명 써주세요" name="furn-detail"></textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="row justify-content-center">
						<div class="col-md-4">
							<button type="button" class="btn btn-primary d-block"
								id="furnPlus">가구추가</button>
						</div>
						<div class="col-md-4">
							<input type="submit" class="btn btn-primary d-block" value="쇼룸추가"/>
						</div>
						<div class="col-md-4">
							<a href="#" class="btn btn-primary d-block">취소</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		</form>
	</section>

	<%@ include file="../footer.jsp"%>
	
	<script type="text/javascript">
		var index = 2;
		var imgId;
		var su;
		var header = $("meta[name='_csrf_header']").attr('content');
		var token = $("meta[name='_csrf']").attr('content');
		function readURL1(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
	
				reader.onload = function(e) {
					$('#image_section').attr('src', e.target.result);
					console.log(e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			} else {
				console.log("nonono~");
			}
		}
		
		$("#imgInput").change(function() {
			readURL1(this);
		});

		
		function readURL2(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
	
				reader.onload = function(e) {
					console.log(imgId);
					$('#'+imgId).attr('src', e.target.result);
					$.ajax({
						url : "/nimo/adShowRoom/furnInfo.ni",
						data : {
							"fur_image" : input.files[0].name
						},
						dataType : "json",
						type : "post",
						beforeSend : function(xhr) {
							xhr.setRequestHeader(header, token);
						},
						success : function(data) {
							console.log("ajax"+su);
							if (su != 0) {
								console.log("input[type=text][name=furn-name" + su + "]");
								$("input[type=text][name=furn-name" + su + "]").val(data.data.fur_name);
								$("input[type=text][name=furn-price" + su + "]").val(data.data.fur_price);
								$("textarea[name=furn-detail" + su + "]").val(data.data.fur_subdetail1_1);
							} else {
								$("input[type=text][name=furn-name]").val(data.data.fur_name);
								$("input[type=text][name=furn-price]").val(data.data.fur_price);
								$("textarea[name=furn-detail]").val(data.data.fur_subdetail1_1);
							}
						}
					});
				}
				reader.readAsDataURL(input.files[0]);
			} else {
				console.log("nonono~");
			}
		}
		
		$("#furn_img_input").change(function() {
			console.log("cl1");
			readURL2(this);
		});
				
		$(document).on('click', 'img', function(e) {
			imgId = $(this).attr('id');
			console.log(imgId);
			if (imgId == 'image_furn') {
				e.preventDefault();
				su = 0;
				$('#furn_img_input').click();
			} else if (imgId == 'image_section') {
				e.preventDefault();
				$('#imgInput').click();
			} else {
				e.preventDefault();
				su = imgId.charAt(imgId.length-1);
				console.log(su);
				$('#furn_img_input').click();
			}
		});
		$('#furnPlus')
				.click(
						function(e) {
							$.ajax({
										url : "/nimo/adShowRoom/showRoomappend.ni",
										success : function(data) {
											var str = "<div class='row detailrow'>";
											str += "<div class='col-md-6'>";
											str += "<input type='file' id='furn_img_input"+index+"' style='display: none;'>";
											str += "<input type='hidden' name='furn_img_hidden"+index+"'>";
											str += "<img id='image_furn"+ index + "' class='img-fluid' src='/nimo/resources/images/du/plus.jpg' style='width:100;height:100%;'/>";
											str += "</div>";
											str += "<div class='col-md-6'><div class='tab-content bg-light' id='v-pills-tabContent'>";
											str += "<div class='tab-pane fade show active' id='v-pills-1' role='tabpanel' aria-labelledby='day-1-tab'>";
											str += "<div class='p-4' id='textField-1'>";
											str += "<h5 style='margin-left:20px;'>가구 이름</h5>";
											str += "<input type='text' style='margin:20px; width: 95%;' placeholder='가구 이름 써주세요' name='furn-name"+index+"'>";
											str += "<h5 style='margin-left:20px;'>가구 가격</h5>";
											str += "<input type='text' style='margin:20px; width: 95%;' placeholder='가구 가격 써주세요' name='furn-price"+index+"'>";
											str += "<h5 style='margin-left:20px;'>가구 설명</h5>";
											str += "<textarea style='margin:20px;width:95%;height:40%;' placeholder='가구 설명 써주세요' name='furn-detail"+index+"'></textarea>";
											str += "</div></div></div></div></div>";
											$("#furnplus").append(str);
											
											console.log(str);
										}
									});
								index++;
						});
	</script>
</body>
</html>