<%@ page language="java" contentType="text/html; charset=UTF-8"
       pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/error.css">
</head>
<script>
document.addEventListener('DOMContentLoaded', function() {
    var homeButton = document.getElementById('home-button');
    
    if (homeButton) {
        homeButton.addEventListener('click', function() {
            window.history.back(); // 브라우저의 히스토리를 뒤로 이동
        });
    }
});
</script>
<body>
   <div class="container-main">
         <div class="detail2-one-main"
            style="height: 350px; text-align: center; display: flex; justify-content: center; flex-direction: column; line-heigth: 10px">
            <i class="fas fa-exclamation-circle"
               style="font-size: 54px; color: rgb(46, 204, 113);; margin-bottom: 16px;"></i>
            <span style="font-size: 20px; color: #1a1a1a; margin-bottom: 18px;">페이지를 찾을 수 없습니다.
               </span> <span style="color: #6161619a; font-size: 15.5px;">페이지가 존재하지 않거나, 사용할 수 없는 페이지입니다.
               </span><span style="color: #6161619a; font-size: 15.5px;">입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.
            </span>
            <div class="select-all"></div>
            <div style="text-align: center;">
               <button id="home-button" style="font-size: 16px; color: #008000; margin-top: 20px; padding: 10px 50px; border: 1px solid #008000; border-radius: 5px; background-color: #ffffff; cursor: pointer;">홈으로 가기</button>
            </div>
         </div>
   </div>
</body>
</html>