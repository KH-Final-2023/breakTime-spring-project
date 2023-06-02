<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">
<link rel="stylesheet" href="${contextPath}/resources/css/chat-style.css">
<style>
   .chatting-area{
      margin :auto;
      height : 600px;
      width : 800px;
      margin-top : 50px;
      margin-bottom : 500px;
   }
   #exit-area{
      text-align:right;
      margin-bottom : 10px;
   }
   .display-chatting {
      width:42%;
      height:450px;
      border : 1px solid gold;
      overflow: auto; /*스크롤 처럼*/
      list-style:none;
      padding: 10px 10px;
      background : lightblue;
      z-index: 1;
          margin: auto;
      background-image : url(${contextPath}/resources/images/chunsickbackground.png);
       background-position: center;
   }
   .img {
      width:100%;
      height:100%;
       position: relative;
       z-index:-100;
   }
   .chat{
      display : inline-block;
      border-radius : 5px;
      padding : 5px;
      background-color : #eee;
   }
   .input-area{
      width:100%;
      display:flex;
      justify-content: center;
   }
   #inputChatting{
      width: 32%;
      resize : none;
   }
   #send{
      width:20%;
   }
   .myChat{
      text-align: right;
   }
   .myChat > p {
      background-color : gold;
   }
   .chatDate{
      font-size : 10px;
   }
</style>
</head>
<body>
<%-- <jsp:include page="/WEB-INF/views/common/header.jsp" /> --%>
   
   <div class="chatting-area">
      <div id="exit-area">
         <button class="btn btn-outline-danger" id="exit-btn">나가기</button>
      </div>
      <ul class="display-chatting">
         <c:forEach items="${list}" var="msg">
            <fmt:formatDate var="chatDate" value="${msg.createDate }" pattern="yyyy년 MM월 dd일 HH:mm:ss"/>
            <c:if test="${msg.userNo == loginUser.userNo }">
               <li class="myChat">
                  <span class="chatDate">${chatDate}</span>
                  <p class="chat">${msg.message }</p>
               </li>
            </c:if>
            
            <c:if test="${msg.userNo != loginUser.userNo }">
               <li>
                  <b>${msg.userId }</b>   <br>
                  <p class="chat">${msg.message }</p>
                  <span class="chatDate">${chatDate}</span>
               </li>
            </c:if>
         
         </c:forEach>
      
      
         
         
      </ul>
      
      <div class="input-area">
         <textarea id="inputChatting" row="3"></textarea>
         <button id="send">보내기</button>
      </div>
   </div>
   <!-- sockjs를 이용한 WebSocket 라이브러리 추가 -->
   
   <!-- socketjs-client -->
   <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
   
   <script>
   		const userNo = '${loginUser.userNo}';
   		const userId = '${loginUser.userId}';
   		const buNo = '${buNo}';
   		const contextPath = '${contextPath}';
   		
   		// /chat이라는 요청주소로 통신할 수 있는 WebSocket 객체 생성
   		let chattingSock = new SockJS(contextPath+"/chat");
   		// websocket프로토콜을 이용해서 해당 주소로 데이터를 송/수신 할 수 있음.
   		let exitBtn = document.querySelector("#exit-btn");
		
		exitBtn.addEventListener("click", exitChatRoom);
		
		function exitChatRoom(){
			if(confirm("채팅방에서 나가시겠습니까?")){
				
				$.ajax({
					url : "${contextPath}/chat/exit",
					data : {
						buNo
					},
					success : function(result){
						// result == 1 나가기 성공
						if(result == 1){
							location.href = "${contextPath}/chat/chatRoomList";
						}else{
							alert("채팅방 나가기에 실패했습니다.");
						}
						// result == 0 실패
					}
				})
			}
		}
   </script>
   
   <script src="${contextPath }/resources/js/chat/chat.js"></script>
   
   
   <%-- <jsp:include page="../common/footer.jsp"/> --%>
   
   
   
</body>
</html>