<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.kh.breaktime.booking.model.vo.Booking"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">   
   <link rel="stylesheet" type="text/css" href="/breaktime/resources/room.css/buReservation.css">
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
        <div style="font-size: xx-large; margin: 50px; margin-bottom: 70px;">예약 내역</div>
        <hr style="background-color: black; width: 100%;">
        <div id="reservationList">
            <div>객실이름</div>
            <div>이용인원수</div>
            <div>예약번호</div>
            <div>체크인</div>
            <div>체크아웃</div>
            <div>예약상태</div>
        </div>
        <hr style="width: 100%;">
        <%-- bookingList는 서버에서 받은 Booking 정보를 담고 있는 List 객체 --%>
       <div>
    <c:forEach items="${bookingList}" var="booking">
            <div>${booking.roomName}</div>
            <div>${booking.roomCount}</div>
            <div>${booking.reservationNo}</div>
            <div>${booking.roomCheckin}</div>
            <div>${booking.roomCheckout}</div>
            <div>${booking.status}</div>
            <hr style="width: 100%;">
        </c:forEach>
    </div>
    </div>
</body>

</html>