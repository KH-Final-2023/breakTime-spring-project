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
                <img src="resources/images/로고.png" alt="로고이미지">
            </div>
            <div id="navbar">
                 <form action="/breaktime/business/login" method="GET">
   				 <button type="submit" id="businesselogin">로그인</button>
			</form>
               
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
                <div class="search-wrapper">
    			<div class="input-holder">
        			<input type="text" class="search-input" placeholder="Type to search" />
        			<button class="search-icon" onclick="searchToggle(this, event);"><span></span></button>
    			</div>
    				<span class="close" onclick="searchToggle(this, event);"></span>
			 </div>
            </div>
        </div>
    </div>
    
    <script>
    function searchToggle(obj, evt){
    var container = $(obj).closest('.search-wrapper');
        if(!container.hasClass('active')){
            container.addClass('active');
            evt.preventDefault();
        }
        else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
            container.removeClass('active');
            // clear input
            container.find('.search-input').val('');
        }
}
    </script>
    
</body>
</html>