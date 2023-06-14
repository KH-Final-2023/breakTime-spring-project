<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반고객 로그인 폼</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="/breaktime/resources/css/sukbumModal.css">
<link rel="stylesheet" href="../resources/css/loginForm.css">
<style>
        #container{
/*         #container{
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
       } */
    </style>
</head>
<body>

<!-- 	<div id="container">
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
    </div> -->

<div id="container" class="container">
    <!-- FORM SECTION -->
    <div class="row">
 	<!-- SIGN UP -->
      <div class="col align-items-center flex-col sign-up">
        <div class="form-wrapper align-items-center">
          <div class="form sign-up">
            <div class="input-group">
              <i class='bx bxs-user'></i>
              <input type="text" placeholder="Username">
            </div>
            <div class="input-group">
              <i class='bx bx-mail-send'></i>
              <input type="email" placeholder="Email">
            </div>
            <div class="input-group">
              <i class='bx bxs-lock-alt'></i>
              <input type="password" placeholder="Password">
            </div>
            <div class="input-group">
              <i class='bx bxs-lock-alt'></i>
              <input type="password" placeholder="Confirm password">
            </div>
            <button>
              Sign up
            </button>
            <p>
              <span>
                Already have an account?
              </span>
              <b onclick="toggle()" class="pointer">
                Sign in here
              </b>
            </p>
          </div>
        </div>

      </div>
      <!-- END SIGN UP -->

      <!-- SIGN IN -->
      <form action="memberLogin" method="post" class="col align-items-center flex-col sign-in">
        <div class="form-wrapper align-items-center">
          <div class="form sign-in">
            <div class="input-group">
              <i class='bx bxs-user'></i>
              <input type="text" placeholder="Username" name="userId">
            </div>
            <div class="input-group">
              <i class='bx bxs-lock-alt'></i>
              <input type="password" placeholder="Password" name="userPwd">
            </div>
            <button>
              로그인
            </button>
            <p class="pointer" style="display: flex; flex-direction: row; justify-content: space-around;">
              <b id="findId">
                아이디찾기
              </b>
               <b onclick="toggle()" class="pointer" id="memberEnrollBtn">
                회원가입
              </b>
            </p>

          </div>
        </div>
        <div class="form-wrapper">

        </div>
      </form>
      <!-- END SIGN IN -->
    </div>
    <!-- END FORM SECTION -->
    <!-- CONTENT SECTION -->
    <div class="row content-row">
      <!-- SIGN IN CONTENT -->
      <div class="col align-items-center flex-col">
        <div class="text sign-in">
          <h2>일반고객로그인</h2>
          <h2>
            Welcome BreakTime
          </h2>

        </div>
        <div class="img sign-in">

        </div>
      </div>
      <!-- END SIGN IN CONTENT -->
      <!-- SIGN UP CONTENT -->
      <div class="col align-items-center flex-col">
        <div class="img sign-up">

        </div>
        <div class="text sign-up">
          <h2>
            Join with us
          </h2>

        </div>
      </div>
      <!-- END SIGN UP CONTENT -->
    </div>
    <!-- END CONTENT SECTION -->
  </div>

	
	<!-- 아이디찾기 모달창 -->
	<div class="modal2 hidden" style="left:200px;">
		<div class="bg2"></div>
		<div class="modalBox" style="height:auto;">
			<div class="header">
				<h2>아이디 찾기</h2>
			</div>
			<form action="findId" method="post">
			<div class="addDdayBody" style="height:auto;">
				<div class="inputBox">
					<h3 class="inputLabel">이메일 입력</h3>
					<input style="margin-top:15px;" type="text" name="email" id="email" placeholder="가입했던 이메일을 입력해주세요." class="inputField" required/><br>
				</div>
			</div>
			<button style="border:transparent;" type="submit" class="closeBtn2" id="fullBlueBtn">아이디 찾기</button>
			</form>
		</div>
	</div>
	
	
	<script> 
        const open2 = () => {
            document.querySelector(".modal2").classList.remove("hidden");
        }
        const close2 = () => {
            console.log('cdlose')
            document.querySelector(".modal2").classList.add("hidden");
        }
        document.querySelector("#findId").addEventListener("click", open2);
        document.querySelector(".closeBtn2").addEventListener("click", close2);
        document.querySelector(".bg2").addEventListener("click", close2);
    </script>
	
    <!-- 제이쿼리 스크립트 -->
    <script>
    let container = document.getElementById('container')
    toggle = () => {
      container.classList.toggle('sign-in')
      container.classList.toggle('sign-up')
    }
    setTimeout(() => {
      container.classList.add('sign-in')
    }, 200)
    </script>

    <script>
    document.getElementById("memberEnrollBtn").addEventListener("click",function(){
        location.href = "<%= request.getContextPath()%>/member/insert";
    })
    </script>
</body>
</html>