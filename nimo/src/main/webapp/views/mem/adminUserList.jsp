<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<c:set var="nimo" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>Liquor Store - Free Bootstrap 4 Template by Colorlib</title>


<!-- jquery 3.2.1 버전을 사용 -->
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 검색버튼  -->
<script>
	$(function() {
		var searchForm = $("#searchForm");
		$('#searchBtn').click(
				function() {
					if (!searchForm.find("option:selected").val()) {
						alert("검색종류를 선택하세요");
						return false;
					}

					if (!searchForm.find("input[name='keyword']").val()) {
						alert("키워드를 입력하세요");
						return false;
					}
					self.location = "adminUserList"
							+ '${pageMaker.makeQuery(1)}' + "&searchType="
							+ $("select option:selected").val() + "&keyword="
							+ encodeURIComponent($('#keywordInput').val());
				});
	});
</script>
<script type="text/javascript">
	function btnClick(formName) {
		formName.submit();
	};
</script>
<!-- 페이징을 가로로 정렬해주는 스타일 -->
<style type="text/css">
li {
	list-style: none;
	float: left;
	padding: 6px;
}
</style>


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
</head>
<body>

	<!-- header -->
	<%@ include file="/views/header.jsp"%>

	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div style="float: none; margin: 0 auto;">
					<h2>User List</h2>
				</div>
			</div>
			<!-- 검색창 ---------------------------------------->
			<form id="searchForm" role="form" method="get">
				<div class="row p-3">
					<div class="col-lg-12">
						<div class="row text-center">
							<div class="col-lg-2 col-md-4 col-sm-12 p-1">
								<select name="searchType" title="검색 항목" class="form-control">
									<option value=""
										<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>---검색
										항목---</option>
									<option value="id"
										<c:out value="${scri.searchType eq 'id' ? 'selected' : ''}"/>>아이디</option>
									<option value="name"
										<c:out value="${scri.searchType eq 'name' ? 'selected' : ''}"/>>이름</option>
									<option value="address"
										<c:out value="${scri.searchType eq 'address' ? 'selected' : ''}"/>>주소</option>
								</select>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-12 p-1">
								<input type="text" class="form-control"
									placeholder="검색어를 입력하세요." title="검색어" id="keywordInput"
									name="keyword" value="${scri.keyword}">
							</div>
							<div class="col-lg-4 col-md-2 col-sm-12 p-1">
								<button type="button" id="searchBtn" class="btn btn-primary">검색</button>
								<span><input type="button" class="btn btn-primary"
									value="추가"
									onclick="location.href='./adminInsertForm?page=${ scri.page }&perPageNum=${ scri.perPageNum }&searchType=${scri.searchType}&keyword=${scri.keyword}'" /></span>
								<button type="button" class="btn btn-secondary"
									onclick="location.href='./adminUserList'">활성</button>
								<span><input type="button" class="btn btn-secondary"
									value="비활성"
									onclick="location.href='./adminNUserList?page=${ scri.page }&perPageNum=${ scri.perPageNum }&searchType=${scri.searchType}&keyword=${scri.keyword}'" /></span>
							</div>
						</div>
					</div>
				</div>
			</form>
			<div class="row">
				<div class="table-wrap">
					<table class="table" summary="유저 목록">
						<caption class="sr-only">유저 목록</caption>
						<thead class="thead-primary">
							<tr>
								<th scope="col">&nbsp;</th>
								<th scope="col">아이디</th>
								<th scope="col">이름</th>
								<th scope="col">주소</th>
								<th scope="col">휴대전화</th>
								<th scope="col">상태</th>
								<th scope="col">권한</th>
								<th scope="col">가입일</th>
								<th scope="col"><button type="button"
										class="btn btn-secondary"
										onclick="location.href='./adminUserList'">활성</button> <span><input
										type="button" class="btn btn-secondary" value="비활성"
										onclick="location.href='./adminNUserList?page=${ scri.page }&perPageNum=${ scri.perPageNum }&searchType=${scri.searchType}&keyword=${scri.keyword}'" /></span></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${ userList }">
								<tr style="cursor: pointer;" class="alert" role="alert">
									<td><label class="checkbox-wrap checkbox-primary">
											<input type="checkbox"> <span class="checkmark"></span>
									</label></td>
									<td
										onclick="location.href='./adminUserDetail?id=${ u.id }&page=${ scri.page }&perPageNum=${ scri.perPageNum }&searchType=${scri.searchType}&keyword=${scri.keyword}'">
										<div class="id">
											<span>${ u.id }</span>
										</div>
									</td>
									<td
										onclick="location.href='./adminUserDetail${pageMaker.makeSearch(pageNum) }&id=${ u.id }'">
										<div class="name">
											<span>${ u.name }</span>
										</div>
									</td>
									<td
										onclick="location.href='./adminUserDetail${pageMaker.makeSearch(pageNum) }&id=${ u.id }'">
										<div class="address">
											<span>${ u.address }</span>
										</div>
									</td>
									<td
										onclick="location.href='./adminUserDetail${pageMaker.makeSearch(pageNum) }&id=${ u.id }'">
										<div class="phone">
											<span>${ u.phone }</span>
										</div>
									</td>
									<td
										onclick="location.href='./adminUserDetail${pageMaker.makeSearch(pageNum) }&id=${ u.id }'">
										<div class="stat">
											<span>${ u.stat }</span>
										</div>
									</td>
									<td
										onclick="location.href='./adminUserDetail${pageMaker.makeSearch(pageNum) }&id=${ u.id }'">
										<div class="role">
											<span>${ u.role }</span>
										</div>
									</td>
									<td
										onclick="location.href='./adminUserDetail${pageMaker.makeSearch(pageNum) }&id=${ u.id }'">
										<div class="reg_date">
											<span>${ u.reg_date }</span>
										</div>
									</td>
									<td>
										<div class="btn">
											<button type="button" class="btn btn-primary"
												onclick="if( confirm('${ u.id } 회원을 완전 삭제하시겠습니까?') ){ location.href='./adminUserDelete?id=${ u.id }&page=${ scri.page }&perPageNum=${ scri.perPageNum }&searchType=${scri.searchType}&keyword=${scri.keyword}' }">탈퇴</button>
											<c:if test="${ u.getStat() eq 'Y'}">
												<input type="button" class="btn btn-secondary" value="비활성"
													onclick="location.href='./adminUserNo${pageMaker.makeSearch(pageNum) }&id=${ u.id }'" />
											</c:if>
											<c:if test="${ u.getStat() eq 'N'}">
												<input type="button" class="btn btn-secondary" value="활성"
													onclick="location.href='./adminUserYes${pageMaker.makeSearch(pageNum) }&id=${ u.id }'" />
											</c:if>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<!-- 페이징 -->
			<div class="row text-center p-3">
				<div style="float: none; margin: 0 auto">
					<ul class="btn-group pagination">
						<c:if test="${pageMaker.prev }">
							<li><a
								href='<c:url value="./adminUserList${pageMaker.makeSearch(pageMaker.startPage-1) }"/>'>이전</a>
							</li>
						</c:if>
						<c:forEach begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }" var="pageNum">
							<li><a
								href='<c:url value="./adminUserList${pageMaker.makeSearch(pageNum) }"/>'>${pageNum }</a>
							</li>
						</c:forEach>
						<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
							<li><a
								href='<c:url value="./adminUserList${pageMaker.makeSearch(pageMaker.endPage+1) }"/>'>다음</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>
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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="${nimo}/resources/js/google-map.js"></script>
	<script src="${nimo}/resources/js/main.js"></script>

	<script src="${nimo}/resources/js/userLogin.js"></script>

</body>
</html>