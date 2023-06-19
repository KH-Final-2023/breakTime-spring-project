<%@page import="com.kh.breaktime.decide.model.vo.Decide"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kh.breaktime.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   Member loginUser = (Member) session.getAttribute("loginUser");
%>
<c:set var="m" value="${map}"/>
<c:set var="room" value="${roomList}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실 선택</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/decide/room.css">
<script>
var globalCheckIn;
var globalCheckOut;

$(document).ready(function() {
	
   var currentUrl = window.location.href;
   var previousUrl = document.referrer;
   
   var dateIn = "${param.dateIn}";
   var dateOut = "${param.dateOut}";

   
   
   // dateIn과 dateOut 값이 있는지 확인
   if (dateIn  && dateOut ) {
	 
   	 if( dateIn === "null" && dateOut === "null" ){
   		var today = new Date();
   		var year = today.getFullYear();
   		var month = String(today.getMonth() + 1).padStart(2, '0');
   		var day = String(today.getDate()).padStart(2, '0');

   		var currentDate = year + '-' + month + '-' + day;
   		
   		dateIn = currentDate;
   		dateOut = currentDate;
   	 }
     // adjustedDateOut 값을 계산
     var adjustedDateOut = adjustDateAndFormat(dateIn, dateOut);
     
     var startDayofWeek = getDayOfWeek(dateIn);
     var endDayofWeek = getDayOfWeek(adjustedDateOut);
     var nights = calculateStayDuration(dateIn, adjustedDateOut);
     
     globalCheckIn = removeHyphens(dateIn);
     globalCheckOut = removeHyphens(adjustedDateOut);
     $(".button").text(dateIn + '(' + startDayofWeek + ') ~ ' + adjustedDateOut + '(' + endDayofWeek +') · ' + nights + '박');
   } else {
     console.log('dateIn or dateOut is missing');
   }

   
   $(".button").click(
         function(e) {
            e.preventDefault();

            var overlay = $("<div>").addClass("overlay");
            var datePicker = $("<iframe>").attr("src",
                  "${contextPath}/decide/dedate");
            var closeBtn = $("<i>").addClass(
                  "fas fa-times close-btn").css({
               "animation-name" : "reverse-animation",
               "animation-duration" : "0.1s",
               "animation-timing-function" : "ease-in-out"
            });

            overlay.append(datePicker, closeBtn);
            $(".container").prepend(overlay);

            setTimeout(function() {
               overlay.addClass("open");
            }, 300);

            closeBtn.click(function() {
               overlay.removeClass("open");

               setTimeout(function() {
                  overlay.remove();
               }, 300);
            });
         });

   $(".close-btn").click(function(e) {
      e.preventDefault();

      if (previousUrl) {
         window.location.href = previousUrl;
      } else {
         window.location.href = currentUrl;
      }
   });
   
   // 장바구니 이동
   <c:forEach items="${roomList}" var="d" varStatus="status">
   var buttonId = `button-card1-${status.index + 1}`;
   $("#" + buttonId).click(function(e) {
     e.preventDefault();
     
     if (null == globalCheckIn || null == globalCheckOut){
        alert("날짜를 선택해주세요.");
        return;
     }
     AjaxinsertCart(${d.roomNo}, ${d.buNo});

     var isConfirm = confirm("장바구니로 이동합니다.");
     if (isConfirm) {
       window.location.href = "${contextPath}/decide/debasket";
     }
   });
   </c:forEach>
   
   // 객실 선택하기 이동
   <c:forEach items="${roomList}" var="d" varStatus="status">
      var buttonId = `button-card2-${status.index + 1}`;
      $("#" + buttonId).click(function(e) {
        e.preventDefault();
        
        if (null == globalCheckIn || null == globalCheckOut){
           alert("날짜를 선택해주세요.");
           return;
        }
        AjaxinsertCart_Pay(${d.roomNo}, ${d.buNo});

        var isConfirm = confirm("결재페이지로 이동합니다.");
        if (isConfirm) {
           window.location.href = "${contextPath}/decide/pay?roomNo=" + ${d.roomNo};
        }
      });
   </c:forEach>
 
});

function adjustDateAndFormat(dateIn, dateOut) {
   if (dateIn === dateOut) {
      var adjustedDate = formatDate(addDays(parseDateString(dateOut), 1));
      return adjustedDate;
   }
   
   return dateOut;
}

function parseDateString(dateString) {
   var parts = dateString.split("-");
   var year = parseInt(parts[0]);
   var month = parseInt(parts[1]) - 1; // JavaScript에서 월은 0부터 시작하므로 1을 뺍니다.
   var day = parseInt(parts[2]);
   
   return new Date(year, month, day);
}

function formatDate(date) {
   var year = date.getFullYear();
   var month = String(date.getMonth() + 1).padStart(2, '0');
   var day = String(date.getDate()).padStart(2, '0');
   
   return year + "-" + month + "-" + day;
}

