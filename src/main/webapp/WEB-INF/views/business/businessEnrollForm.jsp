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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
            justify-content: space-evenly;
        }
    </style>
</head>
<body>
    <div id="container">
        
        
        <form action="insert" method="post">
        	<h1 style="display: flex; justify-content: center;">사업자 회원가입</h1> 
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
				<input type="number" name="roomCount" id="roomCount" placeholder="객실 갯수">
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
				<input type="text" id="sample6_postcode" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
				<input type="text" id="sample6_address" name="buAddress" placeholder="도로명주소">
				<input type="text" id="sample6_detailAddress" placeholder="상세주소">
				<input type="text" id="sample6_extraAddress" placeholder="참고항목">
			</div>
			<input type="tel" name="buTel" id="buTel" placeholder="사업자연락처">
			<label>객실사진등록</label>
    		<textarea cols="50" name="buMainImg"></textarea>
			<input type="submit" onclick="validation()" value="회원가입">
			</form>
        </div>  
    
	
	<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script> 

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