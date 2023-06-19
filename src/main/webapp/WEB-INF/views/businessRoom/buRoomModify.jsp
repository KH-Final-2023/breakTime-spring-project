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

</style>

</head>
<body>
	<%@ include file="../header.jsp"%>
	<div id="content">
		<div id="content1">
			<div id="modifyFormMove">
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
			<div id="modifyForm">
				<form action="/breaktime/businessRoom/buRoomModify" method="POST" style="font-size :20px;"
					enctype="multipart/form-data">
					<div id="roomModifyText1"
						style="font-size: x-large; margin: 15px; text-align: center;">객실
						수정</div>

					<input type="hidden" name="fileNo" value="${roomImg.fileNo}">
					<input type="hidden" name="roomNo" value="${room.roomNo}" />
					<div class="room-info" data-room-no="${room.roomNo}">
						<div id="imgList" >
							<img src="<%=request.getContextPath() %>${roomImg.filePath}/${roomImg.originName}">
						</div>
					</div>

					<div id="ModifyroomName">객실 이름 :</div>
					<div>
						<input name="roomName" placeholder="수정할 객실 이름을 입력해주세요" value="${room.roomName}">
					</div>
					<div id="ModifyroomCount">인원 수:</div>
					<div>
						<input name="roomHCount" placeholder="인원을 입력해주세요" value="${room.roomHCount}">
					</div>
					<div id="ResisterRoomcheckin">체크인 :</div>
					<div>
						<input name="roomCheckin" placeholder="체크인 시간을 입력해주세요" value="${room.roomCheckin}">
					</div>
					<div id="ResisterRoomcheckout">체크아웃 :</div>
					<div>
						<input name="roomCheckout" placeholder="체크아웃 시간을 입력해주세요" value="${room.roomCheckout}">
					</div>
					<div id="ModifyroomPrice">가격 :</div>
					<div>
						<input name="roomPrice" placeholder="수정할 객실 가격을 입력해주세요" value="${room.roomPrice}">
					</div>
					<div id="ModifyroomStandardInfoText">수정 객실 기본 정보</div>
					<div>
						<input name="roomInfo" placeholder="수정할 객실 정보를 입력해주세요" value="${room.roomInfo}">
						<%--  <div><textarea name="roomInfo"  placeholder="수정할 객실 정보를 입력해주세요" value ="${room.roomInfo}"></textarea> --%>
					</div>
					<div id="ModifyroomPhotoInfoText">수정 객실 사진 등록</div>
					<div>
						<input type="file" name="upfiles" multiple value="${roomImg.saveName}">
					</div>
					<div id=modifyBtn>

						<button type="submit" id="resisterBtn">수정하기</button>
						<button type="button" onclick="deleteRoom(${room.roomNo})">삭제하기</button>
					</div>
					
				</form>
			</div>
		</div>
	</div>
	<script>
function deleteRoom(roomNo) {
  if (confirm("정말로 객실을 삭제하시겠습니까?")) {
    $.ajax({
      url: "/breaktime/businessRoom/deleteRoom/" + roomNo,
      type: 'POST',
      success: function(response) {
        // 삭제 성공한 경우의 처리
        alert("ddd");
        alert("성공적으로 삭제 되었습니다");
        location.reload();
      },
      error: function(xhr) {
        // 삭제 실패한 경우의 처리
        alert(xhr.responseText);
      }
    });
  }
}
</script>

</body>

</html>