function addDays(date, days) {
   var result = new Date(date);
   result.setDate(result.getDate() + days);
   return result;
}


// 객실 선택하기
function AjaxinsertCart_Pay(roomNo, buNo) {
    var requestData = {
       roomNo: roomNo,
       buNo: buNo,
       checkIn: globalCheckIn,
       checkOut: globalCheckOut
    };
    
    console.log(requestData);
 
 var url = "${contextPath}/decide/insertCart";
 $.ajax({
    url: url,
    type: 'POST',
    contentType: 'application/json',
    data: JSON.stringify(requestData),
    success: function(response){
     console.log(response);
    },
    error: function(error){
       console.log(error);
       alert("동일한 날짜의 체크인/체크아웃 상품이 이미 담겼습니다.");
    }
 });
}

// 장바구니 담기
function AjaxinsertCart(roomNo, buNo) {
      var requestData = {
         roomNo: roomNo,
         buNo: buNo,
         checkIn: globalCheckIn,
         checkOut: globalCheckOut
      };
      
      console.log(requestData);
   
   var url = "${contextPath}/decide/insertCart";
   $.ajax({
      url: url,
      type: 'POST',
      contentType: 'application/json',
      data: JSON.stringify(requestData),
      success: function(response){
       if ( '1' == response){
          alert("장바구니에 상품이 담겼습니다.");       
       }else {
          console.log("0");
          alert("동일한 날짜의 체크인/체크아웃 상품이 이미 담겼습니다.");
       }
       
      },
      error: function(error){
         console.log(error);
         alert("동일한 날짜의 체크인/체크아웃 상품이 이미 담겼습니다.");
      }
   });
}

window.addEventListener('message', function(event) {
   if (event.data.type === 'selectedDates') {
      var startDt = event.data.startDt;
      var endDt = event.data.endDt;
      var startDayofWeek = event.data.startDayofWeek;
      var endDayofWeek = event.data.endDayofWeek;
      var night = event.data.night;

      // selectDateData 함수를 호출하여 시작 날짜와 끝 날짜를 전달합니다.
      selectDateData(startDt, endDt, startDayofWeek, endDayofWeek, night);
      
      // .close-btn 요소를 클릭하는 것처럼 트리거 합니다.
      $(".close-btn").click();
   }
});


function selectDateData(startDt, endDt, startDayofWeek, endDayofWeek, night){
   globalCheckIn = removeHyphens(startDt);
   globalCheckOut = removeHyphens(endDt);
   $(".button").text(startDt + '(' + startDayofWeek + ') ~ ' + endDt + '(' + endDayofWeek +') · ' + night + '박');
}

function removeHyphens(dateString) {
   return dateString.replace(/-/g, '');
}

function getDayOfWeek(inputDt) {
    var daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];
    
    var inputDateObj = new Date(inputDt);

    var inputDayOfWeek = daysOfWeek[inputDateObj.getDay()];

    var result = inputDayOfWeek
    
    return result;
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
</script>

</head>

<body>
   <div class="container">
      <div class="detail2-all">
         <div class="button-container">
            <a href="${contextPath}/decide/dedate" class="button" id="selectDateBtn">&#128197; Check-in 또는 Check-out 날짜가 없습니다.</a>
         </div>
         <div class="detail2-main">
            <c:forEach items="${roomList}" var="d" varStatus="status">
               <div class="detail2-card">
                  <div class="image">
                     <img src="${contextPath}/${d.filePath}/${d.originName}" alt="숙소 이미지">
                  </div>
                  <h2 class="title">${d.roomName}</h2>
                  <p class="description">${d.roomInfo}</p>
                  <p class="price">${d.roomPrice}</p>
                  <hidden type="input" id="roomNo" value="${d.roomNo}"></hidden>
                  <hidden type="input" id="buNo" value="${d.buNo}"></hidden>

                  <c:if test="${empty roomList}">
                     <div class="button-card" disabled>
                        <a href="#" class="button-card1">장바구니
                           담기</a> <a href="#" class="button-card2">객실 선택하기</a>
                     </div>
                  </c:if>
                  
                  <c:if test="${!empty roomList}">
                  <%if (loginUser == null) {%>
                     <div class="button-card">
                        <a href="${contextPath}/member/login" class="button-card3">장바구니 담기</a> 
                        <a href="${contextPath}/member/login" class="button-card2">객실 선택하기</a>
                     </div>
                     <% } else { %>
                     <div class="button-card">
                     <a href="#" class="button-card1" id="button-card1-${status.index + 1}">장바구니 담기</a> 
                     <a href="#" class="button-card2" id="button-card2-${status.index + 1}">객실 선택하기</a>
                     </div>
                     <% } %>
                  </c:if>
               </div>
            </c:forEach>
         </div>
      </div>
   </div>
</body>
</html>