<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <script src="/js/summernote/summernote-lite.js"></script>
    <script src="/js/summernote/lang/summernote-ko-KR.js"></script>

    <link rel="stylesheet" href="/css/summernote/summernote-lite.css">
 	<script type="text/javascript">
        function deleteNotice(){
								
			if(!confirm("삭제 하시겠습니까?")){
				return false;
			}else{
				location.href="<%=request.getContextPath()%>/notice/delete?noticeNo=${notice.noticeNo}";
			}
			}
	</script>   
  
</head>
<body>
	<%@ include file="/resources/admin/adminFrame.jsp"%>
	<main id="main" class="main">
		<div class="notice">
			<div id="notice_area">
				<span id="notice_title"> 공지사항 </span>
				<hr>


				<div id="enrollWrap">
					<div style="display: flex;">
						<div style="font-size: 2em; font-weight: 600; width: 90%;">
							<p>${notice.noticeTitle }</p>

						</div>
						<c:if test="${loginUser.getAuthority() == 0}">
							<div class="dropdown">
								<button class="dropbtn">
									<img
										src="<%=request.getContextPath()%>/resources/images/noticeImg.png"
										style="width: 30px;">
								</button>
								<div class="dropdown-content">
									<a
										href="<%=request.getContextPath()%>/notice/update?noticeNo=${notice.noticeNo}">수정</a>
									<a href="javascript:void(0);" onclick="deleteNotice();">삭제</a>

								</div>
							</div>
						</c:if>

					</div>
					<hr>
					<div id="content">
						<p>${notice.noticeContent }</p>
					</div>
				</div>
			</div>
		</div>
	</main>
</body>
</html>