<%@page import="java.util.List"%>
<%@page import="com.kh.breaktime.chat.model.vo.ChatMessage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%List<ChatMessage> list = (List<ChatMessage>) request.getAttribute("list"); %>
<!-- Jquey 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부투스트랩에서 제공하고있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
	height:600px;
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
	height: 78vh;
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
	height: 45px;
	padding: 5px;
	font-size: 20px;
	background-color: #eee;
}

.input-area {
	width: 100%;
	height: 35px;
	display: flex;
	justify-content: center;
}

#inputChatting {
	width: 32%;
	resize: none;
	font-size: 15px;
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

#firstMsg {
	width: 50%;
	margin-left : 25%;
	text-align  : center;
	font-weight : bold;
	background-color : yellow;
	border-radius: 20px;	
}
</style>
</head>
<body>
	<div id="wrapper">
		<%@ include file="/WEB-INF/views/header.jsp"%>

		<div class="chatting-area">
			<ul class="display-chatting">
				<% if(list.size()==0) {%>
					<div id="firstMsg">
						<p>본 문의창은 다수의 사용자가 사용하므로 개인정보에 관한 내용은 삼가해주시길 바랍니다.
						자세한 문의가 필요할 시 본 숙소로 전화해주시길 바랍니다.</p>
					</div>
				<%} else {%>	
					<% for(int i = 0; i<list.size()*0+1; i++) { %>
						<div id="firstMsg">
							<p>안녕하세요 <%=list.get(i).getBuTitle() %> 입니다.
							본 문의창은 다수의 사용자가 사용하므로  개인정보에 관한 내용은 삼가해주시길 바랍니다.
							자세한 문의가 필요할 시  본 숙소로 전화해주시길 바랍니다.</p>
						</div>
					<%} %>
				<%} %>
				<c:forEach items="${list}" var="msg">
					<fmt:formatDate var="chatDate" value="${msg.createDate}"
						pattern="yyyy년 MM월 dd일 HH:mm:ss" />
					<c:if test="${msg.userNo == loginUser.userNo }">
						<li class="myChat"><span class="chatDate">${chatDate}</span>
							<p class="chat">${msg.message }</p></li>
					</c:if>

					<c:if test="${msg.userNo != loginUser.userNo }">
						<li><b>${msg.userId }</b> <br>
							<p class="chat">${msg.message }</p> <span class="chatDate">${chatDate}</span>
						</li>
					</c:if>
				</c:forEach>
			</ul>

			<div class="input-area">
				<textarea id="inputChatting" row="3"></textarea>
				<button id="send" class="btn btn-primary">보내기</button>
			</div>
		</div>

	</div>
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	
	<script>
   		const userNo = '${loginUser.userNo}';
   		const userId = '${loginUser.userId}';
   		const buNo = '${buNo}';
   		const contextPath = '${contextPath}';
   		
   		let chattingSock = new SockJS(contextPath+"/chat");
   </script>

	<script src="${contextPath }/resources/js/chat/chat.js"></script>
</body>
</html>