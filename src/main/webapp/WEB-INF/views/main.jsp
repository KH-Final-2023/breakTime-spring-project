<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/header.css">
    <link rel="stylesheet" href="resources/css/base.css">
    <link rel="stylesheet" href="resources/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js" charset = "UTF-8"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <title>Document</title>

</head>
<body>

<div id="wrapper">

	<%@ include file="header.jsp"%>

    <div class="mainContent">
        <div id="backgroundArea">
            <a href=""><img src="/${contextPath}/resources/images/한옥.jpg" id="backImg"></a>
        </div>
    
    </div>

      <div class="categoryText">
            <span>모든 유형의 휴가 숙소</span><br>
            <span>충분한 공간을 제공하는 숙소를 찾아보세요.</span>
      </div>
      
<div class="category">
    <div class="categorySubBox" id="hotel"></div>
    <div class="categorySubBox" id="motel"></div>
    <div class="categorySubBox" id="resort"></div>
    <div class="categorySubBox" id="pension"></div>
</div>

    <div class="rankingText">
      <span>최고 평점을 받은 한국의 휴가 숙소</span><br>
      <span>충분한 공간을 제공하는 숙소를 찾아보세요.</span>
    </div>

    <div class="ranking">
      <div class="rankingSubBox" id="1st"></div>
      <div class="rankingSubBox" id="2nd"></div>
      <div class="rankingSubBox" id="3rd"></div>
      <div class="rankingSubBox" id="4th"></div>
  </div>    




    <div class="footer">




    </div>






</div>
</body>










</html>