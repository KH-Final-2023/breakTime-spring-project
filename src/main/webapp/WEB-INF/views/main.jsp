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
<link rel="stylesheet" href="/breaktime/resources/css/font.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<title>BreakTime</title>
<style>
   

</style>

</head>
<body>

   <div id="wrapper">

      <%@ include file="header.jsp"%>

      <!-- <div class="mainContent">
         <div id="backgroundArea">
            <a href=""><img src="/breaktime/resources/images/한옥.jpg" id="backImg"></a>
         </div>
      </div> -->

   <div class="slideshow-container">

     <div class="mySlideDiv fade active">
        <a href=""><img src="/breaktime/resources/images/메인배너1.jpg" id="backImg"></a>
     </div>
            
     <div class="mySlideDiv fade">
         <a href=""><img src="/breaktime/resources/images/모텔.jpg" id="backImg"></a> 
     </div>
            
     <div class="mySlideDiv fade">
         <a href=""><img src="/breaktime/resources/images/리조트.jpg" id="backImg"></a>
     </div>

     <!-- <a class="prev" onclick="prevSlide()">&#10094;</a>
     <a class="next" onclick="nextSlide()">&#10095;</a> -->
            
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
         <span>여름 휴가 지역 추천!</span>
      </div>


    <div class="area">
      <div class="areaSubBox" id="seoul">
         <p id="pSeoul" >서울</p>
         </div>
      <div class="areaSubBox" id="busan">
         <p id="pBusan" >부산</p>
         </div>
      <div class="areaSubBox" id="gangwon">
         <p id="pGangwon" >강원도</p>
         </div>
      <div class="areaSubBox" id="jeju">
         <p id="pJeju" >제주도</p>
         </div>
  	</div> 
  	
  	
  	
  	 <!-- <div class="th">
      <div class="box1" id="th1">
      
         </div>
      <div class="box2" id="th2">
         <p id="goNotice" >사장님 회원가입하기</p>
         </div>
      <div class="box1" id="th3">
      
         </div>
      <div class="box2" id="th4">
         <p id="goBus" >Break Time 공지사항</p>
         </div>
  	</div>  -->
  	
  	
  	
  
  
     <div class="bottom-slideshow-container">

     <div class="bottom-mySlideDiv bottom-fade bottom-active">
        <a href=""><img src="/breaktime/resources/images/하단배너.jpg" id="bottom-backImg"></a>
     </div>
            
     <div class="bottom-mySlideDiv bottom-fade">
         <a href=""><img src="/breaktime/resources/images/하단배너.jpg" id="bottom-backImg"></a> 
     </div>
            
     <div class="bottom-mySlideDiv bottom-fade">
         <a href=""><img src="/breaktime/resources/images/하단배너.jpg" id="bottom-backImg"></a>
     </div>

            
</div>  
       



   <%@ include file="footer.jsp"%>

</div>
</body>
<script>
$(document).ready(function() {
    // "hotel" 카테고리 요소를 클릭했을 때 이벤트 처리
    $("#seoul").click(function() {
        // 리다이렉션할 URL
        var redirectUrl = "<%=request.getContextPath()%>/list/marea/1";
        // 현재 창에서 새 URL로 리다이렉션
        window.location.href = redirectUrl;
    });
});



$(document).ready(function() {
    // "hotel" 카테고리 요소를 클릭했을 때 이벤트 처리
    $("#seoul").click(function() {
        // 리다이렉션할 URL
        var redirectUrl = "<%=request.getContextPath()%>/list/marea/1";
        // 현재 창에서 새 URL로 리다이렉션
        window.location.href = redirectUrl;
    });
});



$(document).ready(function() {
    // "hotel" 카테고리 요소를 클릭했을 때 이벤트 처리
    $("#busan").click(function() {
        // 리다이렉션할 URL
        var redirectUrl = "<%=request.getContextPath()%>/list/marea/6";
        // 현재 창에서 새 URL로 리다이렉션
        window.location.href = redirectUrl;
    });
});

