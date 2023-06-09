<%@page import="com.kh.breaktime.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   Member loginUser = (Member) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title></title>

</head>

<body>

  	<%@ include file="/resources/admin/adminFrame.jsp"%>
    
    <main id="main" class="main">
    	
	
		<div class="notice">
			<div id="notice_area">
				<div id="notice_title_area">
					<span id="notice_title"> 문의내역 </span>
					<hr style="width: 100%;">
				</div>
				
				<form id="searchForm" action="" method="get" align="center">
				 	<input type="hidden" class="custom-select" name="condition" value="title" ${param.condition=='title' ? 'checked' : ''}>
		 			<div class="text">
				 		<input type="text" class="form-control" name="keyword" placeholder="문의하실 숙소를 검색하세요."value="${param.keyword }"
				 				style="margin-left:30%;">
				 	</div>
				 	<button type="submit" class="searchBtn btn btn-secondary" style="margin-left:20%;">검색 </button>
		 		</form>
		 
				
				<div id="notice_board_area">
					<table id="noticeList">
							<thead>
							<tr style="background: #428bca;color: #fff;">
								<th>숙소명</th>
								<th>지역</th>
								<th>전화번호</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty selectChatSearchList.list } ">
									<tr>
										<td></td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${selectChatSearchList.list}" var="s">
										<tr>
											<td>
												${s.buTitle }
												<button class="btn btn-primary"
												onclick="location.href='${contextPath}/chat/room/${s.buNo}'">
												문의</button>
											</td>
											<td>${s.buAddress }</td>
											<td>${s.buTel }</td>
											
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
	
					<br>
	
					<c:set var="url" value="chatList?cpage=" />
					<div class="paging">
						<ul class="pagination">
							<c:choose>
								<c:when test="${ selectChatSearchList.pi.currentPage eq 1 }">
									<li class="page-item disabled"><a class="page-link"
										href="#">Previous</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="${url}${selectChatSearchList.pi.currentPage -1 }${sUrl}">Previous</a></li>
								</c:otherwise>
							</c:choose>
	
							<c:forEach var="item" begin="${selectChatSearchList.pi.startPage }"
								end="${selectChatSearchList.pi.endPage }">
								<li class="page-item"><a class="page-link"
									href="${url}${item }${sUrl}">${item }</a></li>
							</c:forEach>
	
							<c:choose>
								<c:when
									test="${ selectChatSearchList.pi.currentPage eq selectChatSearchList.pi.maxPage }">
									<li class="page-item disabled"><a class="page-link"
										href="#">Next</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="${url}${selectChatSearchList.pi.currentPage + 1 }${sUrl}">Next</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
			</div>
		</div>
    </main>

 

</body>

</html>