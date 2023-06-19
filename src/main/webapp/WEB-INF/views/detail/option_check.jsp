<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>옵션 체크</title>
<!-- fontawesome라이브러리추가 다양한 아이콘을 지원함.(EX) 검색용 돋보기 버튼) -->
<script src="https://kit.fontawesome.com/a2e8ca0ae3.js"
	crossorigin="anonymous"></script>

<style>
.optionArea {
	position: fixed;
	left: 20px;
	top: 80px;
	height: 100%;
	width: 250px;
	background-color: #fff;
	overflow-y: auto;
	overflow-x: hidden;
}

.optionTable {
	min-width: 250px;
	width: 100%;
}

.tableTitle {
	height: 60px;
	font-size: 16px;
	font-weight: bolder;
	text-align: left;
}

.optionTable>tbody>tr>td {
	font-size: 14px;
}

a {
	cursor: pointer;
}

/* area_detail */
.dropdown1 {
	width: 200px;
}

/* 체크인, 체크아웃 */
.date_detail {
	width: 200px;
}

.dropdown2 {
	position: relative;
	display: inline-block;
}
</style>
</head>
<body>
	<div class="optionArea">
		<br> <br>
		<div class="houseOption">
			<form id="houseOption" name="option"
				action="<%=request.getContextPath()%>/list/filter/${category}"
				method="GET">
				<table class="optionTable">
					<tr>
						<td>지역 :
							<div class="area_detail">
								<div class="dropdown1">
									<select class="areaCode" name="area">
										<option value="">전국</option>
										<option value="1">서울</option>
										<option value="2">인천</option>
										<option value="3">대전</option>
										<option value="4">대구</option>
										<option value="5">광주</option>
										<option value="6">부산</option>
										<option value="7">울산</option>
										<option value="8">세종</option>
										<option value="31">경기도</option>
										<option value="32">강원도</option>
										<option value="33">충청북도</option>
										<option value="34">충청남도</option>
										<option value="35">경상북도</option>
										<option value="36">경상남도</option>
										<option value="37">전라북도</option>
										<option value="38">전라남도</option>
										<option value="39">제주도</option>
									</select>
								</div>
							</div>
						</td>
					</tr>
					<!-- 체크인 날짜 옵션 -->
					<tr>
						<td>체크인 :
							<div class="date_checkIn">
								<div class="dropdown2">
									<select class="dateCheck1" name="date_in">
									</select>
								</div>
							</div>
						</td>
					</tr>
					<!-- 체크아웃 날짜 옵션 -->
					<tr>
						<td>체크아웃 :
							<div class="date_checkOut">
								<div class="dropdown3">
									<select class="dateCheck2" name="date_out">
									</select>
								</div>
							</div>
						</td>
					</tr>

					<!-- 숙박객수 옵션 -->
					<tr>
						<th class="tableTitle">숙박객 수</th>
					</tr>
					<tr>
						<td><input class="guest-count-checkbox" type="checkbox"
							name="guests" value=1><i class="fa-solid fa-person"></i>
							1인</td>
					</tr>
					<tr>
						<td><input class="guest-count-checkbox" type="checkbox"
							name="guests" value=2><i class="fa-solid fa-person"></i><i
							class="fa-solid fa-person"></i> 2인</td>
					</tr>
					<tr>
						<td><input class="guest-count-checkbox" type="checkbox"
							name="guests" value=3><i class="fa-solid fa-person"></i><i
							class="fa-solid fa-person"></i><i class="fa-solid fa-person"></i>
							3인</td>
					</tr>

					<!-- 가격 옵션 -->
					<tr>
						<th class="tableTitle">가격</th>
					</tr>
					<tr>
						<td><input class="price-checkbox" type="checkbox"
							name="prices" value="[0,100000]" onclick="handleCheckbox(this)">₩0
							- ₩100,000</td>
					</tr>
					<tr>
						<td><input class="price-checkbox" type="checkbox"
							name="prices" value="[100000,200000]"
							onclick="handleCheckbox(this)">₩100,000 - ₩200,000</td>
					</tr>
					<tr>
						<td><input class="price-checkbox" type="checkbox"
							name="prices" value="[200000,300000]"
							onclick="handleCheckbox(this)">₩200,000 - ₩300,000</td>
					</tr>
					<tr>
						<td><input class="price-checkbox" type="checkbox"
							name="prices" value="[300000,400000]"
							onclick="handleCheckbox(this)">₩300,000 - ₩400,000</td>
					</tr>

					<!-- 예약 옵션 -->
					<tr>
						<th class="tableTitle">예약 종류</th>
					</tr>
					<tr>
						<td><input class="house-option-checkbox" type="checkbox"
							name="reserveOptions" value="무료 취소">무료 취소</td>
					</tr>
					<tr>
						<td><input class="house-option-checkbox" type="checkbox"
							name="reserveOptions" value="환불 불가">환불 불가</td>
					</tr>

					<!-- 편의시설 옵션 -->
					<tr>
						<th class="tableTitle">편의시설</th>
					</tr>
					<tr>
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="와이파이"><i
							class="fa-solid fa-wifi"></i> 와이파이</td>
					</tr>
					<tr>
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="금연"> <i
							class="fa-solid fa-ban-smoking"></i> 금연</td>
					</tr>
					<tr>
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="주차장">주차장</td>
					</tr>
					<tr>
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="에어컨">에어컨</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="애완동물 허용"> 애완동물 허용</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="바다가 보이는 객실"> 바다가 보이는 객실</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="호수가 보이는 객실"> 호수가 보이는 객실</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="식당"> 식당</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="주방"> 주방</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="카페"> 카페</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="바"> 바</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="바비큐"> 바비큐</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="무료 생수"> 무료 생수</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="유/소아 편의시설"> 유/소아 편의시설</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="유/소아 수영장"> 유/소아 수영장</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="놀이터"> 놀이터</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="아기 돌보미 서비스"> 아기 돌보미 서비스</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="금연"> 금연</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="세탁"> 세탁</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="금연층"> 금연층</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="흡연 구역"> 흡연 구역</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="라운지"> 라운지</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="결혼식장"> 결혼식장</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="욕조"> 욕조</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="샤워실"> 샤워실</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="책상"> 책상</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="스파"> 스파</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="사우나"> 사우나</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="자전거 대여"> 자전거 대여</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="미용실"> 미용실</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="오락실"> 오락실</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="노래방"> 노래방</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="당구장"> 당구장</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="나이트클럽"> 나이트클럽</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="볼링장"> 볼링장</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="24시간 프런트 데스크"> 24시간 프런트 데스크</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="짐 보관"> 짐 보관</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="룸 서비스"> 룸 서비스</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="빠른 체크인"> 빠른 체크인</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="모닝콜"> 모닝콜</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="빠른 체크아웃"> 빠른 체크아웃</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="조기 체크인"> 조기 체크인</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="ATM"> ATM</td>
					</tr>
					<tr class="hiddenRow">
						<td><input class="house-option-checkbox" type="checkbox"
							name="houseOptions" value="체크아웃 시간 연장"> 체크아웃 시간 연장</td>
					</tr>
					<tr>
						<td><a class="option_openBtn">더 보기</a></td>
					</tr>
					<tr>
						<th class="tableTitle">투숙객 별점</th>
					</tr>
					<tr>
						<td><input class="star-count-checkbox" type="checkbox"
							name="userStarScore" value=5.0><i
							class="fa-solid fa-star starStyle"></i><i
							class="fa-solid fa-star starStyle"></i><i
							class="fa-solid fa-star starStyle"></i><i
							class="fa-solid fa-star starStyle"></i><i
							class="fa-solid fa-star starStyle"></i></td>
					</tr>
					<tr>
						<td><input class="star-count-checkbox" type="checkbox"
							name="userStarScore" value=4.0><i
							class="fa-solid fa-star starStyle"></i><i
							class="fa-solid fa-star starStyle"></i><i
							class="fa-solid fa-star starStyle"></i><i
							class="fa-solid fa-star starStyle"></i></td>
					</tr>
					<tr>
						<td><input class="star-count-checkbox" type="checkbox"
							name="userStarScore" value=3.0><i
							class="fa-solid fa-star starStyle"></i><i
							class="fa-solid fa-star starStyle"></i><i
							class="fa-solid fa-star starStyle"></i></td>
					</tr>
					<tr>
						<td><input class="star-count-checkbox" type="checkbox"
							name="userStarScore" value=2.0><i
							class="fa-solid fa-star starStyle"></i><i
							class="fa-solid fa-star starStyle"></i></td>
					</tr>
					<tr>
						<td><input class="star-count-checkbox" type="checkbox"
							name="userStarScore" value=1.0><i
							class="fa-solid fa-star starStyle"></i></td>
					</tr>
				</table>
				<br>
				<button type="submit" onclick="submitForm()">검색하기</button>
			</form>
			<br> <br> <br> <br> <br> <br> <br>
			<br>
		</div>
	</div>

	<!-- 스크립트 -->
	<script>
	    // 페이지가 로드될 때 숨겨진 tr 요소와 "더 보기" 링크를 숨김
	    document.addEventListener("DOMContentLoaded", function() {
	        var hiddenRows = document.querySelectorAll(".hiddenRow");
	        var optionOpenBtn = document.querySelector(".option_openBtn");
	        hiddenRows.forEach(function(hiddenRow) {
	            hiddenRow.style.display = "none";
	        });
	        optionOpenBtn.style.display = "inline";
	    });
	
	    // "더 보기"를 클릭했을 때 숨겨진 tr 요소를 보이게 하고 "더 보기" 링크를 숨김
	    var optionOpenBtn = document.querySelector(".option_openBtn");
	    optionOpenBtn.addEventListener("click", function() {
	        var hiddenRows = document.querySelectorAll(".hiddenRow");
	        hiddenRows.forEach(function(hiddenRow) {
	            hiddenRow.style.display = "table-row";
	        });
	        optionOpenBtn.style.display = "none";
	    });
	</script>

	<script>
	  // 체크인 select 요소 가져오기
	  const dateSelect1 = document.querySelector('.dateCheck1');
	  const today1 = new Date();
	  const oneMonthLater1 = new Date();
	  oneMonthLater1.setMonth(today1.getMonth() + 1);
	  addDateOptions(today1, oneMonthLater1, dateSelect1);
	
	  // 체크아웃 select 요소 가져오기
	  const dateSelect2 = document.querySelector('.dateCheck2');
	  dateSelect2.disabled = true; // 초기에 비활성화 상태로 설정
	
	  // 체크인 select 변경 이벤트 리스너 추가
	  dateSelect1.addEventListener('change', function () {
	    const startDate = new Date(dateSelect1.value);
	    const endDate = new Date(startDate);
	    endDate.setMonth(startDate.getMonth() + 1);
	    addDateOptions(startDate, endDate, dateSelect2);
	    dateSelect2.disabled = false; // 체크인 선택 후에 활성화
	
	    const checkoutDate = new Date(startDate);
	    checkoutDate.setDate(checkoutDate.getDate() + 1); // 체크인 날짜 + 1일
	    dateSelect2.value = checkoutDate.toISOString().split('T')[0]; // 체크아웃 select 요소에 설정
	
	    // 이전 옵션 제거
	    const options = dateSelect2.querySelectorAll('option');
	    options.forEach((option) => {
	      const date = new Date(option.value);
	      if (date <= startDate) {
	        option.remove();
	      }
	    });
	  });
	
	  // 날짜 옵션 추가 함수
	  function addDateOptions(startDate, endDate, dateSelect) {
	    dateSelect.innerHTML = ''; // 기존 옵션 초기화
	    let currentDate = new Date(startDate);
	    while (currentDate <= endDate) {
	      const option = document.createElement('option');
	      const dateValue = currentDate.toISOString().split('T')[0];
	      option.value = String(dateValue);
	      option.textContent = currentDate.toLocaleDateString();
	      dateSelect.appendChild(option);
	      currentDate.setDate(currentDate.getDate() + 1);
	    }
	  }
	</script>



	<script>
		init();
	</script>

	<script>
		function handleCheckbox(checkbox) {
			var checkboxes = document.getElementsByName('prices');
			checkboxes.forEach(function(element) {
				if (element !== checkbox) {
					element.checked = false;
				}
			});
		}
	</script>

	<script>
		// 페이지 로드 시 옵션과 드롭다운 초기화
		window.addEventListener('load', function() {
			initializeOptions();
		});

		// 옵션과 드롭다운 초기화 함수
		function initializeOptions() {
			const params = new URLSearchParams(window.location.search);

			// 지역 선택 초기화
			const areaSelect = document.querySelector('.areaCode');
			const areaParam = params.get('area');
			if (areaParam) {
				areaSelect.value = areaParam;
			}

			// 체크인 날짜 선택 초기화
			const dateCheckinSelect = document.querySelector('.dateCheck1');
			const dateCheckinParam = params.get('date_in');
			if (dateCheckinParam) {
				dateCheckinSelect.value = dateCheckinParam;
			}

			// 체크아웃 날짜 선택 초기화
			const dateCheckoutSelect = document.querySelector('.dateCheck2');
			const dateCheckoutParam = params.get('date_out');
			if (dateCheckoutParam) {
				dateCheckoutSelect.value = dateCheckoutParam;
			}

			// 숙박객 수 선택 초기화
			const guestCountCheckboxes = document
					.querySelectorAll('.guest-count-checkbox');
			const guestCountParams = params.getAll('guests');
			guestCountCheckboxes.forEach(function(checkbox) {
				checkbox.checked = guestCountParams.includes(checkbox.value);
			});

			// 가격 선택 초기화
			const priceCheckboxes = document
					.querySelectorAll('.price-checkbox');
			const priceParams = params.getAll('prices');
			priceCheckboxes.forEach(function(checkbox) {
				checkbox.checked = priceParams.includes(checkbox.value);
			});

			// 예약 종류 선택 초기화
			const reserveOptionsCheckboxes = document
					.querySelectorAll('.house-option-checkbox[name="reserveOptions"]');
			const reserveOptionsParams = params.getAll('reserveOptions');
			reserveOptionsCheckboxes.forEach(function(checkbox) {
				checkbox.checked = reserveOptionsParams
						.includes(checkbox.value);
			});

			// 편의시설 선택 초기화
			const houseOptionsCheckboxes = document
					.querySelectorAll('.house-option-checkbox[name="houseOptions"]');
			const houseOptionsParams = params.getAll('houseOptions');
			houseOptionsCheckboxes.forEach(function(checkbox) {
				checkbox.checked = houseOptionsParams.includes(checkbox.value);
			});

			// 투숙객 별점 선택 초기화
			const starCountCheckboxes = document
					.querySelectorAll('.star-count-checkbox');
			const starCountParams = params.getAll('starScore');
			starCountCheckboxes.forEach(function(checkbox) {
				checkbox.checked = starCountParams.includes(checkbox.value);
			});
		}

		// 폼 제출 시 URL에 선택한 값 추가
		function submitForm() {
			const form = document.getElementById('houseOption');
			const areaSelect = document.querySelector('.areaCode');
			const dateCheckinSelect = document.querySelector('.dateCheck1');
			const dateCheckoutSelect = document.querySelector('.dateCheck2');
			const guestCountCheckboxes = document
					.querySelectorAll('.guest-count-checkbox:checked');
			const priceCheckboxes = document
					.querySelectorAll('.price-checkbox:checked');
			const reserveOptionsCheckboxes = document
					.querySelectorAll('.house-option-checkbox[name="reserveOptions"]:checked');
			const houseOptionsCheckboxes = document
					.querySelectorAll('.house-option-checkbox[name="houseOptions"]:checked');
			const starCountCheckboxes = document
					.querySelectorAll('.star-count-checkbox:checked');

			// 기존의 쿼리 매개변수 삭제
			const url = new URL(window.location.href);
			url.search = '';

			// 지역 선택 추가
			const areaValue = areaSelect.value;
			url.searchParams.append('area', areaValue);

			// 체크인 날짜 추가
			const dateCheckinValue = dateCheckinSelect.value;
			url.searchParams.append('date_in', dateCheckinValue);

			// 체크아웃 날짜 추가
			const dateCheckoutValue = dateCheckoutSelect.value;
			url.searchParams.append('date_out', dateCheckoutValue);

			// 숙박객 수 추가
			guestCountCheckboxes.forEach(function(checkbox) {
				url.searchParams.append('guests', checkbox.value);
			});

			// 가격 추가
			priceCheckboxes.forEach(function(checkbox) {
				url.searchParams.append('prices', checkbox.value);
			});

			// 예약 종류 추가
			reserveOptionsCheckboxes.forEach(function(checkbox) {
				url.searchParams.append('reserveOptions', checkbox.value);
			});

			// 편의시설 추가
			houseOptionsCheckboxes.forEach(function(checkbox) {
				url.searchParams.append('houseOptions', checkbox.value);
			});

			// 투숙객 별점 추가
			starCountCheckboxes.forEach(function(checkbox) {
				url.searchParams.append('starScore', checkbox.value);
			});

			// 새로운 URL로 리다이렉트
			window.location.href = url.toString();
		}
	</script>

</body>
</html>