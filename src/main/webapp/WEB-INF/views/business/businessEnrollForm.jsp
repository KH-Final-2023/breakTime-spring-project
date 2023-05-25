<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사업자 회원가입 폼</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <style>
        #container{
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
        }
    </style>
</head>
<body>
    <div id="container">
        <h1>사업자 회원가입</h1> 
        <div>
        <form action="insert" method="post">
            <div>
                <input type="email" name="email" id="email" placeholder="이메일입력" required>
                <input type="button" value="인증번호 전송">
            </div>

            <div>
                <input type="text" placeholder="인증번호입력">
                <input type="button" value="인증확인">
                <p>이메일이 도착하는데 1-2분정도 소요될수있습니다.</p>
            </div>
            <input type="text" name="buId" id="buId" placeholder="아이디 - 4~12자 영문 대소문자, 숫자만 입력하세요." required>
            <input type="password" name="buPwd" id="buPwd" placeholder="비밀번호 입력 - 4~12자 영문 대소문자, 숫자만 입력하세요." required>
            <input type="password" name="pwdCheck" id="pwdCheck" placeholder="비밀번호확인" required> 
            <input type="text" name="buUserName" id="buUserName" placeholder="사업자이름" required> 
			<div>
				<select name="buCategory" id="buCategory" required>
					<option>업체종류</option>
					<option value="B02010100">호텔</option>
					<option value="B02010500">리조트</option>
					<option value="B02010700">펜션</option>
					<option value="B02010900">모텔</option>
				</select> 
				<input type="text" name="buTitle" id="buTitle" placeholder="숙박업체이름">
			</div>
			<div>
				<select name="areaNo" id="areaNo" required>
					<option>업체지역선택</option>
					<option value="1">서울</option>
					<option value="2">인천</option>
					<option value="3">대전</option>
					<option value="4">대구</option>
					<option value="5">광주</option>
					<option value="6">부산</option>
					<option value="7">울산</option>
					<option value="8">세종특별자치시</option>
					<option value="31">경기도</option>
					<option value="32">강원도</option>
					<option value="33">충청북도</option>
					<option value="34">충청남도</option>
					<option value="35">경상북도</option>
					<option value="36">경상남도</option>
					<option value="37">전라북도</option>
					<option value="38">전라남도</option>
					<option value="39">제주도</option>
				</select>
				<input type="text" name="buAddress" id="buAddress" placeholder="상세주소">
			</div>
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