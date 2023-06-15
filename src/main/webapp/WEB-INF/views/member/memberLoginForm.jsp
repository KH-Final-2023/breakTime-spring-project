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
  #userIdOutput {
    position: fixed;
    bottom: 10px;
    right: 10px;
    background-color: #ffffff;
    padding: 10px;
    border: 1px solid #000000;
  }
    </style>
</head>
<body>

${script }

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
      <h2>아이디 찾기<b></b></h2>
    </div>
    <div class="addDdayBody" style="height:auto;">
      <div class="inputBox">
        <h3 class="inputLabel">이메일 입력</h3>
        <input style="margin-top:15px;" type="text" name="email" id="email" placeholder="가입했던 이메일을 입력해주세요." class="inputField" required/>
      </div> 
    	
    </div>
    <button style="border:transparent;" type="button" class="closeBtn2" id="fullBlueBtn">아이디 찾기</button>
  </div>
</div>


      
    <script>
      $(document).ready(function() {
        // 아이디 찾기 버튼 클릭 시 AJAX 요청 보내기
        $('#fullBlueBtn').click(function() {
          var email = $('#email').val(); // 입력된 이메일 값 가져오기

          $.ajax({
            type: 'POST',
            url: 'findId',
            data: { email: email },
            success: function(response) {
                if (response !== null && response !== '') {
                  // 아이디가 존재하는 경우
                  alert('아이디는 ' + response + '입니다.');
                } else {
                  // 아이디가 존재하지 않는 경우
                  alert('이메일이 존재하지않습니다.');
                }
              },
            error: function() {
              // 요청 실패 시 처리할 코드
              console.log('AJAX 요청 실패');
            }
          });
        });
      });
      </script>
 
	 
<script> 
  const open2 = () => {
    document.querySelector(".modal2").classList.remove("hidden");
  }
  const close2 = () => {
    console.log('close')
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