$(document).ready(function() {
    // "hotel" 카테고리 요소를 클릭했을 때 이벤트 처리
    $("#gangwon").click(function() {
        // 리다이렉션할 URL
        var redirectUrl = "<%=request.getContextPath()%>/list/marea/32";
        // 현재 창에서 새 URL로 리다이렉션
        window.location.href = redirectUrl;
    });
});

$(document).ready(function() {
    // "hotel" 카테고리 요소를 클릭했을 때 이벤트 처리
    $("#jeju").click(function() {
        // 리다이렉션할 URL
        var redirectUrl = "<%=request.getContextPath()%>/list/marea/39";
        // 현재 창에서 새 URL로 리다이렉션
        window.location.href = redirectUrl;
    });
});


</script>



<script>
    // jQuery를 사용하여 문서가 완전히 로드된 후에 스크립트 실행
    $(document).ready(function() {
        // "hotel" 카테고리 요소를 클릭했을 때 이벤트 처리
        $("#hotel").click(function() {
            // 리다이렉션할 URL
            var redirectUrl = "<%=request.getContextPath()%>/list/detail/B02010100";
            // 현재 창에서 새 URL로 리다이렉션
            window.location.href = redirectUrl;
        });
    });
    
    $(document).ready(function() {
        // "hotel" 카테고리 요소를 클릭했을 때 이벤트 처리
        $("#motel").click(function() {
            // 리다이렉션할 URL
            var redirectUrl = "<%=request.getContextPath()%>/list/detail/B02010900";
            // 현재 창에서 새 URL로 리다이렉션
            window.location.href = redirectUrl;
        });
    });
    
    $(document).ready(function() {
        // "hotel" 카테고리 요소를 클릭했을 때 이벤트 처리
        $("#resort").click(function() {
            // 리다이렉션할 URL
            var redirectUrl = "<%=request.getContextPath()%>/list/detail/B02010500";
            // 현재 창에서 새 URL로 리다이렉션
            window.location.href = redirectUrl;
        });
    });
    
    $(document).ready(function() {
        // "hotel" 카테고리 요소를 클릭했을 때 이벤트 처리
        $("#pension").click(function() {
            // 리다이렉션할 URL
            var redirectUrl = "<%=request.getContextPath()%>/list/detail/B02010700";
            // 현재 창에서 새 URL로 리다이렉션
            window.location.href = redirectUrl;
        });
    });
</script>

  
  
  
  
  
  
  <script type="text/javascript">

$(document).ready(function () {
   $(".mySlideDiv").not(".active").hide(); //화면 로딩 후 첫번째 div를 제외한 나머지 숨김
   
   setInterval(nextSlide, 4000); //4초(4000)마다 다음 슬라이드로 넘어감
});

//이전 슬라이드
function prevSlide() {
   $(".mySlideDiv").hide(); //모든 div 숨김
   var allSlide = $(".mySlideDiv"); //모든 div 객체를 변수에 저장
   var currentIndex = 0; //현재 나타난 슬라이드의 인덱스 변수
   
   //반복문으로 현재 active클래스를 가진 div를 찾아 index 저장
   $(".mySlideDiv").each(function(index,item){ 
      if($(this).hasClass("active")) {
         currentIndex = index;
      }
        
   });
   
   //새롭게 나타낼 div의 index
   var newIndex = 0;
    
   if(currentIndex <= 0) {
      //현재 슬라이드의 index가 0인 경우 마지막 슬라이드로 보냄(무한반복)
      newIndex = allSlide.length-1;
   } else {
      //현재 슬라이드의 index에서 한 칸 만큼 뒤로 간 index 지정
      newIndex = currentIndex-1;
   }

   //모든 div에서 active 클래스 제거
   $(".mySlideDiv").removeClass("active");
    
   //새롭게 지정한 index번째 슬라이드에 active 클래스 부여 후 show()
   $(".mySlideDiv").eq(newIndex).addClass("active");
   $(".mySlideDiv").eq(newIndex).show();

}

