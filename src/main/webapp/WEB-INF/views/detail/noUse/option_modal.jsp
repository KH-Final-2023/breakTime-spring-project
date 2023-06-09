<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>option modal</title>
<!-- fontawesome라이브러리추가 다양한 아이콘을 지원함.(EX) 검색용 돋보기 버튼) -->
<script src="https://kit.fontawesome.com/a2e8ca0ae3.js"
	crossorigin="anonymous"></script>
<style>
/* 모달창 배경 */
.modal_background {
	position: fixed;
	visibility: hidden;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	background: rgba(0, 0, 0, 0.8);
	z-index: 99;
}

/* 모달창 영역 */
.modal_box {
	position: absolute;
	top: calc(50vh - 400px);
	left: calc(50vw - 400px);
	background-color: white;
	display: grid;
	grid-template-rows: repeat(12, 1fr);
	grid-template-columns: 1fr 3fr;
	padding: 3%;
	justify-content: center;
	align-items: center;
	border-radius: 10px;
	width: 800px;
	height: 700px;
	z-index: 100;
	grid-gap: 0;
}

.modal_grid1 {
	text-align: right;
	font-size: larger;
	font-weight: bolder;
}

.modal_grid22 {
	text-align: right;
}

.modal_grid1:nth-child(1) {
	grid-column: 1/3;
	grid-row: 1/2;
	text-align: center;
}

.modal_grid3 {
	position: relative;
}

.modal_grid3:nth-child(3) {
	grid-column: 2/3;
	grid-row: 2/12;
}

.option_closeBtn1, .option_closeBtn2, .option_closeBtn3,
	.option_closeBtn4, .option_closeBtn5, .option_closeBtn6,
	.option_closeBtn7, .option_closeBtn8, .option_closeBtn9,
	.option_closeBtn10 {
	position: absolute;
	right: 3%;
	top: 3%;
	background-color: #fff;
	border: none;
	font-size: 24px;
}

.modal_box>div {
	padding: 1rem;
}

.modal_grid3>table>tbody>tr>td {
	width: 300px;
	padding: 20px;
}

