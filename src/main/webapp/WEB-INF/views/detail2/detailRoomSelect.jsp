<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실 선택</title>
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
            display: flex;
            justify-content: flex-end;
            padding: 0;
            position: relative;
            flex-wrap: wrap;
        }

        .detail2-all {
            display: flex;
            padding: 0;
            position: relative;
            flex-direction: column;
        }

        .detail2-card {
            width: 384px;
            height: 422px;
            background-color: #ffffff;
            overflow: hidden;
            padding: 20px 30px;
            border: 1px solid #e6e6e6;
        }

        .detail2-card .image {
            width: 100%;
            height: 240px;
            overflow: hidden;
        }

        .detail2-card .image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .detail2-card .title {
            font-size: 18px;
            font-weight: bold;
            margin-top: 10px;
            margin-bottom: 5px;
        }

        .detail2-card .description {
            font-size: 14px;
            color: #777777;
            margin-bottom: 10px;
        }

        .detail2-card .price {
            font-size: 16px;
            font-weight: bold;
        }

        .detail2-card .button:hover {
            background-color: #4CAF50;
        }

        .button-card {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 10px;
        }

        .button-card1 {
            display: inline-block;
            width: 130px;
            padding: 10px 16px;
            background-color: rgb(46, 204, 113);
            color: #ffffff;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            cursor: pointer;
            font-size: 12px;
        }

        .button-card2 {
            display: inline-block;
            width: 130px;
            padding: 10px 16px;
            color: rgb(46, 204, 113);
            ;
            border: 1px solid rgb(46, 204, 113);
            border-radius: 4px;
            text-decoration: none;
            cursor: pointer;
            font-size: 12px;
        }

        .button-container {
            display: flex;
            /* 버튼 위의 여백 크기 */
            justify-content: center;
            align-items: center;
        }

        .button-container .button {
            display: inline-block;
            width: 92%;
            padding: 10px 16px;
            background-color: white;
            color: black;
            border: 1px solid rgba(0, 0, 0, 0.299);
            border-radius: 4px;
            text-decoration: none;
            cursor: pointer;
        }

        /* 가격과 예약하기 정렬 */
        .button-card1,
        .button-card2 {
            text-align: center;
        }

        .detail2-card .price {
            text-align: right;
        }

        .overlay {
            position: fixed;
            top: 100%;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            display: flex;
            justify-content: center;
            align-items: center;
            transition: top 0.3s ease-in-out;
            z-index: 9999;
        }

        .overlay.open {
            top: 0;
        }

        .overlay iframe {
            width: 100%;
            height: 100%;
            border: none;
        }

        .overlay .close-btn {
            position: absolute;
            top: 22px;
            left: 492px;
            font-size: 20px;
            color: black;
            cursor: pointer;
        }
    </style>
    <script>
        $(document).ready(function () {
            var currentUrl = window.location.href;
            var previousUrl = document.referrer;

            $(".button").click(function (e) {
                e.preventDefault();

                var overlay = $("<div>").addClass("overlay");
                var datePicker = $("<iframe>").attr("src", "날짜선택.html");
                var closeBtn = $("<i>")
                    .addClass("fas fa-times close-btn")
                    .css({
                        "animation-name": "reverse-animation",
                        "animation-duration": "0.1s",
                        "animation-timing-function": "ease-in-out"
                    });

                overlay.append(datePicker, closeBtn);
                $(".container").prepend(overlay);

                setTimeout(function () {
                    overlay.addClass("open");
                }, 300);

                closeBtn.click(function () {
                    overlay.removeClass("open");

                    setTimeout(function () {
                        overlay.remove();
                    }, 300);
                });
            });

            $(".close-btn").click(function (e) {
                e.preventDefault();

                if (previousUrl) {
                    window.location.href = previousUrl;
                } else {
                    window.location.href = currentUrl;
                }
            });
        });
    </script>
</head>

<body>
    <div class="container">
        <div class="detail2-all">
            <div class="button-container">
                <a href="#" class="button">날짜</a>
            </div>
            <div class="detail2-main">
                <div class="detail2-card">
                    <div class="image">
                        <img src="https://www.sonohotelsresorts.com/img/front/saupjang/geoje/family06.jpg" alt="숙소 이미지">
                    </div>
                    <h2 class="title">숙소 제목</h2>
                    <p class="description">숙소 설명</p>
                    <p class="price">100,000원~</p>
                    <div class="button-card">
                        <a href="#" class="button-card1">장바구니 담기</a>
                        <a href="#" class="button-card2">객실 선택하기</a>
                    </div>
                </div>
                <div class="detail2-card">
                    <div class="image">
                        <img src="https://www.sonohotelsresorts.com/img/front/saupjang/geoje/family06.jpg" alt="숙소 이미지">
                    </div>
                    <h2 class="title">숙소 제목</h2>
                    <p class="description">숙소 설명</p>
                    <p class="price">120,000원~</p>
                    <div class="button-card">
                        <a href="#" class="button-card1">장바구니 담기</a>
                        <a href="#" class="button-card2">객실 선택하기</a>
                    </div>
                </div>
                <div class="detail2-card">
                    <div class="image">
                        <img src="https://www.sonohotelsresorts.com/img/front/saupjang/geoje/family06.jpg" alt="숙소 이미지">
                    </div>
                    <h2 class="title">숙소 제목</h2>
                    <p class="description">숙소 설명</p>
                    <p class="price">140,000원~</p>
                    <div class="button-card">
                        <a href="#" class="button-card1">장바구니 담기</a>
                        <a href="#" class="button-card2">객실 선택하기</a>
                    </div>
                </div>
                <div class="detail2-card">
                    <div class="image">
                        <img src="https://www.sonohotelsresorts.com/img/front/saupjang/geoje/family06.jpg" alt="숙소 이미지">
                    </div>
                    <h2 class="title">숙소 제목</h2>
                    <p class="description">숙소 설명</p>
                    <p class="price">160,000원~</p>
                    <div class="button-card">
                        <a href="#" class="button-card1">장바구니 담기</a>
                        <a href="#" class="button-card2">객실 선택하기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>