<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="list" value="${map.list}" />




<!DOCTYPE html>
<html lang="kor">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BreakTime 상세페이지</title>

<!-- 메인페이지에 적용할 css 템플릿 추가  -->
<link rel="stylesheet" href="${contextPath}/resources/css/detail/detail_main.css">

<!-- fontawesome라이브러리추가 다양한 아이콘을 지원함.(EX) 검색용 돋보기 버튼) -->
<script src="https://kit.fontawesome.com/a2e8ca0ae3.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

</head>
<body>

	<jsp:include page="/WEB-INF/views/header.jsp" />

	<%-- <jsp:include page="/WEB-INF/views/detail/noUse/option_modal.jsp" /> --%>

	<jsp:include page="/WEB-INF/views/detail/option_check.jsp" />

	<div class="mainArea">
		<div class="houseList">
			<ul>
				<c:if test="${empty list}">
					<td>예약 가능한 숙소가 없습니다!</td>
				</c:if>
				<c:forEach items="${list }" var="d">
					<li>
						<div class="houseContent">
							<div class="houseMainImg">
								<img src="${d.buMainImg}">
							</div>
							<div class="houseInfo">
								<a>
									<div>
										<div class="houseTitle">${d.buTitle}</div>
										<div class="starPlace">
											<c:set var="fullStars" value="${Math.floor(d.userStarScore)}" />
											<c:set var="halfStar" value="${d.userStarScore - fullStars}" />

											<c:choose>
												<c:when test="${fullStars > 0}">
													<c:forEach var="i" begin="1" end="${fullStars}">
														<i class="fa-solid fa-star starStyle"></i>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<i class="far fa-star starStyle"></i>
												</c:otherwise>
											</c:choose>

											<c:if test="${halfStar >= 0.5}">
												<i class="fa-solid fa-star-half starStyle"></i>
											</c:if>

											<span> ${d.userStarScore } </span>
										</div>
										<div class="houseAddress">${d.buAddress}</div>
										<div class="houseTel">${d.buTel}</div>
										<div class="room_options">${d.roomInfo }</div>
									</div>
								</a>
							</div>
							<div class="housePrice">
								<div class="priceHowMuch">${d.roomPrice }</div>
								<div class="priceDetailList">
									<p class="priceDetail1">1박 가격</p>
									<p class="priceDetail2">모든 세금 및 수수료 포함</p>
								</div>
								<div class="hpButton">
									<p class="rsButton"
										th:if="${d.roomInfo == '무료 취소' or d.roomInfo == '환불 불가'}">${d.roomInfo}</p>
									<p class="rsButton"
										th:unless="${d.roomInfo == '무료 취소' or d.roomInfo == '환불 불가'}"></p>
									<button onclick="redirectToDetail('${d.buNo}')">자세히 보기</button>
								</div>

							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>

	<div class id="map"
		style="width: 40%; height: 1080px; position: fixed; right: 0; top: 0;"></div>

	<!-- 지도 api 스크립트 -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55a7843b1806f000c969ae74b8fbf856&libraries=services"></script>
	<script>
   var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
   var mapOption = {
     center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
     level: 3 // 지도의 확대 레벨
   };

   // 지도를 생성합니다    
   var map = new kakao.maps.Map(mapContainer, mapOption);

   // 주소-좌표 변환 객체를 생성합니다
   var geocoder = new kakao.maps.services.Geocoder();

   // 주소와 마커 정보를 배열로 저장
   var addresses = [      
   <c:forEach items="${list}" var="d" varStatus="status">
            {
                address: "${d.buAddress}",
                content: "${d.buTitle}"
            }<c:if test="${!status.last}">,</c:if>
        </c:forEach>
   ];
       

   // 주소로 좌표를 검색하여 마커를 생성
   function createMarker(addressObj) {
     geocoder.addressSearch(addressObj.address, function(result, status) {
       // 정상적으로 검색이 완료됐으면
       if (status === kakao.maps.services.Status.OK) {
         var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

         // 결과값으로 받은 위치를 마커로 표시
         var marker = new kakao.maps.Marker({
           map: map,
           position: coords
         });

         // 인포윈도우로 장소에 대한 설명을 표시
         var infowindow = new kakao.maps.InfoWindow({
           content: '<div style="width:150px;text-align:center;padding:6px 0;">' + addressObj.content + '</div>'
         });
         infowindow.open(map, marker);

         // 마커 클릭 시 인포윈도우 표시
         kakao.maps.event.addListener(marker, 'click', function() {
           infowindow.open(map, marker);
         });

         // 지도의 중심을 결과값으로 받은 위치로 이동
         map.setCenter(coords);
       }
     });
   }

   // 배열에 저장된 주소에 대해 반복하여 마커를 생성
   for (var i = 0; i < addresses.length; i++) {
     createMarker(addresses[i]);
   }

   </script>

	<script>
      // houseContent div 클릭 시 해당 주소의 마커로 이동하는 함수
      function moveMarker(address) {
        geocoder.addressSearch(address, function(result, status) {
          if (status === kakao.maps.services.Status.OK) {
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
            map.setCenter(coords);
          }
        });
      }
      
      // houseContent div 클릭 이벤트 처리
      var houseContents = document.getElementsByClassName('houseContent');
      for (var i = 0; i < houseContents.length; i++) {
        houseContents[i].addEventListener('click', function() {
          var address = this.getElementsByClassName('houseAddress')[0].innerText;
          moveMarker(address);
        });
      }
   </script>



	<script>
    function checkScreenWidth() {
        var mapDiv = document.getElementById('map');
        var screenWidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
        
        if (screenWidth <= 0.7 * screen.availWidth) {
            mapDiv.style.display = 'none';
        } else {
            mapDiv.style.display = 'block';
        }
    }
    
    window.addEventListener('resize', checkScreenWidth);
    checkScreenWidth();
   </script>

	<script>
	  function redirectToDetail(buNo) {
	    var url = window.location.href; // 현재 페이지의 URL을 가져옵니다.
	    var urlParams = new URLSearchParams(url.split('?')[1]); // 쿼리 파라미터를 추출합니다.
	    var date_in = urlParams.get('date_in'); // date_in 값을 가져옵니다.
	    var date_out = urlParams.get('date_out'); // date_out 값을 가져옵니다.

	    // date_in과 date_out 값을 사용하여 URL을 구성합니다.
	    var redirectUrl = '/breaktime/decide/demain/' + buNo + '?dateIn=' + date_in + '&dateOut=' + date_out;
	    window.location.href = redirectUrl;
	  }
	  
	</script>

	<!-- footer include -->

	<!-- jQuery 라이브러리 추가 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>

</body>
</html>