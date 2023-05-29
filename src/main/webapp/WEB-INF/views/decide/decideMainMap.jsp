<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위치</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
/* Reset CSS */
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

/* 전체적인 스타일 */
body {
	font-family: Arial, sans-serif;
	font-size: 14px;
	line-height: 1.4;
	color: #333;
	background-color: #f2f2f2;
}

.container {
	max-width: 768px;
	margin: 0 auto;
	background-color: #fff;
	/* 컨테이너 배경색상 */
}

.detail2-main {
	margin-top: 20px;
	/* 위쪽 여백 크기 */
	margin-bottom: 50px;
	display: flex;
	justify-content: flex-start;
	align-items: center;
	padding: 0;
	position: relative;
	flex-wrap: wrap;
	font-size: 16px;
	font-weight: bold;
}

.detail2-all {
	display: flex;
	padding: 0;
	position: relative;
	flex-direction: column;
}

.map-container {
	display: flex;
	margin-bottom: 20px;
	justify-content: flex-start;
	margin-left: 31px;
	font-size: 18px;
	font-weight: bold;
}

.map-image {
	display: flex;
	margin-bottom: 30px;
	justify-content: center;
	cursor: zoom-in;
	/* 클릭시 zoom-in 커서 효과 */
}

.map-image a {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 40%;
}

.map-image img {
	max-width: 100%;
}

.address-container {
	display: flex;
	align-items: center;
	margin-left: 35px;
	/* 주소를 왼쪽으로 옮김 */
}

.address-icon {
	margin-right: 5px;
	font-size: 14px;
}

.address-text {
	font-size: 14px;
	font-weight: normal;
}

.copy-button {
	margin-left: auto;
	/* 주소 복사 버튼을 오른쪽으로 옮김 */
	margin-right: 20px;
	padding: 5px 10px;
	background-color: transparent;
	color: blue;
	/* 파란색으로 변경 */
	border: none;
	border-radius: 4px;
	text-decoration: none;
	cursor: pointer;
	font-size: 13px;
}
</style>
<script>
	$(document).ready(function() {
		// 주소 복사 버튼 클릭 이벤트 핸들러
		$(".copy-button").click(function() {
			var address = "상세 주소"; // 복사할 주소 정보를 입력해주세요.
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
</script>
</head>

<body>
	<div class="container">
		<div class="detail2-all">
			<div class="map-container">
				<span>위치</span>
			</div>
			<div class="map-image">
				<a href="메인.html"> <img
					src="https://navermaps.github.io/ios-map-sdk/assets/2-3-basic.png"
					alt="지도 이미지">
				</a>
			</div>
			<div class="detail2-main">
				<div class="address-container">
					<i class="fas fa-map-marker-alt address-icon"></i> <span
						class="address-text">상세 주소 입니다 여기는</span>
				</div>
				<button class="copy-button">주소 복사</button>
			</div>
		</div>
	</div>
</body>

</html>