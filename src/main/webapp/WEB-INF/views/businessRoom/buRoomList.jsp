<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
/* 전체적인 초록색 계열 스타일 */

body{
	margin:0;
}
#content1 {
	display: flex;
	justify-content: center;
}

body {
	background-color: ;
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
	background-color:#f2f2f2 ;
	display: flex;
	justify-content: center;
}

#resistedRoomListText {
	font-size:50px;
	color: #228b22;
	margin-bottom: 10px;
	text-align: center;
	margin-top: 60px;
}

#lodging {
	background-color:white ;
	border-radius: 15px;
	display: flex;
	align-items: center;
	flex-direction: column;
	justify-content: center;
	width: 1150px;
	margin-bottom: 40px;
	height : 100%;
}

/* 포인트 스타일 */
.room-info {
	display: flex;
	justify-content: space-between;
	height: 300px;
	background-color: white;
	margin-bottom: 30px;
	width: 1000px;
	border-radius: 15px;
	box-shadow: 0 8px 16px rgba(0, 0, 0, 1.0);
	transition: transform 0.3s ease;
}

.room-info:hover {
	transform: scale(1.1);
}

#roomListInfo {
	width : 750px;
	font-size: xlarge;
}

#imgList {
	
}

#buRoomRegister, #buRoomReservation, #buReview {
	border: solid 1px black;
	border-radius: 5px;
	background-color: green;
	color: white;
	width: 100px;
	height: 40px;
}

#selectRoom {
	margin-bottom: 30px;
	display: flex;
	justify-content: space-between;
}

#roomName, #roomHCount, #roomPrice {
	height: 40px;
	width: 200px;
	border-radius: 5px;
	border: 1px solid lightgreen;
}

#selectRoomBtn {
	width: 50px;
	height: 30px;
	border-radius: 5px;
}

button {
	font-family: 'Arial', fantasy;
	font-size: 16px;
	font-weight: bold;
	text-transform: uppercase;
}

img {
	width: 250px;
	height: 300px;
	border-radius: 10px;
}
#buRoomName,#buroomHCount,#buroomcheckin,#buroomcheckout,#buRoomInfo{
	margin-left : 20px;
}
#buRoomPirce{
	margin-left : 600px;
	margin-bottom : 30px;
}
</style>
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
			<div id="lodging">
				<%--   <!-- 페이징 처리를 위한 페이지 링크 생성 -->
      <div class="pagination">
         <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="page">
            <a href="/breaktime/businessRoom/searchRoomList?page=${page}">${page}</a>
         </c:forEach>
      </div> --%>
			<%-- 	<img src="<%= request.getContextPath() %>/resources/images/bestback.jpg" alt="대체 텍스트" style="width:"> --%>

				<div id="selectRoom">
					<form action="/breaktime/businessRoom/searchRoomList" method="get"
						onsubmit="return validateSearchForm()">
						<label for="roomName" style="font-size: 23px;">ROOM CLASS:</label>
						<input type="text" id="roomName" name="roomName"> <label
							for="roomHCount" style="font-size: 23px;">PERSON COUNT:</label> <select
							id="roomHCount" name="roomHCount">
							<option value="">Any</option>
							<option value="1">1 Person</option>
							<option value="2">2 Persons</option>
							<option value="3">3 Persons</option>
							<option value="4">4 Persons</option>
						</select> <label for="roomPrice" style="font-size: 23px;">PRICE:</label> <select
							id="roomPrice" name="roomPrice">
							<option value="">Default</option>
							<option value="asc">Low to High</option>
							<option value="desc">High to Low</option>
						</select>
						<button type="submit" onclick="validateSearchForm()" id="selectRoomBtn">검색</button>
					</form>
				</div>
				<c:forEach items="${roomList}" var="room" varStatus="roomStatus">
					<div class="room-info" data-room-no="${room.roomNo}">
						<div id="imgList">
							<!-- 해당 방의 이미지 출력 -->
							<img
								src="<%=request.getContextPath() %>${roomImgList[roomStatus.index].filePath}/${roomImgList[roomStatus.index].originName}">
						</div>
						<div id="roomListInfo">
							<div id="buRoomName"><p  style="font-size:25px;">방이름: ${room.roomName}</p></div>
							<div id="buroomHCount"><p   style="font-size:25px;">인원: ${room.roomHCount}</p></div>
							<div id="buroomcheckin"><p   style="font-size:25px;">체크인: ${room.roomCheckin}</p></div>
							<div id="buroomcheckout"><p   style="font-size:25px;">체크아웃: ${room.roomCheckout}</p></div>
							<div id="buRoomInfo"><p  style="font-size:25px;">객실 정보: ${room.roomInfo}</p></div>
							<div id="buRoomPirce"><p  style="font-size:25px;">가격: ${room.roomPrice}</p></div>
						</div>
					</div>
				</c:forEach>

				<!-- 페이징 처리를 위한 페이지 링크 생성 -->
				<%--  <div class="pagination">
         <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="page">
            <a href="/breaktime/businessRoom/searchRoomList?page=${page}">${page}</a>
         </c:forEach>
      </div> --%>
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
														'room-no'); // 클릭한 방의 roomNo 값을 가져옴
												if (roomNo !== undefined) {
													window.location.href = '/breaktime/businessRoom/modifyPage?roomNo='
															+ roomNo;
												}
											});
						});

		function validateSearchForm() {
			var roomName = document.getElementById("roomName").value;
			var roomPrice = document.getElementById("roomPrice").value;
			var roomHCount = document.getElementById("roomHCount").value;

			if (roomName.trim() === "" || roomPrice.trim() === ""
					|| roomHCount.trim() === "") {
				alert("Please enter all search criteria.");
				return false;
			}

			return true;
		}
		
		document.getElementById("bulogout").addEventListener("click",function(){
	           location.href = "<%=request.getContextPath()%>/business/logout";
	           })
	</script>
</body>
</html>
