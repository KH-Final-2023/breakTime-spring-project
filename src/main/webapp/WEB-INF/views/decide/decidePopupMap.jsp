<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="m" value="${map}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소로 장소 표시하기</title>
<link rel="stylesheet" href="${contextPath}/resources/css/decide/popupmap.css">

<style>

</style>
</head>
<body style="background-color: #f2f2f2; overflow: hidden;">

<div class="container">
        <div id="addressDisplay" class="address-display">${m.buAddress}</div>
        <div id="copyButton" class="copy-button" onclick="copyToClipboard()">주소복사</div>
        <div class="map-title">지도</div>
        <div class="map-container">
            <div id="map" class="map"></div>
        </div>
    </div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3b5347099c8e3ae79e5a54152d45cdb9&libraries=services"></script>

<script>
function copyToClipboard() {
    var tempInput = document.createElement("input");
    tempInput.value = '${m.buAddress}';
    document.body.appendChild(tempInput);
    tempInput.select();
    document.execCommand("copy");
    document.body.removeChild(tempInput);
    alert("주소가 복사되었습니다.");
};

var buAddress = '${m.buAddress}';
var buTitle = '${m.buTitle}';
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(buAddress , function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">' + buTitle + '</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
</body>

</html>