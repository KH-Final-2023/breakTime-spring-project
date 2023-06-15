<%@ page language="java" contentType="text/html; charset=UTF-8"
       pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<!-- Bootstrap JavaScript and jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/decide/basket.css">
<script>
$(document).ready(function() {
	
   $.fn.modal.Constructor.prototype._enforceFocus = function() {
   };

   // 전체 선택 체크박스 클릭 시 모든 체크박스 상태 변경
   $("#select-all").change(
        function() {
           var isChecked = this.checked;
           $(".item-checkbox").prop("checked",isChecked).change();
           $(this).siblings("label").find(".custom-checkbox").toggleClass("checked", isChecked);
           // 선택된 개수 및 전체 개수 업데이트
           updateSelectionCount();
        });

// 아이템 선택 체크박스 클릭 시 체크박스 상태 변경
$(document).on("change",".item-checkbox",function() {
   var isChecked = this.checked;
   $(this).siblings("label").find(".custom-checkbox").toggleClass("checked",isChecked);

   // 선택된 아이템의 개수 확인
   var checkedItems = $(".item-checkbox:checked");
   var totalItems = $(".item-checkbox").length;

   // 전체 선택 체크박스 상태 변경
   $("#select-all").prop("checked",checkedItems.length === totalItems);
   $("#select-all").siblings("label").find(".custom-checkbox").toggleClass("checked",checkedItems.length === totalItems);
   // 선택된 개수 및 전체 개수 업데이트
   updateSelectionCount();
});

// 선택 삭제 버튼 클릭 시 선택된 아이템 제거
$(document).on("click", "#delete-selected", function() {
   var checkedItems = $(".item-checkbox:checked");
   if (checkedItems.length > 0) {
      showDeleteConfirmModal(checkedItems);
   }
});

// 선택된 개수 및 전체 개수 업데이트 함수
function updateSelectionCount() {
   var totalItems = $(".item-checkbox").length;
   var checkedItems = $(".item-checkbox:checked").length;
   $("#selected-count").text(checkedItems);
   $("#total-count").text(totalItems);

   // 선택된 아이템이 있는 경우 선택 삭제 버튼 색상 변경
   if (checkedItems > 0) {
      $("#delete-selected").css("color", "green");
   } else {
      $("#delete-selected").css("color", "");
   }
}

// 초기 로딩 시 선택 개수 업데이트
updateSelectionCount();

function updateReservationItems() {
	var selectedItems = $(".item-checkbox:checked");
	var itemCount = selectedItems.length;
	var totalPrice = 0;
	
	var reservationItems = $(".reservation-items");
	reservationItems.html('');

    selectedItems.each(function() {
    var $item = $(this).closest(".item-top");
    var itemName = $item.find(".item-name").text();
    var itemPrice = $item.find(".item-price").text();
    totalPrice += parseInt(itemPrice.replace(/[^0-9]/g, ""));

    var reservationItem = '<div class="reservation-item">'
            + '<div class="item-name">'
            + itemName
            + '</div>'
            + '<div class="item-price">'
            + itemPrice
            + '</div>'
            + '</div>';
    reservationItems.append(reservationItem);
   });
    
    updateSelectionCount(); // 선택된 개수 업데이트

   // 상품 개수 업데이트
   $("#selected-item-count").text(itemCount);

   // 상품 금액 업데이트
   $("#item-total-price").text(formatPrice(totalPrice));

   // 결제 예상 금액 업데이트
   $("#total-price").text(formatPrice(totalPrice));

	// 선택된 개수 및 전체 개수 업데이트
   $("#selected-item-count").text(itemCount);
   $("#item-total-price").text(formatPrice(totalPrice));
   $("#total-price").text(formatPrice(totalPrice));

   // 예약하기 버튼 업데이트
   var reservationButton = $("#reservation-button");
   if (itemCount > 0) {
     reservationButton.prop("disabled", false).addClass("enabled");
   } else {
     reservationButton.prop("disabled", true).removeClass("enabled");
   }
 }

// 가격을 3자리마다 콤마(,)를 추가하는 함수
function formatPrice(price) {
   return price.toLocaleString() + "원";
}

// 예약 상품 체크박스 변경 이벤트 처리
$(document).on("change", ".item-checkbox", function() {
   updateReservationItems();
});

// 초기 로딩 시 예약 상품 업데이트
updateReservationItems();

//모달창의 삭제하기 버튼 클릭 시 선택된 아이템 제거
$(document).on("click","#confirm-delete",function() {
	
	AjaxDeleteCart();
	
   $(".item-checkbox:checked").each(function() {
      var $item = $(this).closest(".item-top");
      var $detail2select = $item.closest(".detail2-select");
      
      $item.remove();

      // 해당 detail2-select 영역에서 남은 아이템의 개수 확인
      if ($detail2select.find(".item-top").length === 0) {
         $detail2select.remove();
      }
   });

   // 선택된 개수 및 전체 개수 업데이트
   updateSelectionCount();

   // reservation-section 데이터 초기화
   updateReservationItems();
   
   // 모달창 닫기
   $("#confirm-modal").modal('hide');
   
});

// 모달창 닫기 시 선택된 아이템 초기화
$(document).on("hidden.bs.modal", "#confirm-modal", function() {
  $("#confirm-modal").data("checkedItems", null);
  updateReservationItems(); // 예약 상품 업데이트 함수 호출
});

// 아이템의 X 버튼 클릭 시 해당 아이템 삭제
$(document).on("click", ".item-remove", function() {
   var $item = $(this).closest(".item-top");
   var $checkbox = $item.find(".item-checkbox");

   // 체크박스를 체크 상태로 변경
   $checkbox.prop("checked", true).change();
   showDeleteConfirmModal($item);
});

function showDeleteConfirmModal($item) {
   var checkedItems = $(".item-checkbox:checked");
   var message = checkedItems.length > 1 ? "선택하신 "
         + checkedItems.length + "개의 상품이 삭제됩니다."
         : "선택하신 상품이 삭제됩니다.";

   // 선택된 아이템을 모달창의 data-checkedItems 속성에 저장
   $("#confirm-modal").data("checkedItems", $item);

   $("#confirm-modal .modal-body").html(
         '<p>삭제하시겠어요?</p><p>' + message + '</p>');
   $("#confirm-modal").modal('show');
}

// 모달 스타일을 변경한 후에도 모달 창이 중앙에 위치하도록 다시 설정
$(document).on("shown.bs.modal", "#confirm-modal",
   function() {
	$(this).find(".modal-dialog");
   });
   
   document.getElementById("home-button").addEventListener("click", function() {
     window.location.href = "${contextPath}";
   });
});

