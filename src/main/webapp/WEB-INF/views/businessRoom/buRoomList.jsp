<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">   
   <link rel="stylesheet" type="text/css" href="/breaktime/resources/css/buRoomList.css">
    <title>Document</title>
</head>

<body>
    <div id="header">
        <div id="header-content">
            <div id="home-logo">
                <img src="resources/IMG/로고.jpg" alt="로고이미지">
            </div>
            <div id="navbar">
                <div id="login">로그인</div>
                <div id="enroll">회원가입</div>
                <div id="notice">공지사항</div>
                <div id="mypage">마이페이지</div>
                <div id="mybooking">예약내역</div>
                <div id="wishList">
                    장바구니
                </div>
                <div id="message">
                    쪽지
                </div>
            </div>
        </div>
    </div>
    <div id="content">
		     <div id="content1">
		     <form action="/breaktime/businessRoom/register" method="GET">
   				 <button type="submit" id="buRoomRegister">객실 등록</button>
			</form>
		    <form action="/breaktime/businessRoom/reservation" method="GET">
		        <button type="submit" id="buRoomReservation">예약 내역</button>
		    </form>
		    <form action="/breaktime/businessRoom/review" method="GET">
		        <button type="submit" id="buReview">리뷰</button>
		    </form>
		</div>
        <div id="content2">
            <div id="resistedRoomListText">등록한 객실 리스트</div>
            <hr>
            <div id="lodging">
                <div id="lodging1">
                    <diV id="lodgingImg1"><img src="images/hotel1.jpg"></diV>
                    <div id="lodgingInfo1">
                        <div id="lodgingInfoName1">이름:동백방</div>
                        <div id="lodgingInfoMan1">인원:2</div>
                        <div id="lodgingInfoPrice1">가격:250000</div>
                    </div>
                </div>
                <div id="lodging2">
                <diV id="lodgingImg2"><img src="images/hotel2.jpg "></diV>
                <div id="lodgingInfo2">
                    <div id="lodgingInfoName2">이름:동백방</div>
                    <div id="lodgingInfoMan2">인원:2</div>
                    <div id="lodgingInfoPrice2">가격:250000</div> 
                </div>
            </div>
            </div>
        </div>
    </div>
    
		
</body>

</html>