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
body {
	background-color: #f0f8f0;
}

#content1 {
	display: flex;
	justify-content: space-around;
	width: 300px;
	margin: 0 auto;
	background-color: greenyellow;
	border-radius: 15px;
}

#content2 {
	background-color: #f0fff0;
}

#resistedRoomListText {
	font-size: 24px;
	color: #228b22;
	margin-bottom: 10px;
}

#lodging {
	text-align: center;
	margin-top: 20px;
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
	border-radius: 5px;
	margin-bottom: 10px;
}

.room-info>div {
	flex: 1;
	margin-right: 10px;
}

#imgList {
	max-width: 250px;
	width: 100%;
}
</style>
<title>Document</title>
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
			<div id="resistedRoomListText">등록한 객실 리스트</div>
			<hr>
			<div id="lodging">
				<div>
					<c:forEach items="${roomList}" var="room" varStatus="roomStatus">
						<div class="room-info" data-room-no="${room.roomNo}">
							<div id="imgList">
								<!-- 해당 방의 이미지 출력 -->
								<img
									src="<%=request.getContextPath() %>${roomImgList[roomStatus.index].filePath}/${roomImgList[roomStatus.index].originName}">
							</div>
							<div>
								<div>${room.roomName}</div>
								<div>인원: ${room.roomCount}</div>
								<div>가격: ${room.roomPrice}</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	 $(document).ready(function() {
	    	  // 각 room-info를 클릭했을 때의 동작 처리
	    	  $('.room-info').click(function(event) {
	    	     event.preventDefault();  // 기본 클릭 동작 방지
	    	   var roomNo = $(this).data('room-no'); // 클릭한 방의 roomNo 값을 가져옴
	    	    if (roomNo !== undefined) {
	    	    	 window.location.href = '/breaktime/businessRoom/modifyPage?roomNo=' + roomNo; 
	    	    }
	    	  }); 
	    	}); 
	    	
    </script>
</body>
</html>