function AjaxDeleteCart() {
	
	var itemsToDelete = [];

    // 선택한 체크박스를 반복합니다.
    $(".item-checkbox:checked").each(function() {
        // 여기서 this는 선택한 체크박스 요소를 가리킵니다.
        var $item = $(this).closest('.item-top'); // 체크박스를 감싸고 있는 상위 요소를 찾습니다. ('.item-top'는 상위 요소의 클래스명입니다.)
        var roomNo = $item.data('room-no'); // 상위 요소에서 data-room-no 속성 값을 가져옵니다.
        var buNo = $item.data('bu-no');

        // 항목 데이터를 배열에 추가
        itemsToDelete.push({
            roomNo: roomNo,
            buNo: buNo
        });
    });

    // 요청 데이터 객체 생성
    var requestData = {
        items: itemsToDelete
    };
    
    var url = "${contextPath}/decide/deleteCart";
    
    $.ajax({
        url: url,
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(requestData),
        success: function(response){
        	if( '0' == response){
        		alert("상품 삭제에 실패했습니다.");
        	} else{
        		alert("장바구니에서 상품이 삭제되었습니다.");	
        	}
            
        },
        error: function(error){
            console.log(error);
        }
    });
}
// pay로 가게끔 자바스크립트 단에 form 동적으로 생성 및 POST 방식으로 전송
//예약하기 버튼 클릭 시 발생  추가
 $(document).ready(function() {
	 $('#reservation-button').click(function() {
	        var selectedRoomNos = [];

	        // 선택한 체크박스를 반복합니다.
	        $(".item-checkbox:checked").each(function() {
	            var $item = $(this).closest('.item-top');
	            var roomNo = $item.data('room-no');
	            selectedRoomNos.push(roomNo);
	        });

	        // 폼을 동적으로 생성
	        var form = $('<form>', {
	            'action': "${contextPath}/decide/pay",
	            'method': 'post'
	        });

	        // 선택된 roomNo 값을 폼에 추가
	        $.each(selectedRoomNos, function(index, value) {
	            form.append($('<input>', {
	                'type': 'hidden',
	                'name': 'roomNos[]',
	                'value': value
	            }));
	        });

	        // DOM에 폼 추가 후 전송
	        $('body').append(form);
	        form.submit();
	    });
}); 
</script>
</head>

