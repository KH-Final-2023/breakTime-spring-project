<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">   
   <link rel="stylesheet" type="text/css" href="/breaktime/resources/css/buReservation.css">
    <title>Document</title>
</head>

<body>
    <div id="header">
        <div id="header-content">
            <div id="home-logo">
                <img src="resources/IMG/로고.jpg" alt="로고이미지">
            </div>
            <div id="navbar">
                <div id="login">로그인</div>
                <div id="enroll">회원가입</div>
                <div id="notice">공지사항</div>
                <div id="mypage">마이페이지</div>
                <div id="mybooking">예약내역</div>
                <div id="wishList">
                    장바구니
                </div>
                <div id="message">
                    쪽지
                </div>
            </div>
        </div>
    </div>

    <div id="content">
        <div id="content1">
           <form action="/breaktime/businessRoom/resister" method="GET">
   				 <button type="submit" id="buRoomRegister">객실 등록</button>
			</form>
		    <form action="/breaktime/businessRoom/reservation" method="GET">
		        <button type="submit" id="buRoomReservation">예약 내역</button>
		    </form>
		    <form action="/breaktime/businessRoom/review" method="GET">
		        <button type="submit" id="buReview">리뷰</button>
		    </form>
        </div>
        <div id="content2">
            <div style="font-size: xx-large; margin: 50px; margin-bottom: 70px;">예약 내역</div>
            <hr style="background-color: black; width: 100%;">
            <div id="reservationList">
                <div>객실이름</div>
                <div>이용인원수</div>
                <div>체크인</div>
                <div>체크아웃</div>
                <div>예약명</div>
                <div>연락처</div>
                <div>예약상태</div>
            </div>
            <hr style="width: 100%;">
            <div>예약 내용</div>
            <hr style=" width: 100%;">
            <div>예약 내용</div>
            <hr style=" width: 100%;">
            <div>예약 내용</div>
            <hr style="  width: 100%;">
            <div>예약 내용</div>
            <hr style=" width: 100%;">
        </div>
    </div>
</body>

</html>