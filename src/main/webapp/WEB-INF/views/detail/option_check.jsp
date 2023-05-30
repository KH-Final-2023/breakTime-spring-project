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
	top: 0;
	left: 0;
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
	font-size: 18px;
	font-weight: bolder;
}

.card {
	width: 220px;
	background-color: #fff;
	padding: 5px;
}

.price-content {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin: 0 30px;
}

label {
	font-size: 12px;
	font-weight: 500;
}

.price-content>div>p {
	font-size: 16px;
	font-weight: 600;
}

.range-slider {
	width: 180px;
	position: relative;
	margin: 15px 0 30px 0;
}

input[type=range] {
	-webkit-appearance: none;
	width: 100%;
	background: transparent;
	position: absolute;
	left: 0;
}

input[type=range]::-webkit-slider-thumb {
	-webkit-appearance: none;
	height: 15px;
	width: 15px;
	border-radius: 50%;
	background: #36b37e;
	cursor: pointer;
	margin-top: -5px;
	position: relative;
	z-index: 1;
}

input[type=range]::-webkit-slider-runnable-track {
	width: 100%;
	height: 5px;
	background: #e8e8e8;
	border-radius: 3px;
	border: none;
}
</style>
</head>
<body>

	<div class="optionArea">
		<div class="houseOption">
			<table class="optionTable">
				<tr>
					<th class="tableTitle">가격</th>
				</tr>
				<tr>
					<td><input type="checkbox">₩0 - ₩100,000</td>
				</tr>
				<tr>
					<td><input type="checkbox">₩100,000 - ₩200,000</td>
				</tr>
				<tr>
					<td><input type="checkbox">₩200,000 - ₩300,000</td>
				</tr>
				<tr>
					<td><input type="checkbox">₩300,000 - ₩400,000</td>
				</tr>
				<tr>
					<td>
						<div class="card">
							<div class="price-content">
								<div>
									<label>Min</label>
									<p id="min-value"></p>
								</div>

								<div>
									<label>Max</label>
									<p id="max-value"></p>
								</div>
							</div>

							<div class="range-slider">
								<input type="range" class="min-price" value="0" min="0"
									max="400000" step="5000"> <input type="range"
									class="max-price" value="400000" min="0" max="400000"
									step="5000">
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th class="tableTitle">숙소 종류</th>
				</tr>
				<tr>
					<td><input type="checkbox">호텔</td>
				</tr>
				<tr>
					<td><input type="checkbox">리조트</td>
				</tr>
				<tr>
					<td><input type="checkbox">콘도</td>
				</tr>
				<tr>
					<td><input type="checkbox">모텔</td>
				</tr>
				<tr>
					<th class="tableTitle">예약 종류</th>
				</tr>
				<tr>
					<td><input type="checkbox">무료 취소</td>
				</tr>
				<tr>
					<td><input type="checkbox">환불 불가</td>
				</tr>
				<tr>
					<th class="tableTitle">편의시설</th>
				</tr>
				<tr>
					<td><input type="checkbox"><i class="fa-solid fa-wifi"></i>
						와이파이</td>
				</tr>
				<tr>
					<td><input type="checkbox"><i
						class="fa-solid fa-ban-smoking"></i> 금연</td>
				</tr>
				<tr>
					<td><input type="checkbox">주차장</td>
				</tr>
				<tr>
					<td><input type="checkbox">에어컨</td>
				</tr>
				<tr>
					<td><button class="option_openBtn">더 보기</button></td>
				</tr>
				<tr>
					<th class="tableTitle">투숙객 별점</th>
				</tr>
				<tr>
					<td><input type="checkbox"><i
						class="fa-solid fa-star starStyle"></i><i
						class="fa-solid fa-star starStyle"></i><i
						class="fa-solid fa-star starStyle"></i><i
						class="fa-solid fa-star starStyle"></i><i
						class="fa-solid fa-star starStyle"></i></td>
				</tr>
				<tr>
					<td><input type="checkbox"><i
						class="fa-solid fa-star starStyle"></i><i
						class="fa-solid fa-star starStyle"></i><i
						class="fa-solid fa-star starStyle"></i><i
						class="fa-solid fa-star starStyle"></i><i
						class="fa-solid fa-star-half starStyle"></i></td>
				</tr>
				<tr>
					<td><input type="checkbox"><i
						class="fa-solid fa-star starStyle"></i><i
						class="fa-solid fa-star starStyle"></i><i
						class="fa-solid fa-star starStyle"></i><i
						class="fa-solid fa-star starStyle"></i></td>
				</tr>
				<tr>
					<td><input type="checkbox"><i
						class="fa-solid fa-star starStyle"></i><i
						class="fa-solid fa-star starStyle"></i><i
						class="fa-solid fa-star starStyle"></i><i
						class="fa-solid fa-star-half starStyle"></i></td>
				</tr>
				<tr>
					<td><input type="checkbox"><i
						class="fa-solid fa-star starStyle"></i><i
						class="fa-solid fa-star starStyle"></i><i
						class="fa-solid fa-star starStyle"></i></td>
				</tr>
				<tr>
					<th class="tableTitle">식사 계획</th>
				</tr>
				<tr>
					<td><input type="checkbox">조식 포함</td>
				</tr>
				<tr>
					<td><input type="checkbox">조식 포함 안 됨</td>
				</tr>
				<tr>
					<th class="tableTitle">인근 지역</th>
				</tr>
				<tr>
					<td><input type="checkbox">인제군</td>
				</tr>
				<tr>
					<td><input type="checkbox">홍천군</td>
				</tr>
				<tr>
					<td><input type="checkbox">평창군</td>
				</tr>
			</table>
		</div>
	</div>

	<!-- 가격 슬라이더 스크립트 -->
	<script>
		const minPriceSlider = document.querySelector('.min-price');
		const maxPriceSlider = document.querySelector('.max-price');
		const minValueElement = document.querySelector('#min-value');
		const maxValueElement = document.querySelector('#max-value');

		minPriceSlider.addEventListener('input', updatePriceValues);
		maxPriceSlider.addEventListener('input', updatePriceValues);

		function updatePriceValues() {
			const minValue = '₩' + numberWithCommas(minPriceSlider.value);
			const maxValue = '₩' + numberWithCommas(maxPriceSlider.value);

			minValueElement.textContent = minValue;
			maxValueElement.textContent = maxValue;
		}

		function numberWithCommas(number) {
			return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		}

		minValueElement.textContent = '₩'
				+ numberWithCommas(minPriceSlider.value);
		maxValueElement.textContent = '₩'
				+ numberWithCommas(maxPriceSlider.value);
	</script>
</body>
</html>