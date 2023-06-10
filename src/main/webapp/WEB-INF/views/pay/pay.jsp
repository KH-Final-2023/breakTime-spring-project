<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page import="com.kh.breaktime.member.model.vo.Member"%>
<%@ page import="com.kh.breaktime.booking.model.vo.Booking"%>
<%@ page import="com.kh.breaktime.room.model.vo.Room"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/breaktime/resources/css/header.css">
<link rel="stylesheet" href="/breaktime/resources/css/base.css">
<link rel="stylesheet" href="/breaktime/resources/css/font.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js" charset="UTF-8"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>Insert title here</title>
</head>
    <style>
        @charset "UTF-8";

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            font-size: 14px;
            line-height: 1.4;
            color: #333;
            background-color: #f2f2f2;
        }

        .container-main {
            max-width: 768px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
        }

        .reservation-title {
            text-align: center;
            border-bottom: 1px solid #e6e6e6;
            margin-top: -10px;
            /* 이 부분을 추가 */
        }

        .company-title h4 {
            margin-bottom: 10px;
        }

        .room-info p {
            margin-bottom: 20px;
        }

        .check-in-out p {
            margin-bottom: 5px;
        }

        .check-in-out {
            display: flex;
            justify-content: flex-start;
            /* 이 부분을 변경 */
        }

        .check-in-out .label {
            font-size: 12px;
            color: #919191;
        }

        .check-in-out .date {
            font-size: 15px;
        }

        .check-in {
            margin-right: 270px;
            /* 이 부분을 추가하여 체크인과 체크아웃 사이의 간격을 조절 */
        }

        .item-list {
            margin-top: 20px;
            /* 이 부분을 추가 */
        }

        .total {
            text-align: right;
            margin-top: 20px;
            /* 위쪽 여백 추가 */
        }

        .total .amount {
            font-weight: bold;
            /* 금액 부분을 볼드체로 */
            font-size: 18px;
        }

        .reservation-info {
            max-width: 768px;
            margin: 10px auto;
            background-color: #fff;
            padding: 20px;
        }

        .reservation-info #customer-name {
            color: #333;
            border-bottom: 1px solid #cccccc;
            font-size: 17px;
            padding-bottom: 7px;
            display: block;
        }

        .form-group {
            margin-bottom: 10px;
        }

        .form-group label {
            display: block;
            font-size: 12px;
            color: #919191;
            margin-bottom: 12px;
        }

        .form-group input {
            width: 100%;
            padding: 8px;
            border: 1px solid #999;
            border-radius: 3px;
        }

        .payment-details {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .dotted-line {
            border-bottom: 2px dashed #e6e6e6;;
            margin: 25px 0;
        }

        .total-payment-amount {
            color: green;
            font-size: 18px;
            font-weight: bold;
        }

        .pay-section{
            max-width: 768px;
            margin: 10px auto;
            background-color: #fff;
            padding: 20px;
        }

        .on-site-payment-section {
            max-width: 768px;
            background-color: #fef8f2;
            padding: 20px;
        }

        .on-site-payment-header {
            display: flex;
            align-items: center;
        }

        .on-site-payment-image {
            width: 20px;
            height: 20px;
            margin-right: 8px;
        }

        .on-site-payment-title h4 {
            font-size: 12px;
            color: #E67000; 
        }

        .on-site-payment-text {
            font-size: 12px;
            margin-left: 28px; 
            margin-bottom: 10px;
        }

        .terms-and-conditions {
            margin-top: 20px;
        }

        .accept-all {
            display: flex;
            align-items: center;
        }

        .accept-all h2 {
            margin-left: 10px;
            font-size: 20px;
        }

        .individual-terms {
            display: flex;
            align-items: center;
            margin-left: 40px;
            margin-top: 10px;
        }

        /* 체크박스 스타일 숨기기 */
        .checkbox-hidden {
                    display: none;
                }

        /* 체크박스 라벨에 배경 이미지 적용 */
        .checkbox-label {
            display: inline-block;
            background-image: url('https://platform-site.yanolja.com/icons/checkbox-unselected.svg?inline');
            background-size: cover;
            width: 20px;
            height: 20px;
            cursor: pointer;
        }

        /* 체크된 상태일 때 라벨 배경 이미지 변경 */
        .checkbox-hidden:checked + .checkbox-label {
            background-image: url('https://platform-site.yanolja.com/icons/checkbox-selected.svg?inline');
            background-color: green; 
        }

        .checkbox-label.accept-age {
            background-image: url('https://platform-site.yanolja.com/icons/checkbox-blue-line-unselected.svg?inline');
        }

        .pay-button {
            width: 100%;
            padding: 10px;
            color: #fff;
            font-size: 18px;
            text-align: center;
            font-weight: bold;
            cursor: pointer;
            border: none;
            border-radius: 3px;
            margin-top: 20px;
            background-color: #cccccc;
        }

        .pay-button.checked {
            background-color: green;
        }

    </style>
</head>

<body>
    <div class="container-main">
        <h2 class="reservation-title">예약</h2>
        <div class="order-details">
        <c:forEach items="${roomList}" var="room">
            <div class="item-list">
                <div class="company-title">
                    <h2>업체명</h2>
                </div>
                <div class="room-info">
                    <p>${room.roomName}</p>
                </div>
                <div class="check-in-out">
                    <div class="check-in">
                        <span class="label">체크인</span><br>
                        <span class="date">${room.roomCheckin}</span>
                    </div>
                    <div class="check-out">
                        <span class="label">체크아웃</span><br>
                        <span class="date">${room.roomCheckout}</span>
                    </div>
                </div>
            </div>
            </c:forEach>
            
            <div class="total">
                <span class="amount">${room.roomPrice}</span><span style="font-size: 18px;">원</span>
            </div>
            
        </div>
    </div>
<c:forEach items="${roomList}" var="room">
    <div class="reservation-info">
        <h3 style="margin-bottom: 15px;">예약자 정보</h3>
        <div class="form-group">
            <label for="customer-name">성명</label>
            <span id="customer-name">홍길동</span>
        </div>
    </div>
</c:forEach>
     <div class="payment-amount-section" style="max-width: 768px; margin: 10px auto; background-color: #fff; padding: 20px;">

        <h3 style="margin-bottom: 15px;">결제 금액</h3>
        
        <div class="payment-details">
            <span style="font-size: 14px;">상품금액</span>
            <span style="font-size: 18px; font-weight: bold;">44,900원</span>
        </div>

        <div class="dotted-line"></div>

        <div class="payment-details">
            <span style="font-size: 14px;"><h3>총 결제 금액</h3></span>
            <span class="total-payment-amount">44,900원</span>
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

        <button class="pay-button" id="pay-button" onclick="requestPay()">49,800원 결제하기</button>
        
       
        
    </div>
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
    </script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
function requestPay() {
  IMP.init('imp49486608'); 
  IMP.request_pay({
    pg: "inicis",
    pay_method: "card",
    merchant_uid : 'merchant_'+new Date().getTime(),
    name : 'BreakTime 예약',
    /* amount : ${booking.price}, */
    amount : 100,
    buyer_email : '${email}',
    buyer_name : '${member.userName}',
    buyer_tel : '${member.tel}',
    buyer_postcode : '123-456',
  }, function (rsp) { // callback
      if (rsp.success) {
    	  $.ajax({
	        	type : "POST",
	        	url : "${pageContext.request.contextPath}/reservation/reservePro",
	        	contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        	header:{"Content-Type":"application/json"},
	    		dateType:'json',
	    		data:{bo_num:rsp.imp_uid, payment:rsp.pay_method},
	        }).done(function(data){
	        	location.href='${pageContext.request.contextPath}/reservation/reservationList'+data
	        })
      } else {
     	alert('결제 실패')
      }
  });
}
</script>


</body>

</html>