<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.kh.breaktime.booking.model.vo.Booking"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="/breaktime/resources/room.css/buReservation.css">
<title>Document</title>
<!--  공통적으로사용할 라이브러리 추가 -->
<!-- Jquey 라이브러리 -->
<scriptsrc="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>




<body>
	<%@ include file="../header.jsp"%>
	<div id="content">
		<div id="content1">
			<div id="reservationFormMove">
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
			<div style="font-size: xx-large; margin: 50px; margin-bottom: 70px;">예약
				내역</div>
			<hr style="background-color: black; width: 100%;">
			<div id="reservationList">
				<table>
					<thead>
						<tr>
							<th>객실이름</th>
							<th>이용인원수</th>
							<th>예약번호</th>
							<th>체크인</th>
							<th>체크아웃</th>

						</tr>
					</thead>
					<tbody>
						<c:forEach items="${bookingList}" var="booking">
							<tr>
								<td>${booking.roomName}</td>
								<td>${booking.roomHCount}</td>
								<td>${booking.reservationNo}</td>
								<td>${booking.roomCheckin}</td>
								<td>${booking.roomCheckout}</td>
							<%-- 	<td>
									 <form action="/breaktime/business/updateReservation" method="get">
										<input type="hidden" name="bookNo" value="${booking.bookNo}">
										<button id="update-btn" type="submit" onclick="buCheckin()">
											<span>입실</span>
										</button>
									</form> 
								</td>
								<td>
									
								</td> --%>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
			<hr style="width: 100%;">
		</div>
	</div>
	<script>
	 	function buCheckin(){
	 		alert("checkin 완료됬습니다.")
	 	}
	</script>
</body>

</html>