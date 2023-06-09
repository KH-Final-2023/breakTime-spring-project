<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.breaktime.decide.model.vo.Decide"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page import="com.kh.breaktime.member.model.vo.Member"%>
<%@ page import="com.kh.breaktime.booking.model.vo.Booking"%>
<%@ page import="com.kh.breaktime.room.model.vo.Room"%>
<%
   Member loginUser = (Member) session.getAttribute("loginUser");

	Map<String, List<Decide>> map = (Map<String, List<Decide>>) request.getAttribute("map");
	
	Map<String, List<Object>> requestData = new HashMap<>();
	   List<Object> roomDataList = new ArrayList<>();

	   for (int i = 0; i < map.size(); i++) {
	      List<Decide> roomList = map.get("roomList" + i);
	      
	      for (Decide roomInfo : roomList) {
	         int roomNo = roomInfo.getRoomNo();
	         String roomName = roomInfo.getRoomName();
	         String roomCheckin = roomInfo.getCartCheckIn();
	         String roomCheckout = roomInfo.getCartCheckOut();
	         int roomHCount = roomInfo.getRoomHCount();
	         
	         // 필요한 값들을 변수에 저장하고 리스트에 추가
	         List<Object> roomDataItem = new ArrayList<>();
	         roomDataItem.add(roomNo);
	         roomDataItem.add(roomName);
	         roomDataItem.add(roomCheckin);
	         roomDataItem.add(roomCheckout);
	         roomDataItem.add(roomHCount);	         
	         roomDataList.add(roomDataItem);
	      }
	   }

	   requestData.put("roomData", roomDataList);
	   // requestData에 필요한 다른 데이터도 추가할 수 있음

	   String encodedData = URLEncoder.encode(new Gson().toJson(requestData), "UTF-8");

%>
<c:set var="m" value="${map}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css"> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js" charset="UTF-8"></script> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/pay/pay.css">
<title>결제</title>

</head>

