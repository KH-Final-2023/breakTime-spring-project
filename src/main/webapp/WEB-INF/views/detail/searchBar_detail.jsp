<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>search bar detail</title>
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

/* 스타일링 */
.calendar {
	font-family: Arial, sans-serif;
}

.calendar button {
	padding: 5px 10px;
	margin-right: 10px;
}

.calendar table {
	border-collapse: collapse;
	width: 100%;
}

.calendar th, .calendar td {
	border: 1px solid black;
	padding: 5px;
	text-align: center;
}

.calendar th {
	background-color: #f2f2f2;
}

.calendar .current-month {
	font-weight: bold;
}

.calendar .selected-date {
	background-color: #ffc107;
}

.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: white;
	margin: 10% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 300px;
}

.modal-header {
	display: flex;
	justify-content: space-between;
}

.modal-header button {
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="searchBar_detail">
		<div class="dropdown">
			<button class="dropbtn">
				<span class="dropbtn_icon">지역</span> <span class="dropbtn_content"></span>
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
		<div class="calendar">
			<button id="checkinBtn" onclick="openCalendar('checkin')">체크인
				날짜 선택</button>
			<button id="checkoutBtn" onclick="openCalendar('checkout')">체크아웃
				날짜 선택</button>
		</div>

		<div id="calendarModal" class="modal">
			<div class="modal-content">
				<div class="modal-header">
					<button onclick="changeMonth('prev')">◀</button>
					<span id="currentMonth"></span>
					<button onclick="changeMonth('next')">▶</button>
				</div>
				<table id="calendarTable">
					<thead>
						<tr>
							<th>일</th>
							<th>월</th>
							<th>화</th>
							<th>수</th>
							<th>목</th>
							<th>금</th>
							<th>토</th>
						</tr>
					</thead>
					<tbody id="calendarBody"></tbody>
				</table>
			</div>
		</div>
	</div>





	<!-- 체크인아웃 -->
	<script>
    // 현재 날짜 정보 가져오기
    const currentDate = new Date();

    // 선택한 날짜를 저장할 변수
    let selectedCheckinDate = null;
    let selectedCheckoutDate = null;

    // 체크인/체크아웃 버튼 클릭 시 달력 모달창 열기
    function openCalendar(target) {
      const modal = document.getElementById('calendarModal');
      modal.style.display = 'block';

      // 체크인/체크아웃 구분하여 날짜 선택 정보 설정
      if (target === 'checkin') {
        selectedCheckinDate = null;
        selectedCheckoutDate = null;
      } else {
        selectedCheckinDate = document.getElementById('checkinBtn').textContent;
      }

      // 현재 날짜로 달력 생성
      generateCalendar(currentDate);
    }

    // 달력 생성
    function generateCalendar(date) {
      const tableBody = document.getElementById('calendarBody');
      tableBody.innerHTML = '';

      const currentYear = date.getFullYear();
      const currentMonth = date.getMonth();

      // 현재 달의 첫째 날
      const firstDay = new Date(currentYear, currentMonth, 1);

      // 현재 달의 마지막 날
      const lastDay = new Date(currentYear, currentMonth + 1, 0);

      // 첫째 날이 속한 주의 일요일로 이동
      const startDate = new Date(firstDay);
      startDate.setDate(startDate.getDate() - startDate.getDay());

      // 마지막 날이 속한 주의 토요일로 이동
      const endDate = new Date(lastDay);
      endDate.setDate(endDate.getDate() + (6 - endDate.getDay()));

      let tableRow = document.createElement('tr');
      let currentDate = new Date(startDate);

      // 달력 테이블 생성
      while (currentDate <= endDate) {
        if (currentDate.getDay() === 0) {
          tableBody.appendChild(tableRow);
          tableRow = document.createElement('tr');
        }

        const tableData = document.createElement('td');
        tableData.textContent = currentDate.getDate();

        if (
          currentDate >= firstDay &&
          currentDate <= lastDay &&
          currentDate.getMonth() === currentMonth
        ) {
          tableData.classList.add('current-month');

          // 체크인/체크아웃 날짜에 따른 스타일 설정
          if (currentDate.toDateString() === selectedCheckinDate) {
            tableData.classList.add('selected-date');
          } else if (currentDate.toDateString() === selectedCheckoutDate) {
            tableData.classList.add('selected-date');
          } else {
            tableData.addEventListener('click', () =>
              selectDate(currentDate)
            );
          }
        } else {
          tableData.classList.add('other-month');
        }

        tableRow.appendChild(tableData);
        currentDate.setDate(currentDate.getDate() + 1);
      }

      tableBody.appendChild(tableRow);

      // 현재 달 표시
      const currentMonthText = `${currentYear}년 ${currentMonth + 1}월`;
      document.getElementById('currentMonth').textContent = currentMonthText;
    }

    // 날짜 선택
    function selectDate(date) {
      if (!selectedCheckinDate) {
        selectedCheckinDate = date.toDateString();
        document.getElementById('checkinBtn').textContent = selectedCheckinDate;
      } else if (!selectedCheckoutDate) {
        selectedCheckoutDate = date.toDateString();
        document.getElementById('checkoutBtn').textContent = selectedCheckoutDate;
        closeCalendar();
      }
    }

    // 이전 달 또는 다음 달로 이동
    function changeMonth(direction) {
      if (direction === 'prev') {
        currentDate.setMonth(currentDate.getMonth() - 1);
      } else if (direction === 'next') {
        currentDate.setMonth(currentDate.getMonth() + 1);
      }

      generateCalendar(currentDate);
    }

    // 달력 모달창 닫기
    function closeCalendar() {
      const modal = document.getElementById('calendarModal');
      modal.style.display = 'none';
    }
  </script>


</body>
</html>