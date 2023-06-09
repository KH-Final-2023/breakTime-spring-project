<%@page import="com.kh.breaktime.decide.model.vo.Decide"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="m" value="${map}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${contextPath}/resources/css/decide/main.css">
<link rel="stylesheet" href="/breaktime/resources/css/font.css">




<script>
$(document).ready(function() {
	
	// 공유 아이콘 클릭 시 페이지 링크 복사
	$(".share-icon").click(function() {
		var pageUrl = window.location.href;
		navigator.clipboard.writeText(pageUrl);
		alert("페이지 링크가 복사되었습니다!");
	});
	
	// 별점 점수를 받아옵니다.
	let starScore = '${m.starScore}';
	// 별점 점수를 정수와 소수 부분으로 분리합니다.
	let intPart = Math.floor(starScore);
	let decimalPart = starScore - intPart;
	// 별을 출력하는 변수를 생성합니다.
	let starHTML = '';
	// 정수 부분의 수만큼 전체 별을 출력합니다.
	for (let i = 0; i < intPart; i++) {
	    starHTML += '<i class="fas fa-star"></i>';
	}
	// 소수 부분이 0.5 이상이면 반개 별을 출력합니다.
	if (decimalPart >= 0.5) {
	    starHTML += '<i class="fas fa-star-half-alt"></i>';
	}
	// 생성한 HTML을 별점 요소에 삽입합니다.
	$('.stars').html(starHTML);
	
	// 별점을 업데이트하는 함수
	function updateStars(starScore) {
		let intPart = Math.floor(starScore);
		let decimalPart = starScore - intPart;
		let starHTML = '';
		for (let i = 0; i < intPart; i++) {
			starHTML += '<i class="fas fa-star"></i>';
		}
		if (decimalPart >= 0.5) {
			starHTML += '<i class="fas fa-star-half-alt"></i>';
		}
		$('.stars').html(starHTML);
	}

	// 별점이 존재하면 업데이트
	if (starScore != null) {
		updateStars(starScore);
	} 
	
	// 하트 아이콘 클릭 시 색상 변경
	$(".heart-icon").click(function() {
		$(this).toggleClass("far fa-heart");
		$(this).toggleClass("fas fa-heart");
		$(this).toggleClass("red"); // 빨간색 클래스 추가 및 제거
	});

	// 섹션 링크 클릭 시 스타일 변경
	$(".section-link").click(function(e) {
		e.preventDefault();
		$(".section-link").removeClass("active"); // 모든 링크의 active 클래스 제거
		$(this).addClass("active"); // 클릭한 링크에 active 클래스 추가
	});

	// 섹션 링크 클릭 시 비동기식으로 JSP 로드
	$(".section-link, .rating").click(function(e) {
		e.preventDefault();
		var target = $(this).attr("href");
		$("#section-content").load(target);

		// 리뷰/후기 섹션 클릭 시 스타일 변경
		if ($(this).hasClass("rating")) {
			$(".section-link").removeClass("active"); // 모든 링크의 active 클래스 제거
			$(".section-link.review-link").addClass("active"); // 리뷰/후기 섹션 링크에 active 클래스 추가
		}
	});

	// 객실선택.html 페이지 자동로드
	var target = "${contextPath}/decide/deroom/${m.buNo}";
	$("#section-content").load(target);
});

$(document).ready(
		function() {
			var currentUrl = window.location.href;
			var previousUrl = document.referrer;
			
			$(".mapButton").click(
					function(e) {
						e.preventDefault();

						var overlay1 = $("<div>").addClass("overlay");
						var depopupmap1 = $("<iframe>").attr("src",
								"${contextPath}/decide/depopupmap/${m.buNo}");
						var closeBtn1 = $("<i>").addClass(
								"fas fa-times close-btn").css({
							"animation-name" : "reverse-animation",
							"animation-duration" : "0.1s",
							"animation-timing-function" : "ease-in-out"
						});

						overlay1.append(depopupmap1, closeBtn1);
						$(".container").prepend(overlay1);

						setTimeout(function() {
							overlay1.addClass("open");
						}, 300);

						closeBtn1.click(function() {
							overlay1.removeClass("open");

							setTimeout(function() {
								overlay1.remove();
							}, 300);
						});
					});

			$(".button").click(
					function(e) {
						e.preventDefault();

						var overlay = $("<div>").addClass("overlay");
						var depopupmap = $("<iframe>").attr("src",
								"${contextPath}/decide/depopupmap/${m.buNo}");
						var closeBtn = $("<i>").addClass(
								"fas fa-times close-btn").css({
							"animation-name" : "reverse-animation",
							"animation-duration" : "0.1s",
							"animation-timing-function" : "ease-in-out"
						});

						overlay.append(depopupmap, closeBtn);
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
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<!-- 메인 부분 -->
	<div class="container-main">
		<!-- 업체 메인 객실 이미지 -->
		<img class="main-image"
			src="${m.buMainImg}"
			alt="업체 메인 객실 이미지">

		<!-- 업체 정보 -->
		<div class="detail2-one-main">
			<div class="company-info">
				<h1 class="company-name">${m.buTitle}</h1>
				<div class="icons">
					<i class="icon share-icon fas fa-share-alt" title="공유하기"></i> <i
						class="icon heart-icon far fa-heart" title="찜하기"></i>
				</div>
			</div>
			<a href="${contextPath}/decide/dereview/${m.buNo}" class="rating"> 
			<span class="stars"> 
			<i class="fas fa-star"></i> 
			<i class="fas fa-star"></i> 
			<i class="fas fa-star"></i> 
			<i class="fas fa-star"></i> 
			<i class="fas fa-star-half-alt"></i>
			</span> 
			<span class="score"><b>${m.starScore} (${m.reviewCount})</b></span>
			</a>

			<!-- 주소와 지도 표시 -->
			<div class="location">
				<a class="mapButton"
					href="${contextPath}/decide/depopupmap/${m.buNo}"><i class="fas fa-map-marker-alt"></i> 
					<span class="address">${m.buAddress}</span>
				</a>
			</div>
		</div>
	</div>
	<div class="detail2-select">
		<!-- 섹션 선택 영역 -->	
		<div class="section">
			<a class="section-link" href="${contextPath}/decide/deroom/${m.buNo}">객실 선택</a>
			<a class="section-link" href="${contextPath}/decide/demap/${m.buNo}">위치 정보</a>
			<a class="section-link review-link" href="${contextPath}/decide/dereview/${m.buNo}">리뷰 / 후기</a>
		</div>

		<!-- 섹션 내용 영역 -->
		<div id="section-content">
			<!-- 객실선택.html 페이지가 자동으로 로드될 것입니다. -->
		</div>
	</div>
	
	
</body>

</html>