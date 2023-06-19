<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!-- 공통적으로 사용할 라이브러리 추가 -->
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- alertify -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- alertify css -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css" />
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css" />
<script>

	$(document).ready(function() {
	    $('[name=reviewForm]').submit(function(e) {
	        e.preventDefault(); // Prevent form submission
	        
	        var formData = $(this).serialize(); // Serialize form data
	        console.dir(this);
	        const radios = this.querySelectorAll("[name=starScore]");
	        const reviewContents = this.querySelector("#reviewContents");
	        const closeBtn = $(this).parents("[id^=insertReview]").find(".close");
	        const reviewButton = $(this).parents("[id^=insertReview]").find(".btn-primary");
	        
	        $.ajax({
	            url: "${contextPath}/booking/reviewInsert",
	            type: "POST",
	            data: formData,
	            success: function(result) {
	                if (result == "1") {
	                	alert("리뷰 등록 성공", function(){
	                    	closeBtn.click();
	                    }	);
		                $(reviewContents).val(""); 
		                $(radios).val("");
		                location.reload();
		                
	                } else {
	                    alertify.alert("서비스 요청 실패", "리뷰 등록 실패");
	                }
	                
	            }
	        });
	    })
	    
	    $.ajax({
	    	url : '${contextPath}/booking/getReviewList',
	    	dataType : 'json',
	    	success : function(result){
	    		//console.log(result);
	    		$('.btn-outline-success').each(function(index0, item0){
	    			$(result).each(function(index1,item1){
	    				
	    				if(item1.usingRoom ==$(item0).attr('roomNo') ){
	    					$(item0).attr("disabled", true);
	    					$(item0).text("완료");
	    				}
	    			})
	    		}) 
	    	}
	    })
	});
	
</script>
<style>
html, body {
	width: 100%;
	height: 100%;
}
.booking {
	margin-top: -5%;
}
#booking-area {
	margin-top: 8%;
	text-align: center;
}

#notice_title {
	font-size: 2em;
	font-weight: bold;
}

#enrollWrap {
	width: 100%;
	margin-top: 5px;
}

table>thead>tr {
	font-weight: bold;
	font-size : 20px;
	background-color: green;
	color : white;
}

.star-rating {
	display: flex;
	flex-direction: row-reverse;
	font-size: 2.25rem;
	line-height: 2.5rem;
	justify-content: space-around;
	padding: 0 0.2em;
	text-align: center;
	width: 5em;
}

.star-rating input {
	display: none;
}

.star-rating label {
	font-size: 1em;
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
}

.star-rating :checked ~ label {
	-webkit-text-fill-color: gold;
}

.star-rating label:hover,
.star-rating label:hover ~ label {
	-webkit-text-fill-color: #fff58c;
}

#reviewContents {
	width: 470px;
	height: 350px;
	padding: 10px;
	box-sizing: border-box;
	border: solid 1.5px #D3D3D3;
	border-radius: 5px;
	font-size: 20px;
	resize: none;
}
</style>
</head>
<body>
	<main>
		<a href="<%=request.getContextPath()%>">
			<img src="<%=request.getContextPath()%>/resources/images/로고.png" style="width:200px; height:60px;">
		</a>
		<div class="booking">
			<div id="booking-area">
				<span id="notice_title"> 예약 내역 </span>
				<hr style="border-color : green;">
				<div id="enrollWrap">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>객실이름</th>
								<th>이용인원수</th>
								<th>예약번호</th>
								<th>체크인</th>
								<th>체크아웃</th>
								<th>리뷰작성</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty bookingList}">
								<td colspan="6" style="font-weight:bold;">예약된 내역이 없습니다.</td>
							</c:if>
							<c:forEach items="${bookingList}" var="booking" varStatus="vs">
								<tr>
									<td>${booking.roomName}</td>
									<td>${booking.roomHCount}</td>
									<td>${booking.reservationNo}</td>
									<td>${booking.roomCheckin}</td>
									<td>${booking.roomCheckout}</td>
									<td>
										<button class="btn btn-outline-success" roomNo="${booking.roomNo}" id="rBtn${vs.index}" type="button" 
											data-toggle="modal" data-target="#insertReview${vs.index}">
											<span>등록</span>
										</button>
									</td>
								</tr>
								
								<!--  수정 모달창 -->
								<div id="insertReview${vs.index}" class="modal fade" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title">리뷰 작성</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form  id="reviewForm" method="post" name="reviewForm">
													<input type="hidden" name="reviewWriter" value="${loginUser.userNo}" />
													<input type="hidden" name="bookNo" value="${empty booking.bookNo ? 0 : booking.bookNo}" />
													<input type="hidden" name="usingRoom" value="${empty booking.roomNo ? 0 : booking.roomNo}" />
													<input type="hidden" name="reviewNo" value="${empty review.reviewNo ? 0 : review.reviewNo}" />
													<div class="star-rating space-x-4 mx-auto">
														<input type="radio" id="5-stars${vs.index}" name="starScore" value="5">
														<label for="5-stars${vs.index}" class="star">★</label>
														<input type="radio" id="4-stars${vs.index}" name="starScore" value="4">
														<label for="4-stars${vs.index}" class="star">★</label>
														<input type="radio" id="3-stars${vs.index}" name="starScore" value="3">
														<label for="3-stars${vs.index}" class="star">★</label>
														<input type="radio" id="2-stars${vs.index}" name="starScore" value="2">
														<label for="2-stars${vs.index}" class="star">★</label>
														<input type="radio" id="1-star${vs.index}" name="starScore" value="1">
														<label for="1-star${vs.index}" class="star">★</label>
													</div>
													<div>
														<textarea class="col-auto form-control" id="reviewContents" name="reviewContent"
														 placeholder="breaktime 리뷰를 남겨주세요"></textarea>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
														<button type="submit" id="btn_register" class="btn btn-primary" >확인</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</main>
</body>
</html>