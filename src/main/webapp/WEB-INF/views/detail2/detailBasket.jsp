<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- Bootstrap JavaScript and jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


<style>
/* Reset CSS */
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

/* 전체적인 스타일 */
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
}

.detail2-one-main {
	padding: 0 2rem;
	height: 40px;
}

.detail2-select {
	max-width: 768px;
	margin: 0 auto;
	background-color: #fff;
	margin-top: 10px;
	height: 150px;
	padding: 0 2rem;
	border-bottom: 1px solid #e6e6e6;
}

.select-all {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 10px;
	padding-top: 8px;
}

/* 아이템 스타일 */
.item-top {
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	justify-content: space-between;
	width: 100%;
}

.item-check-image-name {
	display: flex;
	align-items: flex-start;
}

.item-image {
	width: 75px;
	height: 75px;
	margin-left: 0;
	margin-right: 10px;
	border-radius: 3px;
}

.item-remove {
	padding: 5px;
	color: #919191;
	width: 20px;
	height: 20px;
	display: flex;
	align-items: center;
	justify-content: center;
	align-self: flex-start;
	position: relative;
	top: 18px;
	margin-left: auto;
	cursor: default;
}

.item-price {
	color: #666;
	align-self: flex-end;
	margin-top: 10px;
	font-weight: bold;
}

.item-name {
	font-weight: bold;
}

/* 기본 체크박스 스타일 */
input[type="checkbox"] {
	display: none;
}

/* 커스텀 체크박스 스타일 */
.custom-checkbox {
	position: relative;
	display: inline-block;
	width: 20px;
	height: 20px;
	border: 1px solid #999;
	cursor: pointer;
	margin-right: 7px;
	background-color: white;
	color: rgb(204, 204, 204);
}

/* 커스텀 체크박스 선택 시 스타일 */
.custom-checkbox.checked {
	background-color: green;
	color: white;
}

/* 커스텀 체크박스 내부 체크 마크 스타일 */
.custom-checkbox::after {
	content: "";
	position: absolute;
	left: 5px;
	top: 2px;
	width: 5px;
	height: 10px;
	border: solid #999;
	border-width: 0 2px 2px 0;
	transform: rotate(45deg);
	display: none;
}

/* 커스텀 체크박스 선택 시 내부 체크 마크 스타일 */
.custom-checkbox.checked::after {
	display: block;
	border-color: #fff;
}

#delete-selected {
	background: none;
	border: none;
	color: #cccccc;
	font-size: 10px;
	cursor: pointer;
}

#delete-selected:focus {
	outline: none;
	box-shadow: none;
}

.select-all-label {
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 5px;
	font-size: 10px;
}

/* 모달 스타일 수정 */
.modal-dialog {
	position: absolute;
	left: 42%;
	top: 35%;
	width: 300px;
	max-width: calc(100% - 2rem);
	/* 모달 너비가 최대 너비보다 클 경우 최대 너비로 설정 */
	height: 120px;
	max-height: calc(100% - 2rem);
	/* 모달 높이가 최대 높이보다 클 경우 최대 높이로 설정 */
	box-shadow: none;
}

.modal-content {
	text-align: center;
	border: none;
	/* 모든 테두리 제거 */
	box-shadow: none;
}

.modal-header, .modal-footer {
	border: none;
	/* 모달 헤더와 푸터의 테두리 제거 */
	background-color: transparent;
	/* 배경색을 투명으로 설정 */
}

.modal-body {
	margin-bottom: -26px;
}

.modal-footer {
	justify-content: center;
}

.modal-footer button {
	background-color: transparent;
	/* 배경색을 투명으로 설정 */
	border: none;
}

.modal-footer #confirm-delete:hover {
	background-color: transparent;
	/* 호버 시 배경색을 투명으로 설정 */
}

.modal-footer #confirm-delete {
	color: #0152cc;
	/* 삭제하기 버튼의 색상을 설정합니다 */
	font-weight: bold;
	/* 삭제하기 버튼의 글꼴을 굵게 설정합니다 */
}

.modal-footer .btn-secondary {
	color: #919191;
	/* 아니요 버튼의 색상을 설정합니다 */
	background-color: transparent;
	/* 배경색을 투명으로 설정 */
}

