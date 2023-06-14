<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.breaktime.review.model.vo.Review"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Document</title>
</head>
<style>
#RenrollWrap {
	width: 60%;
	height: 80%;
	border: 1px solid rgb(224, 224, 224);
	border-radius: 10px;
	padding: 20px;
	background: rgb(247, 247, 247);
}
#contentR2 {
	display: flex;
	align-items: center;
}
#reviewNickname {
	display: flex;
	font-size: 16px;
	margin-bottom: 10px;
	color: rgb(97, 97, 97);
}

#reviewRoomName {
	display: flex;
}

#reviewRoomNameList {
	width: 5%;
	height: 20px;
	border-radius: 2px;
	text-align: center;
	color: rgb(145, 145, 145);
	background-color: rgba(230, 230, 230);
}

#reviewRoomNameInfo {
	width: 95%;
	margin-left: 10px;
	border-radius: 2px;
	color: rgb(97, 97, 97);
	background-color: rgba(248, 248, 248);
}

#review {
	margin: 20px 0;
	text-align: left;
}

#buReviewList {
	width: 700px;
	height: 200px;
	background-color: white;
	padding: 20px;
}

#review-star-rating .fa {
	color: #ffc107;
}

#review-star-rating {
	margin-bottom: 10px;
}

.buReviewDate {
	float: right;
	font-size: 16px;
	color: rgb(97, 97, 97);
}
</style>
<body>
	<%@ include file="../header.jsp"%>
	<div id="content">
		<div id="content1">
			<div id="reviewFormMove">
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
			<div id="buReviewText">리뷰 목록</div>
			<hr style="width: 100%;">
		<%-- 	<table>
				<thead>
					<tr>
						<th>Review Number</th>
						<th>Writer</th>
						<th>Room Number</th>
						<th>Booking Number</th>
						<th>Star Score</th>
						<th>Review Content</th>
						<th>Review Content Reply
							<div class="openBtn2" id="search2">
								<img
									src="<%=request.getContextPath()%>/resources/images/흰돋보기.png"
									alt="로고이미지">
									
							</div>
						</th>
						<th>Create Date</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${businessReviews}" var="review">
						<tr>
							<td>${review.reviewNo}</td>
							<td>${review.reviewWriter}</td>
							<td>${review.usingRoom}</td>
							<td>${review.bookNo}</td>
							<td>${review.starScore}</td>
							<td>${review.reviewContent}</td>
							<td>${review.reviewContentReply}</td>
							<td>${review.createDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
		<hr style="width: 100%;">
	</div>

	  <!-- 검색 모달창 html -->
    <div class="modal2 hidden">
            <div class="bg2"></div>
            <div class="modalBox2">
				<button class="closeBtn2">X</button>
				<div class="searchheader2">
					<p>검색</p>
				</div>
				<div class="searchbody2" style="overflow: auto;">
                    <form action="/breaktime/business/reviewContentReply" method="POST" >
                      <input type="hidden" name="reviewNo" value="${review.reviewNo}">
                    <input type="hidden" name="userNo" value="${loginBusiness.buNo}">
					<input type="search" id="search-input2" placeholder="키워드로 검색하세요" value="${review.reviewContentReply }" name="reviewContentReply" onkeyup="enterkey()" >
                	</form>
				</div>
            </div>
        </div> --%>
    
    	<div id="RenrollWrap">

					<c:forEach items="${businessReviews}" var="review">
						<div id="content">
							<div id="contentR2">
								<div id="reviewBackground" style="width:100%;">
									<div id="review-star-rating">
										<div class="fa fa-star" >
											 <c:choose>
												<c:when test="${review.starScore == '1' }">★</c:when>
												<c:when test="${review.starScore == '2' }">★★</c:when>
												<c:when test="${review.starScore == '3' }">★★★</c:when>
												<c:when test="${review.starScore == '4' }">★★★★</c:when>
												<c:when test="${review.starScore == '5' }">★★★★★</c:when>
											</c:choose>	 
										</div>
									</div>
									<div id="reviewNickname">
										 <div>${review.userName }|${review.createDate }</div> 
									</div>
									<div id="reviewRoomName">
										<div id="reviewRoomNameList">객실명</div>
										<div id="reviewRoomNameInfo">${review.roomName }</div> 
									</div>
									 <div id="review">${review.reviewContent }</div> 
									
										
									<form action="/breaktime/business/reviewContentReply" method="post">
										 <input type="hidden" name="reviewNo" value="${review.reviewNo}">
										
										<div id="buReviewList">
											<span style="font-size: larger;"><b>숙소 답변</b></span>
											<textarea class="buReview" name="reviewContentReply">${review.reviewContentReply }</textarea>
										</div>
										<a href="<%=request.getContextPath()%>/business/review">
										<button  type="submit" onclick="buReviewSubmit()">등록</button>
										</a>
									</form>	
									<form action="/breaktime/business/reviewReplyDecla" method="post">
										 <input type="hidden" name="reviewNo" value="${review.reviewNo}">
										
										<div id="buReviewList">
											<span style="font-size: larger;"><b>숙소 답변</b></span>
											<textarea class="buReview" name="reviewContentReply">${review.reviewContentReply }</textarea>
										</div>
										<a href="<%=request.getContextPath()%>/business/review">
										<button  type="submit" onclick="buReviewSubmit()">등록</button>
										</a>
									</form>	
										
								</div>
							</div>
							<hr style="color: rgba(0, 0, 0, 0.5);">
							
						</div>
					 </c:forEach> 
    <!-- 검색창 모달창 스크립트 -->
    <script>
    function buReviewSubmit() {
    	  // 등록 버튼 클릭 시 실행되는 코드
    	  // 댓글 작성 성공 알림 창 띄우기
    	  alert('댓글이 성공적으로 작성되었습니다.');

    	  window.addEventListener('unload', function() {
    		    location.reload();
    		  });
    } 

        </script>
</body>
	<link rel="stylesheet" type="text/css" href="/breaktime/resources/room.css/buReview.css">
</html>