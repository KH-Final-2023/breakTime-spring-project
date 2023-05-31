<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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

      .paging{
        margin: 0px 0px 0px 40%;
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
                고객 정보 관리
            </span>
            <hr>
           
			
				<div id="enrollWrap">
					<table class="table table-hover">
                        <thead>
                            <tr>
                                <th>사업자</th>
                                <th>전화번호</th>
                                <th>숙소 이름</th>
                                <th>주소</th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                             <c:forEach var="b" items="${selectManageList.list}" varStatus ="vs"> 
                                <tr>
                                    <td>${b.buUserName }</td>
                                    <td>${b.buTel }</td>
                                    <td>${b.buTitle }</td>
                                    <td>${b.buAddress }</td>
                                    <td>
                                        <button id="update-btn" type="submit" class="btn btn-primary"
                                        data-text="수정" data-toggle="modal" data-target="#updateMember${vs.index }" >
                                        	<span>수정</span>
                                        </button>
                                        
                                    </td>
                                    <td>
                                     	<a href="<%=request.getContextPath()%>/manage/delete?buId=${b.buId}">
	                                        <button  type="button" class="btn btn-danger" data-text="탈퇴" >
	                                        	<span>탈퇴</span>
	                                       </button>
                                       </a>
                                    </td>
                                </tr>
                                
                                <!--  수정 모달창 -->
							<form action="<%=  request.getContextPath() %>/manage/update" id="updateForm" method="post"> 
								<div id="updateMember${vs.index }" class="modal fade" id="registerModal"
									tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
									<div
										class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title">고객 정보 수정</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<p style="word-spacing: 8px;">
													사업자 : <input type="text" name="buUserName" value="${b.buUserName} " >
												</p>
												<p>
													전화번호 : <input type="text" name="buTel" value="${b.buTel} ">
												</p>
												<p>
													숙소이름 : <input type="text" name="buTitle" value="${b.buTitle} ">
												</p>
												<p style="word-spacing: 16px;">
													주소 : <input type="text" name="buAddress" value="${b.buAddress} ">
												</p>
											</div>
											<input type="hidden" name="buId" value="${empty b.buId ? 0 : b.buId}" /> 
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">취소</button>
												<a href="<%=request.getContextPath()%>/manage/update?buId=${b.buId}">
												<button type="submit" id="btn_register"
													class="btn btn-primary">확인</button>
											</a>
											</div>
										</div>
									</div>
								</div>
							 </form> 
						</c:forEach>
                        </tbody>
                    </table>
                    <c:set var="url" value="list?cpage=" />
					<div class="paging">
						<ul class="pagination">
							<c:choose>
								<c:when test="${ selectManageList.pi.currentPage eq 1 }">
									<li class="page-item disabled"><a class="page-link"
										href="#">Previous</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="${url}${selectManageList.pi.currentPage -1 }${sUrl}">Previous</a></li>
								</c:otherwise>
							</c:choose>
	
							<c:forEach var="item" begin="${selectManageList.pi.startPage }"
								end="${selectManageList.pi.endPage }">
								<li class="page-item"><a class="page-link"
									href="${url}${item }${sUrl}">${item }</a></li>
							</c:forEach>
	
							<c:choose>
								<c:when
									test="${ selectManageList.pi.currentPage eq selectManageList.pi.maxPage }">
									<li class="page-item disabled"><a class="page-link"
										href="#">Next</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="${url}${selectManageList.pi.currentPage + 1 }${sUrl}">Next</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
                </div>	
        </div>     
    </div>
    
</body>
</html>