.modal-footer .btn-primary:focus, .modal-footer .btn-primary.focus,
	.modal-footer .btn-primary:not(:disabled):not(.disabled):active,
	.modal-footer .btn-primary:not(:disabled):not(.disabled).active {
	background-color: transparent;
	box-shadow: none;
}

.modal-footer .btn-secondary:focus, .modal-footer .btn-secondary.focus,
	.modal-footer .btn-secondary:not(:disabled):not(.disabled):active,
	.modal-footer .btn-secondary:not(:disabled):not(.disabled).active {
	background-color: transparent;
	box-shadow: none;
}

.reservation-section {
	background-color: #fff;
	padding: 20px;
	max-width: 768px;
	margin: 10px auto;
	background-color: #fff;
}

.reservation-title {
	font-weight: bold;
	margin-bottom: 10px;
}

.reservation-items {
	margin-bottom: 10px;
}

.reservation-item {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 5px;
}

.item-price {
	text-align: right;
}

.reservation-summary {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 5px;
}

.summary-label {
	line-height: 40px;
}

.reservation-button {
	width: 100%;
	background-color: #cccccc;
	color: #ffffff;
	border: none;
	padding: 10px;
	font-weight: bold;
	cursor: not-allowed;
}

.reservation-button:disabled {
	background-color: #cccccc;
	cursor: not-allowed;
}

