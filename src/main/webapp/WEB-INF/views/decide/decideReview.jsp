<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="m" value="${map}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/decide/review.css">

<script>
$(document).ready(function () {
// 별 크기 변경
$('.review-star i').removeClass('fa-star').addClass('fa-star');
// 평점 크기 변경
$('.rating-score').css('font-size', '35px').css('font-weight', 'bold');

$('.review-star i').removeClass('fa-star').addClass('fa-star').css('color', 'rgba(255, 204, 0, 0.852)');

let userStarScore = ${m.userStarScore}; // JSP에서 전달한 데이터를 JavaScript 변수에 할당

for (let i = 0; i < userStarScore.length; i++) {
    let starScore1 = userStarScore[i];
    let intPart1 = Math.floor(starScore1);
    let decimalPart1 = starScore1 - intPart1;
    let starHTML1 = '';
    for (let j = 0; j < intPart1; j++) {
        starHTML1 += '<i class="fas fa-star"></i>';
    }
    if (decimalPart1 >= 0.5) {
        starHTML1 += '<i class="fas fa-star-half-alt"></i>';
    }
    $('.star').eq(i).html(starHTML1); // 별점을 표시할 요소에 HTML 삽입
}

// 별점을 업데이트하는 함수
function updateStars1(starScore1) {
	let intPart1 = Math.floor(starScore1);
	let decimalPart1 = starScore1 - intPart1;
	let starHTML1 = '';
	for (let i = 0; i < intPart1; i++) {
		starHTML1 += '<i class="fas fa-star"></i>';
	}
	if (decimalPart1 >= 0.5) {
		starHTML1 += '<i class="fas fa-star-half-alt"></i>';
	}
	$('.star').html(starHTML1);
}

//첫 로딩시 최근 작성순에 체크 아이콘 추가
$('.modal-list-item-text').each(function () {
    if ($(this).text() === '최근 작성순') {
        $(this).parent('.modal-list-item').addClass('checked');
        $(this).prev('.checkbox').removeClass('far').addClass('fas');
        $(this).addClass('selected');
        $(this).after('<span class="fas fa-check"></span>');
    }
});

$('.review-main-star').css('display', 'none'); // 모든 review-main-star div를 숨김
$('#review-main-star-recent').css('display', 'block'); // "최근 작성순" div만 보이게 함


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
$(document).on('click', '.modal-close', function() {
	closeModal();
 });
 
// 모달 창의 각 항목에 클릭 이벤트 추가
$('.modal-list-item-text').on('click', function() {
    // 선택한 정렬 방식에 따라 적절한 div를 표시
    switch($(this).text()) {
        case '최근 작성순':
            showDiv('review-main-star-recent');
            break;
        case '별점 높은순':
            showDiv('review-main-star-high');
            break;
        case '별점 낮은순':
            showDiv('review-main-star-low');
            break;
    }
});

function showDiv(id) {
    // 모든 review-main-star div를 숨김
    $('.review-main-star').css('display', 'none');

    // 선택된 div만 보이게 함
    $('#' + id).css('display', 'block');
  }
});
</script>
</head>
<body>    
    <div class="container">
        <div class="detail2-all">
            <div class="review-container">
                <span>후기 (${m.reviewCount})</span>
            </div>
            <div class="review-star">
                <div class="star-rating">
                <span><i class="fas fa-star"></i></span>
                <span class="rating-score">${m.starScore}
                <span class="rating-small">/5</span></span>
                 </div>
            </div>
            <div class="review-avg">
                누적 평점
            </div>
            <div class="recent-reviews">
                <span style="cursor: pointer;">최근 작성순</span>
            </div>
            <div class="review-main-star" id="review-main-star-recent" data-section="recent">
           		<c:forEach items="${reviewList}" var="d">
	                <div id="content">
	                    <div id="content2">
	                        <div id="reviewBackground" style="width: 100%;">
	                            <div id="review-star-rating">
	                            <span class="star" style="color : rgba(255, 204, 0, 0.852);">
	                                </span>
	                            </div>
	                            <div id="reviewNickname">
	                                <div>${d.userName} | ${d.createDate}</div>
	                            </div>
	                            <div id="reviewRoomName">
	                                <div id="reviewRoomNameList">객실명</div>
	                                <div id="reviewRoomNameInfo">${d.roomName} (${d.roomInfo})</div>
	                            </div>
	                            <div id="review">${d.reviewContent }</div>
	                            
	                            <c:if test="${empty reviewList}">
	                            </c:if>
	                            
								<c:if test="${!empty d.reviewContentReply}">
	                            <div id="buReviewList">
	                                <span style="font-size: larger;"><b>숙소 답변</b></span> 
	                                <span class="buReviewDate">${d.createDate}</span>   
	                                <p class="buReview">${d.reviewContentReply}</p>
	                            </div>
	                            </c:if>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
          	</div>
                
           	<div class="review-main-star" id="review-main-star-high" data-section="high">
                <c:forEach items="${reviewListHigh}" var="d">
	                <div id="content">
	                    <div id="content2">
	                        <div id="reviewBackground" style="width: 100%;">
	                            <div id="review-star-rating">
	                                <c:forEach begin="1" end="${d.userStarScore}" var="i">
				                        <i class="fa fa-star" style="color:rgba(255, 204, 0, 0.852)"></i>
				                    </c:forEach>
	                            </div>
	                            <div id="reviewNickname">
	                                <div>${d.userName} | ${d.createDate}</div>
	                            </div>
	                            <div id="reviewRoomName">
	                                <div id="reviewRoomNameList">객실명</div>
	                                <div id="reviewRoomNameInfo">${d.roomName} (${d.roomInfo})</div>
	                            </div>
	                            <div id="review">${d.reviewContent }</div>
	                            
	                            <c:if test="${empty reviewList}">
	                            </c:if>
	                            
								<c:if test="${!empty d.reviewContentReply}">
	                            <div id="buReviewList">
	                                <span style="font-size: larger;"><b>숙소 답변</b></span> 
	                                <span class="buReviewDate">${d.createDate}</span>   
	                                <p class="buReview">${d.reviewContentReply}</p>
	                            </div>
	                            </c:if>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
          	</div>
                
          	<div class="review-main-star" id="review-main-star-low" data-section="low">
               <c:forEach items="${reviewListLow}" var="d">
	                <div id="content">
	                    <div id="content2">
	                        <div id="reviewBackground" style="width: 100%;">
	                            <div id="review-star-rating">
	                            	<c:forEach begin="1" end="${d.userStarScore}" var="i">
				                        <i class="fa fa-star" style="color:rgba(255, 204, 0, 0.852)"></i>
				                    </c:forEach>
	                            </div>
	                            <div id="reviewNickname">
	                                <div>${d.userName} | ${d.createDate}</div>
	                            </div>
	                            <div id="reviewRoomName">
	                                <div id="reviewRoomNameList">객실명</div>
	                                <div id="reviewRoomNameInfo">${d.roomName} (${d.roomInfo})</div>
	                            </div>
	                            <div id="review">${d.reviewContent }</div>
	                            
	                            <c:if test="${empty reviewList}">
	                            </c:if>
	                            
								<c:if test="${!empty d.reviewContentReply}">
	                            <div id="buReviewList">
	                                <span style="font-size: larger;"><b>숙소 답변</b></span> 
	                                <span class="buReviewDate">${d.createDate}</span>   
	                                <p class="buReview">${d.reviewContentReply}</p>
	                            </div>
	                            </c:if>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
         	</div>
            
            
            <!-- 모달 창 -->
            <div class="modal">
                <span class="modal-close">X</span> <!-- "X" 버튼을 모달 왼쪽 상단에 추가 -->
                <div class="modal-content">
                    <h2 class="modal-title">정렬</h2>
                    <ul class="modal-list">
                        <li class="modal-list-item">
                            <span class="modal-list-item-text">최근 작성순</span>
                        </li>
                        <li class="modal-list-item">
                            <span class="modal-list-item-text">별점 높은순</span>
                        </li>
                        <li class="modal-list-item">
                            <span class="modal-list-item-text">별점 낮은순</span>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="modal-overlay"></div>
        </div>
    </div>
</body>
</html>