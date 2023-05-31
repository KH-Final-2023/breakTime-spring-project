<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/breaktime/resources/css/header.css">
<link rel="stylesheet" href="/breaktime/resources/css/base.css">
<link rel="stylesheet" href="/breaktime/resources/css/main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js"
	charset="UTF-8"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>BreakTime</title>
<style>
</style>

</head>
<body>



	<div id="wrapper">

		<%@ include file="header.jsp"%>

		<div class="mainContent">
			<div id="backgroundArea">
				<a href=""><img src="/breaktime/resources/images/한옥.jpg"
					id="backImg"></a>
			</div>


		</div>


      <div class="categoryText">
            <span>카테고리 별로 검색해 보세요!</span>
      </div>
      
   <div class="category">
       <div class="categorySubBox" id="hotel">
          <p id="pHotel" >호텔</p>
       </div>
       <div class="categorySubBox" id="motel">
          <p id="pMotel">모텔</p>
       </div>
       <div class="categorySubBox" id="resort">
          <p id="pResort">리조트</p>
       </div>
       <div class="categorySubBox" id="pension">
          <p id="pPension">펜션</p>
       </div>
   </div>



		<div class="rankingText">
			<span>별점 순으로 검색해 보세요!</span>
		</div>



    <div class="ranking">
      <div class="rankingSubBox" id="1st">
      
         </div>
      <div class="rankingSubBox" id="2nd">
      
         </div>
      <div class="rankingSubBox" id="3rd">
      
         </div>
      <div class="rankingSubBox" id="4th">
      
         </div>
  </div>    



   <%@ include file="footer.jsp"%>

</div>
</body>

   <%-- <script>
    $("hotel").click(function(){
          location.href = "<%=request.getContextPath()%>/
       })
   
   </script> --%>







		<div class="ranking">
			<div class="rankingSubBox" id="1st"></div>
			<div class="rankingSubBox" id="2nd"></div>
			<div class="rankingSubBox" id="3rd"></div>
			<div class="rankingSubBox" id="4th"></div>
		</div>




   <%@ include file="footer.jsp"%>

</div>
</body>


<script>
    // jQuery를 사용하여 문서가 완전히 로드된 후에 스크립트 실행
    $(document).ready(function() {
        // "hotel" 카테고리 요소를 클릭했을 때 이벤트 처리
        $("#hotel").click(function() {
            // 리다이렉션할 URL
            var redirectUrl = "<%=request.getContextPath()%>/detail?category=B02010100";
            // 현재 창에서 새 URL로 리다이렉션
            window.location.href = redirectUrl;
        });
    });
    
    $(document).ready(function() {
        // "hotel" 카테고리 요소를 클릭했을 때 이벤트 처리
        $("#motel").click(function() {
            // 리다이렉션할 URL
            var redirectUrl = "<%=request.getContextPath()%>/detail?category=B02010900";
            // 현재 창에서 새 URL로 리다이렉션
            window.location.href = redirectUrl;
        });
    });
    
    $(document).ready(function() {
        // "hotel" 카테고리 요소를 클릭했을 때 이벤트 처리
        $("#resort").click(function() {
            // 리다이렉션할 URL
            var redirectUrl = "<%=request.getContextPath()%>/detail?category=B02010500";
            // 현재 창에서 새 URL로 리다이렉션
            window.location.href = redirectUrl;
        });
    });
    
    $(document).ready(function() {
        // "hotel" 카테고리 요소를 클릭했을 때 이벤트 처리
        $("#pension").click(function() {
            // 리다이렉션할 URL
            var redirectUrl = "<%=request.getContextPath()%>/detail?category=B02010700";
            // 현재 창에서 새 URL로 리다이렉션
            window.location.href = redirectUrl;
        });
    });
</script>

   <%-- <script>
    $("hotel").click(function(){
          location.href = "<%=request.getContextPath()%>/
       })
   
   </script> --%>







</html>