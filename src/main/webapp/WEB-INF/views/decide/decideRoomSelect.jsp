<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실 선택</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/decide/room.css">
<script>
$(document).ready(
function() {
	var currentUrl = window.location.href;
	var previousUrl = document.referrer;

	$(".button").click(
			function(e) {
				e.preventDefault();

				var overlay = $("<div>").addClass("overlay");
				var datePicker = $("<iframe>").attr("src",
						"${contextPath}/decide/dedate");
				var closeBtn = $("<i>").addClass(
						"fas fa-times close-btn").css({
					"animation-name" : "reverse-animation",
					"animation-duration" : "0.1s",
					"animation-timing-function" : "ease-in-out"
				});

				overlay.append(datePicker, closeBtn);
				$(".container").prepend(overlay);

				setTimeout(function() {
					overlay.addClass("open");
				}, 300);

				closeBtn.click(function() {
					overlay.removeClass("open");

					setTimeout(function() {
						overlay.remove();
					}, 300);
				});
			});

	$(".close-btn").click(function(e) {
		e.preventDefault();

		if (previousUrl) {
			window.location.href = previousUrl;
		} else {
			window.location.href = currentUrl;
		}
	});
});
</script>
</head>

<body>
	<div class="container">
		<div class="detail2-all">
			<div class="button-container">
				<a href="${contextPath}/decide/dedate" class="button">날짜</a>
			</div>
			<div class="detail2-main">
				<c:forEach items="${roomList}" var="d">
					<div class="detail2-card">
						<div class="image">
							<img src="${d.roomImg}" alt="숙소 이미지">
						</div>
						<h2 class="title">${d.roomName}</h2>
						<p class="description">${d.roomInfo}</p>
						<p class="price">${d.roomPrice}</p>
						
						<c:if test="${empty roomList}">
							<div class="button-card" disabled>
								<a href="${contextPath}/decide/debasket" class="button-card1">장바구니
									담기</a> <a href="#" class="button-card2">객실 선택하기</a>
							</div>
						</c:if>
						
						<c:if test="${!empty roomList}">
							<div class="button-card">
								<a href="${contextPath}/decide/debasket" class="button-card1">장바구니
									담기</a> <a href="#" class="button-card2">객실 선택하기</a>
							</div>
						</c:if>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>

</html>