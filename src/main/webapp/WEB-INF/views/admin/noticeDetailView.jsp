<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
 	<script type="text/javascript">
        function deleteNotice(){
			if(!confirm("삭제 하시겠습니까?")){
				return false;
			}else{
				location.href="<%=request.getContextPath()%>/notice/delete?noticeNo=${notice.noticeNo}";
			}
	}
	</script>   
  <style>
  #detailcomment{
	width:50%;
	height:100px;
	text-align:center;
	margin:40px auto;
	font-size:x-large;
}

.inquiryDetail{
	width:70%;
	margin-top:30px;
	margin-bottom:80px;
	border-top: 3px solid #623f30;
	border-collapse: collapse;
}

.inquiryDetail tr{
	border-bottom:2px solid #e6e6e6;
	padding:10px;
}

.inquiryDetail tr td{
	border-bottom:2px solid #e6e6e6;
	padding:10px;
	height:30px;
}

#detail{
	text-align:center;
	width:130px;
	height:40px;
	color:white;
    font-weight:900;
    background-color:#428bca;
}

#detailcontent{
	text-align:center;
	width:130px;
	height:440px;
	color:white;
    font-weight:900;
    background-color:#428bca;
}

#detailtextarea{
	width:100%;
	height:440px;
	font-size:18px;
	border:none;
	background-color:white;
}

#detailtextarea:focus{
	outline:none;
}

  </style>
</head>
<body>
	<%@ include file="/resources/admin/adminFrame.jsp"%>
	<main id="main" class="main">
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
			<tr align="center">
				<td colspan="4">
					<c:if test="${loginUser.getAuthority() == 0}">
						<input type="submit" id="btn" value="수정" class="btn btn-outline-primary" onclick="location.href='update?noticeNo=${notice.noticeNo}'" />
						<a href="javascript:void(0);" onclick="deleteNotice();">
							<input type="button" id="btn" class="btn btn-outline-danger" value="삭제" />
						</a>
					</c:if>
					<input type="button" id="btn" value="목록"  class="btn btn-outline-success" onclick="location.href='list'" />
				</td>
			</tr>
		</table>
		</div>
	</main>
</body>
</html>