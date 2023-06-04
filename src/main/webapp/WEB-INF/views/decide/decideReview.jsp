<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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

.container {
	max-width: 768px;
	margin: 0 auto;
	background-color: #fff;
	/* 컨테이너 배경색상 */
}

.detail2-main {
	margin-top: 20px;
	/* 위쪽 여백 크기 */
	margin-bottom: 50px;
	display: flex;
	justify-content: flex-start;
	align-items: center;
	padding: 0;
	position: relative;
	flex-wrap: wrap;
	font-size: 16px;
	font-weight: bold;
}

.detail2-all {
	display: flex;
	padding: 0;
	position: relative;
	flex-direction: column;
	padding: 0 2rem;
}

.review-container {
	display: flex;
	margin-bottom: 20px;
	justify-content: flex-start;
	font-size: 18px;
	font-weight: bold;
}

.review-star {
	display: flex;
	margin-bottom: px;
	justify-content: flex-start;
	/* 왼쪽으로 정렬 */
}

.review-avg {
	display: flex;
	justify-content: flex-start;
	margin-left: 30px;
	margin-bottom: 20px;
	color: rgb(145, 145, 145);
}

.star-rating {
	display: flex;
	align-items: center;
	color: black;
}

.star-rating span {
	margin-right: 7px;
}

.star-rating i {
	color: rgba(255, 204, 0, 0.852);
	font-size: 30px;
	/* 별 아이콘 크기 변경 */
}

.rating-score {
	font-size: 14px;
	/* 평점 크기 변경 */
	margin-left: 5px;
}

.rating-small {
	font-size: 20px;
	color: rgb(145, 145, 145);
	/* /5 글자 크기 작게 변경 */
}

.recent-reviews {
	display: flex;
	align-items: center;
	font-size: 14px;
	color: blue !important;
	margin-top: 10px;
	padding-top: 15px;
	padding-bottom: 15px;
	border-top: 1px solid rgb(204, 204, 204);
	border-bottom: 1px solid rgb(204, 204, 204);
}

.recent-reviews i {
	margin-right: 5px;
	color: blue !important;
}

.recent-reviews span {
	color: blue !important;
	margin-left: 5px;
}

.recent-reviews::before {
	content: "";
	display: inline-block;
	width: 0;
	height: 0;
	cursor: pointer;
	border-style: solid;
	border-width: 4px 4px 0 4px;
	border-color: blue transparent transparent transparent;
	margin-right: 5px;
}

.modal {
	position: fixed;
	bottom: 0;
	left: 50%;
	transform: translateX(-50%);
	z-index: 9999;
	background-color: #fff;
	width: 700px;
	height: 350px;
	padding: 20px;
	border-radius: 10px;
	visibility: hidden;
	opacity: 0;
	/* 추가 */
}

.modal-overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 9998;
	visibility: hidden;
	opacity: 0;
	/* 추가 */
}

.modal.active {
	visibility: visible;
	align-items: flex-end;
	animation: modal-show 0.18s ease-in-out forwards;
}

.modal-overlay.active {
	visibility: visible;
	animation: overlay-show 0.18s ease-in-out forwards;
}

.modal.hide {
	animation: modal-hide 0.18s ease-in-out forwards;
}

.modal-overlay.hide {
	animation: overlay-hide 0.18s ease-in-out forwards;
}

@
keyframes modal-show { 0% {
	opacity: 0;
	transform: translate(-50%, 100%);
}

100
%
{
opacity
:
1;
transform
:
translate(
-50%
,
0
);
}
}
@
keyframes overlay-show { 0% {
	opacity: 0;
}

100
%
{
opacity
:
1;
}
}

/* 모달 숨김 애니메이션 */
@
keyframes modal-hide { 0% {
	opacity: 1;
	transform: translate(-50%, 0);
}

100
%
{
opacity
:
0;
transform
:
translate(
-50%
,
100%
);
}
}
@
keyframes overlay-hide { 0% {
	opacity: 1;
}

100
%
{
opacity
:
0;
}
}
.modal-close {
	position: absolute;
	top: 19px;
	left: 19px;
	font-size: 20px;
	color: #333;
	cursor: pointer;
	z-index: 100000;
}

.modal-content h2 {
	text-align: center;
	/* "정렬" 텍스트를 가운데로 이동 */
}

.modal-close:hover {
	color: #000;
}

.modal-content {
	display: flex;
	flex-direction: column;
	align-items: start;
	justify-content: flex-start;
	width: 100%;
}

.modal-title {
	width: 100%;
	text-align: center;
	font-weight: bold;
	/* 굵은 폰트로 표시 */
	position: absolute;
	/* 절대 위치 지정 */
	top: 18px;
	/* 모달 창 상단에서부터의 거리 */
	right: 3px;
}

.modal-list {
	list-style: none;
	padding: 0;
}

.modal-list-item {
	display: flex;
	align-items: flex-start;
	cursor: pointer;
	margin-top: 41px;
}

/* 모달 리스트 아이템 체크 아이콘 스타일 */
.modal-list-item.checked .checkbox {
	color: green;
}

