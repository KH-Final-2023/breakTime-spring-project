# BREAKTIME
최종 프로젝트 여행가조

> ## 팀원

- [한동휘(조장)](#한동휘---NOTION-참조)
- [손석범](#손석범---NOTION-참조)
- [엄태환](#엄태환---NOTION-참조)
- [이규정](#이규정---NOTION-참조)
- [이준석](#이준석---NOTION-참조)
- [이충영](#이충영---NOTION-참조)

---

> ## 프로젝트 소개

### 숙박예약 사이트

고객들이 다양한 종류의 숙박업소와
다양한 가격대의 옵션들 중에서 자신의 필요에 맞는
선택을 할수 있도록 하기 위한 웹페이지 구현

- [[PPT] 링크](https://www.miricanvas.com/v/11ytu1c) / <a href="./SEMI_MZ/WebContent/resource/etc/MZONE_PPT.pdf" download="Mzone.pdf">[PPT] 다운로드</a>

- 회원
  [![회원](./SEMI_MZ/WebContent/resource/etc/video/member.gif)](#프로젝트-소개)

- 사업자
  [![광장](./SEMI_MZ/WebContent/resource/etc/video/square.gif)](#프로젝트-소개)

- 상세페이지1
  [![마이룸](./SEMI_MZ/WebContent/resource/etc/video/myroom.gif)](#프로젝트-소개)

- 상세페이지2
  [![미니게임](./SEMI_MZ/WebContent/resource/etc/video/minigame.gif)](#프로젝트-소개)

- 결제
  [![미니게임](./SEMI_MZ/WebContent/resource/etc/video/minigame.gif)](#프로젝트-소개)

- 리뷰
  [![미니게임](./SEMI_MZ/WebContent/resource/etc/video/minigame.gif)](#프로젝트-소개)

- 관리자
  [![관리자](./SEMI_MZ/WebContent/resource/etc/video/admin.gif)](#프로젝트-소개)

<br>

---

> ## 주요 기능

- 회원

  - 로그인
  - 회원가입
  - 회원정보 수정
  - 아이디 찾기
  - 로그아웃
  - 회원 탈퇴
  - 찜 목록
  - 문의 채팅

- 사업자

  - 숙소 조회/등록/수정/삭제
  - 사업자 리뷰 댓글 등록
  - 회원 리뷰 신고
  - 예약 확인

- 상세페이지1

  - 한국 관광공사 API 
  - 카카오맵  API
  - 필터링 기능
  - 숙박업소 리스트

- 상세페이지2

  - ChatGpt API
  - 카카오맵 API
  - 장바구니
  - 리뷰 정렬
  - 캘린더 날짜 선택
  - 찜 추가/삭제
  - 업체별 리뷰 평균 별점
  - 객실 리스트

- 결제

   - 토스 API
   - 구매 목록 리스트

- 리뷰

   - 리뷰 별점/내용 등록
   - 리뷰 등록 제한
     
- 관리자
  
  - 공지사항 관리
  - 사업자 승인/정보 관리
  - 신고 리뷰 관리
  - 문의 채팅
 

---

> ## 담당 기능

## 공통


- SQL
  - [BREAKTIME.sql](https://www.notion.so/SQL-a6a77827207247588b7dc8d5c3296564) : 기본 테이블 세팅용 SQL
  - [BREAKTIME_INSERT.sql](https://www.notion.so/70e57d0042d74b519de19cdfd9674765) : 기본 데이터 세팅용 SQL
  - [testData.sql](https://www.notion.so/b8fbb8523e814d2396292c9a41e45a4f) : 테스트 데이터 세팅용 SQL

---

## 엄태환 - [NOTION](https://www.notion.so/7fe9754672944f26a88b0dd34076fb33) 참조

- 메인 페이지

  - [Main.jsp](src/main/webapp/WEB-INF/views/main.jsp) : 메인 view 페이지

  - 숙소 검색
    - [header.jsp](src/main/webapp/WEB-INF/views/header.jsp) : 검색 기능
    - [searchdetailList.java](src/main/java/com/kh/breaktime/detail/controller/DetailController.java) : 조건에 따라 검색
   
  - 결제
    - [pay.jsp](src/main/webapp/WEB-INF/views/pay/pay.jsp) : API 결제 view 페이지
    - [insertBooking.java](src/main/java/com/kh/breaktime/booking/controller/BookingController.java) : 결제 후 예약기능

---

## 손석범 - [NOTION](https://www.notion.so/7c291a057eaf4e5bb394dfa66690ddff) 참조

- 로그인

  - [memberEnrollForm.jsp](src/main/webapp/WEB-INF/views/member/memberEnrollForm.jsp) : 일반고객 회원가입 view 페이지
  - [insertMember.java](src/main/java/com/kh/breaktime/member/controller/MemberController.java) : 일반고객 로그인 처리
  - [businessEnrollForm.jsp](src/main/webapp/WEB-INF/views/business/businessEnrollForm.jsp) : 사업자 회원가입 view 페이지
  - [insertBusiness.java](./SEMI_MZ/src/mz/square/controller/blockCheckController.java) : 사업자 로그인 처리
  
  - 마이페이지
    - [myPage.jsp](src/main/webapp/WEB-INF/views/member/myPage.jsp) : 마이페이지 view
    - [deleteMember.java](src/main/java/com/kh/breaktime/member/controller/MemberController.java) : 회원 탈퇴 처리
    - [updateId.java](src/main/java/com/kh/breaktime/member/controller/MemberController.java) : 회원 아이디 수정
    - [findId.java](src/main/java/com/kh/breaktime/member/controller/MemberController.java) : 아이디 찾기
    - [wishList.java](src/main/java/com/kh/breaktime/member/controller/MemberController.java) : 찜 목록

---

## 이준석 - [NOTION](https://www.notion.so/bb11e3822288426fb657965eb0c4c706) 참조

- 사업자

  - [selectBuRoomList.java](src/main/java/com/kh/breaktime/room/controller/RoomController.java) : 객실 리스트
  - [registerBuRoom.jsp](src/main/webapp/WEB-INF/views/businessRoom/buRoomEnroll.jsp) : 객실 등록 
  - [updateBuRoom.java](src/main/java/com/kh/breaktime/room/controller/RoomController.java) : 객실 정보 수정
  - [searchRooms.java](src/main/java/com/kh/breaktime/room/controller/RoomController.java) : 객실 검색
  - [deleteRoom.java](src/main/java/com/kh/breaktime/room/controller/RoomController.java) : 객실 삭제
  - [buReview.jsp](src/main/webapp/WEB-INF/views/businessRoom/buReview.jsp) : 사업자 댓글 등록 / 리뷰 신고
  
---

## 이규정 - [NOTION](https://www.notion.so/59c4b515199f4a67aca760aa12451a21) 참조

- 상세페이지1
  - [detail.jsp](src/main/webapp/WEB-INF/views/detail/detail.jsp) : 상세1 view 페이지
  - [ApiController.java](src/main/java/com/kh/breaktime/api/controller/ApiController.java) : API활용 숙소리스트 생성
  - [filterListSubmit.java](src/main/java/com/kh/breaktime/detail/controller/DetailController.java) : 필터링 기능
  - [map.js](src/main/webapp/WEB-INF/views/detail/detail.jsp) : 카카오맵 기능
  - 방명록
    - [board.js](./SEMI_MZ/WebContent/resource/js/myroom/board.js) : 방명록 관련 데이터 처리
    - [BoardListController.java](./SEMI_MZ/src/mz/board/controller/BoardListController.java) : 방명록 목록 조회
    - [BoardDetailController.java](./SEMI_MZ/src/mz/board/controller/BoardDetailController.java) : 방명록 상세조회(로그인 유저)
    - [BoardInsertController.java](./SEMI_MZ/src/mz/board/controller/BoardInsertController.java) : 방명록 작성
    - [BoardUpdateController.java](./SEMI_MZ/src/mz/board/controller/BoardUpdateController.java) : 방명록 수정
    - [BoardDeleteController.java](./SEMI_MZ/src/mz/board/controller/BoardDeleteController.java) : 방명록 삭제
    - [SendBoardDetailController.java](./SEMI_MZ/src/mz/board/controller/SendBoardDetailController.java) : 방명록 상세 조회(접속 유저)
  - 옷장/상점
    - [closet.js](./SEMI_MZ/WebContent/resource/js/myroom/closet.js) : 옷장/상점 관련 데이터 처리
    - [MyroomMySkinController.java](./SEMI_MZ/src/mz/skin/controller/MyroomMySkinController.java) : 보유 캐릭터 스킨 조회
    - [MyroomSkinListController.java](./SEMI_MZ/src/mz/skin/controller/MyroomSkinListController.java) : 상점 캐릭터 스킨 목록 조회
    - [MyroomSkinInsertController.java](./SEMI_MZ/src/mz/skin/controller/MyroomSkinInsertController.java) : 캐릭터 스킨 구매
    - [MyroomSkinUpdateController.java](./SEMI_MZ/src/mz/skin/controller/MyroomSkinUpdateController.java) : 캐릭터 스킨 착용

## 한승은 - [PPT] 72p 참조

- 채팅

  - [chatting.jsp](./SEMI_MZ/WebContent/views/chatting.jsp) : 채팅창 외관
  - [chatData.js](./SEMI_MZ/WebContent/resource/js/chat/chatData.js) : DB와 통신하는 등 채팅 데이터관련 처리
  - [chatFront.js](./SEMI_MZ/WebContent/resource/js/chat/chatFront.js) : 사용자 이용에 따른 채팅창 동작 관련 이벤트 처리
  - [AjaxChat.java](./SEMI_MZ/src/mz/chatting/controller/ajax/AjaxChat.java) : 채팅 관련 데이터 처리
  - [AjaxChatRoom.java](./SEMI_MZ/src/mz/chatting/controller/ajax/AjaxChatRoom.java) : 채팅방 관련 데이터 처리
  - [websocket(하위 파일 전체)](./SEMI_MZ/src/mz/chatting/websocket) : 채팅용 웹소켓 파일들

- 미니게임(스킨팡)

  - [skinPang.js](./SEMI_MZ/WebContent/resource/js/minigame/skinPang.js)
  - [skinPang.jsp](./SEMI_MZ/WebContent/views/minigame/skinPang.jsp)
  - [SkinPangController.java](./SEMI_MZ/src/mz/minigame/controller/SkinPangController.java)

- 관리자
  - [admin view(하위 파일 전체)](./SEMI_MZ/WebContent/views/admin)
  - [admin js(하위 파일 전체)](./SEMI_MZ/WebContent/resource/js/admin)
  - [AdminPageController.java](./SEMI_MZ/src/mz/admin/controller/AdminPageController.java) : 어드민 메뉴 관련
  - [MainController.java](./SEMI_MZ/src/mz/admin/controller/MainController.java) : 대시보드 메뉴 관련
  - [ChatLogDeleteController.java](./SEMI_MZ/src/mz/chatting/controller/ChatLogDeleteController.java) : 채팅 기록 삭제용
  - [member(하위 파일 전체)](./SEMI_MZ/src/mz/member/controller/admin) : 사용자 메뉴 관련
  - [notice(하위 파일 전체)](./SEMI_MZ/src/mz/notice/controller) : 공지 메뉴 관련
  - [report(하위 파일 전체)](./SEMI_MZ/src/mz/report/controller/admin) : 신고 메뉴 관련
  - 캐릭터 스킨 메뉴 관련
    - [SkinDeleteController.java](./SEMI_MZ/src/mz/skin/controller/SkinDeleteController.java)
    - [SkinEnrollController.java](./SEMI_MZ/src/mz/skin/controller/SkinEnrollController.java)
    - [SkinListController.java](./SEMI_MZ/src/mz/skin/controller/SkinListController.java)
    - [SkinUpdateController.java](./SEMI_MZ/src/mz/skin/controller/SkinUpdateController.java)

---

> ## 사용 기술 스택

### 협업 툴

- 미리캔버스

### 사용 언어

- FE(Front End)

  - JSP
  - CSS
  - Javascript
  - jQuery

- BE(Back-End)

  - Language: Java, Ajax
  - WAS(Web-Application-Server): Apache Tomcat 9.0
  - Database
    - RDBMS: Oracle 11g XE
  - Developer tool
    - Java: Eclipse
    - Oracle: SQL-Developer

- 사용 디자인 패턴: **MVC 패턴**

### 사용한 오픈 API

- BootStrap
- 카카오 Login API

---
