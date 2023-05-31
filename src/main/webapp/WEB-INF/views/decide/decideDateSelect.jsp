<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캘린더 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
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

/* 열릴 때 애니메이션 */
@
keyframes pageAnimation { 0% {
	transform: translate3d(0px, 100%, 0px);
	opacity: 0;
}

100
%
{
transform
:
translate3d(
0px
,
0px
,
0px
);
opacity
:
1;
}
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
	border-collapse: collapse;
	table-layout: fixed;
}

/* 날짜 셀 스타일 */
.calendar-table td {
	text-align: center;
	padding: 10px;
	border: 1px solid #ccc;
	cursor: pointer;
}

/* 선택할 수 없는 날짜 스타일 */
.calendar-table td.disabled {
	color: #ccc;
	cursor: not-allowed;
}

.calendar-table {
	border-collapse: collapse;
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
	border: 2px solid #0000ff86;
	color: #0000ff86;
	border-radius: 100%;
	position: relative;
}

.calendar-table td {
	padding: 17px;
	text-align: center;
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
        var currentDate = new Date();
        var year = currentDate.getFullYear();
        var month = currentDate.getMonth();
        var currentDay = currentDate.getDate();
        currentDate.setHours(0, 0, 0, 0);

        function generateCalendar() {
            var calendarContainer = document.querySelector('.calendar-container');
            calendarContainer.innerHTML = '';

            for (var i = 0; i < 12; i++) {
                var calendarTable = document.createElement('table');
                calendarTable.classList.add('calendar-table');

                var calendarHeader = document.createElement('tr');
                calendarHeader.classList.add('month-header');
                var headerCell = document.createElement('th');
                headerCell.setAttribute('colspan', '7');
                headerCell.textContent = getMonthName(month) + ' ' + year;
                calendarHeader.appendChild(headerCell);
                calendarTable.appendChild(calendarHeader);

                var calendarBody = document.createElement('tbody');
                generateMonth(calendarBody, year, month);
                calendarTable.appendChild(calendarBody);

                calendarContainer.appendChild(calendarTable);

                month++;
                if (month > 11) {
                    month = 0;
                    year++;
                }
            }
        }

        function generateMonth(calendarBody, year, month) {
            var startDate = new Date(year, month, 1);
            var endDate = new Date(year, month + 1, 0);
            var totalDays = endDate.getDate();

            var startDayOfWeek = startDate.getDay();

            var row = document.createElement('tr');

            // 요일 추가
            var weekdays = ['일', '월', '화', '수', '목', '금', '토'];
            for (var i = 0; i < 7; i++) {
                var weekdayCell = document.createElement('th');
                weekdayCell.textContent = weekdays[i];
                row.appendChild(weekdayCell);
            }

            calendarBody.appendChild(row);
            row = document.createElement('tr');

            for (var i = 0; i < startDayOfWeek; i++) {
                var emptyCell = document.createElement('td');
                row.appendChild(emptyCell);
            }

            for (var day = 1; day <= totalDays; day++) {

                //id설정 start
                var strYear = year.toString();
                var strMonth;
                var strDay;
                if (month + 1 < 10) {
                    var strMonth = '0' + (month + 1).toString();
                }
                else {
                    var strMonth = (month + 1).toString();
                }
                if (day < 10) {
                    var strDay = '0' + day.toString();
                }
                else {
                    var strDay = day.toString();
                }
                //id설정 end

                var cell = document.createElement('td');
                cell.setAttribute('id', strYear + "-" + strMonth + "-" + strDay); //id 속성 추가 
                cell.addEventListener('click', selectDate); // 날짜 선택 이벤트 등록
                cell.textContent = day; // 일자 텍스트 설정

                // 오늘 이전의 날짜는 선택할 수 없도록 처리
                var selectedDateTime = new Date(year, month, day);
                selectedDateTime.setHours(0, 0, 0, 0);
                if (selectedDateTime < currentDate) {
                    cell.classList.add('disabled');
                }

                // 좌우로 붙어있는 날짜만 선택 가능하도록 처리
                if (
                    (day === 1 || day === totalDays) ||
                    (day > 1 && day < totalDays && (
                        selectedDateTime > currentDate ||
                        selectedDateTime < currentDate && (
                            selectedDateTime.setDate(selectedDateTime.getDate() + 1) <= currentDate ||
                            selectedDateTime.setDate(selectedDateTime.getDate() - 1) <= currentDate
                        )
                    ))
                ) {
                    row.appendChild(cell);
                } else {
                    cell.classList.add('disabled');
                    row.appendChild(cell);
                }

                if ((startDayOfWeek + day - 1) % 7 === 6 || day === totalDays) {
                    calendarBody.appendChild(row);
                    row = document.createElement('tr');
                }
            }

        }

        function getMonthName(month) {
            var monthNames = [
                '1월',
                '2월',
                '3월',
                '4월',
                '5월',
                '6월',
                '7월',
                '8월',
                '9월',
                '10월',
                '11월',
                '12월'
            ];
            return monthNames[month];
        }

        var selectedDates = []; //  날짜를 저장할 배열

        function selectDate(event) {
            var selectedCell = event.target;
            var selectedDate = selectedCell.textContent;

            // 선택할 수 없는 날짜는 처리 중단
            if (selectedCell.classList.contains('disabled')) {
                return;
            }

            // 이미 선택된 날짜인 경우 선택 해제
            if (selectedCell.classList.contains('selected')) {
                selectedCell.classList.remove('selected');
                return;
            }

            // 이미 선택된 날짜가 있는지 확인
            var selectedCells = document.querySelectorAll('.calendar-table td.selected');
            if (selectedCells.length === 2) {
                // 이미 2개의 날짜가 선택된 경우, 선택 해제 후 클릭한 날짜 선택
                selectedCells.forEach(function (cell) {
                    cell.classList.remove('selected');
                });
                selectedCell.classList.add('selected');
            }
            // else if (selectedCells.length > 0) {
            //     // 1개의 날짜가 선택된 경우, 클릭한 날짜와의 좌우 연속성 확인
            //     var previousCell = selectedCells[0];
            //     var previousDate = parseInt(previousCell.textContent);

            //     if (Math.abs(previousDate - selectedDate) === 1) {
            //         // 클릭한 날짜와 이전 선택한 날짜가 좌우로 연속적인 경우 선택
            //         selectedCell.classList.add('selected');
            //     }
            // } 
            else {
                // 2개의 날짜가 선택되지 않은 경우, 클릭한 날짜 선택
                selectedCell.classList.add('selected');
            }

            var previousCell = selectedCells[0];
            var previousDate = parseInt(previousCell.textContent);

            var startDate = previousCell.getAttribute("id");
            var lastDate = selectedCell.getAttribute("id");

            var middleDate = [];
            middleDate = getDatesStartToLast(startDate, lastDate);

            setClassList(middleDate);
        }

        function setClassList(arr) {
            for (var i = 0; i < arr.length - 1; i++) {
                document.getElementById(arr[i]).classList.add('selected');
            }
        }

        function getDatesStartToLast(startDate, lastDate) {
            var regex = RegExp(/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);
            if (!(regex.test(startDate) && regex.test(lastDate))) return "Not Date Format";
            var result = [];
            var curDate = new Date(startDate);
            while (curDate <= new Date(lastDate)) {
                result.push(curDate.toISOString().split("T")[0]);
                curDate.setDate(curDate.getDate() + 1);
            }
            return result;
        }

        function resetCalendar() {
            // 선택된 날짜들을 선택해제하는 로직 작성
            var selectedDates = document.querySelectorAll('.selected');
            selectedDates.forEach(function (date) {
                date.classList.remove('selected');
            });
        }

        /* 추가된 스크립트: 컨테이너에 버튼과 텍스트 요소 추가 */
        window.addEventListener('DOMContentLoaded', function () {
            var container = document.querySelector('.container');

            // 날짜 선택 텍스트 추가
            var dateSelect = document.createElement('div');
            dateSelect.classList.add('date-select');
            dateSelect.textContent = '날짜 선택';
            container.appendChild(dateSelect);

            // 초기화 버튼 추가
            var resetButton = document.createElement('div');
            resetButton.classList.add('reset-button');
            resetButton.textContent = '초기화';
            resetButton.addEventListener('click', resetCalendar);
            container.appendChild(resetButton);

            setTimeout(function () {
                container.classList.add('active');
            }, 1000);
        });

        function init() {
            var currentDate = new Date();
            year = currentDate.getFullYear();
            month = currentDate.getMonth();
            var previousCalendarCount = document.querySelectorAll('.calendar-table').length;

            generateCalendar();

            var currentCalendarCount = document.querySelectorAll('.calendar-table').length;
            var changeCount = currentCalendarCount - previousCalendarCount;

            if (changeCount > 0) {
                console.log('새로운 달력이 추가되었습니다. 위치: ' + (previousCalendarCount + 1) + '부터 ' + currentCalendarCount + '까지');
            } else if (changeCount < 0) {
                console.log('달력이 변경되었습니다. 위치: ' + previousCalendarCount);
            } else {
                console.log('변경된 부분이 없습니다.');
            }
        }
    </script>
</head>

<body onload="init()" style="background-color: #f2f2f2;">
	<div class="container container-close">
		<div class="detail2-main">
			<div class="calendar-container">
				<!-- 달력 내용 -->
			</div>
		</div>
		<div class="button-container">
			<button>버튼</button>
		</div>
	</div>
</body>

</html>