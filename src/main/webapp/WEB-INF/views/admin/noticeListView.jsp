<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="pi" value="${map.pi }"/>
<c:set var="list" value="${map.list }"/>
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
        /* 공지사항 시작*/
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

       #notice_board{
        width: 100%;
        height: 85%;
       }

       /* 공지사항 테이블 시작 */
        #noticeList {
        margin-top: 5vh;
        margin-left: 20vh;
        min-width: 100vh;
        max-width: 100%;
        border-collapse: collapse;
        }

        #noticeList tr:first-child {
        border-top: none;
        background: #428bca;
        color: #fff;
        }

        #noticeList tr {
        border-top: 1px solid #ddd;
        border-bottom: 1px solid #ddd;
        background-color: #f5f9fc;
        }

        #noticeList tr:nth-child(odd):not(:first-child) {
        background-color: #ebf3f9;
        }

        #noticeList th {
        display: none;
        }

        #noticeList td {
        display: block;
        }

        #noticeList td:first-child {
        margin-top: .5em;
        }

        #noticeList td:last-child {
        margin-bottom: .5em;
        }

        #noticeList td:before {
        content: attr(data-th) ": ";
        font-weight: bold;
        width: 120px;
        display: inline-block;
        color: #000;
        }

        #noticeList th,
        #noticeList td {
        text-align: left;
        }

        #noticeList {
        color: #333;
        border-radius: .4em;
        overflow: hidden;
        }

        #noticeList tr {
        border-color: #bfbfbf;
        }

        #noticeList th,
        #noticeList td {
        padding: .5em 1em;
        }
        @media screen and (max-width: 601px) {
        #noticeList tr:nth-child(2) {
            border-top: none;
        }
        }
        @media screen and (min-width: 600px) {
        #noticeList tr:hover:not(:first-child) {
            background-color: #d8e7f3;
        }
        #noticeList td:before {
            display: none;
        }
        #noticeList th,
        #noticeList td {
            display: table-cell;
            padding: .25em .5em;
        }
        #noticeList th:first-child,
        #noticeList td:first-child {
            padding-left: 0;
        }
        #noticeList th:last-child,
        #noticeList td:last-child {
            padding-right: 0;
        }
        #noticeList th,
        #noticeList td {
            padding: 1em !important;
        }
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
                <li><a href="관리자-공지사항.html">공지사항</a></li>
                <li><a href="관리자-사업자가입승인.html">사업자 가입 승인</a></li>
                <li><a href="관리자-고객정보관리.html">고객 정보 관리</a></li>
                <li><a href="관리자-악성리뷰관리.html">악성 리뷰 관리</a></li>      
            </ul> 
        </div>
    </div>

    <div class="notice">
        <div id="notice_area">
            <div id="notice_title_area">
                <span id="notice_title">
                    공지사항
                </span>
                <hr>
            </div>
              <a class="btn btn-secondary"  style="margin-left: 112vh;"  href="<%=  request.getContextPath() %>/notice/enrollForm">글 등록</a>
           
            <div id="notice_board_area">
                <table id="noticeList">
                    <thead>
                      <tr>
                        <th>글 번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                      <c:if test="${empty list }">
						<td colspan="5" style="text-align:center;">게시글이 없습니다</td>
					  </c:if>
					  <c:forEach items="${list }" var="n">
						<tr onclick="movePage(${n.noticeNo});">
							<td class="nno">${n.noticeNo}</td>
							<td>${n.noticeTitle }</td>
							<%-- <td>${m.userName }</td>  --%>
						</tr>				
					</c:forEach>
					  </tr>
                    <!--  <tr>
                        <td data-th="글 번호">
                        	1
                        </td>
                        <td data-th="제목">
                          test
                        </td>
                        <td data-th="작성자">
                          admin
                        </td>                       
                      </tr>  -->
                     
                    </tbody>
                  </table>
                  <script>
				function movePage(nno){
					location.href='${contextPath}/notice/detail/'+nno;					
				}
			</script>
                  <br>
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