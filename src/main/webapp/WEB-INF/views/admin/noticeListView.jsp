<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${!empty param.condition}" >
	<c:set var="sUrl" value="&condition=${param.condition }&keyword=${param.keyword }"/>
</c:if>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title></title>
<style>
.page-item.active a {
    background-color: #f8f9fa;
    color: #007bff;
}
</style>
</head>

<body>

  	<%@ include file="/resources/admin/adminFrame.jsp"%>
    
    <main id="main" class="main">
    	
	
		<div class="notice">
			<div id="notice_area">
				<div id="notice_title_area">
					<span id="notice_title"> 공지사항 </span>
					<hr style="width: 100%;">
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
					<a class="btn btn-primary" style="margin : 0.5% 0% 0% 5%;"
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
							<c:if test="${empty selectNoticeList.list}">
								<td colspan="5" style="font-weight:bold; text-align:center;">등록된 글이 없습니다.</td>
							</c:if>
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
								<c:set var="currentPage" value="${selectNoticeList.pi.currentPage}" />
								    <li class="page-item ${currentPage == item ? 'active' : ''}">
								        <a class="page-link" href="${url}${item}${sUrl}">${item}</a>
								    </li>
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
    </main>
	<script>
		$(document).ready(function() {
	        var updateNotice = '<c:out value="${updateNotice}"/>';
	        if(!(updateNotice==''))
	            alert("공지사항 수정에 성공하였습니다.");
	    });
		
		$(document).ready(function() {
	        var insertNotice = '<c:out value="${insertNotice}"/>';
	        if(!(insertNotice==''))
	            alert("공지사항 등록에 성공하였습니다.");
	    });
	</script> 
 

</body>

</html>