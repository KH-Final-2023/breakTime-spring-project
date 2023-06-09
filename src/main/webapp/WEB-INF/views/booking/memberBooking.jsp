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
     <!--  공통적으로사용할 라이브러리 추가 -->
    <!-- Jquey 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩에서 제공하있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부투스트랩에서 제공하고있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- alertify -->
    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
    <!-- alertify css -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
    <!-- Default theme -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
    <!-- Semantic UI theme -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
</head>

<body>
<%--  <%@ include file="../header.jsp"%> --%>

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
           <table class="table table-hover" style="width:1800px;">
                  <thead>
                     <tr>
                        <th>객실이름</th>
                        <th>이용인원수</th>
                        <th>예약번호</th>
                        <th>체크인</th>
                        <th>체크아웃</th>
                        <th>예약상태</th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:forEach items="${bookingList}" var="booking">
                        <tr>
                           <td>${booking.roomName}</td>
                           <td>${booking.roomHCount}</td>
                           <td>${booking.reservationNo}</td>
                           <td>
                              <button id="update-btn" type="submit"
                                    class="btn btn-outline-primary" 
                                    data-toggle="modal">
                                    <span>입실전</span>
                              </button>
                           </td>
                           <td>
                                 <button type="button" class="btn btn-outline-danger">
                                    <span>퇴실전</span>
                              </a>
                           </td>
                           <td>
                                 <button type="button" class="btn btn-outline-success">
                                    <span>예약전</span>
                                 </button>
                           </td>
                        </tr>
                         </c:forEach>
                        </tbody>
               </table>
           <!--  <div>객실이름</div>
            <div>이용인원수</div>
            <div>예약번호</div>
            <div>체크인</div>
            <div>체크아웃</div>
            <div>예약상태</div> -->
        </div>
        <hr style="width: 100%;">
        <%-- bookingList는 서버에서 받은 Booking 정보를 담고 있는 List 객체 --%>
     <%--   <div>
    <c:forEach items="${bookingList}" var="booking">
            <div>${booking.roomName}</div>
            <div>${booking.roomHCount}</div>
            <div>${booking.reservationNo}</div>
            <div>${booking.roomCheckin}</div>
            <div>${booking.roomCheckout}</div>
            <div>${booking.status}</div>
            <hr style="width: 100%;">
        </c:forEach>
    </div> --%>
    </div>
</body>

</html>