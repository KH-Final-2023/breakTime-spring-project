<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="kor">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BreakTime 상세페이지</title>

<!-- 메인페이지에 적용할 css 템플릿 추가  -->


<!-- fontawesome라이브러리추가 다양한 아이콘을 지원함.(EX) 검색용 돋보기 버튼) -->
<script src="https://kit.fontawesome.com/a2e8ca0ae3.js"
	crossorigin="anonymous"></script>

<style>
body {
	overflow: scroll;
	overflow-x: hidden;
}

.mainArea {
	width: 45%;
	margin-left: 250px;
}

button {
	cursor: pointer;
}

.houseList {
	margin-left: 5%;
}

.houseContent {
	min-width: 700px;
	min-height: 200px;
	height: 25%;
	border-radius: 0.75rem;
	border: solid 1px darkgray;
	box-shadow: 3px 3px 3px 3px gray;
	display: grid;
	grid-template-columns: minmax(200px, 2fr) minmax(300px, 3fr)
		minmax(200px, 2fr);
}

.houseMainImg {
	box-sizing: border-box;
	min-height: 180px;
}

.houseInfo {
	box-sizing: border-box;
	padding: 5%;
}

.houseTitle {
	font-size: 25px;
	padding: 0 0 2%;
}

.housePrice {
	position: relative;
	border-left: 1px solid darkgrey;
	box-sizing: border-box;
	padding: 8%;
	text-align: right;
	color: gray;
}

.priceHowMuch {
	font-size: 130%;
	font-weight: bold;
	color: black;
}

.priceDetail1 {
	font-size: 80%;
	margin-bottom: 1%;
}

.priceDetail2 {
	font-size: 70%;
	margin-top: 1%;
}

.hpButton {
	height: 50px;
	position: absolute;
	bottom: 15%;
	right: 8%;
}

.rsButton {
	font-size: 70%;
	color: black;
}

.houseList>ul {
	padding-left: 0;
	margin-left: 0;
}

.houseList>ul>li {
	list-style-type: none;
	margin-bottom: 3%;
}

.houseList>ul>li>div>div>img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	border-top-left-radius: 0.75rem;
	border-bottom-left-radius: 0.75rem;
}

.starStyle {
	color: #d8db1f;
}

#optionReset {
	
}

#optionSubmit {
	
}
</style>

</head>

