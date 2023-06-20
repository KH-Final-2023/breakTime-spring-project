<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캘린더 페이지</title>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
/* area_detail */
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

/* date_detail */
.blue-button {
	color: blue;
}

.date_detail {
	margin-left: 500px;
	margin-top: -50px;
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
	width: 400px;
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

/* Reset CSS */
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

/* 전체 컨테이너 스타일 */
.container {
	display: flex;
	position: relative;
	justify-content: center;
	align-items: center;
	height: 100vh;
	max-width: 768px;
	margin: 0 auto;
	background-color: #fff;
	opacity: 1;
	/* 초기에 투명하지 않도록 설정 */
	animation: 0.1s ease 0s 1 normal none running pageAnimation;
}

.detail2-main {
	padding: 0 2rem;
}

/* 달력 컨테이너 스타일 */
.calendar-container {
	max-height: 400px;
	overflow-y: auto;
	scrollbar-width: none;
	/* Firefox용 스크롤바 감추기 */
	-ms-overflow-style: none;
	/* IE/Edge용 스크롤바 감추기 */
	max-height: calc(100vh - 100px);
}

/* 스크롤바 감추기 */
.calendar-container::-webkit-scrollbar {
	display: none;
	/* Chrome/Safari용 스크롤바 감추기 */
}

/* 달력 테이블 스타일 */
.calendar-table {
	width: 100%;
	/* border-collapse: collapse; */
	table-layout: fixed;
	border-spacing: 0; /* 추가된 부분 */
}

/* 날짜 셀 스타일 */
.calendar-table td {
	text-align: center;
	padding: 10px;
	/* border: 1px solid #ccc; */
	border: 1px solid transparent; /* 변경된 부분 */
	cursor: pointer;
	box-sizing: border-box; /* 변경된 부분 */
}

/* 선택할 수 없는 날짜 스타일 */
.calendar-table td.disabled {
	color: #ccc;
	cursor: not-allowed;
}

.calendar-table th, .calendar-table td {
	border: none;
}

.calendar-table td {
	padding: 5px;
	text-align: center;
}

/* 토요일 색상 변경 */
.calendar-table td:nth-child(7), .calendar-table th:nth-child(7) {
	color: #0000ff86;
}

/* 일요일 색상 변경 */
.calendar-table td:nth-child(1), .calendar-table th:nth-child(1) {
	color: rgb(46, 204, 113);
}

.calendar-table th:nth-child(1), .calendar-table th:nth-child(2),
	.calendar-table th:nth-child(3), .calendar-table th:nth-child(4),
	.calendar-table th:nth-child(5), .calendar-table th:nth-child(6),
	.calendar-table th:nth-child(7) {
	color: rgba(0, 0, 0, 0.6);
}

/* 선택된 날짜 스타일 적용 */
.calendar-table td.selected {
	/* border: 1px solid #A5FF00; */
	/* border-color: #0000ff86;  */
	/* color: #0000ff86; */
	border-radius: 50%;
	/* box-shadow: inset 0 0 20px #A5FF00; */
	/* background-image: linear-gradient(to outer top, rgba(61, 20, 204, 0), #3D14CC); */
	/* color: #3D14CC; */
	border: 1px solid #3D14CC;
	background-color: #3D14CC;
	color: #fff;
	position: relative;
	box-sizing: border-box; /* 추가된 부분 */
}

.selected-light {
	border-radius: 50%;
	border: 1px solid #6941f2;
	background-color: #6941f2;
	color: #fff;
	position: relative;
	box-sizing: border-box; /* 연한 배경색으로 변경 */
}

.calendar-table td {
	padding: 17px;
	text-align: center;
	border: 1px solid transparent; /* border를 투명하게 설정 */
	box-sizing: border-box; /* 추가된 부분 */
}

.calendar-table {
	table-layout: auto;
}

.calendar-table td {
	width: 40px;
	padding: 17px;
	text-align: center;
}

.month-header {
	text-align: left;
	height: 100px;
}

/* 추가된 스타일: 초기화 버튼 */
.reset-button {
	position: absolute;
	top: 20px;
	right: 20px;
	cursor: pointer;
	font-size: 13px;
	color: blue;
}

/* 추가된 스타일: 날짜 선택 */
.date-select {
	position: absolute;
	top: 20px;
	left: 50%;
	transform: translateX(-50%);
	font-size: 18px;
	font-weight: bold;
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
<script>
	var inOut = [];

	function init() {
		// Dropdown 초기화
		dropdown2();
		generateCalendars();
	}

	function dropdown2() {
		document.getElementsByClassName("dropdown-content2")[0].classList
				.remove("show");
	}

	$(document).ready(
			function() {
				$("td").click(
						function() {
							var selectedDate = $(this).text();
							var selectedMonth = $(".month-name").first().text()
									.split(" ")[0];
							var selectedYear = $(".month-name").first().text()
									.split(" ")[1];
							var selectedDateElement = $("<span>").addClass(
									"selected-date").text(
									selectedMonth + " " + selectedDate);

							if ($(".selected-date").length < 2) {
								$(".dropbtn2_content").append(
										selectedDateElement);
								$(this).addClass("selected");
							}

							if ($(".selected-date").length === 2) {
								highlightSelectedDates();
								updateCursorStyle();
							}

							if ($(".selected-date").length > 2) {
								resetSelection();
							}
						});

				$(".submit-button").click(function() {
					submitSelection();
					closeDropdown();
				});

				$(".reset-button").click(function() {
					resetSelection();
				});

				$(".dropdown-content2").mouseenter(function() {
					$(".calendar-container").addClass("no-highlight");
				});

				$(".dropdown-content2").mouseleave(function() {
					$(".calendar-container").removeClass("no-highlight");
				});

				$("td").mouseenter(function() {
					$(this).css("cursor", "pointer");
				});

				$("td").mouseleave(function() {
					$(this).css("cursor", "auto");
				});
			});

	function updateCursorStyle() {
		if ($(".selected-highlight").length >= 2) {
			$(".submit-button").addClass("blue-button");
			$(".submit-button").css("cursor", "pointer");
		} else {
			$(".submit-button").removeClass("blue-button");
			$(".submit-button").css("cursor", "auto");
		}
	}

	function generateCalendars() {
		var currentDate = new Date();
		for (var i = 0; i < 6; i++) {
			var calendarContainer = $("<div>").addClass(
					"container container-close");
			var calendarTable = $("<table>");
			var calendarBody = $("<tbody>");

			var year = currentDate.getFullYear();
			var month = currentDate.getMonth();
			var daysInMonth = new Date(year, month + 1, 0).getDate();
			var firstDay = new Date(year, month, 1).getDay();

			var row = $("<tr>");
			var weekdays = [ "일", "월", "화", "수", "목", "금", "토" ];
			for (var j = 0; j < 7; j++) {
				row.append($("<th>").text(weekdays[j]));
			}

			calendarBody.append(row);

			row = $("<tr>");
			for (var k = 0; k < firstDay; k++) {
				row.append($("<td>").text(""));
			}

			for (var day = 1; day <= daysInMonth; day++) {
				if (row.children().length === 7) {
					calendarBody.append(row);
					row = $("<tr>");
				}
				var cell = $("<td>").text(day);
				row.append(cell);
			}

			calendarBody.append(row);
			calendarTable.append(calendarBody);
			calendarContainer.append(calendarTable);

			// 월 표시
			var monthName = $("<div>").addClass("month-name").text(
					getMonthName(month) + " " + year);
			calendarContainer.prepend(monthName);

			$(".calendar-container").append(calendarContainer);

			currentDate.setMonth(currentDate.getMonth() + 1);
		}

		$(".container-close").first().removeClass("container-close");
	}

	function getMonthName(month) {
		var monthNames = [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
				"9월", "10월", "11월", "12월" ];
		return monthNames[month];
	}

	function getDayOfWeek(year, month, day) {
		var date = new Date(year, month - 1, day);
		var weekdays = [ "일", "월", "화", "수", "목", "금", "토" ];
		return weekdays[date.getDay()];
	}

	function highlightSelectedDates() {
		var startDate = $(".selected-date").first().text().split(" ")[1]
				.split("(")[0];
		var endDate = $(".selected-date").last().text().split(" ")[1]
				.split("(")[0];
		var startMonth = $(".selected-date").first().text().split(" ")[0];
		var endMonth = $(".selected-date").last().text().split(" ")[0];
		var startYear = $(".month-name").first().text().split(" ")[1];
		var endYear = $(".month-name").last().text().split(" ")[1];

		$("td").removeClass("selected-highlight");

		$(".month-name").each(function() {
			var month = $(this).text().split(" ")[0];
			var year = $(this).text().split(" ")[1];

			if (month === startMonth && year === startYear) {
				$(this).next().find("td").filter(function() {
					return parseInt($(this).text()) >= parseInt(startDate);
				}).addClass("selected-highlight");
			} else if (month === endMonth && year === endYear) {
				$(this).next().find("td").filter(function() {
					return parseInt($(this).text()) <= parseInt(endDate);
				}).addClass("selected-highlight");
			} else if (year > startYear && year < endYear) {
				$(this).next().find("td").addClass("selected-highlight");
			}
		});
	}

	function resetSelection() {
		$(".selected-date").remove();
		$(".submit-button").removeClass("blue-button").css("cursor", "auto");
	}

	function closeDropdown() {
		$(".dropdown-content2").removeClass("show");
		resetSelection();
	}

	function submitSelection() {
		  var selectedDates = $(".selected-date");

		  if (selectedDates.length === 2) {
		    var startDate = selectedDates.first().text().replace(/\(.*\)/g, "");
		    var endDate = selectedDates.last().text().replace(/\(.*\)/g, "");
		    var startMonth = startDate.split(" ")[0];
		    var startDay = startDate.split(" ")[1];
		    var endMonth = endDate.split(" ")[0];
		    var endDay = endDate.split(" ")[1];
		    var selectionText = startMonth + " " + startDay + "일 ~ " + endMonth + " " + endDay + "일";
		    
		    var startFormatted = formatDate(startDate);
		    var endFormatted = formatDate(endDate);
		    var selectionFormatted = startFormatted + " ~ " + endFormatted;
		    
		    $(".dropbtn2_content").text(selectionText);
		    inOut.push(startFormatted);
		    inOut.push(endFormatted);
		  } else if (selectedDates.length === 1) {
		    var selectedDate = selectedDates.first().text().replace(/\(.*\)/g, "");
		    var month = selectedDate.split(" ")[0];
		    var day = selectedDate.split(" ")[1];
		    var selectionText = month + " " + day + "일";
		    
		    var formatted = formatDate(selectedDate);
		    var selectionFormatted = formatted;
		    
		    $(".dropbtn2_content").text(selectionText);
		    inOut.push(formatted);
		  } else {
		    $(".dropbtn2_content").text("날짜 선택");
		  }
		  closeDropdown();
		  $("td").removeClass("selected-highlight");

		  console.log(inOut);
		}

		function formatDate(dateString) {
		  var dateParts = dateString.split(" ");
		  var month = dateParts[0];
		  var day = dateParts[1];
		  var formattedDate = "0000.00.00";
		  
		  if (month && day) {
		    var today = new Date();
		    var year = today.getFullYear();
		    var monthNumber = getMonthNumber(month);
		    
		    formattedDate = year + "." + padZero(monthNumber) + "." + padZero(day);
		  }
		  
		  return formattedDate;
		}

		function getMonthNumber(monthName) {
		  var months = {
		    "1월": "01",
		    "2월": "02",
		    "3월": "03",
		    "4월": "04",
		    "5월": "05",
		    "6월": "06",
		    "7월": "07",
		    "8월": "08",
		    "9월": "09",
		    "10월": "10",
		    "11월": "11",
		    "12월": "12"
		  };
		  
		  return months[monthName] || "00";
		}

		function padZero(value) {
		  return value.toString().padStart(2, "0");
		}
	function closeDropdownOutsideClick(event) {
		var dropdown = $(".dropdown2");
		if (!dropdown.is(event.target)
				&& dropdown.has(event.target).length === 0) {
			closeDropdown();
		}
	}

	$(document).on("click", ".submit-button", function() {
		submitSelection();
		closeDropdown();
	});

	$(document).on("click", function(event) {
		closeDropdownOutsideClick(event);
	});
</script>
</head>
<body>
	<form id="searchOption" name="search_option"
		action="<%=request.getContextPath()%>/list/filter/${category}"
		method="GET">
		<div class="area_detail">
			<div class="dropdown1">
				<div class="dropbtn1">
					<span class="dropbtn1_icon">지역</span> <span
						class="dropbtn1_content"></span> <span class="dropbtn1_click"
						style="font-family: Material Icons; font-size: 16px; color: #3b3b3b; float: right;"
						onclick="dropdown1()">지역 선택</span>
				</div>
				<div class="dropdown-content1">
					<div class="categoryCode" name="seoul" value="1">서울</div>
					<div class="categoryCode" name="incheon" value="2">인천</div>
					<div class="categoryCode" name="daejeon" value="3">대전</div>
					<div class="categoryCode" name="daegu" value="4">대구</div>
					<div class="categoryCode" name="gwangju" value="5">광주</div>
					<div class="categoryCode" name="busan" value="6">부산</div>
					<div class="categoryCode" name="ulsan" value="7">울산</div>
					<div class="categoryCode" name="sejong" value="8">세종</div>
					<div class="categoryCode" name="gyeonggi" value="31">경기도</div>
					<div class="categoryCode" name="gangwon" value="32">강원도</div>
					<div class="categoryCode" name="chungbug" value="33">충청북도</div>
					<div class="categoryCode" name="chungnam" value="34">충청남도</div>
					<div class="categoryCode" name="gyeongbug" value="35">경상북도</div>
					<div class="categoryCode" name="gyeongnam" value="36">경상남도</div>
					<div class="categoryCode" name="jeonbug" value="37">전라북도</div>
					<div class="categoryCode" name="jeonnam" value="38">전라남도</div>
					<div class="categoryCode" name="jeju" value="39">제주도</div>
				</div>
			</div>
		</div>
		<div class="date_detail">
			<div class="dropdown2">
				<div class="dropbtn2">
					<span class="dropbtn2_icon">날짜</span> <span
						class="dropbtn2_content"></span> <span class="dropbtn2_click"
						style="font-family: Material Icons; font-size: 16px; color: #3b3b3b; float: right;"
						onclick="dropdown2()">날짜 선택</span>
				</div>

				<div class="dropdown-content2">
					<div class="container container-close">
						<span class="submit-button">Submit</span> <span
							class="reset-button">reset</span>
						<div class="detail2-main">
							<div class="calendar-container">
								<!-- 달력 컨테이너 -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div>
			<button type="submit" class="search-button" onclick="submitForm()">검색하기</button>
		</div>
	</form>

	<script>
		init();
	</script>

	<!-- 지역 선택시 실행되는 함수 -->
	<script>
	function showMenu(value, id) {
	  var dropbtn_icon = document.querySelector('.dropbtn1_icon');
	  var dropbtn_content = document.querySelector('.dropbtn1_content');
	  var dropbtn_click = document.querySelector('.dropbtn1_click');
	  var dropbtn = document.querySelector('.dropbtn1');

	  dropbtn_icon.innerText = '';
	  dropbtn_content.innerText = value;
	  dropbtn_content.style.color = '#252525';
	  dropbtn.style.borderColor = '#3992a8';

	  // 변수에 선택한 값을 저장
	  selectedArea = id;
	  console.log('Selected Area:', selectedArea);

	}
	</script>
	
	<!-- 드롭다운 스크립트 -->
	<script type="text/javascript">
    window.onload = () => {
    	  document.querySelector('.dropbtn2_click').onclick = () => {
    	    dropdown('.dropdown-content2', '.dropbtn2');
    	  };

    	  document.querySelector('.dropbtn1_click').onclick = () => {
    	    dropdown('.dropdown-content1', '.dropbtn1');
    	  };

    	  // 추가된 부분: dropdown-content2의 클릭 이벤트 핸들러 제거
    	  var dropdownContent2 = document.querySelector('.dropdown-content2');
    	  dropdownContent2.onclick = (event) => {
    	    event.stopPropagation();
    	  };

    	  // 추가된 부분: dropdown-content2의 마우스 강조 효과 제거
    	  dropdownContent2.onmouseover = (event) => {
    	    event.target.style.backgroundColor = 'transparent';
    	  };

    	  var categoryCodes = document.getElementsByClassName('categoryCode');
    	  for (var i = 0; i < categoryCodes.length; i++) {
    	    categoryCodes[i].onclick = function () {
    	      var id = this.getAttribute('id');
    	      showMenu(this.innerText, id);
    	    };
    	  }

    	  function dropdown(contentClass, btnClass) {
    	    var v = document.querySelector(contentClass);
    	    var dropbtn = document.querySelector(btnClass);
    	    v.classList.toggle('show');
    	    dropbtn.style.borderColor = 'rgb(94, 94, 94)';
    	  }

    	  window.onclick = (e) => {
    	    if (!e.target.matches('.dropbtn1_click') && !e.target.matches('.dropbtn2_click')) {
    	      var dropdowns1 = document.getElementsByClassName('dropdown-content1');
    	      var dropdowns2 = document.getElementsByClassName('dropdown-content2');
    	      closeDropdowns(dropdowns1);
    	      closeDropdowns(dropdowns2);
    	    }
    	  };

    	  function closeDropdowns(dropdowns) {
    	    for (var i = 0; i < dropdowns.length; i++) {
    	      var openDropdown = dropdowns[i];
    	      if (openDropdown.classList.contains('show')) {
    	        openDropdown.classList.remove('show');
    	      }
    	      openDropdown.style.borderColor = 'rgb(177, 177, 177)';
    	    }
    	  }
    	};
    </script>
    
    <!-- submit form 2 -->
    <script type="text/javascript">
    function submitForm() {
    	  var inOut = [];

    	  // 2번째 드롭다운의 선택값 가져오기
    	  var selectedDate = $(".dropbtn2_content").text();
    	  var formattedDate = formatDate(selectedDate);
    	  inOut.push(formattedDate);

    	  // URL 생성
    	  var url = "<%=request.getContextPath()%>/list/filter/${category}";
    	  url += "?inOut=" + encodeURIComponent(inOut.join(","));

    	  // 페이지 이동
    	  document.getElementById("searchOption").action = url;
    	  document.getElementById("searchOption").submit();
    	}

    </script>

</body>

</html>