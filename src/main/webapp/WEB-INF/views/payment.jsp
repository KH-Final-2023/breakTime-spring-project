<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="bu.CSS/payment.css">
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
            <div id="paymentManInfo">
                <div id=paymentInfoText style="font-size: x-large;">예약자 정보</div>
                <div>예약자 이름</div>
                <div id="userName"></div>
                <div id="phoneInfo">
                    <div>휴대폰 정보</div>
                    <div id="phoneNumber"></div>
                </div>
            </div>
            <div id="paymentInfo">
                <div>숙소이름</div>
                <div>동백방</div>
                <div>객실타입</div>
                <div>스탠다드</div>
                <div>체크인</div>
                <div>2023.05.31</div>
                <div>체크아웃</div>
                <div>2023.06.02</div>
                <hr>
                <div>총 결제 금액</div>
                <div style="font-size: x-large;">50000원</div>
                <button id="paymentBtn">결제하기</button>
            </div>
        </div>
    </div>
</body>

</html>