//다음 슬라이드
function nextSlide() {
   $(".mySlideDiv").hide();
   var allSlide = $(".mySlideDiv");
   var currentIndex = 0;
   
   $(".mySlideDiv").each(function(index,item){
      if($(this).hasClass("active")) {
         currentIndex = index;
      }
        
   });
   
   var newIndex = 0;
   
   if(currentIndex >= allSlide.length-1) {
      //현재 슬라이드 index가 마지막 순서면 0번째로 보냄(무한반복)
      newIndex = 0;
   } else {
      //현재 슬라이드의 index에서 한 칸 만큼 앞으로 간 index 지정
      newIndex = currentIndex+1;
   }

   $(".mySlideDiv").removeClass("active");
   $(".mySlideDiv").eq(newIndex).addClass("active");
   $(".mySlideDiv").eq(newIndex).show();
   
}

</script>


 <script type="text/javascript">

$(document).ready(function () {
   $(".bottom-mySlideDiv").not(".bottom-active").hide(); //화면 로딩 후 첫번째 div를 제외한 나머지 숨김
   
   setInterval(bottomNextSlide, 4000); //4초(4000)마다 다음 슬라이드로 넘어감
});

//이전 슬라이드
function bottomPrevSlide() {
   $(".bottom-mySlideDiv").hide(); //모든 div 숨김
   var allSlide = $(".bottom-mySlideDiv"); //모든 div 객체를 변수에 저장
   var currentIndex = 0; //현재 나타난 슬라이드의 인덱스 변수
   
   //반복문으로 현재 active클래스를 가진 div를 찾아 index 저장
   $(".bottom-mySlideDiv").each(function(index,item){ 
      if($(this).hasClass("bottom-active")) {
         currentIndex = index;
      }
        
   });
   
   //새롭게 나타낼 div의 index
   var newIndex = 0;
    
   if(currentIndex <= 0) {
      //현재 슬라이드의 index가 0인 경우 마지막 슬라이드로 보냄(무한반복)
      newIndex = allSlide.length-1;
   } else {
      //현재 슬라이드의 index에서 한 칸 만큼 뒤로 간 index 지정
      newIndex = currentIndex-1;
   }

   //모든 div에서 active 클래스 제거
   $(".bottom-mySlideDiv").removeClass("bottom-active");
    
   //새롭게 지정한 index번째 슬라이드에 active 클래스 부여 후 show()
   $(".bottom-mySlideDiv").eq(newIndex).addClass("bottom-active");
   $(".bottom-mySlideDiv").eq(newIndex).show();

}

//다음 슬라이드
function bottomNextSlide() {
   $(".bottom-mySlideDiv").hide();
   var allSlide = $(".bottom-mySlideDiv");
   var currentIndex = 0;
   
   $(".bottom-mySlideDiv").each(function(index,item){
      if($(this).hasClass("bottom-active")) {
         currentIndex = index;
      }
        
   });
   
   var newIndex = 0;
   
   if(currentIndex >= allSlide.length-1) {
      //현재 슬라이드 index가 마지막 순서면 0번째로 보냄(무한반복)
      newIndex = 0;
   } else {
      //현재 슬라이드의 index에서 한 칸 만큼 앞으로 간 index 지정
      newIndex = currentIndex+1;
   }

   $(".bottom-mySlideDiv").removeClass("bottom-active");
   $(".bottom-mySlideDiv").eq(newIndex).addClass("bottom-active");
   $(".bottom-mySlideDiv").eq(newIndex).show();
   
}

</script>






<!-- <script>
   document.addEventListener('DOMContentLoaded', function() {
      var mySwiper = new Swiper('.swiper-container', {
         slidesPerView : 3,
         slidesPerGroup : 3,
         observer : true,
         observeParents : true,
         spaceBetween : 24,
         navigation : {
            nextEl : '.swiper-button-next',
            prevEl : '.swiper-button-prev',
         },
         breakpoints : {
            1280 : {
               slidesPerView : 3,
               slidesPerGroup : 3,
            },
            720 : {
               slidesPerView : 1,
               slidesPerGroup : 1,
            }
         }
      });
   });
</script> -->



</html>