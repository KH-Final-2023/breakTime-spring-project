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

/* date_detail */
.blue-button {
	color: blue;
}

.date_detail {
	width: 200px;
}

.search-button {
	margin-left: 500px;
	margin-bottom: 50px;
	display: block;
	border: 2px solid rgb(94, 94, 94);
	border-radius: 4px;
	background-color: #fcfcfc;
	font-weight: 400;
	color: black;
	background-color: yellowgreen;
	padding: 12px;
	width: 400px;
	text-align: middle;
	cursor: pointer;
	font-size: 12px;
	position: relative;
}

.dropdown2 {
	position: relative;
	display: inline-block;
}

.dropbtn2_icon {
	font-family: 'Material Icons';
}

.dropbtn2 {
	display: block;
	border: 2px solid rgb(94, 94, 94);
	border-radius: 4px;
	background-color: #fcfcfc;
	font-weight: 400;
	color: rgb(124, 124, 124);
	padding: 12px;
	width: 200px;
	text-align: left;
	cursor: pointer;
	font-size: 12px;
	position: relative;
}

.dropdown-content2 {
	display: none;
	font-weight: 400;
	background-color: #fcfcfc;
	min-width: 240px;
	border-radius: 8px;
	height: 160px;
	overflow: scroll;
	box-shadow: 0px 0px 10px 3px rgba(190, 190, 190, 0.6);
}

.dropdown-content2::-webkit-scrollbar {
	width: 5px;
	height: 10px;
}

.dropdown-content2::-webkit-scrollbar-thumb {
	border-radius: 2px;
	background-color: rgb(194, 194, 194)
}

.dropdown-content2 div {
	display: block;
	text-decoration: none;
	color: rgb(37, 37, 37);
	font-size: 12px;
	padding: 12px 20px;
}

.dropdown-content2 div:hover {
	background-color: rgb(226, 226, 226);
}

.dropdown-content2.show {
	display: block;
}

.button-container {
	display: flex;
	justify-content: center;
	align-items: flex-end;
	margin-top: 20px;
	width: 100%;
	position: absolute;
	bottom: 20px;
}

.button-container button {
	width: 95%;
	height: 50px;
	background-color: #4CAF50;
	color: white;
	font-weight: bold;
	font-size: 16px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="optionArea">
		<div class="houseOption">
			<form id="houseOption" name="option"
				action="<%=request.getContextPath()%>/list/filter/${category}"
				method="GET">
				<table class="optionTable">
					<tr>
						<td>
							<div class="area_detail">
								<div class="dropdown1">
									<select class="areaCode" name="area">
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
						<td>
							<div class="date_detail1">
								<div class="dropdown2">
									<select class="dateCheck1" name="date">
									</select>
								</div>
							</div>
						</td>
					</tr>
					<!-- 체크아웃 날짜 옵션 -->
					<tr>
						<td>
							<div class="date_detail2">
								<div class="dropdown3">
									<select class="dateCheck2" name="date">
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
					<tr>
						<td><a class="option_openBtn">더 보기</a></td>
					</tr>
					<tr>
						<th class="tableTitle">투숙객 별점</th>
					</tr>
					<tr>
						<td><input class="star-count-checkbox" type="checkbox"
							name="starScore" value="5"><i
							class="fa-solid fa-star starStyle"></i><i
							class="fa-solid fa-star starStyle"></i><i
							class="fa-solid fa-star starStyle"></i><i
							class="fa-solid fa-star starStyle"></i><i
							class="fa-solid fa-star starStyle"></i></td>
					</tr>
					<tr>
						<td><input class="star-count-checkbox" type="checkbox"
							name="starScore" value="4"><i
							class="fa-solid fa-star starStyle"></i><i
							class="fa-solid fa-star starStyle"></i><i
							class="fa-solid fa-star starStyle"></i><i
							class="fa-solid fa-star starStyle"></i></td>
					</tr>
					<tr>
						<td><input class="star-count-checkbox" type="checkbox"
							name="starScore" value="3"><i
							class="fa-solid fa-star starStyle"></i><i
							class="fa-solid fa-star starStyle"></i><i
							class="fa-solid fa-star starStyle"></i></td>
					</tr>
					<tr>
						<td><input class="star-count-checkbox" type="checkbox"
							name="starScore" value="2"><i
							class="fa-solid fa-star starStyle"></i><i
							class="fa-solid fa-star starStyle"></i></td>
					</tr>
					<tr>
						<td><input class="star-count-checkbox" type="checkbox"
							name="starScore" value="1"><i
							class="fa-solid fa-star starStyle"></i></td>
					</tr>
				</table>
				<br>
				<button type="submit" onclick="submitForm()">검색하기</button>
			</form>
		</div>
	</div>

	<!-- 스크립트 -->
	<script>
		// 체크인 select 요소 가져오기
		const dateSelect1 = document.querySelector('.dateCheck1');
		const today1 = new Date();
		const oneMonthLater1 = new Date();
		oneMonthLater1.setMonth(today1.getMonth() + 1);
		addDateOptions(today1, oneMonthLater1, dateSelect1);

		// 체크아웃 select 요소 가져오기
		const dateSelect2 = document.querySelector('.dateCheck2');
		const today2 = new Date();
		const oneMonthLater2 = new Date();
		oneMonthLater2.setMonth(today2.getMonth() + 1);
		addDateOptions(today2, oneMonthLater2, dateSelect2);

		// 날짜 옵션 추가 함수
		function addDateOptions(startDate, endDate, dateSelect) {
			let currentDate = new Date(startDate);
			while (currentDate <= endDate) {
				const option = document.createElement('option');
				option.value = currentDate.toISOString().split('T')[0];
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

</body>
</html>