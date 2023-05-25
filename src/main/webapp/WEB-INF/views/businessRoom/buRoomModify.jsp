<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" type="text/css" href="bu.CSS/buRoomModify.css">
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
            <div id="buRoomRegister">객실 등록</div>
            <div id="buRoomReservation">예약 내역</div>
            <div id="buReview">리뷰</div>
        </div>
        <div id="content2">
            <div id="roomModifyText1" style="font-size: x-large; margin: 15px;">객실 수정</div>

            <div id="ModifyroomName">객실 이름 : </div>
            <div><input placeholder=" 수정할 객실 이름을 입력해주세요"></div>
            <div id="ModifyroomPrice">가격 : </div>
            <div><input placeholder=" 수정할 객실 이름을 입력해주세요"></div>

            
            <div id="ModifyroomStandardInfoText">수정 객실 기본 정보</div>
            <div><textarea></textarea></div>
            <div id="ModifyroomPhotoInfoText">수정 객실 사진 등록</div>
            <div><input type="file" multiple style="height: 150px;"></div>
            <div><button id="resisterBtn">수정하기</button></div>
        </div>
    </div>
</body>
</html>