.modal-list-item.checked .checkbox::before {
	content: "\f00c";
}

/* 체크 아이콘 스타일 */
.modal-list-item .checkbox {
	display: inline-block;
	margin-left: 5px;
	color: blue;
}

.modal-list-item-text {
	margin: 10px 0;
	/* 위아래로 10px의 마진을 추가. */
	margin-bottom: 35px;
	font-size: 16px;
	/* 원하는 px 값으로 조정하세요. */
}

.fa-check {
	margin-left: 234px;
	font-size: 20px;
	margin-top: 10px;
}

.review-main-star {
	padding: 20px 0;
}

#content {
	padding: 20px 0;
	border-bottom: 1px solid rgb(242, 242, 242);
}

#content2 {
	display: flex;
	align-items: center;
}

#reviewNickname {
	display: flex;
	font-size: 16px;
	margin-bottom: 10px;
	color: rgb(97, 97, 97);
}

#reviewRoomName {
	display: flex;
}

#reviewRoomNameList {
	width: 8%;
	height: 20px;
	border-radius: 2px;
	text-align: center;
	color: rgb(145, 145, 145);
	background-color: rgba(230, 230, 230);
}

#reviewRoomNameInfo {
	width: 92%;
	margin-left: 10px;
	border-radius: 2px;
	color: rgb(97, 97, 97);
	background-color: rgba(248, 248, 248);
}

#review {
	margin: 20px 0;
	text-align: left;
}

#buReviewList {
	width: 700px;
	height: 200px;
	background-color: rgba(248, 248, 248);
	padding: 20px;
}

#review-star-rating .fa {
	color: #ffc107;
}

#review-star-rating {
	margin-bottom: 10px;
}

.buReviewDate {
	float: right;
	font-size: 16px;
	color: rgb(97, 97, 97);
}
</style>
<script>
        $(document).ready(function () {
            // 별점 아이콘 생성 및 점수 표시
            function showRating(rating) {
                var ratingHTML = '<span><i class="fas fa-star"></i></span>';
                return ratingHTML;
            }

            // 후기 개수 및 별점 표시
            var starRatingHTML = showRating(${r.starScore});

            $('.review-container span').text('후기 (' + ${r.reviewCount} + ')');
            $('.review-star').html('<div class="star-rating">' + starRatingHTML + '<span class="rating-score">' + ${starScore} + '<span class="rating-small">/5</span></span></div>');
            $('.review-avg').html("누적 평점");

            // 별 크기 변경
            $('.review-star i').removeClass('fa-star').addClass('fa-star');
            // 평점 크기 변경
            $('.rating-score').css('font-size', '35px').css('font-weight', 'bold');

            // 첫 로딩시 최근 작성순에 체크 아이콘 추가
            $('.modal-list-item-text').each(function () {
                if ($(this).text() === '최근 작성순') {
                    $(this).parent('.modal-list-item').addClass('checked');
                    $(this).prev('.checkbox').removeClass('far').addClass('fas');
                    $(this).addClass('selected');
                    $(this).after('<span class="fas fa-check"></span>');
                }
            });

            // 모달 리스트 아이템 클릭 이벤트
            $('.modal-list-item').click(function () {
                var selectedText = $(this).find('.modal-list-item-text').text();

                if (!$(this).hasClass('checked')) {
                    $('.modal-list-item').removeClass('checked');
                    $('.modal-list-item .checkbox').removeClass('fas').addClass('far');
                    $('.modal-list-item .modal-list-item-text').removeClass('selected');
                    $(this).addClass('checked');
                    $(this).find('.checkbox').removeClass('far').addClass('fas');
                    $(this).find('.modal-list-item-text').addClass('selected');

                    // 체크 아이콘 추가
                    $('.modal-list-item .fas.fa-check').remove();
                    $(this).find('.modal-list-item-text').after('<span class="fas fa-check"></span>');

                    // 다른 항목의 체크 아이콘 제거
                    $('.modal-list-item').not(this).find('.fas.fa-check').remove();

                    $('.recent-reviews span').text(selectedText).css('color', 'green');
                } else {
                    $(this).removeClass('checked');
                    $(this).find('.checkbox').removeClass('fas').addClass('far');
                    $(this).find('.modal-list-item-text').removeClass('selected');
                    $(this).find('.fas.fa-check').remove();
                    $('.recent-reviews span').text('최근 작성순').css('color', '');
                }

                // 선택된 항목 스타일 변경
                $('.modal-list-item.checked .modal-list-item-text, .modal-list-item.checked .fa-check').css('color', 'green');

                // 선택되지 않은 항목 스타일 초기화
                $('.modal-list-item:not(.checked) .modal-list-item-text, .modal-list-item:not(.checked) .fa-check').css('color', '');

                closeModal();
            });

            // 모달 창 열기 버튼 클릭 이벤트
            $('.recent-reviews').on('click', function () {
                openModal();
                $('.modal').addClass('active');
                $('.modal-overlay').addClass('active');
                var selectedText = $('.recent-reviews span').text();
                $('.modal-list-item .modal-list-item-text').each(function () {
                    if ($(this).text() === selectedText) {
                        $(this).parent('.modal-list-item').addClass('checked');
                        $(this).prev('.checkbox').removeClass('far').addClass('fas');
                        $(this).addClass('selected');
                    } else {
                        $(this).parent('.modal-list-item').removeClass('checked');
                        $(this).prev('.checkbox').removeClass('fas').addClass('far');
                        $(this).removeClass('selected');
                    }
                });

                // 선택된 항목 스타일 변경
                $('.modal-list-item.checked .modal-list-item-text, .modal-list-item.checked .fa-check').css('color', 'green');
            });

            // span 선택 시 체크 아이콘 표시 및 모달 닫기
            $('.modal-list-item-text').on('click', function () {
                $('.modal-list-item .checkbox').removeClass('fas').addClass('far');
                $('.modal-list-item-text').removeClass('selected');
                $(this).prev('.checkbox').removeClass('far').addClass('fas');
                $(this).addClass('selected');
                var selectedText = $(this).text();
                $('.recent-reviews span').text(selectedText).css('color', 'green');
                closeModal();
            });

            function openModal() {
                $('.modal').addClass('active');
                $('.modal-overlay').addClass('active');
                $('body').css('overflow', 'hidden');
            }

            function closeModal() {
                $('.modal').addClass('hide');
                $('.modal-overlay').addClass('hide');
                $('body').css('overflow', 'auto');
            }

            // 모달 외부 영역 클릭 이벤트
            $('.modal-overlay').on('click', function () {
                closeModal();
            });

            // 애니메이션 종료 이벤트
            $('.modal').on('animationend', function () {
                if ($(this).hasClass('hide')) {
                    $(this).removeClass('active').removeClass('hide');
                }
            });

            $('.modal-overlay').on('animationend', function () {
                if ($(this).hasClass('hide')) {
                    $(this).removeClass('active').removeClass('hide');
                }
            });

            /* X 버튼 클릭 이벤트 */
            $(document).on('click', '.modal-close', function () {
                closeModal();
            });
        });
    </script>
