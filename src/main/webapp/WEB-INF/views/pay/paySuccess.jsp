<%@ page language="java" contentType="text/html; charset=UTF-8"
       pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<style>
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

button:focus {
  outline: none;
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
</style>
</head>
<script>

$(document).ready(function() {
  $("#home-button").on("click", function() {
    window.location.href = "${contextPath}";
  });
});
</script>
<body>
   <!-- 메인 부분 -->
   <div class="container-main">
         <div class="detail2-one-main"
            style="height: 350px; text-align: center; display: flex; justify-content: center; flex-direction: column; line-heigth: 10px">
            <i class="fas fa-check-circle"
               style="font-size: 54px; color: rgb(46, 204, 113);; margin-bottom: 16px;"></i>
            <span style="font-size: 20px; color: #1a1a1a;">예약이 완료됐습니다.
               </span> <span style="color: #616161; font-size: 18.5px;">예약내역 페이지에서 확인해보세요.
               </span>
            <div class="select-all"></div>
            <div style="text-align: center;">
               <button id="home-button" style="font-size: 16px; color: #008000; margin-top: 20px; padding: 10px 50px; border: 1px solid #008000; border-radius: 5px; background-color: #ffffff; cursor: pointer;">홈으로 가기</button>
            </div>
         </div>
   </div>

</body>
</html>