<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
    <div class="container-main">
        <h2 class="reservation-title">예약</h2>
        <div class="order-details">
        <c:forEach items="${map}" var="entry">
            <c:forEach items="${entry.value}" var="room">
            <div class="item-list">
                <div class="company-title">
                    <h2 class="buTitle">${room.buTitle }</h2>
                </div>
                <div class="room-info">
                    <p class="roomName">${room.roomName}</p>
                    <p class="roomHCount">최대 ${room.roomHCount } 명</p>
                </div>
                <div class="check-in-out">
                    <div class="check-in">
                        <span class="label">체크인</span><br>
                        <span class="date">${room.cartCheckIn}</span>
                    </div>
                    <div class="check-out">
                        <span class="label">체크아웃</span><br>
                        <span class="date">${room.cartCheckOut}</span>
                    </div>
                </div>
            </div>
             <div class="total">
                <span class="amount"></span><span style="font-size: 25px; font-weight: bold;">${room.roomPrice} 원</span>
            </div> 
            </c:forEach>
        </c:forEach>
            
        </div>
    </div>

       <div class="reservation-info">
           <h3 style="margin-bottom: 15px;">예약자 정보</h3>
           <div class="form-group">
               <label for="customer-name">성명</label>
               <span id="customer-name"><%= loginUser.getUserName()%></span>
           </div>
       </div>
       
     <div class="payment-amount-section" style="max-width: 768px; margin: 10px auto; background-color: #fff; padding: 20px;">

        <h3 style="margin-bottom: 15px;">결제 금액</h3>
        <div class="payment-details">
            <span style="font-size: 20px;">상품금액</span>
            <span class="total-payment-amount" id="product-amount" style="font-size: 25px; font-weight: bold;"></span>
        </div>
      
        <div class="dotted-line"></div>

        <div class="payment-details">
          <span style="font-size: 20px;"><h3>총 결제 금액</h3></span>
          <span class="total-payment-amount" id="total-payment-amount"></span>
      </div>
    </div>
   
    <div class="pay-section">
        <div class="on-site-payment-section">
            <div class="on-site-payment-header">
                <img class="on-site-payment-image" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiI+PHBhdGggZD0iTTguNjY3IDcuMzMzdjRINy4zMzN2LTRoMS4zMzR6bTAtMi42NjZWNkg3LjMzM1Y0LjY2N2gxLjMzNHpNOCAxLjMzM0E2LjY3IDYuNjcgMCAwMDEuMzMzIDggNi42NyA2LjY3IDAgMDA4IDE0LjY2NyA2LjY3IDYuNjcgMCAwMDE0LjY2NyA4IDYuNjcgNi42NyAwIDAwOCAxLjMzM3oiIGZpbGw9IiNFNjcwMDAiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjwvc3ZnPg==">
                <div class="on-site-payment-title">
                    <h4>현장결제</h4>
                </div>
            </div>
            <div class="on-site-payment-text">
                추가인원 비용등의 현장결제 발생 상품을 확인하세요.
            </div>

            <div class="on-site-payment-header">
                <img class="on-site-payment-image" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiI+PHBhdGggZD0iTTguNjY3IDcuMzMzdjRINy4zMzN2LTRoMS4zMzR6bTAtMi42NjZWNkg3LjMzM1Y0LjY2N2gxLjMzNHpNOCAxLjMzM0E2LjY3IDYuNjcgMCAwMDEuMzMzIDggNi42NyA2LjY3IDAgMDA4IDE0LjY2NyA2LjY3IDYuNjcgMCAwMDE0LjY2NyA4IDYuNjcgNi42NyAwIDAwOCAxLjMzM3oiIGZpbGw9IiNFNjcwMDAiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjwvc3ZnPg==">
                <div class="on-site-payment-title">
                    <h4>취소불가 및 수수료</h4>
                </div>
            </div>
            <div class="on-site-payment-text">
                취소 및 환불규정에 따라 취소불가, 수수료가 발생 할 수 있습니다.
            </div>

            <div class="on-site-payment-header">
                <img class="on-site-payment-image" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiI+PHBhdGggZD0iTTguNjY3IDcuMzMzdjRINy4zMzN2LTRoMS4zMzR6bTAtMi42NjZWNkg3LjMzM1Y0LjY2N2gxLjMzNHpNOCAxLjMzM0E2LjY3IDYuNjcgMCAwMDEuMzMzIDggNi42NyA2LjY3IDAgMDA4IDE0LjY2NyA2LjY3IDYuNjcgMCAwMDE0LjY2NyA4IDYuNjcgNi42NyAwIDAwOCAxLjMzM3oiIGZpbGw9IiNFNjcwMDAiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjwvc3ZnPg==">
                <div class="on-site-payment-title">
                    <h4>미성년자 및 법정대리인 필수</h4>
                </div>
            </div>
            <div class="on-site-payment-text">
                미성년자는 법정대리인 동행 없이 투숙이 불가능합니다.
            </div>
        </div>
        <div class="terms-and-conditions">
            <div class="accept-all">
                <input type="checkbox" id="accept-all" class="checkbox-hidden" onclick="toggleAllCheckboxes()">
                <label for="accept-all" class="checkbox-label"></label>
                <h2 style="margin-left: 10px;">필수 약관 전체 동의</h2>
            </div>
            <div class="individual-terms" style="margin-left: 0; margin-top: 30px;">
                <input type="checkbox" id="accept-age" class="checkbox-hidden accept-age" onclick="updateAcceptAllCheckbox()">
                <label for="accept-age" class="checkbox-label accept-age"></label>
                <label for="accept-age">[필수] 만 14세 이상 이용 동의</label>
            </div>
            <div class="individual-terms" style="margin-left: 0; margin-top: 30px;">
                <input type="checkbox" id="accept-info-collection" class="checkbox-hidden accept-age" onclick="updateAcceptAllCheckbox()">
                <label for="accept-info-collection" class="checkbox-label accept-age"></label>
                <label for="accept-info-collection">[필수] 개인정보 수집 및 이용</label>
            </div>
            <div class="individual-terms" style="margin-left: 0; margin-top: 30px;">
                <input type="checkbox" id="accept-info-third-party" class="checkbox-hidden accept-age" onclick="updateAcceptAllCheckbox()">
                <label for="accept-info-third-party" class="checkbox-label accept-age"></label>
                <label for="accept-info-third-party">[필수] 개인정보 제 3자 제공</label>
            </div>
        </div>
     <button class="pay-button" id="pay-button" onclick="paymentsBtn_click()">
        <span class="total-payment-amount" id="payment-amount-on-button"></span>
        결제하기
     </button>
    </div>
