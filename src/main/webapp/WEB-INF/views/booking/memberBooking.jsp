<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.kh.breaktime.booking.model.vo.Booking"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">   
   <link rel="stylesheet" type="text/css" href="/breaktime/resources/room.css/buReservation.css">
    <title>Document</title>
     <!--  공통적으로사용할 라이브러리 추가 -->
    <!-- Jquey 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩에서 제공하있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부투스트랩에서 제공하고있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- alertify -->
    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
    <!-- alertify css -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
    <!-- Default theme -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
    <!-- Semantic UI theme -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
</head>
<style>

.reviewModal{
    position: fixed;
    bottom: 5%;
    left: 0;
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    z-index : 1;
    
}


.reviewModal .reviewBg{
    width: 100%;
    height: 1000%;
    background-color: rgba(0, 0, 0, 0.6);
}



.reviewModal .reviewCloseBtn {
    position: absolute;
    top: 10px;
    right: 25px;
    background-color: #fff;
    border: none;
    font-size: 24px;
}


.modalBox {
    position: absolute;
    background-color: #fff;
    width: 450px;
    height: 550px;
    border-radius: 16px;
    
}
.modalBox .reviewHeader{
    width: 100%;
    height: 29px;
    display: flex;
    justify-content: center;
    align-items: center;
}
.modalBox .reviewBody{
    width: 500px;
    height: 150px;
    padding: 20px 20px;
}

#search-input{
	width: 430px;
	height: 45px;
}


.hidden {
    display: none;
}

#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform fieldset legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewContents {
    width: 400px;
    height: 350px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}



</style>

<body>
<%--  <%@ include file="../header.jsp"%> --%>

    <div id="content">
      <div id="content1">
         <form action="/breaktime/businessRoom/resister" method="GET">
            <button type="submit" id="buRoomRegister">객실 등록</button>
         </form>
         <form action="/breaktime/business/reservation" method="GET">
            <button type="submit" id="buRoomReservation">예약 내역</button>
         </form>
         <form action="/breaktime/business/review" method="GET">
            <button type="submit" id="buReview">리뷰</button>
         </form>
      </div>
        <div id="content2">
        <div style="font-size: xx-large; margin: 50px; margin-bottom: 70px;">예약 내역</div>
        <hr style="background-color: black; width: 100%;">
        <div id="reservationList">
           <table class="table table-hover" style="width:1800px;">
                  <thead>
                     <tr>
                        <th>객실이름</th>
                        <th>이용인원수</th>
                        <th>예약번호</th>
                        <th>체크인</th>
                        <th>체크아웃</th>
                        <th>예약상태</th>
                        <th>리뷰작성</th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:forEach items="${bookingList}" var="booking">
                        <tr>
                           <td>${booking.roomName}</td>
                           <td>${booking.roomHCount}</td>
                           <td>${booking.reservationNo}</td>
                           <td>
                              <button id="update-btn" type="submit"
                                    class="btn btn-outline-primary" 
                                    data-toggle="modal">
                                    <span>입실전</span>
                              </button>
                           </td>
                           <td>
                                 <button type="button" class="btn btn-outline-danger">
                                    <span>퇴실전</span>
                              </a>
                           </td>
                           <td>
                                 <button type="button" class="btn btn-outline-success">
                                    <span>예약전</span>
                                 </button>
                           </td>
                          <td>
                                 <button type="button" class="btn btn-outline-success" id="reviewOpenBtn">
                                    <span>리뷰작성</span>
                                 </button>
                           </td>
                        </tr>
                         </c:forEach>
                        </tbody>
               </table>
           <!--  <div>객실이름</div>
            <div>이용인원수</div>
            <div>예약번호</div>
            <div>체크인</div>
            <div>체크아웃</div>
            <div>예약상태</div> -->
        </div>
        <hr style="width: 100%;">
        <%-- bookingList는 서버에서 받은 Booking 정보를 담고 있는 List 객체 --%>
     <%--   <div>
    <c:forEach items="${bookingList}" var="booking">
            <div>${booking.roomName}</div>
            <div>${booking.roomHCount}</div>
            <div>${booking.reservationNo}</div>
            <div>${booking.roomCheckin}</div>
            <div>${booking.roomCheckout}</div>
            <div>${booking.status}</div>
            <hr style="width: 100%;">
        </c:forEach>
    </div> --%>
    </div>
    
    <div class="reviewModal hidden">
            <div class="reviewBg"></div>
            <div class="modalBox">
				<button class="reviewCloseBtn">X</button>
				<div class="reviewHeader">
					<p>리뷰</p>
				</div>
				<div class="reviewBody">
					<form class="mb-3" name="myform" id="myform" method="post">
                        <fieldset>
                            <input type="radio" name="reviewStar" value="5" id="rate1"><label
								for="rate1">★</label>
							<input type="radio" name="reviewStar" value="4" id="rate2"><label
								for="rate2">★</label>
							<input type="radio" name="reviewStar" value="3" id="rate3"><label
								for="rate3">★</label>
							<input type="radio" name="reviewStar" value="2" id="rate4"><label
								for="rate4">★</label>
							<input type="radio" name="reviewStar" value="1" id="rate5"><label
								for="rate5">★</label>
                        </fieldset>
                        <div>
                            <textarea class="col-auto form-control" type="text" id="reviewContents"
                                      placeholder="breaktime 리뷰를 남겨주세요"></textarea>
                        </div>
                    </form>
                    <input type="submit" value="리뷰작성" id="reviewCommit">
				</div>
            </div>
        </div>
        
        
        <script>
            const open = () => {
                document.querySelector(".reviewModal").classList.remove("hidden");
                
            }
            const close = () => {
				console.log('cdlose')
                document.querySelector(".reviewModal").classList.add("hidden");
            }
            document.querySelector("#reviewOpenBtn").addEventListener("click", open); 
            document.querySelector(".reviewCloseBtn").addEventListener("click", close); 
            document.querySelector(".reviewBg").addEventListener("click", close); 

        </script>
</body>

</html>