</head>

<body>
	<div class="container">
		<div class="detail2-all">
			<div class="review-container">
				<span>후기 (${r.reviewCount})</span>
			</div>

			<div class="review-star">
				<!-- 평점 표시를 위한 요소 -->
			</div>

			<div class="review-avg">
				<!-- 누적 평점 -->
			</div>

			<div class="recent-reviews">
				<span style="cursor: pointer;">최근 작성순</span>
			</div>

			<div class="review-main-star">
				<c:forEach items="${list }" var="d">
					<div id="content">
						<div id="content2">
							<div id="reviewBackground">
								<div id="review-star-rating">
									<span class="fa fa-star"></span> <span class="fa fa-star"></span>
									<span class="fa fa-star"></span> <span class="fa fa-star"></span>
									<span class="fa fa-star"></span>
								</div>
								<div id="reviewNickname">
									<div>${m.userName} | ${r.createDate}</div>
								</div>
								<div id="reviewRoomName">
									<div id="reviewRoomNameList">객실명</div>
									<div id="reviewRoomNameInfo">${r.roomName}(${r.roomInfo})</div>
								</div>
								<div id="review">${r.reviewContent }</div>

								<div id="buReviewList">
									<span style="font-size: larger;"><b>숙소 답변</b></span> <span
										class="buReviewDate">${r.createDate}</span>
									<p class="buReview">${r.reviewContentReply }</p>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>

				<div id="content">
					<div id="content2">
						<div id="reviewBackground">
							<div id="review-star-rating">
								<span class="fa fa-star"></span> <span class="fa fa-star"></span>
								<span class="fa fa-star"></span> <span class="fa fa-star"></span>
								<span class="fa fa-star"></span>
							</div>
							<div id="reviewNickname">
								<div>기구구구구 | 2023.05.04</div>
							</div>
							<div id="reviewRoomName">
								<div id="reviewRoomNameList">객실명</div>
								<div id="reviewRoomNameInfo">미니룸(인터넷,넷플릭스사용가능)</div>
							</div>
							<div id="review">방도 깔끔하고 생각보다 넓어서 싫어용!</div>

							<div id="buReviewList">
								<span style="font-size: larger;"><b>숙소 답변</b></span> <span
									class="buReviewDate">2023.05.04</span>
								<p class="buReview">저희 숙소를 이용해주셔서 감사합니다</p>
							</div>
						</div>
					</div>
				</div>
			</div>


			<!-- 모달 창 -->
			<div class="modal">
				<span class="modal-close">X</span>
				<!-- "X" 버튼을 모달 왼쪽 상단에 추가 -->
				<div class="modal-content">
					<h2 class="modal-title">정렬</h2>
					<ul class="modal-list">
						<li class="modal-list-item"><span
							class="modal-list-item-text">최근 작성순</span></li>
						<li class="modal-list-item"><span
							class="modal-list-item-text">별점 높은순</span></li>
						<li class="modal-list-item"><span
							class="modal-list-item-text">별점 낮은순</span></li>
					</ul>
				</div>
			</div>
			<div class="modal-overlay"></div>
		</div>
	</div>
</body>

</html>