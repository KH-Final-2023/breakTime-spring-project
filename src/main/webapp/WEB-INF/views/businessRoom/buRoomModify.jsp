<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="/breaktime/resources/room.css/buRoomModify.css">
<title>Document</title>

<body>
	 <%-- <%@ include file="../header.jsp"%> --%>
	 <div id="content">
        <div id="content1">
            <div id="buRoomRegister">객실 등록</div>
            <div id="buRoomReservation">예약 내역</div>
            <div id="buReview">리뷰</div>
        </div>
        <div id="content2">
            <div id="roomModifyText1" style="font-size: x-large; margin: 15px;">객실 수정</div>

            <div id="ModifyroomName">객실 이름 : </div>
            <div><input placeholder=" 수정할 객실 이름을 입력해주세요"></div>
            <div id="ModifyroomPrice">가격 : </div>
            <div><input placeholder=" 수정할 객실 이름을 입력해주세요"></div>

            
            <div id="ModifyroomStandardInfoText">수정 객실 기본 정보</div>
            <div><textarea></textarea></div>
            <div id="ModifyroomPhotoInfoText">수정 객실 사진 등록</div>
            <div><input type="file" multiple style="height: 150px;"></div>
            <div><button id="resisterBtn">수정하기</button></div>
        </div>
    </div>


</body>

</html>