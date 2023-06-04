<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/breaktime/resources/css/header.css">
<link rel="stylesheet" href="/breaktime/resources/css/base.css">
<link rel="stylesheet" href="/breaktime/resources/css/main.css">
<link rel="stylesheet" href="/breaktime/resources/css/footer.css">
<style>
body {
overflow: hidden;
}
#wrapper {
	width: 100%;
	min-width: 1180px;
	background-color: white;
}

.chatting-area {
	height: 600px;
	width: 100%;
	margin-top: 100px;
	margin-bottom: 500px;
}

#exit-area {
	text-align: right;
	margin-bottom: 10px;
}

.display-chatting {
	width: 80%;
	height: 450px;
	overflow: auto; /*스크롤 처럼*/
	list-style: none;
	padding: 10px 10px;
	background: #f1f4f9;
	z-index: 1;
	margin: auto;
	background-position: center;
	border-radius: 15px;
}

.img {
	width: 100%;
	height: 100%;
	position: relative;
	z-index: -100;
}

.chat {
	display: inline-block;
	border-radius: 15px;
	height: 30px;
	padding: 5px;
	font-size: 20px;
	background-color: #eee;
}

.input-area {
	width: 100%;
	display: flex;
	justify-content: center;
}

#inputChatting {
	width: 32%;
	resize: none;
}

#send {
	width: 20%;
}

.myChat {
	text-align: right;
}

.myChat>p {
	background-color: white;
}

.chatDate {
	font-size: 15px;
}
</style>
</head>
<body>
	<div id="wrapper">
		<%@ include file="/WEB-INF/views/header.jsp"%>

		<div class="chatting-area">
			<ul class="display-chatting">
				<c:forEach items="${list}" var="msg">
					<fmt:formatDate var="chatDate" value="${msg.createDate }"
						pattern="yyyy년 MM월 dd일 HH:mm:ss" />
					<c:if test="${msg.buNo == loginBusiness.buNo }">
						<li class="myChat"><span class="chatDate">${chatDate}</span>
							<p class="chat">${msg.message }</p></li>
					</c:if>

					<c:if test="${msg.buNo != loginBusiness.buNo }">
						<li><b>사용자</b> <br>
							<p class="chat">${msg.message }</p> <span class="chatDate">${chatDate}</span>
						</li>
					</c:if>
				</c:forEach>
			</ul>

			<div class="input-area">
				<textarea id="inputChatting" row="3"></textarea>
				<button id="send">보내기</button>
			</div>
		</div>

	</div>
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	
	<script>
   		const buNo = '${loginBusiness.buNo}';
   		const buNo = '${buNo}';
   		const contextPath = '${contextPath}';
   		
   		let chattingSock = new SockJS(contextPath+"/chat");
   </script>

	<script src="${contextPath }/resources/js/chat/chatBu.js"></script>
</body>
</html>