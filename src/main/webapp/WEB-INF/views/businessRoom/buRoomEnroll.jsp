<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">   
   <link rel="stylesheet" type="text/css" href="/breaktime/resources/css/buRoomEnroll.css">
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
             <form action="/breaktime/business/resister" method="GET">
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
    <div id="roomResisterText1" style="font-size: x-large; margin: 15px;">객실 등록</div>

   		<form id="buRoomEnrollForm" action="/breaktime/business/enroll" enctype="multipart/form-data" method="get">	   
		    <div id="ResisterRoomName">객실 이름 :</div>
		    <div><input name="roomName" placeholder="등록할 객실 이름을 입력해주세요"></div>
		    <div id="ResisterRoomCount">인원 :</div>
		    <div><input name="roomCount" placeholder="등록할 인원을 입력해주세요"></div>
		    <div id="ResisterRoomPrice">가격 :</div>
		    <div><input name="roomPrice" placeholder="등록할 가격을 입력해주세요"></div>
		    <div id="roomStandardInfoText">객실 기본 정보</div>
		    <div><textarea name="roomInfo"></textarea></div>
		    <div id="roomPhotoInfoText">객실 사진 등록</div>
		    <div><input type="file" multiple style="height: 150px;" name="upfiles"></div>
		    <div><button id="registerBtn" type="submit">등록하기</button></div>
		</form>
	</div>
    </div>
</body>

</html>