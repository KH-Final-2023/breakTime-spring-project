<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
.area_detail {
	margin-left: 500px;
	margin-top: 100px;
	margin-bottom: 50px;
}

.dropdown1 {
	position: relative;
	display: inline-block;
}

.dropbtn1_icon {
	font-family: 'Material Icons';
}

.dropbtn1 {
	display: block;
	border: 2px solid rgb(94, 94, 94);
	border-radius: 4px;
	background-color: #fcfcfc;
	font-weight: 400;
	color: rgb(124, 124, 124);
	padding: 12px;
	width: 400px;
	text-align: left;
	cursor: pointer;
	font-size: 12px;
	position: relative;
}

.dropdown-content1 {
	display: none;
	font-weight: 400;
	background-color: #fcfcfc;
	min-width: 240px;
	border-radius: 8px;
	height: 160px;
	overflow: scroll;
	box-shadow: 0px 0px 10px 3px rgba(190, 190, 190, 0.6);
}

.dropdown-content1::-webkit-scrollbar {
	width: 5px;
	height: 10px;
}

.dropdown-content1::-webkit-scrollbar-thumb {
	border-radius: 2px;
	background-color: rgb(194, 194, 194)
}

.dropdown-content1 div {
	display: block;
	text-decoration: none;
	color: rgb(37, 37, 37);
	font-size: 12px;
	padding: 12px 20px;
}

.dropdown-content1 div:hover {
	background-color: rgb(226, 226, 226);
}

.dropdown-content1.show {
	display: block;
}
</style>
</head>
<body>
	<div class="area_detail">
		<div class="dropdown1">
			<button class="dropbtn1">
				<span class="dropbtn1_icon">지역</span> <span class="dropbtn1_content"></span>
				<span class="dropbtn1_click"
					style="font-family: Material Icons; font-size: 16px; color: #3b3b3b; float: right;"
					onclick="dropdown1()">지역 선택</span>
			</button>
			<div class="dropdown-content1">
				<div class="categoryCode" name="seoul" id="1">서울</div>
				<div class="categoryCode" name="incheon" id="2">인천</div>
				<div class="categoryCode" name="daejeon" id="3">대전</div>
				<div class="categoryCode" name="daegu" id="4">대구</div>
				<div class="categoryCode" name="gwangju" id="5">광주</div>
				<div class="categoryCode" name="busan" id="6">부산</div>
				<div class="categoryCode" name="ulsan" id="7">울산</div>
				<div class="categoryCode" name="sejong" id="8">세종</div>
				<div class="categoryCode" name="gyeonggi" id="31">경기도</div>
				<div class="categoryCode" name="gangwon" id="32">강원도</div>
				<div class="categoryCode" name="chungbug" id="33">충청북도</div>
				<div class="categoryCode" name="chungnam" id="34">충청남도</div>
				<div class="categoryCode" name="gyeongbug" id="35">경상북도</div>
				<div class="categoryCode" name="gyeongnam" id="36">경상남도</div>
				<div class="categoryCode" name="jeonbug" id="37">전라북도</div>
				<div class="categoryCode" name="jeonnam" id="38">전라남도</div>
				<div class="categoryCode" name="jeju" id="39">제주도</div>
			</div>
		</div>
	</div>

</body>
</html>
