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
<!-- 부트스트랩에서 제공하있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/breaktime/resources/css/header.css">
<link rel="stylesheet" href="/breaktime/resources/css/base.css">
<link rel="stylesheet" href="/breaktime/resources/css/footer.css">
<link rel="stylesheet" href="/breaktime/resources/css/main.css">
<style>
div {
	box-sizing: border-box;
	/* border: 1px solid red; */
}

html, body {
	width: 100%;
	height: 100%;
	margin: 0%;
	font-family: 'YanoljaYache';
	font-size: 18px;
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
	margin-top: 15vh;
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
	margin: 0px 0px 0px 45%;
}

#searchForm {
	width: 80%;
	margin-left: 15%;
}

#searchForm>* {
	float: left;
	margin: 5px;
}

.select {
	width: 15%;
}

.text {
	width: 53%;
}

.searchBtn {
	width: 10%;
}

#wrapper {
	height: 95%;
}

#footer {
	height: 18.5%;
	margin: -5% 0% 0% 12%;
}
</style>
</head>
	<body>
		<div id="wrapper">
			<%@ include file="/WEB-INF/views/header.jsp"%>
			
		
	
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
											onclick="location.href='<%=request.getContextPath()%>/notice/publicDetail?noticeNo=${n.noticeNo}'">
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
	
					<c:set var="url" value="publicList?cpage=" />
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
		
		</div>
			<div id= "footer">
				<%@ include file="/WEB-INF/views/footer.jsp"%>
			</div>
		
	</body>
</html>