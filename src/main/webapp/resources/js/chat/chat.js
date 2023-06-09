/**
 * 
 */
 // 페이지 로딩 완료시 채팅창을 밑으로 내리기(즉시 실행 함수(IIFE) => 속도가 빠르고, 변수명 중복문제 해결)
 (
 	function(){
 	const display = document.getElementsByClassName("display-chatting")[0];
 	
 		if(display != null) {
 			display.scrollTop = display.scrollHeight;
 		}
 	}
 )();
 
 // 채팅 메세지 보내기
 document.getElementById("send").addEventListener("click", sendMessage);
 
 
 //채팅 보내기 함수
 function sendMessage(){
    
    // 채팅이 입력되는 textarea
    const inputChatting = document.getElementById("inputChatting");
    
    if(inputChatting.value.trim().length === 0){
       // 입력이 되지 않은경우
       alert("뭐라도 입력해주세요");
       
       inputChatting.value = ""; // 공백문자 삭제
       inputChatting.focus();
    }else{ // 입력이 된경우
    
       //메세지 입력시 필요한 데이터를 js 객체로 생성
       
       const chatMessage = {
          "userNo" : userNo,
          "userId" : userId,
          "buNo" : buNo,
          "message" : inputChatting.value
       };
       
       // JSON.parse(문자열) : JSON -> Js Object
       // JSON.stingify(객체) : JS Object -> JSON
       
       // chattingSock(웹 소켓 객체)를 이용해서 메세지 보내기
       // chattingSock.send(값) : 웹 소켓 핸들러로 값을 보냄
       
       chattingSock.send( JSON.stringify(chatMessage));
       
       inputChatting.value = "";
    }
 }
 
 // 웹소켓 핸들러에서 sendMessage라는 함수가 호출되었을 때를 캐치하는 이벤트핸들러
 chattingSock.onmessage = function(e){
	// 매개변수 e : 발생한 이벤트에 대한 정보를 담고있는 객체
	// e.data : 전달된 메세지가 담겨있음(JSON객체) ==> message.getPayload()
	
	// 전달받은 메세지를 JS객체로 변환
	const chatMessage = JSON.parse(e.data); // JSON -> JS Object
	console.log(chatMessage);
	
	const li = document.createElement("li");
	
	const p = document.createElement("p");
	p.classList.add("chat");
	
	p.innerHTML = chatMessage.message.replace( /\\n/gm , "<br>" );
	//내용
	
	const span = document.createElement("span");
	span.classList.add("chatDate");
	span.innerText = currentTime(); // 날짜정보
	
	// 내가 쓴 채팅 : span -> p
	// 남이 쓴 채팅 : p -> span
	if( userNo == chatMessage.userNo ) { // 내가쓴거
	
		li.append(span , p);
		li.classList.add("myChat");
	} else { // 남이쓴거
		li.innerHTML = "<b>" + chatMessage.userId + "</b><br>";
		li.append(p, span);
	}
	
	// 채팅창
	const display = document.getElementsByClassName("display-chatting")[0];
	
	// 채팅창에 채팅 추가
	display.append(li);
	
	// 채팅창 제일 밑으로 내리는 코드 추가
	display.scrollTop = display.scrollHeight;
	// scrollTop : 스크롤 이동시켜주는 속성
	// scrollHeight : 스크롤 되는 요소의 전체 높이
 }
 
 // 현재 시간 출력 함수
 // 2023년 05월 04일 12:29:33
 function currentTime() {
 	const now = new Date();
 	const time = now.getFullYear()+"년 "
 			   + addZero(now.getMonth() +1) +"월 "
 			   + addZero(now.getDate()) + "일 "
 			   + addZero(now.getHours()) + ":"
 			   + addZero(now.getMinutes()) + ":"
 			   + addZero(now.getSeconds());
 			   
 	return time;
 }
 // 10보다 작은 숫자일 경우 앞에 0을 붙여준느 함수
 function addZero(number) {
 	return number < 10 ? "0" + number : String(number);
 }

 
 
 
 
 