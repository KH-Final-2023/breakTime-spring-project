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
	href="/breaktime/resources/room.css/buRoomList.css">
<title>Document</title>
<style>
/* 전체적인 초록색 계열 스타일 */
#content1 {
	display: flex;
	justify-content: center;
}

body {
	background-color: #f0fff0;
}

#formMove {
	display: flex;
	justify-content: space-around;
	width: 600px;
	height: 60px;
	background-color: #c0e2c0;
	border-radius: 15px;
	margin-top: 150px;
	align-items: center;
}

#content2 {
	background-color: #f0fff0;
	display: flex;
	justify-content: center;
}

#resistedRoomListText {
	font-size: 24px;
	color: #228b22;
	margin-bottom: 10px;
	text-align: center;
	margin-top: 60px;
}

#lodging {
	text-align: center;
	margin-top: 40px;
	display: flex;
	/* justify-content: space-between; */
	align-items: center;
	flex-direction: column;
	justify-content: center;
	width: 1150px;
	margin-bottom: 40px;
}

img {
	width: 210x;
	height: 170px;
	margin: 10px;
}

/* 포인트 스타일 */
.room-info {
	display: flex;
	justify-content: space-between;
	padding: 10px;
	background-color: white;
	margin-bottom: 10px;
	width: 1000px;
	border-radius: 15px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4);
}

#imgList, #roomListInfo {
	max-width: 250px;
	width: 100%;
}

#buRoomRegister, #buRoomReservation, #buReview {
	border: solid 1px black;
	border-radius: 5px;
	background-color: green;
	color: white;
	width: 100px;
	height: 40px
}
</style>
<title>Document</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
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
		<div id="resistedRoomListText">등록한 객실 리스트</div>
		<hr>
		<div id="content2">
		<div><input id="searchRoom" placeholder="검색할 객실을 입력하세요"></div>
			<div id="lodging">
				<c:forEach items="${roomList}" var="room" varStatus="roomStatus">
					<div class="room-info" data-room-no="${room.roomNo}">
						<div id="imgList">
							<!-- 해당 방의 이미지 출력 -->
							<img
								src="<%=request.getContextPath() %>${roomImgList[roomStatus.index].filePath}/${roomImgList[roomStatus.index].originName}">
						</div>
						<div id="roomListInfo">
							<div>${room.roomName}</div>
							<div>인원: ${room.roomHCount}</div>
							<div>가격: ${room.roomPrice}</div>
						</div>
					</div>
					<div id="dd" style="height: 15px; background-color: #f0fff0;"></div>
				</c:forEach>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							// 각 room-info를 클릭했을 때의 동작 처리
							$('.room-info')
									.click(
											function(event) {
												event.preventDefault(); // 기본 클릭 동작 방지
												var roomNo = $(this).data(
														'room-no');// 클릭한 방의 roomNo 값을 가져옴
												if (roomNo !== undefined) {
													window.location.href = '/breaktime/businessRoom/modifyPage?roomNo='
															+ roomNo;
												}
											});
						});
	</script>
</body>
</html>