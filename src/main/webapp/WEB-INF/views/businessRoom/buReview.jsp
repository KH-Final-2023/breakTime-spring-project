<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kh.breaktime.review.model.vo.Review"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="/breaktime/resources/room.css/buReview.css">
<title>Document</title>
</head>

<body>
	 <%@ include file="../header.jsp"%> 
	<div id="content">
		<div id="content1">
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
		<div id="content2">
			<div id="buReviewText">리뷰 목록</div>
			<hr style="width: 100%;">
			<!-- <div id="reviewBackground">

				<div id="reviewInfo">
					<div id="reviewStar">
						&nbsp&nbsp&nbsp&nbsp
						<div id="reviewFace">
							<img src="images/smile.png" style="height: 30px;">
						</div>
						<div id="reviewStar1">
							<img src="images/star.png" style="height: 30px; width: 30px;">
						</div>
						<div id="reviewStar2">
							<img src="images/star.png" style="height: 30px; width: 30px;">
						</div>
						<div id="reviewStar3">
							<img src="images/star.png" style="height: 30px; width: 30px;">
						</div>
						<div id="reviewStar4">
							<img src="images/star.png" style="height: 30px; width: 30px;">
						</div>
						<div id="reviewStar5">
							<img src="images/star.png" style="height: 30px; width: 30px;">
						</div>
					</div>
					<div id="reviewNickname">
						&nbsp&nbsp &nbsp&nbsp
						<div>손오공/</div>
						<div>2023.05.02</div>
					</div>
					<div id="reviewRoomName">
						&nbsp&nbsp&nbsp&nbsp
						<div id="reviewRoomNameList">객실명</div>
						&nbsp&nbsp
						<div id="reviewRoomNameInfo">미니룸(인터넷,넷플릭스사용가능)</div>
					</div>
					<div id="review">방도 깔끔하고 생각보다 넓어서 좋아요!</div>

					<div id="buReviewList">
						<p style="font-size: larger;">&nbsp&nbsp숙소 답변</p>
						&nbsp 저희 숙소를 이용해주셔서 감사합니다
					</div> -->
			<table>
				<thead>
					<tr>
						<th>Review Number</th>
						<th>Writer</th>
						<th>Room Number</th>
						<th>Booking Number</th>
						<th>Star Score</th>
						<th>Review Content</th>
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
							<td>${review.createDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
	</div>
	</div>
</body>

</html>