<script>
       // 체크박스 상태에 따라 버튼 배경색 변경
       function updatePayButton() {
            var checkboxes = document.querySelectorAll('.accept-age');
            var payButton = document.getElementById('pay-button');
            var allChecked = true;

            for (var i = 0; i < checkboxes.length; i++) {
                if (!checkboxes[i].checked) {
                    allChecked = false;
                    break;
                }
            }

            if (allChecked) {
                payButton.classList.add('checked');
            } else {
                payButton.classList.remove('checked');
            }
        }

        function updateAcceptAllCheckbox() {
            var checkboxes = document.querySelectorAll('.accept-age');
            var acceptAllCheckbox = document.getElementById('accept-all');

            var allChecked = true;

            for (var i = 0; i < checkboxes.length; i++) {
                if (!checkboxes[i].checked) {
                    allChecked = false;
                    break;
                }
            }

            acceptAllCheckbox.checked = allChecked;

            updatePayButton();
        }

        function toggleAllCheckboxes() {
            var checkboxes = document.querySelectorAll('.accept-age');
            var acceptAllCheckbox = document.getElementById('accept-all');

            for (var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].checked = acceptAllCheckbox.checked;
            }

            updatePayButton();
        }

        // 첫 번째 로드 시에도 체크 여부를 확인하여 필수 약관 전체 동의 체크박스 업데이트
        document.addEventListener('DOMContentLoaded', function() {
            updateAcceptAllCheckbox();

            var checkboxes = document.querySelectorAll('.accept-age');
            var acceptAllCheckbox = document.getElementById('accept-all');

            checkboxes.forEach(function(checkbox) {
                checkbox.addEventListener('change', function() {
                    updateAcceptAllCheckbox();
                });
            });

            acceptAllCheckbox.addEventListener('change', function() {
                toggleAllCheckboxes();
            });
        });
        
        // 상품 금액
        var totalProductAmount = 0;
        var productAmountElement = document.getElementById('product-amount');
        
        <c:forEach items="${map}" var="entry">
           <c:forEach items="${entry.value}" var="room">
           totalProductAmount += parseInt("${room.roomPrice.replaceAll(',', '')}");
           </c:forEach>
       </c:forEach>
        
        // 총 결제 금액
        var totalPaymentAmount = 0;
        var totalPaymentElement = document.getElementById('total-payment-amount');

        <c:forEach items="${map}" var="entry">
            <c:forEach items="${entry.value}" var="room">
                totalPaymentAmount += parseInt("${room.roomPrice.replaceAll(',', '')}");
            </c:forEach>
        </c:forEach>
        
        // 결제하기 버튼
        var paymentAmountOnButton = document.getElementById('payment-amount-on-button');
        
        // 상품 금액
        productAmountElement.innerText = new Intl.NumberFormat('ko-KR').format(totalProductAmount) + ' 원';
        // 총 결제 금액
        totalPaymentElement.innerText = new Intl.NumberFormat('ko-KR').format(totalPaymentAmount) + ' 원';
        // 결제하기 버튼
        paymentAmountOnButton.innerText = new Intl.NumberFormat('ko-KR').format(totalPaymentAmount) + ' 원';
        paymentAmountOnButton.style.color = 'white';
    </script>
    
 <script src="https://js.tosspayments.com/v1/payment-widget"></script>
    
    <script>
    function paymentsBtn_click() {

    	const clientKey = 'test_ck_aBX7zk2yd8yed6OBR9Q8x9POLqKQ' // 테스트용 클라이언트 키
    	const customerKey = 'lwPDAudM9-GcGY7CP0DO0' // 고객을 식별할 수 있는 키

    	// 2. 결제위젯 SDK 초기화
    	const paymentWidget = PaymentWidget(clientKey, customerKey) // 회원 결제
    	
        const url = 'http://localhost:8081/breaktime/booking/insertBooking?requestData=<%= encodedData %>';
        
    	paymentWidget.renderPaymentMethods('#pay-button', 
		  { value: 1, currency: 'KRW', country: 'KR' }, 
		  { variantKey: 'widgetA' });
    		    
		 paymentWidget.requestPayment({
		  orderId: 'AD8aZDpbzXs4EQa-UkIX6',
		  orderName: 'breakTime 예약',
		  successUrl: url,
    	  failUrl: 'http://localhost:8081/fail',
		  customerEmail: 'customer123@gmail.com',
		  customerName: 'breakTime'
	})
    }
</script>
</body>
</html>