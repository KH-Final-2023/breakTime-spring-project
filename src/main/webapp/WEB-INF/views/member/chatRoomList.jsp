<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page import="com.kh.breaktime.member.model.vo.Member"%>
<%@ page import="com.kh.breaktime.business.model.vo.Business"%>
<%
   Member loginUser = (Member) session.getAttribute("loginUser");
   Business loginBusiness = (Business) session.getAttribute("loginBusiness");
   String alertMsg = (String) session.getAttribute("alertMsg");
%>
<c:if test="${!empty param.condition}" >
	<c:set var="sUrl" value="&condition=${param.condition }&keyword=${param.keyword }"/>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 고객 마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@alphardex/aqua.css/dist/aqua.min.css"> -->
<link rel="stylesheet" href="../resources/css/button.css">
<style>

	body{
		margin:0;
	}
	#wrapper{
	width: 100%;
    height: 800px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
    
	}
	
	#content1 {
    width: 20%;
    margin-bottom: 50px;
    display: flex;
    flex-direction: column;
    align-items: flex-end;
    padding-right: 5%;
    }
	
	#content2{
	padding-left:7%;
	width: 45%; 
	display: flex;
    flex-direction: column;
    border-left: 2px solid #67d567;
	}
	
	.sideMenu{
	font-size: 18px;
    color: black;
	}
	
	.side{
	width: 140px;
  font-family: 'Roboto', sans-serif;
  font-size: 11px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 500;
  color: #000;
  background-color: #fff;
  border: none;
  border-radius: 45px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  margin-bottom : 20px;
	}
	
	b{
	width:100px;
	}
	
	.sessionData{
	color:#67d567;
	}
	
	.btn-primary btn-ghost btn-slash{
	color: #67d567;
    border-color: #67d567;
	}
	

	.page-item.active a {
	    background-color: #f8f9fa;
	    color: #007bff;
	}

	a{
	 text-decoration : none;
	 display: flex;
    justify-content: center;
	}
	
	.side:hover {
  border: 1px solid #2EE59D;
  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
  color: #fff;
  transform: translateY(-7px);
}
	
	.sessionData{
	color:#67d567;
	}
	

</style>
</head>
<body>
	 <jsp:include page="/WEB-INF/views/header.jsp" />
	<div id="wrapper" >
		<div style="width:100%; display: contents;">
			<h1 style="margin-bottom:100px; border-top: 1px solid black; border-bottom: 1px solid black;">MEMBER INFO</h1>
		</div>
		<div style="width:100%; display: flex; flex-direction: row;">
			<div id="content1">
				<ul style="list-style:none;">
					<li class="side"><a class="sideMenu" href="<%=request.getContextPath()%>/member/myPage">내 정보</a></li>
					<li class="side"><a class="sideMenu" id="booking">예약내역</a></li>
					<li class="side"><a class="sideMenu" href="<%=request.getContextPath()%>/member/wishList">찜한 목록</a></li>
					<li class="side"><a class="sideMenu" href="<%=request.getContextPath()%>/member/list">문의쪽지</a></li>
				</ul>
			</div>
		
			<div id="content2">
				<form id="searchForm" action="" method="get" align="center">
				 	<input type="hidden" class="custom-select" name="condition" value="title" ${param.condition=='title' ? 'checked' : ''}>
				 	
				 	<div class="text">
				 		<input type="text" class="form-control" name="keyword" placeholder="문의하실 숙소를 검색하세요."value="${param.keyword }">
				 	</div>
				 	<button type="submit" class="searchBtn btn btn-secondary">검색 </button>
		 		</form>		
		 		
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
								<c:when test="${empty selectSearchList.list } ">
									<tr>
										<td></td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${selectSearchList.list}" var="s">
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
			</div>
		</div>
			<c:set var="url" value="list?cpage=" />
					<div class="paging">
						<ul class="pagination">
							<c:choose>
								<c:when test="${ selectSearchList.pi.currentPage eq 1 }">
									<li class="page-item disabled"><a class="page-link"
										href="#">Previous</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="${url}${selectSearchList.pi.currentPage -1 }${sUrl}">Previous</a></li>
								</c:otherwise>
							</c:choose>
	
							<c:forEach var="item" begin="${selectSearchList.pi.startPage }"
								end="${selectSearchList.pi.endPage }">
								<c:set var="currentPage" value="${selectSearchList.pi.currentPage}" />
								    <li class="page-item ${currentPage == item ? 'active' : ''}">
								        <a class="page-link" href="${url}${item}${sUrl}">${item}</a>
								    </li>
							</c:forEach>
	
							<c:choose>
								<c:when
									test="${ selectSearchList.pi.currentPage eq selectSearchList.pi.maxPage }">
									<li class="page-item disabled"><a class="page-link"
										href="#">Next</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="${url}${selectSearchList.pi.currentPage + 1 }${sUrl}">Next</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
	</div>
	
 	  <script>
         document.getElementById("booking").addEventListener("click",function(){
        location.href = "<%=request.getContextPath()%>/booking/bookingView";
        })
      </script>
</body>
</html>