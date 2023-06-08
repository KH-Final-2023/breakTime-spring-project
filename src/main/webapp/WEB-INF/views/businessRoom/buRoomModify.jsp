<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.breaktime.room.model.vo.Room"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="/breaktime/resources/room.css/buRoomModify.css">
<title>Document</title>
<style>
img {
	width: 210x;
	height: 170px;
	margin: 10px;
}
</style>

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
			<div id="roomModifyText1" style="font-size: x-large; margin: 15px;">객실
				수정</div>

			<form action="/breaktime/businessRoom/buRoomModify" method="POST"
				enctype="multipart/form-data">
				<input type="hidden" name="fileNo" value="${roomImg.fileNo}">
				<input type="hidden" name="roomNo" value="${ room.roomNo}" />
				<div class="room-info" data-room-no="${room.roomNo}">
					<div id="imgList">
						<img
							src="<%=request.getContextPath() %>${roomImg.filePath}/${roomImg.originName}">
					</div>
					<div>
						<div>${room.roomName}</div>
						<div>인원: ${room.roomCount}</div>
						<div>가격: ${room.roomPrice}</div>
					</div>
				</div>

				<div id="ModifyroomName">객실 이름 :</div>
				<div>
					<input name="roomName" placeholder="수정할 객실 이름을 입력해주세요">
				</div>
				<div id="ModifyroomCount">인원 수:</div>
				<div>
					<input name="roomCount" placeholder="인원을 입력해주세요">
				</div>
				<div id="ModifyroomPrice">가격 :</div>
				<div>
					<input name="roomPrice" placeholder="수정할 객실 가격을 입력해주세요">
				</div>
				<div id="ModifyroomStandardInfoText">수정 객실 기본 정보</div>
				<div>
					<input name="roomInfo" placeholder="수정할 객실 정보를 입력해주세요">
				</div>
				<div id="ModifyroomPhotoInfoText">수정 객실 사진 등록</div>
				<div>
					<input type="file" name="upfiles" multiple style="height: 150px;">
				</div>
				<div>

					<button type="submit" id="resisterBtn">수정하기</button>
					<%-- <a
						href="<%=request.getContextPath()%>/businessRoom/buRoomList">
						<button type="submit" id="resisterBtn">확인수정하기button>
					</a> --%>
				</div>
			</form>
		</div>

	</div>
	<script>
    var roomNo = "${room.roomNo}";
    console.log(roomNo);
</script>

</body>

</html>
