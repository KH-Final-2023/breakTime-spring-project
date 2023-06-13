<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">   
   <link rel="stylesheet" type="text/css" href="/breaktime/resources/room.css/buRoomInfo.css">
    <title>Document</title>
</head>

<body>
 <%@ include file="../header.jsp"%> 
<div id="content">
        <div id="content1">
            <div id="buRoomRegister">객실 등록</div>
            <div id="buRoomReservation">예약 내역</div>
            <div id="buReview">리뷰</div>
        </div>
        <div id="content2">
            <div id="roomInfoText">객실 정보</div>
            <div id="roomLInfoImng"><img src="images/hotel1.jpg"></div>
            <div>객실 상세 내용</div>
            <div id="roomInfo"><textarea id="roomTextarea">
            </textarea>
        </div>
        <div id="roomInfoBtn">
            <div id="roomInfobtn1"><button id="modifyBtn">수정하기</button></div>
            <div id="roomInfobtn2"><button id="deleteBtn">삭제하기</button></div>
        </div>
        </div>
    </div>
</body>

</html>