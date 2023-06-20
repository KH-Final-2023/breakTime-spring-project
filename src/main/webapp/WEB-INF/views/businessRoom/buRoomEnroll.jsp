<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="/breaktime/resources/room.css/buRoomEnroll.css">
<title>Document</title>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div id="content">
		<div id="content1">
			<div id="formMove">
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
			<div id="roomEnrollForm" style="font-size: 25px;">

				<form id="buRoomEnrollForm" action="/breaktime/businessRoom/enroll"
					enctype="multipart/form-data" method="POST">
					<div id="roomResisterText1"
						style="font-size: x-large; margin: 15px;">객실 등록</div>
					<div>
						<input type="hidden" name="buNo" value="${loginBusiness.buNo}">
					</div>
					<div id="ResisterRoomName">객실 이름 :</div>
					<div>
						<input name="roomName" placeholder="등록할 객실 이름을 입력해주세요">
					</div>
					<div id="ResisterRoomCount">인원 :</div>
					<div>
						<input name="roomHCount" placeholder="등록할 인원을 입력해주세요">
					</div>
					<div id="ResisterRoomcheckin">체크인 :</div>
					<div>
						<input name="roomCheckin" placeholder="체크인 시간을 입력해주세요">
					</div>
					<div id="ResisterRoomcheckout">체크아웃 :</div>
					<div>
						<input name="roomCheckout" placeholder="체크아웃 시간을 입력해주세요">
					</div>
					<div id="ResisterRoomPrice">가격 :</div>
					<div>
						<input name="roomPrice" placeholder="등록할 가격을 입력해주세요">
					</div>
					<div id="roomStandardInfoText">객실 기본 정보</div>
					<div>
						<textarea name="roomInfo"></textarea>
					</div>
					<div id="roomPhotoInfoText">객실 사진 등록</div>
					<div>
						<input type="file" multiple style="height: 150px;" name="upfiles">
					</div>
					<div id="enrollBtn">
						<button id="registerBtn" type="submit">등록하기</button>
					</div>
				</form>

			</div>
		</div>
	</div>
	
	<script>
	document.getElementById("bulogout").addEventListener("click",function(){
        location.href = "<%=request.getContextPath()%>/business/logout";
        })

	</script>
</body>

</html>