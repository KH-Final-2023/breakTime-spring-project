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
        height: 80%;
        border: 1px solid rgb(224, 224, 224);
        border-radius: 10px;
        padding: 20px;
        background: rgb(247, 247, 247);
      }

    .dropbtn {
        background-color: rgb(247, 247, 247);
        color: white;
        padding: 16px;
        font-size: 16px;
        border: none;
    }

    .dropdown {
        position: relative;
        display: inline-block;
    }

    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #f1f1f1;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
    }

    .dropdown-content a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }

    .dropdown-content a:hover {background-color: #ddd;}

    .dropdown:hover .dropdown-content {display: block;}

    .dropdown:hover .dropbtn {background-color:  #ddd;}


    </style>
</head>
<body>
    <div class="header">
        <div id="bt_title" >
          <span id="title">breaktime admin</span>
        </div>
        
        <div class="nav">
            <ul>
                <li><a href="<%=request.getContextPath()%>/notice/list">공지사항</a></li>
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
           
			
				<div id="enrollWrap">
					<div style="display: flex;">
                        <div style="font-size: 2em; font-weight: 600; width: 90%;">
                            <p>${notice.noticeTitle }</p>
                            
                        </div>
                        <div class="dropdown">
                            <button class="dropbtn"><img src="<%=request.getContextPath()%>/resources/images/noticeImg.png" style="width: 30px;"></button>
                            <div class="dropdown-content">
                              <a href="<%=request.getContextPath()%>/notice/enrollForm?noticeNo=${notice.noticeNo}">수정</a>
                              <a href="<%=request.getContextPath()%>/notice/delete?noticeNo=${notice.noticeNo}" id="deleteNotice">삭제</a>             
                            </div>
                        </div>        
                    </div>
                    <hr>
                    <div id="content">
                       <p>${notice.noticeContent }</p>
                    </div>
                </div>
					
		
        </div>      
    </div>
    <script>
					$("#deleteNotice").click(function(){
						 Swal.fire({
			                 title: '게시물을 삭제하시겠습니까?',
			                 text: "삭제된 게시물은 다시 볼 수 없습니다.",
			                 icon: 'warning',
			                 showCancelButton: true,
			                 confirmButtonColor: '#3085d6',
			                 cancelButtonColor: '#d33',
			                 confirmButtonText: '삭제',
			                 cancelButtonText: '취소'
			             }).then((result) => {
			                 if (result.isConfirmed) {
			                	 
			                     Swal.fire(
			                         '삭제가 완료되었습니다.'
			                     )
			                     setTimeout(() =>  location.href='<%=request.getContextPath()%>/notice/delete?noticeNo=${notice.noticeNo}', 1000);
			                    
			                 }
			                 
			             })
						
					});
											
				</script>
</body>
</html>