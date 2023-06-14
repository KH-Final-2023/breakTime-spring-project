<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@alphardex/aqua.css/dist/aqua.min.css"> -->
<link rel="stylesheet" href="../resources/css/button.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.10/dist/sweetalert2.all.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.10/dist/sweetalert2.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="/breaktime/resources/css/sukbumModal.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
#wrapper {
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

#content2 {
	padding-left: 7%;
	width: 60%;
	display: flex;
	flex-direction: column;
	border-left: 2px solid #67d567;
}

.sideMenu {
	font-size: 18px;
	color: rgba(0, 0, 0, 0.56);
}

li {
	margin-bottom: 26px;
}

b {
	width: 100px;
}

.sessionData {
	color: #67d567;
}

.btn-primary btn-ghost btn-slash {
	color: #67d567;
	border-color: #67d567;
}
</style>
</head>
<body>
	

	
	<div id="wrapper">
		<div style="width: 100%; display: contents;">
			<h1
				style="color: #1dbf1d; margin-bottom: 100px; border-top: 1px solid #1dbf1d; border-bottom: 1px solid #1dbf1d;">MEMBER
				INFO</h1>
		</div>
		<div style="width: 100%; display: flex; flex-direction: row;">
			<div id="content1">
				<ul style="list-style: none;">
					<li><a class="sideMenu"
						href="<%=request.getContextPath()%>/member/myPage">내 정보</a></li>
					<li><a class="sideMenu" id="booking">예약내역</a></li>
					<li><a class="sideMenu"
						href="<%=request.getContextPath()%>/member/wishList">찜한 목록</a></li>
					<li><a class="sideMenu"
						href="<%=request.getContextPath()%>/member/list">문의쪽지</a></li>
				</ul>
			</div>

			<div id="content2">
				<h3>찜 목록</h3>
				<div style="width: 80%; height: 520px; display: flex; flex-wrap: wrap;">
					<c:forEach items="${list}" var="w" varStatus="loop">					
						<div onclick="location.href='${contextPath }/decide/demain/${w.buNo}'" id="v" style="border: 1px solid black; width: 40%; height: 100%; display: flex; align-items: center; flex-direction: column; margin-right: 70px; margin-bottom: 20px">
							<div style="height: 60%; width: 100%">
								<img style="width: 100%; height: 100%; object-fit: cover;"
									src="${w.buMainImg}">
							</div>
							<div style="height: 20%">
								<h2 style="text-align: center;">${w.buTitle}</h2>
							</div>
							<div style="height: 20%">
								<h4>${w.buAddress}</h4>
							</div>
						</div>	
						<c:if test="${loop.index % 2 == 1}">
							<div style="width: 100%; height: 0;"></div>
						</c:if>
						
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	


 	  <script>
         document.getElementById("booking").addEventListener("click",function(){
        location.href = "<%=request.getContextPath()%>/booking/bookingView";
        })
      </script>
</body>
</html>