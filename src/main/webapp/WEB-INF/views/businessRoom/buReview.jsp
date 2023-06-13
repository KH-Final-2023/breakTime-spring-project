<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.breaktime.review.model.vo.Review"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Document</title>
</head>

<body>
	<%@ include file="../header.jsp"%>
	<div id="content">
		<div id="content1">
			<div id="reviewFormMove">
				<form action="/breaktime/businessRoom/resister" method="GET">
					<button type="submit" id="buRoomRegister">객실 등록</button>
				</form>
				<form action="/breaktime/business/reservation" method="GET">
					<button type="submit" id="buRoomReservation">예약 내역</button>
				</form>
				<form action="/breaktime/business/review" method="GET">
					<button type="submit" id="buReview">리뷰</button>
				</form>
			</div>
		</div>
		<div id="content2">
			<div id="buReviewText">리뷰 목록</div>
			<hr style="width: 100%;">
			<table>
				<thead>
					<tr>
						<th>Review Number</th>
						<th>Writer</th>
						<th>Room Number</th>
						<th>Booking Number</th>
						<th>Star Score</th>
						<th>Review Content</th>
						<th>Review Content Reply
							<div class="openBtn2" id="search2">
								<img
									src="<%=request.getContextPath()%>/resources/images/흰돋보기.png"
									alt="로고이미지">
									
							</div>
						</th>
						<th>Create Date</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${businessReviews}" var="review">
						<tr>
							<td>${review.reviewNo}</td>
							<td>${review.reviewWriter}</td>
							<td>${review.usingRoom}</td>
							<td>${review.bookNo}</td>
							<td>${review.starScore}</td>
							<td>${review.reviewContent}</td>
							<td>${review.reviewContentReply}</td>
							<td>${review.createDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
		<hr style="width: 100%;">
	</div>

	  <!-- 검색 모달창 html -->
    <div class="modal2 hidden">
            <div class="bg2"></div>
            <div class="modalBox2">
				<button class="closeBtn2">X</button>
				<div class="searchheader2">
					<p>검색</p>
				</div>
				<div class="searchbody2" style="overflow: auto;">
                    <form action="/breaktime/business/reviewContentReply" method="POST" >
                      <input type="hidden" name="reviewNo" value="${review.reviewNo}">
                  <%--   <input type="hidden" name="userNo" value="${loginBusiness.buNo}"> --%>
					<input type="search" id="search-input2" placeholder="키워드로 검색하세요" <%-- value="${review.reviewContentReply }" --%> name="reviewContentReply" onkeyup="enterkey()" >
                	</form>
				</div>
            </div>
        </div>
    
    
    <!-- 검색창 모달창 스크립트 -->
    <script>
  
            const open2 = () => {
                document.querySelector(".modal2").classList.remove("hidden");
                
            }
            const close2 = () => {
				console.log('cdlose')
                document.querySelector(".modal2").classList.add("hidden");
            }
            document.querySelector(".openBtn2").addEventListener("click", open2); 
            document.querySelector(".closeBtn2").addEventListener("click", close2); 
            document.querySelector(".bg2").addEventListener("click", close2); 

        </script>
</body>
	<link rel="stylesheet" type="text/css" href="/breaktime/resources/room.css/buReview.css">
</html>