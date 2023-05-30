<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일반고객 회원가입 폼</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <style>
/*         #container{
            width: 100%;
            height: 700px;
            border: 1px solid black;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        form{
            display: flex;
            flex-direction: column;
            height: 200px;
            justify-content: space-evenly;
        } */
        
        body {
        background-color: #f0f0f0;
        font-family: Arial, sans-serif;
    }

    #container {
        max-width: 400px;
        margin: 0 auto;
        padding: 20px;
        background-color: #e8f5e9;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h1 {
        text-align: center;
        color: #388e3c;
    }

    form {
        margin-top: 20px;
    }

    input[type="email"],
    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #81c784;
        border-radius: 3px;
    }

    input[type="button"],
    input[type="submit"] {
        display: block;
        width: 100%;
        padding: 10px;
        background-color: #388e3c;
        color: #fff;
        border: none;
        border-radius: 3px;
        cursor: pointer;
    }

    p {
        color: #388e3c;
    }
    </style>
</head>
<body>
    <div id="container">
        <h1>일반고객 회원가입</h1> 
        <div>
        <form action="insert" method="post">
            <div>
                <input type="email" name="email" id="email" placeholder="이메일입력">
                <input type="button" value="인증번호 전송">
            </div>

            <div>
                <input type="text" placeholder="인증번호입력">
                <input type="button" value="인증확인">
                <p>이메일이 도착하는데 1-2분정도 소요될수있습니다.</p>
            </div>
            <input type="text" name="userId" id="userId" placeholder="아이디입력 : 4~12자 영문 대소문자, 숫자만 입력하세요." required>
            <input type="password" name="userPwd" id="userPwd" placeholder="비밀번호 입력 - 4~12자 영문 대소문자, 숫자만 입력하세요.">
            <input type="password" name="pwdCheck" id="pwdCheck" placeholder="비밀번호확인">
            <input type="text" name="userName" id="userName" placeholder="이름">
            <input type="submit" onclick="validation()" value="회원가입">
        </form>
        </div>  
    </div>

    <script>
        function validation(){

            var mail = document.getElementById("email")
            var uid = document.getElementById("userId")
            var pw = document.getElementById("userPwd")
            var cpw = document.getElementById("pwdCheck")
            var name = document.getElementById("userName")
            
            // 정규식
            // id, pw
            var regIdPw = /^[a-zA-Z0-9]{4,12}$/;
            // 이름
            var regName = /^[가-힣a-zA-Z]{2,15}$/;
            // 이메일
            var regMail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;


            //메일주소 확인
            if(mail.value.length == 0){
            alert("메일주소를 입력하세요.")
            mail.focus();
            return false;
            }

            else if(!regMail.test(mail.value)){
            alert("잘못된 이메일 형식입니다.")
            mail.focus();
            return false;
            }

            //아이디 확인
            if(uid.value == ""){
            alert("아이디를 입력하세요.")
            uid.focus();
            return false;
            }

            //아이디 영어 대소문자 확인
            else if(!regIdPw.test(uid.value)){
            alert("4~12자 영문 대소문자, 숫자만 입력하세요.")
            uid.focus();
            return false;
            }

            //비밀번호 확인
            if(pw.value == ""){
            alert("비밀번호를 입력하세요.")
            pw.focus();
            return false;
            }

            //비밀번호 영어 대소문자 확인
            else if(!regIdPw.test(pw.value)){
            alert("4~12자 영문 대소문자, 숫자만 입력하세요.")
            pw.focus();
            return false;
            }

            //비밀번호와 아이디 비교
            else if(pw.value == uid.value){
            alert("아이디와 동일한 비밀번호를 사용할 수 없습니다.")
            pw.focus();
            return false;
            }


            //비밀번호 확인
            if(cpw.value !== pw.value){
            alert("비밀번호와 동일하지 않습니다.")
            cpw.focus();
            return false;
            }


            //이름 확인 = 한글과 영어만 가능하도록
            if(uname.value == ""){
            alert("이름을 입력하세요.")
            uname.focus();
            return false;
            }

            else if(!regName.test(uname.value)){
            alert("최소 2글자 이상, 한글과 영어만 입력하세요.")
            uname.focus();
            return false;
            }

            // 유효성 문제 없을 시 폼에 submit
            document.joinForm.submit();
            }

    </script>
    
</body>
</html>