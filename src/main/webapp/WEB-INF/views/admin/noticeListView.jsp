<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${!empty param.condition}" >
	<c:set var="sUrl" value="&condition=${param.condition }&keyword=${param.keyword }"/>
</c:if>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<!--  공통적으로사용할 라이브러리 추가 -->
	<!-- Jquey 라이브러리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
		
	<script type="text/javascript">
    $(document).ready(function() {
        var insertNotice = '<c:out value="${insertNotice}"/>';
        if(!(insertNotice==''))
            alert("공지사항 작성 완료");
    });

    $(document).ready(function() {
        var updateNotice = '<c:out value="${updateNotice}"/>';
        if(!(updateNotice==''))
            alert("공지사항 수정 완료");
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
			overflow-y: hidden;
		}
		/* 헤더 시작*/
		.header {
			width: 100%;
			height: 12%;
			background: #09ba1b !important;
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
		/* 공지사항 시작*/
		.notice {
			width: 100%;
			height: 88%;
		}
		
		#notice_area {
			width: 70%;
			height: 90%;
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
		
		#notice_board {
			width: 100%;
			height: 85%;
		}
		
		/* 공지사항 테이블 시작 */
		#noticeList {
			margin-top: 5vh;
			margin-left: 20vh;
			min-width: 100vh;
			max-width: 100%;
			border-collapse: collapse;
		}
		
		#noticeList tr {
			border-top: 1px solid #ddd;
			border-bottom: 1px solid #ddd;
			background-color: #f5f9fc;
		}
		
		#noticeList th {
			display: none;
		}
		
		#noticeList td {
			display: block;
		}
		
		#noticeList td:first-child {
			margin-top: .5em;
		}
		
		#noticeList td:last-child {
			margin-bottom: .5em;
		}
		
		#noticeList td:before {
			content: attr(data-th) ": ";
			font-weight: bold;
			width: 120px;
			display: inline-block;
			color: #000;
		}
		
		#noticeList th, #noticeList td {
			text-align: left;
		}
		
		#noticeList {
			color: #333;
			border-radius: .4em;
			overflow: hidden;
		}
		
		#noticeList tr {
			border-color: #bfbfbf;
		}
		
		#noticeList th, #noticeList td {
			padding: .5em 1em;
		}
		
		@media screen and (max-width: 601px) {
			#noticeList tr:nth-child(2) {
				border-top: none;
			}
		}
	
		@media screen and (min-width: 600px) {
		#noticeList tr:hover {
			background-color: #d8e7f3;
		}
		#noticeList td:before {
			display: none;
		}
		#noticeList th, #noticeList td {
			display: table-cell;
			padding: .25em .5em;
		}
		#noticeList th:first-child, #noticeList td:first-child {
			padding-left: 0;
		}
		#noticeList th:last-child, #noticeList td:last-child {
			padding-right: 0;
		}
		#noticeList th, #noticeList td {
			padding: 1em !important;
		}
	}
	
		.paging {
			margin: 0px 0px 0px 40%;
		}
		#searchForm {
            width:80%;
            margin-left : 15%;
        }
        #searchForm>* {
            float:left;
            margin:5px;
        }
        .select {width:15%;}
        .text {width:53%;}
        .searchBtn {width:10%;}
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
					<li><a href="<%=request.getContextPath()%>/approval/list">사업자 가입 승인</a></li>
					<li><a href="<%=request.getContextPath()%>/manage/list">고객 정보 관리</a></li>
					<li><a href="<%=request.getContextPath()%>/report/list">악성 리뷰 관리</a></li>
				</ul>
			</div>
		</div>
	
		<div class="notice">
			<div id="notice_area">
				<div id="notice_title_area">
					<span id="notice_title"> 공지사항 </span>
					<hr>
				</div>
				
				<form id="searchForm" action="" method="get" align="center">
				 	<div class="select">
				 		<select class="custom-select" name="condition">
				 			<option value="title" ${param.condition=='title' ? 'checked' : ''}>제목</option>
				 			<option value="content" ${param.condition=='content' ? 'checked' : ''}>내용</option>
				 			<option value="titleAndContent" ${param.condition=='titleAndContent' ? 'checked' : ''}>제목+내용</option>
				 		</select>
				 	</div>
				 	<div class="text">
				 		<input type="text" class="form-control" name="keyword" value="${param.keyword }">
				 	</div>
				 	<button type="submit" class="searchBtn btn btn-secondary">검색 </button>
		 		</form>
		 
				<c:if test="${loginUser.getAuthority() == 0}"> 
					<a class="btn btn-primary" style="margin-left: 112vh;"
						href="<%=  request.getContextPath() %>/notice/enrollForm">글 등록</a>
				</c:if> 
				<div id="notice_board_area">
					<table id="noticeList">
						<thead>
							<tr style="background: #428bca;color: #fff;">
								<th>글 번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty selectNoticeList.list } ">
									<tr>
										<td colspan="5">게시글이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${selectNoticeList.list}" var="n">
										<tr
											onclick="location.href='<%=request.getContextPath()%>/notice/detail?noticeNo=${n.noticeNo}'">
											<td>${n.noticeNo }</td>
											<td>${n.noticeTitle }</td>
											<td>${n.userName }</td>
											<td>${n.createDate }</td>
											<td>${n.count }</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
	
					<br>
	
					<c:set var="url" value="list?cpage=" />
					<div class="paging">
						<ul class="pagination">
							<c:choose>
								<c:when test="${ selectNoticeList.pi.currentPage eq 1 }">
									<li class="page-item disabled"><a class="page-link"
										href="#">Previous</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="${url}${selectNoticeList.pi.currentPage -1 }${sUrl}">Previous</a></li>
								</c:otherwise>
							</c:choose>
	
							<c:forEach var="item" begin="${selectNoticeList.pi.startPage }"
								end="${selectNoticeList.pi.endPage }">
								<li class="page-item"><a class="page-link"
									href="${url}${item }${sUrl}">${item }</a></li>
							</c:forEach>
	
							<c:choose>
								<c:when
									test="${ selectNoticeList.pi.currentPage eq selectNoticeList.pi.maxPage }">
									<li class="page-item disabled"><a class="page-link"
										href="#">Next</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="${url}${selectNoticeList.pi.currentPage + 1 }${sUrl}">Next</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>