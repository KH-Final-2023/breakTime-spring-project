<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link rel="stylesheet" href="/css/summernote/summernote-lite.css">
<link rel="stylesheet" href="/breaktime/resources/css/header.css">
<link rel="stylesheet" href="/breaktime/resources/css/base.css">
<link rel="stylesheet" href="/breaktime/resources/css/footer.css">
<link rel="stylesheet" href="/breaktime/resources/css/main.css">
<script src="/js/summernote/summernote-lite.js"></script>
<script src="/js/summernote/lang/summernote-ko-KR.js"></script>

<style>
div {
	box-sizing: border-box;
	/* border: 1px solid red;  */
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

#detailcomment {
	width: 50%;
	height: 100px;
	text-align: center;
	margin: 40px auto;
	font-size: x-large;
}

.inquiryDetail {
	width: 1000px;
	margin-top: 80px;
	margin-bottom: 0px;
	margin-left : 500px;
	border-top: 3px solid #623f30;
	border-collapse: collapse;
}

.inquiryDetail tr {
	border-bottom: 2px solid #e6e6e6;
	padding: 10px;
}

.inquiryDetail tr td {
	border-bottom: 2px solid #e6e6e6;
	padding: 10px;
	height: 30px;
}

#detail {
	text-align: center;
	width: 130px;
	height: 40px;
	color: white;
	font-weight: 900;
	background-color: #428bca;
}

#detailcontent {
	text-align: center;
	width: 130px;
	height: 440px;
	color: white;
	font-weight: 900;
	background-color: #428bca;
}

#detailtextarea {
	width: 100%;
	height: 440px;
	font-size: 18px;
	border: none;
	background-color: white;
}

#detailtextarea:focus {
	outline: none;
}

#enrollWrap {
	width: 100%;
	height: 80%;
	border: 1px solid rgb(224, 224, 224);
	border-radius: 10px;
	padding: 20px;
	background: rgb(247, 247, 247);
}

#wrapper {
	height: 95%;
}

#footer {
	height: 18.5%;
}

</style>
</head>
<body>
	<div id="wrapper">
		<%@ include file="/WEB-INF/views/header.jsp"%>

		<div class="notice">
			<div id="notice_area">
				<span id="notice_title"> 공지사항 </span>
				<hr>
			</div>
			<table align="center" class="inquiryDetail">
				<tr>
					<td id="detail">제목</td>
					<td>${notice.noticeTitle}</td>
					<td id="detail">번호</td>
					<td>${notice.noticeNo}</td>
				</tr>
				<tr>
					<td id="detail">작성자</td>
					<td>${notice.userName}</td>
					<td id="detail">작성일</td>
					<td>${notice.createDate}</td>
				</tr>
				<tr>
					<td id="detailcontent">내용</td>
					<td colspan="3">
						<div id="detailtextarea" name="noticeContent">${notice.noticeContent}</div>
					</td>
				</tr>
			</table>
		</div>
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</div>
</body>
</html>