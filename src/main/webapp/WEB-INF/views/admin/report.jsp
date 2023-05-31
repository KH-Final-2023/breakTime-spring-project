<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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
           
        }
        /* 헤더 시작*/
        .header {                     
        width: 100%;
        height: 12%;
        background: #09ba1b !important;        
        position: sticky;
        top : 0px;
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
        height: 10%;
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
        /* height: 100%; */
        border: 1px solid rgb(224, 224, 224);
        border-radius: 10px;
        padding: 20px;
        justify-content: space-between;
        background: rgb(247, 247, 247);
      }


    .paging{
        margin: left;
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
                <li><a href="<%=request.getContextPath()%>/notice/list">공지사항</a></li>
				<li><a href="<%=request.getContextPath()%>/approval/list">사업자 가입 승인</a></li>
				<li><a href="<%=request.getContextPath()%>/manage/list">고객 정보 관리</a></li>
				<li><a href="<%=request.getContextPath()%>/report/list">악성 리뷰 관리</a></li>    
            </ul> 
        </div>
    </div>
    
    <div class="notice">
        <div id="notice_area">
            <span id="notice_title">
                악성 리뷰 관리
            </span>
            <hr>
           
			
				<div id="enrollWrap">
					<div>
                        <c:forEach var="r" items="${selectReportList.list}"> 
                            <div id="review-box" style="padding: 20px 20px 20px 20px; margin:0 auto;
                                width:60%; border : 1px solid rgba(0, 0, 0, 0.1); border-radius: 5px;">
                                <div style="color:#c8c8c8; font-size: 14px">
                                    <div class="row">
                                        <div class="col-sm-6 review_star">
                                            <%--  <c:choose>
                                                <c:when test="${review.score == '1' }">⭐</c:when>
                                                <c:when test="${review.score == '2' }">⭐ ⭐</c:when>
                                                <c:when test="${review.score == '3' }">⭐ ⭐ ⭐</c:when>
                                                <c:when test="${review.score == '4' }">⭐ ⭐ ⭐ ⭐</c:when> 
                                                <c:when test="${review.score == '5' }">⭐ ⭐ ⭐ ⭐ ⭐</c:when>
                                            </c:choose>	 --%>
                                        </div>
                                        <div class="col-sm-6 review_email" style="text-align: right;">
                                            <span>
                                                2023-11-11
                                        </span>
                                        </div>
                                    </div>
                    
                                    <div class="review_email">
                                        <span>${r.reviewNo }</span> <br> 
                                        <span></span> <br> 
                                        <span></span>
                                    </div>
                                </div>
                                
                                <hr style="color: rgba(0, 0, 0, 0.5);">
                                
                                <div class="review_content mt-1">
                                    <span>리뷰내용</span>
                                   <%--  <c:if test="${review.content_reply ne null}">
                                        <br><br>&nbsp;&nbsp;
                                        <svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24"><path d="M0 0h24v24H0V0z" fill="none"/><path d="M19 15l-6 6-1.42-1.42L15.17 16H4V4h2v10h9.17l-3.59-3.58L13 9l6 6z"/></svg>
                                        <!-- ${review.content_reply} -->test 대댓글
                                    </c:if> --%>
                                </div>
                                <hr style="color: rgba(0, 0, 0, 0.5);">
                                <button type="button" onclick="" class="btn btn-outline-danger">삭제</button>
                                <button type="button" onclick="" class="btn btn-outline-success">유지</button>
                            </div>
                            <br>
                         </c:forEach>
 
                    <div class="paging">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                            <li class="page-item disabled">
                                <a class="page-link">Previous</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#">Next</a>
                            </li>
                            </ul>
                        </nav>
                    </div>  
                </div>
					
		
        </div>    
    </div>
    
</body>
</html>