<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    <script src="/js/summernote/summernote-lite.js"></script>
    <script src="/js/summernote/lang/summernote-ko-KR.js"></script>

    <link rel="stylesheet" href="/css/summernote/summernote-lite.css">
    <!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
    <style>
        div {
         box-sizing: border-box;
         /* border: 1px solid red; */
        }

        html, body{
         width: 100%;
         height: 100%;
         margin: 0%;
        }

        body{
            overflow-x: hidden;
            overflow-y: hidden;
        }
        /* 헤더 시작*/
        .header {                     
        width: 100%;
        height: 12%;
        background: #09ba1b !important;        
       }

       #bt_title {
         width: 100%;
         height: 70%;
         text-align: center;
         color: #ffff;
       }

       #title{
        font-size: 3em;
        font-weight: bold;
       }

       .nav {
        width: 100%;
        height: 30%;
        text-align: center;
            
       }

       .nav > ul{
        display : flex;
        list-style: none;
        padding: 0;
        margin: 0;
        height: 100%;
       }

       .nav li{
            width :500px;
       }

      .nav a{
        display: block;
        height: 100%;

        text-align: center;

        padding : 5px 0;

      
        text-decoration: none;
        font-size: 18px;
        font-weight: bold;
        color : #ffff;

        border-radius: 5px;
        transition-duration: 0.1s;
       }

       .nav a:hover{
        color : black;
       }

       .notice{
        width: 100%;
        height: 88%;
       }
       
       #notice_area{
        width: 70%;
        height: 90%;
        margin-top: 5vh;
        margin-left: 30vh;
       }

       #notice_title_area{
        width: 100%;
        height: 15%;
       }

       #notice_title{
        font-size: 2em;
        font-weight: bold;
       }

       #enrollWrap {
		width: 100%;
		height:100%;
		/* height:100%; */
		border: 1px solid rgb(224, 224, 224);
		border-radius: 10px;
		padding: 20px;
		background: rgb(247, 247, 247);
	}
    </style>
    
</head>
<body>
    <div class="header">
        <div id="bt_title" >
          <span id="title">breaktime admin</span>
        </div>
        
        <div class="nav">
            <ul>
                <li><a href="">공지사항</a></li>
                <li><a href="">사업자 가입 승인</a></li>
                <li><a href="">고객 정보 관리</a></li>
                <li><a href="">악성 리뷰 관리</a></li>      
            </ul> 
        </div>
    </div>
    
    <div class="notice">
        <div id="notice_area">
            <span id="notice_title">
                공지사항
            </span>
            <hr>
            <form action="<%=  request.getContextPath() %>/notice/insert" id="enrollForm" method="post">
			
				<div id="enrollWrap">
					<div style="font-size: larger; font-weight: 600;">
						 <input id="textInput" type="text" name="noticeTitle" required value="${n.noticeTitle }"
							style="width: 100%;" placeholder="제목을 입력하세요">
					</div>
					<br>
					<textarea id="summernote" name="noticeContent"  required value="${n.noticeContent }"></textarea>
					</div>
					<input type="hidden" name="mode" value="${param.mode}"/>
					<input type="hidden" name="noticeNo" value="${empty n.noticeNo ? 0 : n.noticeNo}" />
					<div id="box" style="float: right;">
						<button type="submit" class="btn btn-primary"
							data-text="등록" style="width: 100px;">
							<span>등록</span>
						</button>
						<button type="reset" class="btn btn-danger"
							data-text="취소" style="width: 100px;">
							<span>취소</span>
						</button>
					</div>	
				
			</form>
        </div>
       <script>
	$(document).ready(function() {
		  $('#summernote').summernote({
	 	    	placeholder: 'content',
		        minHeight: 370,
		        maxHeight: null,
		        focus: true, 
		        lang : 'ko-KR',
		        placeholder: '내용을 입력하세요',
		        	toolbar: [
		                ['fontname', ['fontname']],     // 글꼴 설정
		                ['fontsize', ['fontsize']],    // 글자 크기 설정
		                ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']], // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		                ['color', ['forecolor','color']],    // 글자색
		                ['table', ['table']],    // 표만들기
		                ['para', ['ul', 'ol', 'paragraph']],    // 글머리 기호, 번호매기기, 문단정렬
		                ['height', ['height']],    // 줄간격
		                ['insert',['picture','link','video']]
		                  // 코드보기, 확대해서보기, 도움말
		    ],
		      // 추가한 글꼴
		    fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
		     // 추가한 폰트사이즈
		    fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
		  });
		});
	</script>
    </div>
    
</body>
</html>