.modal_grid3>table {
	position: absolute;
	top: -200px;
}
</style>
</head>
<body>
	<div class="modal_background">
		<form id="houseOption" name="option"
			action="<%=request.getContextPath()%>/list/filter/${category}"
			method="GET">
			<div class="modal_box" id="div_01">
				<div class="modal_grid1">
					옵션 검색 <input id="optionSearch" type="search">
					<button class="option_closeBtn1">X</button>
				</div>
				<a>전용 시설</a>
				<div class="modal_grid3">
					<table>
						<tr>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="애완동물 허용"> 애완동물 허용</td>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="바다가 보이는 객실"> 바다가 보이는 객실</td>
						</tr>
						<tr>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="호수가 보이는 객실"> 호수가 보이는 객실</td>
						</tr>
					</table>
				</div>
				<a href="javascript:show_layer('2');">음식 및 음료</a> <a
					href="javascript:show_layer('3');">가족 친화</a> <a
					href="javascript:show_layer('4');">호텔 및 야외 부대시설</a> <a
					href="javascript:show_layer('5');">객실 내</a> <a
					href="javascript:show_layer('6');">레저 및 엔터테인먼트</a> <a
					href="javascript:show_layer('7');">서비스</a> <a
					href="javascript:show_layer('8');">스포츠 및 피트니스</a> <a
					href="javascript:show_layer('9');">이동 수단 및 주차 관련</a> <a
					href="javascript:show_layer('10');">WiFi 및 인터넷</a>
				<div></div>
				<div class="modal_grid22">
					<button id="optionReset" type="reset">지우기</button>
					<button type="submit" onclick="submitForm()">결과보기</button>
				</div>
			</div>

			<div class="modal_box option_child" id="div_02"
				style="display: none;">
				<div class="modal_grid1">
					옵션 검색 <input id="optionSearch" type="search">
					<button class="option_closeBtn2">X</button>
				</div>
				<a href="javascript:show_layer('1');">전용 시설</a>
				<div class="modal_grid3">
					<table>
						<tr>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="식당"> 식당</td>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="주방"> 주방</td>
						</tr>
						<tr>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="카페"> 카페</td>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="바"> 바</td>
						</tr>
						<tr>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="바비큐"> 바비큐</td>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="무료 생수"> 무료 생수</td>
						</tr>
					</table>
				</div>
				<a>음식 및 음료</a> <a href="javascript:show_layer('3');">가족 친화</a> <a
					href="javascript:show_layer('4');">호텔 및 야외 부대시설</a> <a
					href="javascript:show_layer('5');">객실 내</a> <a
					href="javascript:show_layer('6');">레저 및 엔터테인먼트</a> <a
					href="javascript:show_layer('7');">서비스</a> <a
					href="javascript:show_layer('8');">스포츠 및 피트니스</a> <a
					href="javascript:show_layer('9');">이동 수단 및 주차 관련</a> <a
					href="javascript:show_layer('10');">WiFi 및 인터넷</a>
				<div></div>
				<div class="modal_grid22">
					<button id="optionReset" type="reset">지우기</button>
					<button type="submit" onclick="submitForm()">결과보기</button>
				</div>
			</div>

			<div class="modal_box" id="div_03" style="display: none;">
				<div class="modal_grid1">
					옵션 검색 <input id="optionSearch" type="search">
					<button class="option_closeBtn3">X</button>
				</div>
				<a href="javascript:show_layer('1');">전용 시설</a>
				<div class="modal_grid3">
					<table>
						<tr>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="유/소아 편의시설"> 유/소아 편의시설</td>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="유/소아 수영장"> 유/소아 수영장</td>
						</tr>
						<tr>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="놀이터"> 놀이터</td>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="아기 돌보미 서비스"> 아기 돌보미 서비스</td>
						</tr>
					</table>
				</div>
				<a href="javascript:show_layer('2');">음식 및 음료</a> <a>가족 친화</a> <a
					href="javascript:show_layer('4');">호텔 및 야외 부대시설</a> <a
					href="javascript:show_layer('5');">객실 내</a> <a
					href="javascript:show_layer('6');">레저 및 엔터테인먼트</a> <a
					href="javascript:show_layer('7');">서비스</a> <a
					href="javascript:show_layer('8');">스포츠 및 피트니스</a> <a
					href="javascript:show_layer('9');">이동 수단 및 주차 관련</a> <a
					href="javascript:show_layer('10');">WiFi 및 인터넷</a>
				<div></div>
				<div class="modal_grid22">
					<button id="optionReset" type="reset">지우기</button>
					<button type="submit" onclick="submitForm()">결과보기</button>
				</div>
			</div>

			<div class="modal_box" id="div_04" style="display: none;">
				<div class="modal_grid1">
					옵션 검색 <input id="optionSearch" type="search">
					<button class="option_closeBtn4">X</button>
				</div>
				<a href="javascript:show_layer('1');">전용 시설</a>
				<div class="modal_grid3">
					<table>
						<tr>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="금연"> 금연</td>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="세탁"> 세탁</td>
						</tr>
						<tr>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="금연층"> 금연층</td>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="흡연 구역"> 흡연 구역</td>
						</tr>
						<tr>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="라운지"> 라운지</td>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="결혼식장"> 결혼식장</td>
						</tr>
					</table>
				</div>
				<a href="javascript:show_layer('2');">음식 및 음료</a> <a
					href="javascript:show_layer('3');">가족 친화</a> <a>호텔 및 야외 부대시설</a> <a
					href="javascript:show_layer('5');">객실 내</a> <a
					href="javascript:show_layer('6');">레저 및 엔터테인먼트</a> <a
					href="javascript:show_layer('7');">서비스</a> <a
					href="javascript:show_layer('8');">스포츠 및 피트니스</a> <a
					href="javascript:show_layer('9');">이동 수단 및 주차 관련</a> <a
					href="javascript:show_layer('10');">WiFi 및 인터넷</a>
				<div></div>
				<div class="modal_grid22">
					<button id="optionReset" type="reset">지우기</button>
					<button type="submit" onclick="submitForm()">결과보기</button>
				</div>
			</div>

			<div class="modal_box" id="div_05" style="display: none;">
				<div class="modal_grid1">
					옵션 검색 <input id="optionSearch" type="search">
					<button class="option_closeBtn5">X</button>
				</div>
				<a href="javascript:show_layer('1');">전용 시설</a>
				<div class="modal_grid3">
					<table>
						<tr>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="에어컨"> 에어컨</td>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="욕조"> 욕조</td>
						</tr>
						<tr>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="샤워실"> 샤워실</td>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="책상"> 책상</td>
						</tr>
					</table>
				</div>
				<a href="javascript:show_layer('2');">음식 및 음료</a> <a
					href="javascript:show_layer('3');">가족 친화</a> <a
					href="javascript:show_layer('4');">호텔 및 야외 부대시설</a> <a>객실 내</a> <a
					href="javascript:show_layer('6');">레저 및 엔터테인먼트</a> <a
					href="javascript:show_layer('7');">서비스</a> <a
					href="javascript:show_layer('8');">스포츠 및 피트니스</a> <a
					href="javascript:show_layer('9');">이동 수단 및 주차 관련</a> <a
					href="javascript:show_layer('10');">WiFi 및 인터넷</a>
				<div></div>
				<div class="modal_grid22">
					<button id="optionReset" type="reset">지우기</button>
					<button type="submit" onclick="submitForm()">결과보기</button>
				</div>
			</div>

			<div class="modal_box" id="div_06" style="display: none;">
				<div class="modal_grid1">
					옵션 검색 <input id="optionSearch" type="search">
					<button class="option_closeBtn6">X</button>
				</div>
				<a href="javascript:show_layer('1');">전용 시설</a>
				<div class="modal_grid3">
					<table>
						<tr>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="스파"> 스파</td>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="사우나"> 사우나</td>
						</tr>
						<tr>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="자전거 대여"> 자전거 대여</td>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="미용실"> 미용실</td>
						</tr>
						<tr>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="오락실"> 오락실</td>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="노래방"> 노래방</td>
						</tr>
						<tr>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="당구장"> 당구장</td>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="나이트클럽"> 나이트클럽</td>
						</tr>
						<tr>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="볼링장"> 볼링장</td>
						</tr>
					</table>
				</div>
				<a href="javascript:show_layer('2');">음식 및 음료</a> <a
					href="javascript:show_layer('3');">가족 친화</a> <a
					href="javascript:show_layer('4');">호텔 및 야외 부대시설</a> <a
					href="javascript:show_layer('5');">객실 내</a> <a>레저 및 엔터테인먼트</a> <a
					href="javascript:show_layer('7');">서비스</a> <a
					href="javascript:show_layer('8');">스포츠 및 피트니스</a> <a
					href="javascript:show_layer('9');">이동 수단 및 주차 관련</a> <a
					href="javascript:show_layer('10');">WiFi 및 인터넷</a>
				<div></div>
				<div class="modal_grid22">
					<button id="optionReset" type="reset">지우기</button>
					<button type="submit" onclick="submitForm()">결과보기</button>
				</div>
			</div>

			<div class="modal_box" id="div_07" style="display: none;">
				<div class="modal_grid1">
					옵션 검색 <input id="optionSearch" type="search">
					<button class="option_closeBtn7">X</button>
				</div>
				<a href="javascript:show_layer('1');">전용 시설</a>
				<div class="modal_grid3">
					<table>
						<tr>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="24시간 프런트 데스크"> 24시간 프런트 데스크</td>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="짐 보관"> 짐 보관</td>
						</tr>
						<tr>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="룸 서비스"> 룸 서비스</td>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="빠른 체크인"> 빠른 체크인</td>
						</tr>
						<tr>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="모닝콜"> 모닝콜</td>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="빠른 체크아웃"> 빠른 체크아웃</td>
						</tr>
						<tr>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="조기 체크인"> 조기 체크인</td>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="ATM"> ATM</td>
						</tr>
						<tr>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="체크아웃 시간 연장"> 체크아웃 시간 연장</td>
						</tr>
					</table>
				</div>
				<a href="javascript:show_layer('2');">음식 및 음료</a> <a
					href="javascript:show_layer('3');">가족 친화</a> <a
					href="javascript:show_layer('4');">호텔 및 야외 부대시설</a> <a
					href="javascript:show_layer('5');">객실 내</a> <a
					href="javascript:show_layer('6');">레저 및 엔터테인먼트</a> <a>서비스</a> <a
					href="javascript:show_layer('8');">스포츠 및 피트니스</a> <a
					href="javascript:show_layer('9');">이동 수단 및 주차 관련</a> <a
					href="javascript:show_layer('10');">WiFi 및 인터넷</a>
				<div></div>
				<div class="modal_grid22">
					<button id="optionReset" type="reset">지우기</button>
					<button type="submit" onclick="submitForm()">결과보기</button>
				</div>
			</div>

			<div class="modal_box" id="div_08" style="display: none;">
				<div class="modal_grid1">
					옵션 검색 <input id="optionSearch" type="search">
					<button class="option_closeBtn8">X</button>
				</div>
				<a href="javascript:show_layer('1');">전용 시설</a>
				<div class="modal_grid3">
					<table>
						<tr>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="수영장"> 수영장</td>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="헬스장"> 헬스장</td>
						</tr>
						<tr>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="테니스장"> 테니스장</td>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="골프장"> 골프장</td>
						</tr>
						<tr>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="탁구장"> 탁구장</td>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="수상 스포츠"> 수상 스포츠</td>
						</tr>
					</table>
				</div>
				<a href="javascript:show_layer('2');">음식 및 음료</a> <a
					href="javascript:show_layer('3');">가족 친화</a> <a
					href="javascript:show_layer('4');">호텔 및 야외 부대시설</a> <a
					href="javascript:show_layer('5');">객실 내</a> <a
					href="javascript:show_layer('6');">레저 및 엔터테인먼트</a> <a
					href="javascript:show_layer('7');">서비스</a> <a>스포츠 및 피트니스</a> <a
					href="javascript:show_layer('9');">이동 수단 및 주차 관련</a> <a
					href="javascript:show_layer('10');">WiFi 및 인터넷</a>
				<div></div>
				<div class="modal_grid22">
					<button id="optionReset" type="reset">지우기</button>
					<button type="submit" onclick="submitForm()">결과보기</button>
				</div>
			</div>

			<div class="modal_box" id="div_09" style="display: none;">
				<div class="modal_grid1">
					옵션 검색 <input id="optionSearch" type="search">
					<button class="option_closeBtn9">X</button>
				</div>
				<a href="javascript:show_layer('1');">전용 시설</a>
				<div class="modal_grid3">
					<table>
						<tr>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="주차장"> 주차장</td>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="렌터카"> 렌터카</td>
						</tr>
						<tr>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="주차 대행"> 주차 대행</td>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="기차역 셔틀 버스"> 기차역 셔틀 버스</td>
						</tr>
					</table>
				</div>
				<a href="javascript:show_layer('2');">음식 및 음료</a> <a
					href="javascript:show_layer('3');">가족 친화</a> <a
					href="javascript:show_layer('4');">호텔 및 야외 부대시설</a> <a
					href="javascript:show_layer('5');">객실 내</a> <a
					href="javascript:show_layer('6');">레저 및 엔터테인먼트</a> <a
					href="javascript:show_layer('7');">서비스</a> <a
					href="javascript:show_layer('8');">스포츠 및 피트니스</a> <a>이동 수단 및 주차
					관련</a> <a href="javascript:show_layer('10');">WiFi 및 인터넷</a>
				<div></div>
				<div class="modal_grid22">
					<button id="optionReset" type="reset">지우기</button>
					<button type="submit" onclick="submitForm()">결과보기</button>
				</div>
			</div>

			<div class="modal_box" id="div_10" style="display: none;">
				<div class="modal_grid1">
					옵션 검색 <input id="optionSearch" type="search">
					<button class="option_closeBtn10">X</button>
				</div>
				<a href="javascript:show_layer('1');">전용 시설</a>
				<div class="modal_grid3">
					<table>
						<tr>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="와이파이"> 와이파이</td>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="인터넷"> 인터넷</td>
						</tr>
						<tr>
							<td><input class="house-option-checkbox" type="checkbox"
								name="houseOptions" value="공공 와이파이"> 공공 와이파이</td>
						</tr>
					</table>
				</div>
				<a href="javascript:show_layer('2');">음식 및 음료</a> <a
					href="javascript:show_layer('3');">가족 친화</a> <a
					href="javascript:show_layer('4');">호텔 및 야외 부대시설</a> <a
					href="javascript:show_layer('5');">객실 내</a> <a
					href="javascript:show_layer('6');">레저 및 엔터테인먼트</a> <a
					href="javascript:show_layer('7');">서비스</a> <a
					href="javascript:show_layer('8');">스포츠 및 피트니스</a> <a
					href="javascript:show_layer('9');">이동 수단 및 주차 관련</a> <a>WiFi 및
					인터넷</a>
				<div></div>
				<div class="modal_grid22">
					<button id="optionReset" type="reset">지우기</button>
					<button type="submit" onclick="submitForm()">결과보기</button>
				</div>
			</div>
		</form>
	</div>

	<!-- 옵션 모달창 스크립트 -->
	<script type="text/javascript">
		function show_layer(div_name) {
			document.all.div_01.style.display = "none";
			document.all.div_02.style.display = "none";
			document.all.div_03.style.display = "none";
			document.all.div_04.style.display = "none";
			document.all.div_05.style.display = "none";
			document.all.div_06.style.display = "none";
			document.all.div_07.style.display = "none";
			document.all.div_08.style.display = "none";
			document.all.div_09.style.display = "none";
			document.all.div_10.style.display = "none";

			switch (div_name) {
			case '1':
				document.all.div_01.style.display = "";
				break;
			case '2':
				document.all.div_02.style.display = "";
				break;
			case '3':
				document.all.div_03.style.display = "";
				break;
			case '4':
				document.all.div_04.style.display = "";
				break;
			case '5':
				document.all.div_05.style.display = "";
				break;
			case '6':
				document.all.div_06.style.display = "";
				break;
			case '7':
				document.all.div_07.style.display = "";
				break;
			case '8':
				document.all.div_08.style.display = "";
				break;
			case '9':
				document.all.div_09.style.display = "";
				break;
			case '10':
				document.all.div_10.style.display = "";
				break;
			}
		}
	</script>
	
	<!-- 모달창 열기/닫기 스크립트 -->
	<!-- <script>
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
    </script> -->


</body>
</html>