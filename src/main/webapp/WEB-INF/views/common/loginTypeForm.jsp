<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 타입</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <style>
        #container{
            width: 100%;
            height: 700px;
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

        #loginType{
            display: flex;
            justify-content: space-between;
          width: 800px;
          height: 500px;
        }
        
      button{
         width: 45%;
         background-color:white;

      }
      
      button:hover{
         cursor: pointer;
         background-color:yellowgreen;
         color:white;
      }
    </style>
</head>
<body>
    <div id="container">
        <h1>BreakTime</h1>
        <p>BreakTime에 오신것을 환영합니다.</p>
  
        <div id="loginType" style="display: flex;">
            <button  id="memberLoginBtn" >일반고객</button>
            <button  id="businessLoginBtn">사업자</button>
        </div> 

    </div>ㄴ
    
    <!-- 일반고객/사업자 로그인폼으로 포워딩(석범) -->
    <script>                 
       document.getElementById("memberLoginBtn").addEventListener("click",function(){
        location.href = "<%= request.getContextPath()%>/member/login";
            })   
            
        document.getElementById("businessLoginBtn").addEventListener("click",function(){
        location.href = "<%= request.getContextPath()%>/business/login";
            })   
   </script>
   
</body>
</html>