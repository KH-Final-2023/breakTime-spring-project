<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>후기</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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
        }

        .review-container {
            display: flex;
            margin-bottom: 20px;
            justify-content: flex-start;
            margin-left: 31px;
            font-size: 18px;
            font-weight: bold;
        }

        .review-star {
            display: flex;
            margin-bottom: 30px;
            justify-content: center;
            cursor: zoom-in;
            /* 클릭시 zoom-in 커서 효과 */
        }

        .star-rating {
            display: flex;
            align-items: center;
        }

        .star-rating span {
            margin-right: 5px;
        }

        .star-rating i {
            color: rgba(255, 204, 0, 0.852);
        }

        .rating-score {
            font-size: 14px;
            margin-left: 5px;
        }

        .address-container {
            display: flex;
            align-items: center;
            margin-left: 35px;
            /* 주소를 왼쪽으로 옮김 */
        }

        .address-text {
            font-size: 14px;
            font-weight: normal;
        }

        .copy-button {
            margin-left: auto;
            /* 주소 복사 버튼을 오른쪽으로 옮김 */
            margin-right: 20px;
            padding: 5px 10px;
            background-color: transparent;
            color: blue;
            /* 파란색으로 변경 */
            border: none;
            border-radius: 4px;
            text-decoration: none;
            cursor: pointer;
            font-size: 13px;
        }
    </style>
    <script>
        $(document).ready(function () {
            // 별점 아이콘 생성 및 점수 표시
            function showRating(rating) {
                var stars = Math.floor(rating);
                var halfStar = rating % 1 !== 0;
                var ratingHTML = '';
                for (var i = 0; i < stars; i++) {
                    ratingHTML += '<span><i class="fas fa-star"></i></span>';
                }
                if (halfStar) {
                    ratingHTML += '<span><i class="fas fa-star-half-alt"></i></span>';
                }
                return ratingHTML;
            }
            
            // 후기 개수 및 별점 표시
            var reviewCount = 10; // 후기 개수
            var ratingScore = 4.6; // 평점
            var starRatingHTML = showRating(ratingScore);
            
            $('.review-container span').text('후기 (' + reviewCount + ')');
            $('.review-star').html('<div class="star-rating">' + starRatingHTML + '<span class="rating-score">' + ratingScore + '/5</span></div>');
        });
</script>
</head>

<body>
    <div class="container">
        <div class="detail2-all">
            <div class="review-container">
                <span>후기 (후기갯수)</span>
            </div>
            <div class="review-star">
                <!-- 평점 표시를 위한 요소 -->
            </div>
            <div class="detail2-main">
                <div class="address-container">
                    <span class="address-text">상세 주소 입니다 여기는</span>
                </div>
                <button class="copy-button">주소 복사</button>
            </div>
        </div>
    </div>
</body>

</html>