.reservation-button.enabled {
	background-color: #009900;
	cursor: pointer;
}
</style>
<script>
	$(document)
			.ready(
					function() {
						// Prevent Bootstrap Modal from stealing focus
						$.fn.modal.Constructor.prototype._enforceFocus = function() {
						};

						// 전체 선택 체크박스 클릭 시 모든 체크박스 상태 변경
						$("#select-all").change(
								function() {
									var isChecked = this.checked;
									$(".item-checkbox").prop("checked",
											isChecked).change();
									$(this).siblings("label").find(
											".custom-checkbox").toggleClass(
											"checked", isChecked);

									// 선택된 개수 및 전체 개수 업데이트
									updateSelectionCount();
								});

						// 아이템 선택 체크박스 클릭 시 체크박스 상태 변경
						$(document)
								.on(
										"change",
										".item-checkbox",
										function() {
											var isChecked = this.checked;
											$(this).siblings("label").find(
													".custom-checkbox")
													.toggleClass("checked",
															isChecked);

											// 선택된 아이템의 개수 확인
											var checkedItems = $(".item-checkbox:checked");
											var totalItems = $(".item-checkbox").length;

											// 전체 선택 체크박스 상태 변경
											$("#select-all")
													.prop(
															"checked",
															checkedItems.length === totalItems);
											$("#select-all")
													.siblings("label")
													.find(".custom-checkbox")
													.toggleClass(
															"checked",
															checkedItems.length === totalItems);

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

							// 예약 상품 섹션 업데이트
							var reservationItems = $(".reservation-items");
							reservationItems.empty();

							selectedItems
									.each(function() {
										var $item = $(this)
												.closest(".item-top");
										var itemName = $item.find(".item-name")
												.text();
										var itemPrice = $item.find(
												".item-price").text();
										totalPrice += parseInt(itemPrice
												.replace(/[^0-9]/g, ""));

										var reservationItem = '<div class="reservation-item">'
												+ '<div class="item-name">'
												+ itemName
												+ '</div>'
												+ '<div class="item-price">'
												+ itemPrice
												+ '</div>'
												+ '</div>';
										reservationItems
												.append(reservationItem);
									});

							// 상품 개수 업데이트
							$("#selected-item-count").text(itemCount);

							// 상품 금액 업데이트
							$("#item-total-price")
									.text(formatPrice(totalPrice));

							// 결제 예상 금액 업데이트
							$("#total-price").text(formatPrice(totalPrice));

							// 예약하기 버튼 업데이트
							var reservationButton = $("#reservation-button");
							if (itemCount > 0) {
								reservationButton.prop("disabled", false)
										.addClass("enabled");
							} else {
								reservationButton.prop("disabled", true)
										.removeClass("enabled");
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

						// 모달창의 삭제하기 버튼 클릭 시 선택된 아이템 제거
						$(document)
								.on(
										"click",
										"#confirm-delete",
										function() {
											var checkedItems = $(
													"#confirm-modal").data(
													"checkedItems");
											if (checkedItems
													&& checkedItems.length > 0) {
												checkedItems
														.each(function() {
															var $item = $(this)
																	.closest(
																			".item-top");
															var $detail2select = $item
																	.closest(".detail2-select");
															$item.remove();

															// 해당 detail2-select 영역에서 남은 아이템의 개수 확인
															if ($detail2select
																	.find(".item-top").length === 0) {
																$detail2select
																		.remove();
															}
														});

												// 선택된 개수 및 전체 개수 업데이트
												updateSelectionCount();
											}

											// 모달창 닫기
											$("#confirm-modal").modal('hide');
										});

						// 모달창 닫기 시 선택된 아이템 초기화
						$(document).on(
								"hidden.bs.modal",
								"#confirm-modal",
								function() {
									$("#confirm-modal").data("checkedItems",
											null);
								});

						// 아이템의 X 버튼 클릭 시 해당 아이템 삭제
						$(document).on("click", ".item-remove", function() {
							var $item = $(this).closest(".item-top");
							var $checkbox = $item.find(".item-checkbox");

							// 체크박스가 체크된 경우에만 체크 해제
							if ($checkbox.prop("checked")) {
								$checkbox.prop("checked", false).change();
							}

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

						// 모달창의 삭제하기 버튼 클릭 시 선택된 아이템 제거
						$(document)
								.on(
										"click",
										"#confirm-delete",
										function() {
											$(".item-checkbox:checked")
													.each(
															function() {
																var $item = $(
																		this)
																		.closest(
																				".item-top");
																var $detail2select = $item
																		.closest(".detail2-select");
																$item.remove();

																// 해당 detail2-select 영역에서 남은 아이템의 개수 확인
																if ($detail2select
																		.find(".item-top").length === 0) {
																	$detail2select
																			.remove();
																}

																// 선택된 개수 및 전체 개수 업데이트
																updateSelectionCount();
															});

											// 모달창 닫기
											$("#confirm-modal").modal('hide');
										});

						$(document).on("click", ".item-remove", function() {
							var $item = $(this).closest(".item-top");
							var $checkbox = $item.find(".item-checkbox");

							// 체크박스가 체크된 경우에만 체크 해제
							if ($checkbox.prop("checked")) {
								$checkbox.prop("checked", false).change();
							}

							showDeleteConfirmModal($item);
						});

						// 모달 스타일을 변경한 후에도 모달 창이 중앙에 위치하도록 다시 설정
						$(document).on("shown.bs.modal", "#confirm-modal",
								function() {
									$(this).find(".modal-dialog");
								});

					});
</script>
</head>

<body>
	<!-- 메인 부분 -->
	<div class="container-main">
		<div class="detail2-one-main">
			<div class="select-all">
				<input type="checkbox" id="select-all" style="display: none;">
				<label for="select-all" class="select-all-label"> <span
					class="custom-checkbox"></span> 전체 선택 (<span id="selected-count">0</span>
					/ <span id="total-count">0</span>)
				</label>
				<button id="delete-selected">선택 삭제</button>
			</div>
		</div>
	</div>
	<div class="detail2-select">
		<div class="item-top">
			<div class="item-remove">X</div>
			<div class="item-check-image-name">
				<input type="checkbox" id="item-checkbox-1" class="item-checkbox"
					style="display: none;"> <label for="item-checkbox-1">
					<span class="custom-checkbox"></span>
				</label>
				<div class="item-image">
					<img
						src="https://emons.co.kr/shop/data/goods/JF_Doit_7ZmU7J207Yq4_02.jpg"
						alt="상품 이미지" class="item-image">
				</div>
				<div class="item-name">상품 1</div>
			</div>
			<div class="item-price">50000원</div>
		</div>
	</div>

	<div class="detail2-select">
		<div class="item-top">
			<div class="item-remove">X</div>
			<div class="item-check-image-name">
				<input type="checkbox" id="item-checkbox-2" class="item-checkbox"
					style="display: none;"> <label for="item-checkbox-2">
					<span class="custom-checkbox"></span>
				</label>
				<div class="item-image">
					<img
						src="https://emons.co.kr/shop/data/goods/JF_Doit_7ZmU7J207Yq4_02.jpg"
						alt="상품 이미지" class="item-image">
				</div>
				<div class="item-name">상품 2</div>
			</div>
			<div class="item-price">70000원</div>
		</div>
	</div>

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