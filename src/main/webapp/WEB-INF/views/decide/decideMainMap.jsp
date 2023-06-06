<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위치</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/decide/map.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55a7843b1806f000c969ae74b8fbf856&libraries=services&autoload=false"></script>
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
				<iframe src="${contextPath}/decide/detailmap" scrolling="no"></iframe>
			</div>
			<div class="detail2-main">
				<div class="address-container">
					<i class="fas fa-map-marker-alt address-icon"></i> <span
						class="address-text">${b.buAddress}</span>
				</div>
				<button class="copy-button">주소 복사</button>
			</div>
		</div>
	</div>
</body>

</html>