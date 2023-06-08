<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
.searchBar_detail {
	margin-left: 500px;
	margin-top: 100px;
	margin-bottom: 50px;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropbtn_icon {
	font-family: 'Material Icons';
}

.dropbtn {
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

.dropdown-content {
	display: none;
	font-weight: 400;
	background-color: #fcfcfc;
	min-width: 240px;
	border-radius: 8px;
	height: 160px;
	overflow: scroll;
	box-shadow: 0px 0px 10px 3px rgba(190, 190, 190, 0.6);
}

.dropdown-content::-webkit-scrollbar {
	width: 5px;
	height: 10px;
}

.dropdown-content::-webkit-scrollbar-thumb {
	border-radius: 2px;
	background-color: rgb(194, 194, 194)
}

.dropdown-content div {
	display: block;
	text-decoration: none;
	color: rgb(37, 37, 37);
	font-size: 12px;
	padding: 12px 20px;
}

.dropdown-content div:hover {
	background-color: rgb(226, 226, 226);
}

.dropdown-content.show {
	display: block;
}
</style>
</head>
<body>
	<div class="searchBar_detail">
		<div class="dropdown">
			<button class="dropbtn">
				<span class="dropbtn_icon">지역</span> <span class="dropbtn_content"></span>
				<button>검색</button>
				<span class="dropbtn_click"
					style="font-family: Material Icons; font-size: 16px; color: #3b3b3b; float: right;"
					onclick="dropdown()">지역 선택</span>
			</button>
			<div class="dropdown-content">
				<div class="categoryCode" name="seoul" id="1"
					onclick="showMenu(this.innerText)">서울</div>
				<div class="categoryCode" name="incheon" id="2"
					onclick="showMenu(this.innerText)">인천</div>
				<div class="categoryCode" name="daejeon" id="3"
					onclick="showMenu(this.innerText)">대전</div>
				<div class="categoryCode" name="daegu" id="4"
					onclick="showMenu(this.innerText)">대구</div>
				<div class="categoryCode" name="gwangju" id="5"
					onclick="showMenu(this.innerText)">광주</div>
				<div class="categoryCode" name="busan" id="6"
					onclick="showMenu(this.innerText)">부산</div>
				<div class="categoryCode" name="ulsan" id="7"
					onclick="showMenu(this.innerText)">울산</div>
				<div class="categoryCode" name="sejong" id="8"
					onclick="showMenu(this.innerText)">세종</div>
				<div class="categoryCode" name="gyeonggi" id="31"
					onclick="showMenu(this.innerText)">경기도</div>
				<div class="categoryCode" name="gangwon" id="32"
					onclick="showMenu(this.innerText)">강원도</div>
				<div class="categoryCode" name="chungbug" id="33"
					onclick="showMenu(this.innerText)">충청북도</div>
				<div class="categoryCode" name="chungnam" id="34"
					onclick="showMenu(this.innerText)">충청남도</div>
				<div class="categoryCode" name="gyeongbug" id="35"
					onclick="showMenu(this.innerText)">경상북도</div>
				<div class="categoryCode" name="gyeongnam" id="36"
					onclick="showMenu(this.innerText)">경상남도</div>
				<div class="categoryCode" name="jeonbug" id="37"
					onclick="showMenu(this.innerText)">전라북도</div>
				<div class="categoryCode" name="jeonnam" id="38"
					onclick="showMenu(this.innerText)">전라남도</div>
				<div class="categoryCode" name="jeju" id="39"
					onclick="showMenu(this.innerText)">제주도</div>
			</div>
		</div>
	</div>

	<!-- 지역 카테고리 설정 스크립트 -->
	<script>
    window.onload=()=>{
      document.querySelector('.dropbtn_click').onclick = ()=>{
        dropdown();
      }
      document.getElementsByClassName('categoryCode').onclick = ()=>{
        showMenu(value);
      };
      dropdown = () => {
        var v = document.querySelector('.dropdown-content');
        var dropbtn = document.querySelector('.dropbtn')
        v.classList.toggle('show');
        dropbtn.style.borderColor = 'rgb(94, 94, 94)';
      }

      showMenu=(value)=>{
        var dropbtn_icon = document.querySelector('.dropbtn_icon');
        var dropbtn_content = document.querySelector('.dropbtn_content');
        var dropbtn_click = document.querySelector('.dropbtn_click');
        var dropbtn = document.querySelector('.dropbtn');

        dropbtn_icon.innerText = '';
        dropbtn_content.innerText = value;
        dropbtn_content.style.color = '#252525';
        dropbtn.style.borderColor = '#3992a8';
      }
    }
    window.onclick= (e)=>{
      if(!e.target.matches('.dropbtn_click')){
        var dropdowns = document.getElementsByClassName("dropdown-content");

        var dropbtn_icon = document.querySelector('.dropbtn_icon');
        var dropbtn_content = document.querySelector('.dropbtn_content');
        var dropbtn_click = document.querySelector('.dropbtn_click');
        var dropbtn = document.querySelector('.dropbtn');

        var i;
        for (i = 0; i < dropdowns.length; i++) {
          var openDropdown = dropdowns[i];
          if (openDropdown.classList.contains('show')) {
            openDropdown.classList.remove('show');
          }
        }
      }
    }
</script>
</body>
</html>