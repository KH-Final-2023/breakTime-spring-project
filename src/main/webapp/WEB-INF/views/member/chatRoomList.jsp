<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page import="com.kh.breaktime.member.model.vo.Member"%>
<%@ page import="com.kh.breaktime.business.model.vo.Business"%>
<%
   Member loginUser = (Member) session.getAttribute("loginUser");
   Business loginBusiness = (Business) session.getAttribute("loginBusiness");
   String alertMsg = (String) session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 고객 마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@alphardex/aqua.css/dist/aqua.min.css"> -->
<link rel="stylesheet" href="../resources/css/button.css">
<style>
	#wrapper{
	width: 100%;
    height: 800px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
    
	}
	
	#content1 {
    width: 40%;
    margin-bottom: 50px;
    display: flex;
    flex-direction: column;
    align-items: flex-end;
    padding-right: 5%;
    }
	
	#content2{
	padding-left:7%;
	width: 60%; 
	display: flex;
    flex-direction: column;
    border-left: 2px solid #67d567;
	}
	
	.sideMenu{
	font-size: 18px;
    color: rgba(0,0,0,0.56);
	}
	
	li{
	margin-bottom : 26px;
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
</style>
</head>
<body>
	
	<div id="wrapper" >
		<div style="width:100%; display: contents;">
			<h1 style="margin-bottom:100px; border-top: 1px solid black; border-bottom: 1px solid black;">MEMBER INFO</h1>
		</div>
		<div style="width:100%; display: flex; flex-direction: row;">
			<div id="content1">
				<ul style="list-style:none;">
					<li><a class="sideMenu">내 정보</a></li>
					<li><a class="sideMenu">예약내역</a></li>
					<li><a class="sideMenu">찜한 목록</a></li>
					<li><a class="sideMenu">문의쪽지</a></li>
					<li><a class="sideMenu">쿠폰함(미정)</a></li>
				</ul>
				<div style="margin-top: auto; position: relative;">
					<button class="btn btn-primary btn-ghost btn-slash">회원탈퇴</button>
				</div>
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
	</div>
	
	
</body>
</html>