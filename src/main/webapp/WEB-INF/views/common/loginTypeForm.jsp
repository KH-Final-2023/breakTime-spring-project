<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css"> 
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 타입</title>
    <style>
        #container{
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
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
    		margin-top:50px;
        }
        
		button{
			width: 45%;
			background-color: #d3fffe;
    border: 1px solid white;
    border-radius: 30px;
        font-size: 30px;

		}
		
		button:hover{
		  box-shadow: 0px 15px 20px white;
 		 color: black;
  		transform: translateY(-7px);
 		 cursor:pointer;
  		opacity:0.8;
		}
		
		#wrapper{
			background-image: url("resources/images/로그인타입.jpg");
			border: 0;
    		padding: 0; 
			
    		min-height: 100%;
    		background-position: center;
   		 background-size: contain;
		}
		
		body, html { 
    	margin: 0;
    	padding: 0;
    	height: 100%;
}
    </style>
</head>
<body>


	<div id="wrapper">
    <div id="container" data-aos="zoom-in">
        <h1 style="margin-top:100px;font-size: 47px; color: #0602a7;">BreakTime</h1>
        <div id="loginType" style="display: flex;">
            <button  id="memberLoginBtn" >일반고객</button>
            <button  id="businessLoginBtn">사업자</button>
        </div> 

    </div>
    </div>
    <!-- 일반고객/사업자 로그인폼으로 포워딩(석범) -->
    <script>              	
    	document.getElementById("memberLoginBtn").addEventListener("click",function(){
        location.href = "<%= request.getContextPath()%>/member/login";
            })	
            
        document.getElementById("businessLoginBtn").addEventListener("click",function(){
        location.href = "<%= request.getContextPath()%>/business/login";
            })	
	</script>
	
	<script> 
            AOS.init(); // 자바스크립트로 init()을 해야 동작한다.
    </script>
</body>
</html>