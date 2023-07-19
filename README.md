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

- [[NOTION] 링크](https://www.notion.so/BreakTime-7816ac597cc7400582f1a750d7c45f08) 

- 회원
  ![로그인gif](https://github.com/KH-Final-2023/breakTime-spring-project/assets/117423689/5178e794-9aaf-4d8c-b4b6-5c9e908133ff)

- 사업자
  ![사업자gif](https://github.com/KH-Final-2023/breakTime-spring-project/assets/117423689/6f3f1449-f4fd-4092-a6be-4d876f7dbe2f)

- 상세페이지1
  ![상세1gif](https://github.com/KH-Final-2023/breakTime-spring-project/assets/117423689/a707321c-c8a2-44b6-a3de-d4f89b9492d4)

- 상세페이지2
  ![상세2](https://github.com/KH-Final-2023/breakTime-spring-project/assets/117423689/2cb2a919-bff6-43b6-a9b2-69a95f030f6b)

- 결제
  ![결제gif](https://github.com/KH-Final-2023/breakTime-spring-project/assets/117423689/4b2b4401-834f-4d8c-bc00-2d4e702202f4)

- 리뷰
  ![리뷰gif](https://github.com/KH-Final-2023/breakTime-spring-project/assets/117423689/79d31eec-5f43-4789-8291-d5c5298f7178)

- 관리자
  ![관리자 gif](https://github.com/KH-Final-2023/breakTime-spring-project/assets/117423689/cad52514-78a8-4f02-a98f-95ff8a287307)

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

- 알람
    
  - [getBusinessCount.java](src/main/java/com/kh/breaktime/admin/controller/NoticeController.java) : 사업자 승인 알람
  - [reviewCount.java](src/main/java/com/kh/breaktime/admin/controller/NoticeController.java) : 리뷰 신고 알람 
 
---

## 이규정 - [NOTION](https://www.notion.so/59c4b515199f4a67aca760aa12451a21) 참조

- 상세페이지1
  
  - [detail.jsp](src/main/webapp/WEB-INF/views/detail/detail.jsp) : 상세1 view 페이지
  - [ApiController.java](src/main/java/com/kh/breaktime/api/controller/ApiController.java) : API활용 숙소리스트 생성
  - [filterListSubmit.java](src/main/java/com/kh/breaktime/detail/controller/DetailController.java) : 필터링 기능
  - [map.js](src/main/webapp/WEB-INF/views/detail/detail.jsp) : 카카오맵 기능
  

## 한동휘 - [NOTION](https://www.notion.so/c85827be9c4546779030efba5d8093fa) 참조

- 상세페이지2

  - [decideMain.jsp](src/main/webapp/WEB-INF/views/decide/decideMain.jsp) : 상세2 main view 페이지
  - [decideDetailMap.jsp](src/main/webapp/WEB-INF/views/decide/decideDetailMap.jsp) : 카카오맵 API 활용
  - [decideMainMap.jsp](src/main/webapp/WEB-INF/views/decide/decideMainMap.jsp) : 주소 복사 기능
  - [decidePopupMap.jsp](src/main/webapp/WEB-INF/views/decide/decidePopupMap.jsp) : 주소로 장소 표시하기
  - [decideDateSelect.jsp](src/main/webapp/WEB-INF/views/decide/decideDateSelect.jsp) : 캘린더 페이지
  - [deleteLikeValue.java](src/main/java/com/kh/breaktime/decide/controller/DecideController.java) : 좋아요, 찜 취소 기능
 

- 장바구니

  - [decideBasket.jsp](src/main/webapp/WEB-INF/views/decide/decideBasket.jsp) : 장바구니 view 페이지
  - [insertCartList.java](src/main/java/com/kh/breaktime/decide/controller/DecideController.java) : 장바구니 등록
  - [deleteCartList.java](src/main/java/com/kh/breaktime/decide/controller/DecideController.java) : 장바구니 삭제
  - [decideRoomSelect.jsp](src/main/webapp/WEB-INF/views/decide/decideRoomSelect.jsp) : 객실 선택
    
- 리뷰

  - [decideReview.java](src/main/java/com/kh/breaktime/decide/controller/DecideController.java) : 리뷰 조회
  - [decideReview.jsp](src/main/webapp/WEB-INF/views/decide/decideReview.jsp) : 작성 / 별점순 정렬

## 이충영 - [NOTION](https://www.notion.so/7e65cbaa9d564d7fbbf50fb11dbf4cb1) 참조

- 관리자 

  - 공지사항
    - [noticeListView.jsp](src/main/webapp/WEB-INF/views/admin/noticeListView.jsp) : 공지사항 리스트 페이지
    - [noticeEnrollForm.java, noticeDelete.java, updateForm.java](src/main/java/com/kh/breaktime/admin/controller/NoticeController.java) : 글 등록 / 수정 / 삭제
    
  - 사업자 가입 승인

    - [approval.jsp](src/main/webapp/WEB-INF/views/admin/approval.jsp) : 사업자 가입 승인 view 페이지
    - [approvalAccept.java, approvalCancel.java](src/main/java/com/kh/breaktime/admin/controller/ApprovalController.java) : 승인 / 거절 기능
    
  - 사업자 정보 관리

    - [manage.jsp](src/main/webapp/WEB-INF/views/admin/manage.jsp) : 사업자 정보 view 페이지
    - [manageUpdate.java, manageCancel.java](src/main/java/com/kh/breaktime/admin/controller/ManageController.java) : 사업자 정보 수정 / 삭제
   
  - 신고 리뷰 관리

    - [report.jsp](src/main/webapp/WEB-INF/views/admin/report.jsp) : 신고 리뷰 리스트 view 페이지
    - [reportKeep.java, reportCancel.java](src/main/java/com/kh/breaktime/admin/controller/ReportController.java) : 리뷰 반려 / 삭제

  - 문의 내역

    - [chatRoomList.jsp](src/main/webapp/WEB-INF/views/admin/chatRoomList.jsp) : 채팅방 리스트 view 페이지
    - [ChatController.java](src/main/java/com/kh/breaktime/chat/controller/ChatController.java) : 채팅방 연결
    - [ChatWebsocketHandler .java](src/main/java/com/kh/breaktime/chat/model/websocket/ChatWebsocketHandler.java) : 웹소켓 주입

---

> ## 사용 기술 스택

### 협업 툴

- github

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
    - Java: Spring Framework
    - Oracle: SQL-Developer

- 사용 디자인 패턴: **MVC 패턴**

### 사용한 오픈 API

- BootStrap
- 카카오 Map API
- 한국관광공사 API
- summernote
- 토스 API
- ChatGpt API
---
