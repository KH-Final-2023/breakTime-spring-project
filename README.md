# BREAKTIME
최종 프로젝트 여행가조

> ## 팀원

- [한동휘(조장)](#한승은---ppt-72p-참조)
- [손석범](#김혜린---ppt-11p-참조)
- [엄태환](#노지의---ppt-58p-참조)
- [이규정](#박가영---ppt-49p-참조)
- [이준석](#윤지영---ppt-27p-참조)
- [이충영](#윤지영---ppt-27p-참조)

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
  - [BREAKTIME.sql](https://www.notion.so/SQL-a6a77827207247588b7dc8d5c3296564)) : 기본 테이블 세팅용 SQL
  - [MZ_INSERT.sql](./SEMI_MZ/sql파일/MZ_INSERT.sql) : 기본 데이터 세팅용 SQL
  - [testData.sql](./SEMI_MZ/sql파일/testData.sql) : 테스트 데이터 세팅용 SQL

---

## 김혜린 - [PPT] 11p 참조

- 시작 페이지

  - [Main.jsp](./SEMI_MZ/WebContent/views/main.jsp)
  - [Main.js](./SEMI_MZ/WebContent/resource/js/main.js)

  - 회원가입
    - [Validation.js](./SEMI_MZ/WebContent/resource/js/validation.js) : 회원가입 유효성검사 JS
    - [EnrollAPICheck.java](./SEMI_MZ/src/mz/member/controller/ajax/AjaxKeyCheck.java) : API 회원 유무 확인
    - [CheckId.java](./SEMI_MZ/src/mz/member/controller/ajax/AjaxCheckId.java) : 아이디 중복확인
    - [CheckNickName.java](./SEMI_MZ/src/mz/member/controller/ajax/AjaxCheckNickname.java) : 닉네임 중복확인
    - [Enroll.java](./SEMI_MZ/src/mz/member/controller/ajax/AjaxEnroll.java) : 회원가입 처리
  - 로그인
    - [LoginAPI.java](./SEMI_MZ/src/mz/member/controller/ajax/AjaxKeyCheck.java) : API로그인
    - [LoginBasic.java](./SEMI_MZ/src/mz/member/controller/ajax/AjaxLogin.java) : Id/Pwd 로그인(일반유저, 비활성 유저, 관리자)
    - [AutoLogin.java](./SEMI_MZ/src/mz/member/controller/ajax/AjaxAutoLogin.java) : 자동 로그인
  - 아이디/비밀번호 찾기
    - [FindAPICheck.java](./SEMI_MZ/src/mz/member/controller/ajax/AjaxKeyCheck.java) : API 계정인증
    - [ValiPwd.js](./SEMI_MZ/WebContent/resource/js/validation.js) : 비밀번호 유효성검사 JS
    - [NewPassword.java](./SEMI_MZ/src/mz/member/controller/ajax/AjaxPwdUpdate.java) : 비밀번호 재설정

- 회원정보변경 / 회원탈퇴

  - [UpdateMember.jsp](./SEMI_MZ/WebContent/views/buttonList.jsp)
  - [UpdateMember.js](./SEMI_MZ/WebContent/resource/js/buttonList.js)
  - [CheckPwd.java](./SEMI_MZ/src/mz/member/controller/ajax/AjaxCheckPwd.java) : 정보변경 전 유저 비밀번호 확인
  - [LoginUserInfo.java](./SEMI_MZ/src/mz/member/controller/ajax/AjaxSelectLoginUser.java) : 현재 유저 정보 조회
  - [CheckNickname.java](./SEMI_MZ/src/mz/member/controller/ajax/AjaxCheckNickname.java) : 닉네임 중복확인
  - [UpdateMember.java](./SEMI_MZ/src/mz/member/controller/ajax/AjaxUpdateMember.java) : 유저 정보 변경 처리
  - [DeleteMember.java](./SEMI_MZ/src/mz/member/controller/ajax/AjaxDeleteMember.java) : 회원탈퇴 처리

- 암호화
  - [PwdFilter.java](./SEMI_MZ/src/mz/common/filter/PasswordEncryptFilter.java) : 암호화 필터
  - [PwdEncrypt.java](./SEMI_MZ/src/mz/common/PasswordEncryptWrapper.java) : API키, 패스워드 암호화

---

## 윤지영 - [PPT] 27p 참조

- 광장

  - [square.jsp](./SEMI_MZ/WebContent/views/square.jsp) : 광장 view페이지
  - [squareCanvas.js](./SEMI_MZ/WebContent/resource/js/squareCanvas.js) : 광장 데이터 처리
  - [squareinit.js](./SEMI_MZ/WebContent/resource/js/squareinit.js) : 광장 시작
  - [blockCheckController.java](./SEMI_MZ/src/mz/square/controller/blockCheckController.java) : 차단/신고 유저 강제퇴장
  - [squareGoHome.java](./SEMI_MZ/src/mz/square/controller/squareGoHome.java) : 마이룸 이동
  - [goMiniGame.java](./SEMI_MZ/src/mz/square/controller/goMiniGame.java) : 미니게임 이동
  - 광장소켓
    - [JSONDecoder.java](./SEMI_MZ/src/mz/square/JSONDecoder.java) : 소켓 데이터 처리
    - [JSONEncoder.java](./SEMI_MZ/src/mz/square/JSONEncoder.java) : 소켓 데이터 처리
    - [SquareServer.java](./SEMI_MZ/src/mz/square/SquareServer.java) : 소켓 데이터 처리
  - 미니게임 리스트창
    - [game.jsp](./SEMI_MZ/WebContent/views/game.jsp) : 미니게임 리스트창 외관
    - [gamezone.js](./SEMI_MZ/WebContent/resource/js/gamezone/gamezone.js) : 미니게임 리스트창 데이터 처리
  - 설정/친구 버튼
    - [buttonList.jsp](./SEMI_MZ/WebContent/views/buttonList.jsp) : 버튼 외관
    - [buttonList.js](./SEMI_MZ/WebContent/resource/js/buttonList.js) : 버튼 데이터 처리
    - [FriendListController.java](./SEMI_MZ/src/mz/buttonList/controller/FriendListController.java) : 친구 리스트 조회
    - [logoutController.java](./SEMI_MZ/src/mz/buttonList/controller/logoutController.java) : 로그아웃

- 미니게임(카드뒤집기)
  - [miniGame.jsp](./SEMI_MZ/WebContent/views/minigame/miniGame.jsp) : 미니게임 view 페이지
  - [cardFlip.js](./SEMI_MZ/WebContent/resource/js/minigame/cardFlip.js) : 미니게임 관련 데이터 처리
  - [FlipGameController.java](./SEMI_MZ/src/mz/minigame/controller/FlipGameController.java) : 미니게임 데이터 처리
  - [FlipGameSever.java](./SEMI_MZ/src/mz/minigame/websocket/FlipGameSever.java) : 미니게임 웹소켓

---

## 박가영 - [PPT] 49p 참조

- 유저 정보창

  - [userInfo.jsp](./SEMI_MZ/WebContent/views/userInfo.jsp) : 유저 정보창
  - [userInfo.js](./SEMI_MZ/WebContent/resource/js/userInfo.js) : 유저 정보 관련 데이터 처리
  - [UserInfo.java](./SEMI_MZ/src/mz/member/controller/UserInfoController.java) : 상호 호감도 조회 / 유저 정보 조회
  - [Heart.java](./SEMI_MZ/src/mz/member/controller/HeartController.java) : 호감도 추가 / 삭제
  - [HeartCount.java](./SEMI_MZ/src/mz/member/controller/HeartCountController.java) : 누적 호감도 조회
  - [Friend.java](./SEMI_MZ/src/mz/member/controller/FriendController.java) : 친구 추가 / 삭제
  - [FriendInfo.java](./SEMI_MZ/src/mz/member/controller/FriendInfoController.java) : 친구 조회
  - [Report.java](./SEMI_MZ/src/mz/report/controller/ReportController.java) : 신고 등록 처리

- 공지사항

  - [notice.jsp](./SEMI_MZ/WebContent/views/notice.jsp) : 공지사항창 외관
  - [notice.js](./SEMI_MZ/WebContent/resource/js/notice.js) : 공지사항 관련 데이터 처리
  - [NoticeList.java](./SEMI-MZ/src/mz/notice/controller/NoticeSelectController.java) : 공지사항 목록 / 상세 조회
  - [HeartRanking.java](./SEMI_MZ/src/mz/member/controller/Rankingcontroller.java) : 호감도 랭킹 처리

---

## 노지의 - [PPT] 58p 참조

- 마이룸
  - [myroom.jsp](./SEMI_MZ/WebContent/views/myroom.jsp) : 마이룸 view 페이지
  - [myroom.js](./SEMI_MZ/WebContent/resource/js/myroom/myroom.js) : 마이룸 시작 화면 데이터 처리
  - [home.java](./SEMI_MZ/src/mz/myroom/home.java) : 접속 유저 판별
  - [MyroomFriendSkinController.java](./SEMI_MZ/src/mz/skin/controller/MyroomFriendSkinController.java) : 접속 유저 캐릭터 스킨 조회
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
