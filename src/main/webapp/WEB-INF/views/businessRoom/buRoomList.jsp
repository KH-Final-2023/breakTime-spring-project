<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="/breaktime/resources/room.css/buRoomList.css">
<title>Document</title>

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
			<form action="/breaktime/businessRoom/review" method="GET">
				<button type="submit" id="buReview">리뷰</button>
			</form>
			<a href="<%=  request.getContextPath() %>/chat/roomBu">
			<button type="submit" id="buReview">문의내역</button>
			</a>
		</div>
		<div id="content2">
			<div id="resistedRoomListText">등록한 객실 리스트</div>
			<hr>
			<div id="lodging">
				<h1>방 정보</h1>
				<table>
					<tr>
						<th>사업자 아이디</th>
						<th>방 이름</th>
						<th>가격</th>
						<th>인원</th>
						<th>상세 정보</th>
					</tr>
					<c:forEach items="${roomList}" var="room">
						<tr>
							<td>${room.buId}</td>
							<td>${room.roomName}</td>
							<td>${room.roomPrice}</td>
							<td>${room.roomCount}</td>
							<td>${room.roomInfo}</td>
						</tr>
					</c:forEach>
				</table>

				<h1>방 이미지</h1>
				<c:forEach items="${roomImgList}" var="roomImg">
					<img src="<%=request.getContextPath() %>${roomImg.filePath}/${roomImg.originName}" >
					
				</c:forEach>
				
			</div>
			<script>
			  console.log(${roomImgList});
			</script>
		</div>
	</div>
	</div>


</body>

</html>