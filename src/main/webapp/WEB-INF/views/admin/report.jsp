<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!--  공통적으로사용할 라이브러리 추가 -->
<!-- Jquey 라이브러리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하있는 스타일 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부투스트랩에서 제공하고있는 스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- alertify -->
<script
	src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- alertify css -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
<!-- Default theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css" />
<!-- Semantic UI theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css" />
<script src="/js/summernote/summernote-lite.js"></script>
<script src="/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/css/summernote/summernote-lite.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script type="text/javascript">
	$(document).ready(function() {
        var reportKeep = '<c:out value="${reportKeep}"/>';
        if(!(reportKeep==''))
            alert("해당 리뷰룰 반려 처리였습니다.");
    });
</script>
<style>
div {
	box-sizing: border-box;
	/* border: 1px solid red; */
}

html, body {
	width: 100%;
	height: 100%;
	margin: 0%;
}

body {
	overflow-x: hidden;
}
/* 헤더 시작*/
.header {
	width: 100%;
	height: 12%;
	background: #09ba1b !important;
	position: sticky;
	top: 0px;
}

#bt_title {
	width: 100%;
	height: 70%;
	text-align: center;
	color: #ffff;
}

#title {
	font-size: 3em;
	font-weight: bold;
}

.nav {
	width: 100%;
	height: 30%;
	text-align: center;
}

.nav>ul {
	display: flex;
	list-style: none;
	padding: 0;
	margin: 0;
	height: 100%;
}

.nav li {
	width: 500px;
}

.nav a {
	display: block;
	height: 100%;
	text-align: center;
	padding: 5px 0;
	text-decoration: none;
	font-size: 18px;
	font-weight: bold;
	color: #ffff;
	border-radius: 5px;
	transition-duration: 0.1s;
}

.nav a:hover {
	color: black;
}

.notice {
	width: 100%;
	height: 88%;
}

#notice_area {
	width: 70%;
	height: 10%;
	margin-top: 5vh;
	margin-left: 30vh;
}

#notice_title_area {
	width: 100%;
	height: 15%;
}

#notice_title {
	font-size: 2em;
	font-weight: bold;
}

#enrollWrap {
	width: 100%;
	/* height: 100%; */
	border: 1px solid rgb(224, 224, 224);
	border-radius: 10px;
	padding: 20px;
	justify-content: space-between;
	background: rgb(247, 247, 247);
}

.paging {
	margin: 0px 0px 0px 40%;
}

#content {
	padding: 20px 0;
	border-bottom: 1px solid rgb(242, 242, 242);
	margin: 0% 0% 0% 15%;
}

#content2 {
	display: flex;
	align-items: center;
}

#reviewNickname {
	display: flex;
	font-size: 16px;
	margin-bottom: 10px;
	color: rgb(97, 97, 97);
}

#reviewRoomName {
	display: flex;
}

#reviewRoomNameList {
	width: 8%;
	height: 20px;
	border-radius: 2px;
	text-align: center;
	color: rgb(145, 145, 145);
	background-color: rgba(230, 230, 230);
}

#reviewRoomNameInfo {
	width: 92%;
	margin-left: 10px;
	border-radius: 2px;
	color: rgb(97, 97, 97);
	background-color: rgba(248, 248, 248);
}

#review {
	margin: 20px 0;
	text-align: left;
}

#buReviewList {
	width: 700px;
	height: 200px;
	background-color: white;
	padding: 20px;
}

#review-star-rating .fa {
	color: #ffc107;
}

#review-star-rating {
	margin-bottom: 10px;
}

.buReviewDate {
	float: right;
	font-size: 16px;
	color: rgb(97, 97, 97);
}
</style>
</head>
<body>
	<div class="header">
		<div id="bt_title">
			<span id="title">breaktime admin</span>
		</div>

		<div class="nav">
			<ul>
				<li><a href="<%=request.getContextPath()%>/notice/list">공지사항</a></li>
				<li><a href="<%=request.getContextPath()%>/approval/list">사업자
						가입 승인</a></li>
				<li><a href="<%=request.getContextPath()%>/manage/list">고객
						정보 관리</a></li>
				<li><a href="<%=request.getContextPath()%>/report/list">악성
						리뷰 관리</a></li>
			</ul>
		</div>
	</div>

	<div class="notice">
		<div id="notice_area">
			<span id="notice_title"> 악성 리뷰 관리 </span>
			<hr>


			<div id="enrollWrap">

				<c:forEach var="r" items="${selectReportList.list}">
					<div id="content">
						<div id="content2">
							<div id="reviewBackground">
								<div id="review-star-rating">
									<span class="fa fa-star"></span> <span class="fa fa-star"></span>
									<span class="fa fa-star"></span> <span class="fa fa-star"></span>
									<span class="fa fa-star"></span>
								</div>
								<div id="reviewNickname">
									<div>${r.userName }|${r.createDate }</div>
								</div>
								<div id="reviewRoomName">
									<div id="reviewRoomNameList">객실명</div>
									<div id="reviewRoomNameInfo">${r.roomName }</div>
								</div>
								<div id="review">${r.reviewContent }</div>

								<div id="buReviewList">
									<span style="font-size: larger;"><b>숙소 답변</b></span>
									<!-- <span class="buReviewDate">2023.05.04</span>  -->
									<p class="buReview">${r.parentReviewNo }</p>
								</div>
							</div>
						</div>
						<hr style="color: rgba(0, 0, 0, 0.5);">
						
						<a href="javascript:void(0);" onclick="reportCancel();">
							<button type="button" class="btn btn-outline-danger">삭제</button>
						</a> 
						<script type="text/javascript">
							function reportCancel(){
												
								if(!confirm("해당 리뷰를 삭제 처리하시겠습니까?")){
									return false;
								}else{
									location.href="<%=request.getContextPath()%>/report/delete?reviewNo=${r.reviewNo}";
								}
							}
						</script>
						
						<a href="<%=request.getContextPath()%>/report/update?reviewNo=${r.reviewNo}">
							<button type="submit" class="btn btn-outline-success" data-text="유지">유지</button>
						</a>
						

					</div>
				</c:forEach>

				<c:set var="url" value="list?cpage=" />
				<div class="paging">
					<ul class="pagination">
						<c:choose>
							<c:when test="${ selectReportList.pi.currentPage eq 1 }">
								<li class="page-item disabled"><a class="page-link"
									href="#">Previous</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="${url}${selectReportList.pi.currentPage -1 }${sUrl}">Previous</a></li>
							</c:otherwise>
						</c:choose>

						<c:forEach var="item" begin="${selectReportList.pi.startPage }"
							end="${selectReportList.pi.endPage }">
							<li class="page-item"><a class="page-link"
								href="${url}${item }${sUrl}">${item }</a></li>
						</c:forEach>

						<c:choose>
							<c:when
								test="${ selectReportList.pi.currentPage eq selectReportList.pi.maxPage }">
								<li class="page-item disabled"><a class="page-link"
									href="#">Next</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="${url}${selectReportList.pi.currentPage + 1 }${sUrl}">Next</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>