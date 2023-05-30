<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>메인</title>
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

        .container-main {
            max-width: 768px;
            margin: 0 auto;
            background-color: #fff;
            /* 컨테이너 배경색상 */

        }

        .detail2-one-main {
            padding: 0 2rem;
        }

        .main-image {
            width: 100%;
            height: auto;
            margin-bottom: 10px;
        }

        .company-info {
            display: flex;
        }

        .company-name {
            font-size: 20px;
            font-weight: bold;
        }

        .icons {
            margin-left: auto;
        }

        .icon {
            font-size: 24px;
            margin-left: 10px;
            color: #333;
            cursor: pointer;
        }

        .icon.red {
            color: #ff0000;
        }

        .rating {
            display: flex;
            align-items: center;
            margin-top: 3px;
            text-decoration: none;
        }

        .stars {
            color: rgba(255, 204, 0, 0.852);
            margin-right: 5px;
        }

        .score {
            font-size: 14px;
            color: #333;
        }

        .location {
            display: flex;
            align-items: center;
            margin-top: 10px;
            padding-bottom: 15px;
        }

        .map-link {
            display: inline-block;
            color: #0000ff86;
            text-decoration: none;
            margin-right: 5px;
        }

        .map-icon {
            font-size: 16px;
            margin-right: 5px;
        }

        .address {
            font-size: 13px;
            color: #0000ff86;
        }

        .section {
            margin-top: 10px;
            height: 40px;
            line-height: 40px;
            padding: 0 2rem;
            border-bottom: 1px solid #8888883b;
        }

        #section-content {
            margin-top: 20px;
        }

        .detail2-select {
            max-width: 768px;
            margin: 0 auto;
            background-color: #fff;
        }

        .section-link {
            font-size: 16px;
            text-decoration: none;
            margin-right: 10px;
            text-underline-offset: 13px;
            color: #333333c7;
            transition: color 0.3s;
            position: relative;
        }

        .section-link::after {
            content: "";
            position: absolute;
            left: 0;
            bottom: -12px;
            width: 100%;
            height: 2px;
            background-color: #8888883b;
            visibility: hidden;
            transition: visibility 0s ease-in-out, background-color 0.3s ease-in-out;
        }

        .section-link.active {
            color: #0000ff;
        }

        .section-link.active::after {
            visibility: visible;
            background-color: #0000ff;
        }
    </style>

    <script>
        $(document).ready(function () {
            // 공유 아이콘 클릭 시 페이지 링크 복사
            $(".share-icon").click(function () {
                var pageUrl = window.location.href;
                navigator.clipboard.writeText(pageUrl);
                alert("페이지 링크가 복사되었습니다!");
            });
            // 하트 아이콘 클릭 시 색상 변경
            $(".heart-icon").click(function () {
                $(this).toggleClass("far fa-heart");
                $(this).toggleClass("fas fa-heart");
                $(this).toggleClass("red"); // 빨간색 클래스 추가 및 제거
            });

            // 섹션 링크 클릭 시 스타일 변경
            $(".section-link").click(function (e) {
                e.preventDefault();
                $(".section-link").removeClass("active"); // 모든 링크의 active 클래스 제거
                $(this).addClass("active"); // 클릭한 링크에 active 클래스 추가
            });

            // 섹션 링크 클릭 시 비동기식으로 JSP 로드
            $(".section-link, .rating").click(function (e) {
                e.preventDefault();
                var target = $(this).attr("href");
                $("#section-content").load(target);
            });

            // 별점 리뷰갯수 클릭 시 비동기식으로 리뷰/후기 섹션 로드 및 스타일 변경
            $(".rating").click(function (e) {
                e.preventDefault();
                var target = "후기.html"; // 로드할 페이지 경로
                $("#section-content").load(target);
                $(".section-link").removeClass("active"); // 모든 링크의 active 클래스 제거
                $(".section-link[href='후기.html']").addClass("active"); // 후기 섹션 링크에 active 클래스 추가
            });

            // 객실선택.html 페이지 자동로드
            var target = "객실선택.html";
            $("#section-content").load(target);
        });


    </script>
</head>

<body>
    <!-- 메인 부분 -->
    <div class="container-main">
        <!-- 업체 메인 객실 이미지 -->
        <img class="main-image" src="https://www.sonohotelsresorts.com/img/front/saupjang/geoje/family06.jpg"
            alt="업체 메인 객실 이미지">

        <!-- 업체 정보 -->
        <div class="detail2-one-main">
            <div class="company-info">
                <h1 class="company-name">부천인데 강릉 강릉 강릉 HOTEL KR</h1>
                <div class="icons">
                    <i class="icon share-icon fas fa-share-alt" title="공유하기"></i>
                    <i class="icon heart-icon far fa-heart" title="찜하기"></i>
                </div>
            </div>
            <a href="후기.html" class="rating">
                <span class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </span>
                <span class="score"><b>4.5 (리뷰갯수)</b></span>
            </a>

            <!-- 주소와 지도 표시 -->
            <div class="location">
                <a class="map-link" href="https://maps.google.com/maps?q=경기도 부천시 송내동 경인로169번길 571-12" target="_blank">
                    <i class="fas fa-map-marker-alt"></i>
                    <span class="address">경기도 부천시 송내동 경인로169번길 571-12</span>
                </a>
            </div>
        </div>
    </div>
    <div class="detail2-select">
        <!-- 섹션 선택 영역 -->
        <div class="section">
            <a class="section-link" href="객실선택.html">객실 선택</a>
            <a class="section-link" href="위치.html">위치 정보</a>
            <a class="section-link" href="후기.html">리뷰 / 후기</a>
        </div>

        <!-- 섹션 내용 영역 -->
        <div id="section-content">
            <!-- 객실선택.html 페이지가 자동으로 로드될 것입니다. -->
        </div>
    </div>
</body>

</html>