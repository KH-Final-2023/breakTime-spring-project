<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캘린더 페이지</title>
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
        @keyframes pageAnimation {
            0% {
                transform: translate3d(0px, 100%, 0px);
                opacity: 0;
            }

            100% {
                transform: translate3d(0px, 0px, 0px);
                opacity: 1;
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

        .calendar-table th,
        .calendar-table td {
            border: none;
        }

        .calendar-table td {
            padding: 5px;
            text-align: center;
        }

        /* 토요일 색상 변경 */
        .calendar-table td:nth-child(7),
        .calendar-table th:nth-child(7) {
            color: #0000ff86;
        }

        /* 일요일 색상 변경 */
        .calendar-table td:nth-child(1),
        .calendar-table th:nth-child(1) {
            color: rgb(46, 204, 113);
        }

        .calendar-table th:nth-child(1),
        .calendar-table th:nth-child(2),
        .calendar-table th:nth-child(3),
        .calendar-table th:nth-child(4),
        .calendar-table th:nth-child(5),
        .calendar-table th:nth-child(6),
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

            // 이미 선택된 날짜가 있는지 확인
            var selectedCells = document.querySelectorAll('.calendar-table td.selected, .calendar-table td.selected-light');

            if (selectedCells.length >= 2) {
                // 이미 2개의 날짜가 선택된 경우, 선택 해제 후 클릭한 날짜 선택
                selectedCells.forEach(function (cell) {
                    cell.classList.remove('selected');
                    cell.classList.remove('selected-light');
                });

                // 클릭한 날짜도 선택 해제
                if (selectedCell.classList.contains('selected')) {
                    selectedCell.classList.remove('selected');
                    
                }
                
                // searchBtn 초기화
                document.getElementById('searchBtn').innerHTML = "";
                return;
            }

            // if (selectedCells.length === 1 && selectedCells[0] === selectedCell) {
            //     selectedCell.classList.toggle('selected');
                
            //     // 모든 날짜를 다시 활성화합니다.
            //     enableAllDates();
            //     return;
            // }

            // 그 외의 경우, 클릭한 날짜 선택
            selectedCell.classList.add('selected');

            // 선택된 날짜가 하나일 경우, 범위 밖의 모든 날짜를 비활성화합니다.
            if (selectedCells.length === 0) {
                var selectedDateId = selectedCell.getAttribute("id");
                var startDate = new Date(selectedDateId);
                var lastDate = new Date(selectedDateId);
                lastDate.setDate(startDate.getDate() + 9);  
                disableDatesOutsideRange(startDate.toISOString().split("T")[0], lastDate.toISOString().split("T")[0]);

                var formatDt = formatDate(startDate);
                var startDayOfWeek = getDayOfWeek(startDate);
                document.getElementById('searchBtn').innerHTML = formatDt + "(" + startDayOfWeek + ") ~"
            } 
             else if (selectedCells.length === 1 && selectedCells[0] === selectedCell) {
            selectedCell.classList.toggle('selected');

            // 모든 날짜를 다시 활성화합니다.
            enableAllDates();
            document.getElementById('searchBtn').innerHTML = "";
            } 
            else {
                var previousCell = selectedCells[0];
                var startDate = previousCell.getAttribute("id");
                var lastDate = selectedCell.getAttribute("id");
                var middleDate = [];
                middleDate = getDatesStartToLast(startDate, lastDate);
                setClassList(middleDate);

                var startDayOfWeek = getDayOfWeek(startDate);
                var lastDayOfWeek = getDayOfWeek(lastDate);
                var night = calculateStayDuration(startDate, lastDate);
                document.getElementById('searchBtn').innerHTML = startDate + "(" + startDayOfWeek + ") ~ "+ lastDate + "(" + lastDayOfWeek + ") · " + night + "박";
            }
        }

        function formatDate(date) {
            var year = date.getFullYear();
            
            var month = ("0" + (date.getMonth() + 1)).slice(-2);
            var day = ("0" + date.getDate()).slice(-2);
            
            return year + "-" + month + "-" + day;
        }

        function calculateStayDuration(startDate, lastDate) {
            var startDateObj = new Date(startDate);
            var lastDateObj = new Date(lastDate);

            // 시간 차이를 밀리초로 계산
            var diff = lastDateObj - startDateObj;

            // 밀리초를 일로 변환 (1일 = 24시간 = 24 * 60 * 60 * 1000 밀리초)
            var diffDays = diff / (24 * 60 * 60 * 1000);
            
            var nights = diffDays;

            return nights;
        }

        function getDayOfWeek(inputDt) {
            var daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];
            
            var inputDateObj = new Date(inputDt);

            var inputDayOfWeek = daysOfWeek[inputDateObj.getDay()];

            var result = inputDayOfWeek
            
            return result;
        }

        //오늘 이전의 날짜 비활성화 조건 추가하여 날짜 활성화 
        function enableAllDates() {
            var allDates = document.querySelectorAll('.calendar-table td');
            var today = new Date();
            today.setHours(0, 0, 0, 0); // 오늘 날짜에서 시간, 분, 초, 밀리초를 제거

            allDates.forEach(function(dateCell) {
                var currentDate = new Date(dateCell.getAttribute('id'));
                
                if (currentDate < today) {
                    // 현재 날짜가 오늘 날짜보다 이전이면 비활성화
                    dateCell.classList.add('disabled');
                } else {
                    // 그렇지 않으면 활성화
                    dateCell.classList.remove('disabled');
                }
            });
        }

        function disableDatesOutsideRange(startDate, lastDate) {
            // 이 메서드는 startDate와 lastDate 사이의 날짜를 제외하고 모든 날짜를 비활성화
            var allDates = document.querySelectorAll('.calendar-table td'); // 모든 날짜 선택

            var startDate = new Date(startDate);
            var lastDate = new Date(lastDate);

            for (var i = 0; i < allDates.length; i++) {
                var currentDate = new Date(allDates[i].getAttribute('id'));

                if (currentDate < startDate || currentDate > lastDate) {
                    // 현재 날짜가 범위 밖에 있으면 비활성화
                    allDates[i].classList.add('disabled');
                }
            }
        }
        
        function setClassList(arr) {
            // for (var i = 0; i < arr.length - 1; i++) {
            //     document.getElementById(arr[i]).classList.add('selected');
            // }
            if (arr.length > 0) {
                document.getElementById(arr[0]).classList.add('selected');
                document.getElementById(arr[arr.length - 1]).classList.add('selected');
                
                for (var i = 1; i < arr.length - 1; i++) {
                document.getElementById(arr[i]).classList.add('selected-light');
                }
            }
            enableAllDates();
        }

        function getDatesStartToLast(startDate, lastDate) {
            var regex = RegExp(/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);
            if (!(regex.test(startDate) && regex.test(lastDate))) return "Not Date Format";
            var result = [];
            var curDate = new Date(startDate);
            if(curDate <= new Date(lastDate)){
              while (curDate <= new Date(lastDate)) {
                result.push(curDate.toISOString().split("T")[0]);
                curDate.setDate(curDate.getDate() + 1);
                } 
            }
            else {
                while(curDate >= new Date(lastDate)){
                result.push(curDate.toISOString().split("T")[0]);
                curDate.setDate(curDate.getDate() - 1);
                }
            }
            return result;
        }

        function resetCalendar() {
            // 선택된 날짜들을 선택해제하는 로직 작성
            var selectedDates = document.querySelectorAll('.selected, .selected-light');
            selectedDates.forEach(function (date) {
                date.classList.remove('selected');
                date.classList.remove('selected-light');
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
            <button id="searchBtn"></button>
        </div>
    </div>
</body>

</html>