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
		<div class="houseOption">
			<form id="houseOption" name="option"
				action="<%=request.getContextPath()%>/list/detail/${category}"
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
							<div class="date_checkIn">
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
							<div class="date_checkOut">
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