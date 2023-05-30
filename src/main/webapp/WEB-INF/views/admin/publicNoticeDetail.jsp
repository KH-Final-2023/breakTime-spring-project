<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <link rel="stylesheet" href="/css/summernote/summernote-lite.css">
	<link rel="stylesheet" href="/breaktime/resources/css/header.css">
    <link rel="stylesheet" href="/breaktime/resources/css/base.css">
    <link rel="stylesheet" href="/breaktime/resources/css/footer.css">
    <link rel="stylesheet" href="/breaktime/resources/css/main.css">
    <script src="/js/summernote/summernote-lite.js"></script>
    <script src="/js/summernote/lang/summernote-ko-KR.js"></script>

    <style>
        div {
         box-sizing: border-box;
          /* border: 1px solid red;  */
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

       .notice{
        width: 100%;
        height: 88%;
       }
       
       #notice_area{
        width: 70%;
        height: 90%;
        margin-top: 15vh;
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
		
	  #wrapper {height:95%;}
      #footer {height:18.5%;}

    </style>
</head>
<body>
    <div id="wrapper">
        <%@ include file="/WEB-INF/views/header.jsp"%>
    
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
                        
                    </div>
                    <hr>
                    <div id="content">
                       <p>${notice.noticeContent }</p>
                    </div>
                </div>
        </div>      
    </div>
    	<%@ include file="/WEB-INF/views/footer.jsp"%>
    </div>
</body>
</html>