<body>
	<jsp:include page="/WEB-INF/views/detail1/searchBar_detail.jsp" />
	
	<jsp:include page="/WEB-INF/views/detail1/option_modal.jsp" />

	<jsp:include page="/WEB-INF/views/detail1/option_check.jsp" />

	<div class="mainArea">
		<div class="houseList">
			<ul>
				<li>
					<div class="houseContent">
						<div class="houseMainImg">
							<img src="호텔_메인이미지.jpg">
						</div>
						<div class="houseInfo">
							<a>
								<div>
									<div class="houseTitle">스타하우스</div>
									<div class="starPlace">
										<i class="fa-solid fa-star starStyle"></i> <i
											class="fa-solid fa-star starStyle"></i> <i
											class="fa-solid fa-star starStyle"></i>
									</div>
									<div></div>

								</div>

							</a>
						</div>
						<div class="housePrice">
							<div class="priceHowMuch">₩ 160,000</div>
							<div class="priceDetailList">
								<p class="priceDetail1">1박 가격</p>
								<p class="priceDetail2">모든 세금 및 수수료 포함</p>
							</div>
							<div class="hpButton">
								<p class="rsButton">예약 무료 취소</p>
								<button>예약하기</button>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="houseContent">
						<div class="houseMainImg">
							<img src="호텔_메인이미지.jpg">
						</div>
						<div class="houseInfo">
							<a>
								<div>
									<div class="houseTitle">스타하우스</div>
									<div class="starPlace">
										<i class="fa-solid fa-star starStyle"></i> <i
											class="fa-solid fa-star starStyle"></i> <i
											class="fa-solid fa-star starStyle"></i>
									</div>
									<div></div>

								</div>

							</a>
						</div>
						<div class="housePrice">
							<div class="priceHowMuch">₩ 160,000</div>
							<div class="priceDetailList">
								<p class="priceDetail1">1박 가격</p>
								<p class="priceDetail2">모든 세금 및 수수료 포함</p>
							</div>
							<div class="hpButton">
								<p class="rsButton">예약 무료 취소</p>
								<button>예약하기</button>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="houseContent">
						<div class="houseMainImg">
							<img src="호텔_메인이미지.jpg">
						</div>
						<div class="houseInfo">
							<a>
								<div>
									<div class="houseTitle">스타하우스</div>
									<div class="starPlace">
										<i class="fa-solid fa-star starStyle"></i> <i
											class="fa-solid fa-star starStyle"></i> <i
											class="fa-solid fa-star starStyle"></i>
									</div>
									<div></div>

								</div>

							</a>
						</div>
						<div class="housePrice">
							<div class="priceHowMuch">₩ 160,000</div>
							<div class="priceDetailList">
								<p class="priceDetail1">1박 가격</p>
								<p class="priceDetail2">모든 세금 및 수수료 포함</p>
							</div>
							<div class="hpButton">
								<p class="rsButton">예약 무료 취소</p>
								<button>예약하기</button>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="houseContent">
						<div class="houseMainImg">
							<img src="호텔_메인이미지.jpg">
						</div>
						<div class="houseInfo">
							<a>
								<div>
									<div class="houseTitle">스타하우스</div>
									<div class="starPlace">
										<i class="fa-solid fa-star starStyle"></i> <i
											class="fa-solid fa-star starStyle"></i> <i
											class="fa-solid fa-star starStyle"></i>
									</div>
									<div></div>

								</div>

							</a>
						</div>
						<div class="housePrice">
							<div class="priceHowMuch">₩ 160,000</div>
							<div class="priceDetailList">
								<p class="priceDetail1">1박 가격</p>
								<p class="priceDetail2">모든 세금 및 수수료 포함</p>
							</div>
							<div class="hpButton">
								<p class="rsButton">예약 무료 취소</p>
								<button>예약하기</button>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="houseContent">
						<div class="houseMainImg">
							<img src="호텔_메인이미지.jpg">
						</div>
						<div class="houseInfo">
							<a>
								<div>
									<div class="houseTitle">스타하우스</div>
									<div class="starPlace">
										<i class="fa-solid fa-star starStyle"></i> <i
											class="fa-solid fa-star starStyle"></i> <i
											class="fa-solid fa-star starStyle"></i>
									</div>
									<div></div>

								</div>

							</a>
						</div>
						<div class="housePrice">
							<div class="priceHowMuch">₩ 160,000</div>
							<div class="priceDetailList">
								<p class="priceDetail1">1박 가격</p>
								<p class="priceDetail2">모든 세금 및 수수료 포함</p>
							</div>
							<div class="hpButton">
								<p class="rsButton">예약 무료 취소</p>
								<button>예약하기</button>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="houseContent">
						<div class="houseMainImg">
							<img src="호텔_메인이미지.jpg">
						</div>
						<div class="houseInfo">
							<a>
								<div>
									<div class="houseTitle">스타하우스</div>
									<div class="starPlace">
										<i class="fa-solid fa-star starStyle"></i> <i
											class="fa-solid fa-star starStyle"></i> <i
											class="fa-solid fa-star starStyle"></i>
									</div>
									<div></div>

								</div>

							</a>
						</div>
						<div class="housePrice">
							<div class="priceHowMuch">₩ 160,000</div>
							<div class="priceDetailList">
								<p class="priceDetail1">1박 가격</p>
								<p class="priceDetail2">모든 세금 및 수수료 포함</p>
							</div>
							<div class="hpButton">
								<p class="rsButton">예약 무료 취소</p>
								<button>예약하기</button>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="houseContent">
						<div class="houseMainImg">
							<img src="호텔_메인이미지.jpg">
						</div>
						<div class="houseInfo">
							<a>
								<div>
									<div class="houseTitle">스타하우스</div>
									<div class="starPlace">
										<i class="fa-solid fa-star starStyle"></i> <i
											class="fa-solid fa-star starStyle"></i> <i
											class="fa-solid fa-star starStyle"></i>
									</div>
									<div></div>

								</div>

							</a>
						</div>
						<div class="housePrice">
							<div class="priceHowMuch">₩ 160,000</div>
							<div class="priceDetailList">
								<p class="priceDetail1">1박 가격</p>
								<p class="priceDetail2">모든 세금 및 수수료 포함</p>
							</div>
							<div class="hpButton">
								<p class="rsButton">예약 무료 취소</p>
								<button>예약하기</button>
							</div>
						</div>
					</div>
				</li>
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

	// 주소와 마커 정보를 배열로 저장합니다
	var addresses = [
	  {
	    address: '경기도 가평군 가화로 1364-59',
	    content: '마커 1에 대한 내용'
	  },
	  {
	    address: '경기도 가평군 북면 가화로 2369-19',
	    content: '마커 2에 대한 내용'
	  },
	  {
	    address: '제주특별자치도 제주시 첨단로 242',
	    content: '마커 3에 대한 내용'
	  }
	];

	// 주소로 좌표를 검색하여 마커를 생성하는 함수입니다
	function createMarker(addressObj) {
	  geocoder.addressSearch(addressObj.address, function(result, status) {
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
	        content: '<div style="width:150px;text-align:center;padding:6px 0;">' + addressObj.content + '</div>'
	      });
	      infowindow.open(map, marker);

	      // 마커 클릭 시 인포윈도우 표시
	      kakao.maps.event.addListener(marker, 'click', function() {
	        infowindow.open(map, marker);
	      });

	      // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	      map.setCenter(coords);
	    }
	  });
	}

	// 배열에 저장된 주소에 대해 반복하여 마커를 생성합니다
	for (var i = 0; i < addresses.length; i++) {
	  createMarker(addresses[i]);
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



	<!-- 모달창 열기/닫기 스크립트 -->
	<script>
        const open = () => {
            document.querySelector(".modal_background").style.visibility="visible";
        }
        const close = () => {
            document.querySelector(".modal_background").style.visibility="hidden";
        }

        document.querySelector(".option_openBtn").addEventListener("click", open); 
        document.querySelector(".option_closeBtn1").addEventListener("click", close);
		document.querySelector(".option_closeBtn2").addEventListener("click", close); 
		document.querySelector(".option_closeBtn3").addEventListener("click", close); 
		document.querySelector(".option_closeBtn4").addEventListener("click", close); 
		document.querySelector(".option_closeBtn5").addEventListener("click", close); 
		document.querySelector(".option_closeBtn6").addEventListener("click", close); 
		document.querySelector(".option_closeBtn7").addEventListener("click", close); 
		document.querySelector(".option_closeBtn8").addEventListener("click", close); 
		document.querySelector(".option_closeBtn9").addEventListener("click", close); 
		document.querySelector(".option_closeBtn10").addEventListener("click", close); 
    </script>

	<!-- footer include -->

	<!-- jQuery 라이브러리 추가 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>

	<!-- main.js 연 결 -->
	<script src="${contextPath}/resources/js/main/main.js"></script>

</body>
</html>