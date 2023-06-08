<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="m" value="${map}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위치</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/decide/map.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55a7843b1806f000c969ae74b8fbf856&libraries=services&autoload=false"></script>
<style>

</style>
<script>    
$(document).ready(function() {
// 주소 복사 버튼 클릭 이벤트 핸들러
$(".copy-button").click(function() {
	var address = "${m.buAddress}"; // 복사할 주소 정보를 입력해주세요.
	copyToClipboard(address);

});

// 주소 복사 함수
function copyToClipboard(text) {
	var dummy = document.createElement("textarea");
	document.body.appendChild(dummy);
	dummy.value = text;
	dummy.select();
	document.execCommand("copy");
	document.body.removeChild(dummy);
	alert("주소가 복사되었습니다!");
}


});

$(document).ready(
		function() {
			var currentUrl = window.location.href;
			var previousUrl = document.referrer;

			$(".mapButton").click(
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
	<div class="container">
		<div class="detail2-all">
			<div class="map-container">
				<span>위치</span>
			</div>
			<div class="map-image">
				<a href="${contextPath}/decide/depopupmap/${m.buNo}" class="mapButton">
				<iframe src="${contextPath}/decide/detailmap/${m.buNo}" scrolling="no"></iframe>
				</a>
			</div>
			<div class="detail2-main">
				<div class="address-container">
					<i class="fas fa-map-marker-alt address-icon"></i> <span
						class="address-text">${m.buAddress}</span>
				</div>
				<button class="copy-button">주소 복사</button>
			</div>
		</div>
	</div>
	
</body>

</html>