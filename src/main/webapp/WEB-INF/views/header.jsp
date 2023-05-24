<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/header.css">
    <title>Document</title>
</head>
<body>
    <div id="header">
        <div id="header-content">
            <div id="home-logo">
                <img src="resources/IMG/로고.png" alt="로고이미지">
            </div>
            <div id="navbar">
                <div id="search">
                  <img src="resources/IMG/돋보기.png" alt="검색">
                </div>
                <div id="login">로그인</div>
                <div id="mybooking">예약내역</div>
                <div class="dropdown">
                  <span class="dropbtn">더보기</span>
                  <div class="dropdown-content">
                    <a href="#">공지사항</a>
                    <a href="#">마이페이지</a>
                    <a href="#">쪽지함</a>
                    <a href="#">장바구니</a>
                  </div>
                </div> 
            </div>
        </div>
    </div>
    
</body>
</html>