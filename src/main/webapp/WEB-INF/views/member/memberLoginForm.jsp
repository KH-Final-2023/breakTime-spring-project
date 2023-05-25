<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반고객 로그인 폼</title>
<style>
        #container{
            width: 100%;
            border: 1px solid black;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        form{
            display: flex;
            flex-direction: column;
            height: 200px;
            justify-content: space-evenly;
        }

       a:hover{
       		cursor: pointer;
       }
    </style>
</head>
<body>
	<div id="container">
        <h1>BreakTime</h1>
        <p>BreakTime에 오신것을 환영합니다.</p>
        <div>
        
        <form action="memberLogin" method="post"> 
            <input type="text" name="userId" placeholder="아이디입력">
            <input type="password" name="userPwd" placeholder="비밀번호입력">
            <label for="remember-check">
               <input type="checkbox" name="saveId" id="saveId">아이디 저장하기
            </label>
            <input type="submit" value="로그인">
            <input id="kakaoLogin" type="button" value="카카오톡으로 로그인">
            
            <div id="contnet3" style="border-top: 1px solid black; margin-top: 15px;">
                <a>아이디/비밀번호찾기</a>
                <a id="memberEnrollBtn">회원가입</a>
            </div>
        </form>
        
        </div>
    </div>
    
    <script>
    document.getElementById("memberEnrollBtn").addEventListener("click",function(){
        location.href = "<%= request.getContextPath()%>/member/insert";
    })

    </script>
</body>
</html>