<body>
   <!-- 메인 부분 -->
   <div class="container-main">
      <c:if test="${empty list}">
         <div class="detail2-one-main"
            style="height: 350px; text-align: center; display: flex; justify-content: center; flex-direction: column; line-heigth: 10px">
            <i class="fas fa-shopping-cart"
               style="font-size: 54px; color: #0000001a; margin-bottom: 16px;"></i>
            <span style="font-size: 20px; color: #1a1a1a;">장바구니에 담긴 상품이
               없습니다</span> <span style="color: #616161; font-size: 18.5px;">원하는
               상품을 담아보세요</span>
            <div class="select-all"></div>
            <div style="text-align: center;">
               <button id="home-button" style="font-size: 16px; color: #008000; margin-top: 20px; padding: 10px 50px; border: 1px solid #008000; border-radius: 5px; background-color: #ffffff; cursor: pointer;">홈으로 가기</button>
            </div>
         </div>
      </c:if>

      <c:if test="${!empty list}">
         <div class="detail2-one-main">
            <div class="select-all">
               <input type="checkbox" id="select-all" style="display: none;">
               <label for="select-all" class="select-all-label"> <span class="custom-checkbox"></span> 
               전체 선택 (<span id="selected-count">0</span>/ <span id="total-count">0</span>)</label>
               <button id="delete-selected">선택 삭제</button>
            </div>
         </div>
   </div>
   
   <c:forEach items="${list }" var="d" varStatus="status">
      <div class="detail2-select">
         <div class="item-top" data-room-no="${d.roomNo}" data-bu-no="${d.buNo}">
            <div class="item-remove">X</div>
            <div class="item-check-image-name">
               <input type="checkbox" id="item-checkbox-${status.index + 1}" class="item-checkbox" style="display: none;">
               <label for="item-checkbox-${status.index + 1}">
                  <span class="custom-checkbox"></span>
               </label>
               <div class="item-image">
                  <img src="${contextPath}/${d.filePath}/${d.originName}" alt="상품 이미지" class="item-image">
               </div>
               <div class="item-name">${d.roomName}</div>
            </div>
            <div class="item-price">${d.roomPrice}원</div>
         </div>
      </div>
</c:forEach>

   <div class="reservation-section">
      <div class="reservation-title">예약 상품</div>
      <div class="reservation-items"></div>
      <div class="reservation-summary">
         <div class="summary-label">상품 개수</div>
         <div id="selected-item-count">0개</div>
      </div>
      <div class="reservation-summary">
         <div class="summary-label">상품 금액</div>
         <div id="item-total-price">0원</div>
      </div>
      <div class="reservation-summary">
         <div class="summary-label">결제 예상 금액</div>
         <div id="total-price">0원</div>
      </div>
      <button id="reservation-button" class="reservation-button" disabled>예약하기</button>
   </div>
  </c:if>

   <!-- 모달창 -->
   <div class="modal" tabindex="-1" role="dialog" id="confirm-modal"
      data-backdrop="static">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-header"></div>
            <div class="modal-body">
               <p>삭제하시겠어요?</p>
               <p>선택하신 상품이 삭제됩니다.</p>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-secondary"
                  data-dismiss="modal">아니요</button>
               <button type="button" class="btn btn-primary" id="confirm-delete">삭제하기</button>
            </div>
         </div>
      </div>
   </div>
</body>
</html>