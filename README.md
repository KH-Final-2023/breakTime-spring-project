# BREAKTIME
최종 프로젝트 여행가조

> ## 팀원

- [한승은(조장)](#한승은---ppt-72p-참조)
- [김혜린](#김혜린---ppt-11p-참조)
- [노지의](#노지의---ppt-58p-참조)
- [박가영](#박가영---ppt-49p-참조)
- [윤지영](#윤지영---ppt-27p-참조)

---

> ## 프로젝트 소개

### 현실과 온라인의 연결공간 '메타버스' 사이트

미니게임을 통한 놀이공간  
MZONE만의 코인 시스템 체계  
실시간 채팅 , 방명록 '소통'을 통한 교류공간  
홀로접속 & 동시접속 모두 재미를 느낄 수 있도록 기획

- [[PPT] 링크](https://www.miricanvas.com/v/11ytu1c) / <a href="./SEMI_MZ/WebContent/resource/etc/MZONE_PPT.pdf" download="Mzone.pdf">[PPT] 다운로드</a>

- 회원
  [![회원](./SEMI_MZ/WebContent/resource/etc/video/member.gif)](#프로젝트-소개)

- 광장
  [![광장](./SEMI_MZ/WebContent/resource/etc/video/square.gif)](#프로젝트-소개)

- 마이룸
  [![마이룸](./SEMI_MZ/WebContent/resource/etc/video/myroom.gif)](#프로젝트-소개)

- 미니게임
  [![미니게임](./SEMI_MZ/WebContent/resource/etc/video/minigame.gif)](#프로젝트-소개)

- 관리자
  [![관리자](./SEMI_MZ/WebContent/resource/etc/video/admin.gif)](#프로젝트-소개)

<br>

---

> ## 주요 기능

- 회원

  - 로그인(API)
  - 회원가입
  - 회원정보 수정
  - 아이디/비밀번호 찾기
  - 로그아웃
  - 회원 탈퇴
  - 상점(캐릭터 스킨) 시스템

- 접속

  - 광장 시스템
  - 실시간 캐릭터 이동
  - 다중 접속
  - 공지사항 게시판
  - 랭킹(호감도, 게임) 기능
  - 미니게임

- 유저 상호 작용

  - 실시간 채팅
  - 유저 상세 정보 조회
  - 친구목록 조회
  - 친구추가/삭제
  - 호감도 추가/삭제
  - 방명록
  - 신고

- 관리자
  - 회원 관리
  - 신고 관리
  - 스킨 관리
  - 공지사항 관리
  - 기타 DB 데이터 관리

---

> ## 담당 기능

## 공통

- [common.js](./SEMI_MZ/WebContent/resource/js/common.js)
  - 위 파일 상 setip의 ip주소를 본인 환경에 맞게 변경하여 사용
- [common.css](./SEMI_MZ/WebContent/resource/css/common.css)
- [common java(하위 파일 전체)](./SEMI_MZ/src/mz/common) : 공용 java 파일들
- [alert.js](./SEMI_MZ/WebContent/resource/js/alert.js) : confirm 팝업창 관련
- [homeAlert.js](./SEMI_MZ/WebContent/resource/js/homeAlert.js) : alert 팝업창 관련
- SQL
  - [MZONE.sql](./SEMI_MZ/sql파일/MZONE.sql) : 기본 테이블 세팅용 SQL
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
