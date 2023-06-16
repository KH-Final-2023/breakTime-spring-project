<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page import="com.kh.breaktime.member.model.vo.Member"%>
<%@ page import="com.kh.breaktime.business.model.vo.Business"%>
<%
   Member loginUser = (Member) session.getAttribute("loginUser");
   Business loginBusiness = (Business) session.getAttribute("loginBusiness");
   String alertMsg = (String) session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 고객 마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@alphardex/aqua.css/dist/aqua.min.css"> -->
<link rel="stylesheet" href="../resources/css/button.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.10/dist/sweetalert2.all.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.10/dist/sweetalert2.min.css" rel="stylesheet">
<link rel="stylesheet" href="/breaktime/resources/css/sukbumModal.css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
	#wrapper{
	width: 100%;
    height: 800px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
    
	}
	
	#content1 {
    width: 20%;
    margin-bottom: 50px;
    display: flex;
    flex-direction: column;
    align-items: flex-end;
    padding-right: 5%;
    }
	
	#content2{
	padding-left:7%;
	width: 60%; 
	display: flex;
    flex-direction: column;
    border-left: 2px solid #67d567;
	}
	
	.sideMenu{
	font-size: 18px;
    color: black;
	}
	
	li{
	width: 140px;
  font-family: 'Roboto', sans-serif;
  font-size: 11px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 500;
  color: #000;
  background-color: #fff;
  border: none;
  border-radius: 45px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  margin-bottom : 20px;
	}
	
	b{
	width:100px;
	}
	
	.sessionData{
	color:#67d567;
	}
	
	.btn-primary btn-ghost btn-slash{
	color: #67d567;
    border-color: #67d567;
	}
	
	a{
	 text-decoration : none;
	 display: flex;
    justify-content: center;
	}
	
	li:hover {
  border: 1px solid #2EE59D;
  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
  color: #fff;
  transform: translateY(-7px);
}
</style>
</head>
<body>
	
  
	<div id="wrapper" >
	
		<div style="width:100%; display: contents;">
			<h1 style="color: #1dbf1d; margin-bottom:100px;border-top:1px solid #1dbf1d; border-bottom: 1px solid #1dbf1d;">MEMBER INFO</h1>
		</div>
		<div style="width:100%; display: flex; flex-direction: row;">
			<div id="content1">
				<ul style="list-style:none;">
					<li><a class="sideMenu" href="<%=request.getContextPath()%>/member/myPage">내 정보</a></li>
					<li><a class="sideMenu" id="booking">예약내역</a></li>
					<li><a class="sideMenu" href="<%=request.getContextPath()%>/member/wishList">찜한 목록</a></li>
					<li><a class="sideMenu" href="<%=request.getContextPath()%>/member/list">문의쪽지</a></li>
				</ul>
				<div style="margin-top: auto; position: relative;">
					<button class="btn btn-primary btn-ghost btn-slash" id="confirmStart">회원탈퇴</button>
				</div>
			</div>
		
			<div id="content2">
					<div style="margin-bottom:3%">
						<b class="sessionData"><%= loginUser.getUserName()%></b>
						<span>님 환영합니다.</span>
					</div>
					<div style="display:flex;">
						<div style="height:128px; width:128px; margin-bottom:5%;">
							<img style="width: 100%;height: 100%;"src="<%=request.getContextPath()%>/resources/images/마이페이지.png">
						</div>
						<div style=" padding-left:25%">
						<button class="btn btn-primary btn-ghost btn-slash" id="logOut">로그아웃</button>
						</div>
					</div>
					<div style="display:flex; margin-bottom:1%">
						<b>아이디</b>
						<b class="sessionData"><%= loginUser.getUserId() %></b>
					</div>
					<div style="margin-bottom:2%">
						<button class="btn btn-primary btn-ghost btn-slash" id="updateId">아이디수정</button>
						<button class="btn btn-primary btn-ghost btn-slash" id="updatePwd">비밀번호수정</button>
					</div>			
					
					<div style="display:flex; margin-bottom:1%">
						<b>예약자이름</b>
						<b class="sessionData"><%= loginUser.getUserName() %></b>
					</div>
					<div style="margin-bottom:3%">
						<button class="btn btn-primary btn-ghost btn-slash" id="updateName">예약자이름수정</button>
					</div>
					<div style="display:flex; margin-bottom:1%">
						<b>이메일</b>
						<b class="sessionData"><%= loginUser.getEmail() %></b>
					</div>
					<div style="margin-bottom:3%">
						<button class="btn btn-primary btn-ghost btn-slash" id="updateEmail">이메일 수정</button>
					</div>
			</div>
		</div>
	</div>
	
	
	<!--  회원탈퇴 모달창 -->
	<script>
	const userId = '${loginUser.userId}';
		
	$("#confirmStart").click(function () {
	    Swal.fire({
	      title: '탈퇴하시겠습니까?',
	      text: "다시 되돌릴 수 없습니다. 신중하세요.",
	      icon: 'warning',
	      showCancelButton: true,
	      confirmButtonColor: '#3085d6',
	      cancelButtonColor: '#d33',
	      confirmButtonText: '탈퇴',
	      cancelButtonText: '취소',
	      reverseButtons: true, // 버튼 순서 거꾸로
	      
	    }).then((result) => {
	      if (result.isConfirmed) {
	    	  $.ajax({
					url : "${contextPath}/member/delete",
					data : {userId},
					success : function (){			
							location.href="${contextPath}/main";
					}
				}) 	
	        Swal.fire(
	          '탈퇴가 완료되었습니다.',
	          '탈퇴성공'
	        )
	      }
	    })
	  });
	</script>
	
	<!-- 아이디변경 모달창 -->
	<div class="modal3 hidden">
		<div class="bg3"></div>
		<div class="modalBox" style="height: 300px;">
			<div class="header">
				<h2>아이디 변경</h2>
			</div>
		<form action="updateId" method="post">
			<div class="addDdayBody" style="height:auto;">
				<div class="inputBox">
					<h3 class="inputLabel">아이디</h3>
					<input type="text" id="updateId" name="userId" placeholder="특수문자 제외 2자~ 8자" class="inputField" /><br>
				</div>
				<div id="emailnotice"
					style="position: relative; text-align: center;">
					※ 아이디를 변경하면 <span class="redline">30일간 변경할 수 없습니다.</span><br>
				</div>
			</div>
			<button type="submit" class="closeBtn3" id="fullBlueBtn3"
					style="width: 100%; height: 60px; display: flex; justify-content: space-evenly; border:transparent; border-radius:0px 0px 12px 12px;" onclick="return validateNickName();">
					아이디 변경
			</button>
		</form>
		<script>
		function validateNickName(){
			  var updaeIdVal = $("#updaeId").val();
			  
			  var regExp = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,8}$/;
			  // 검증에 사용할 정규식 변수 regExp에 저장
			  if (regExp.test(updaeIdVal)) {
			    return true;
			  }
			  else {
			    alertMsg('닉네임 형식이 다릅니다.');
			    return false;
			  }
			  window.location.href="/breaktime/member/myPage"; 
		}
		</script>
		</div>
	</div>
	<!-- 아이디변경 모달창  끝-->
	
	<!-- 비밀번호변경 모달창 -->
	<div class="modal hidden">
		<div class="bg"></div>
		<div class="modalBox">
			<div class="header">
				<h2>비밀번호 변경</h2>
			</div>
			<form action="updatePwd" method="post"> 
				<div class="addDdayBody">
					<div class="inputBox">
						<h4 class="inputLabel">새 비밀번호</h4>
						<input type="password" name="userPwd" placeholder="새 비밀번호" class="inputField" required /><br>
						<input type="password" name="checkPwd" placeholder="새 비밀번호 확인" class="inputField" required />
					</div>
				</div>
				<button type="submit" class="closeBtn" id="fullBlueBtn1"
					onclick="return validatePwd();">비밀번호 변경</button>			
			</form>
			
			<!-- 비밀번호 유효성검사 정규식 -->
			<script>
		 	function validatePwd(){
		 		var regExp = /^[a-z0-9!@#$%^]{8,15}$/i;
			        if(!regExp.test(userPwd.value)){
			              alertMsg("유효한 비밀번호를 입력해주세요");
			              userPwd.value = "";
			              userPwd.select();
			               return true;
			            } 
		 				if($("input[name='userPwd']").val() != $("input[name='checkPwd']").val()) {
		 					alertMsg("비밀번호가 일치하지 않습니다.");						
		 					return true;	
		 				} 
		 			}
		 	</script>
		</div>
	</div>
	
	<!-- 예약자이름변경 모달창 -->
	<div class="modal1 hidden">
		<div class="bg1"></div>
		
		<div class="modalBox" style="height:auto;">
			<div class="header">
				<h2>예약자이름 변경</h2>
			</div>
			<form action="updateName" method="post">
			<div class="addDdayBody" style="height:auto;">
				<div class="inputBox">
					<h3 class="inputLabel">이름</h3>
					<input type="text" name="userName" id="updateName" placeholder="" class="inputField" required/><br>
				</div>
			</div>
			<button style="border:transparent;" type="submit" class="closeBtn1" id="fullBlueBtn">이름변경</button>
			</form>
		</div>
	</div>
	
	<!-- [이메일 변경] 모달창 -->
	<div class="modal2 hidden">
		<div class="bg2"></div>
		<div class="modalBox" style="height:auto;">
			<div class="header">
				<h2>이메일 변경</h2>
			</div>
			<form action="updateEmail" method="post">
			<div class="addDdayBody" style="height:auto;">
				<div class="inputBox">
					<h3 class="inputLabel">이메일</h3>
					<input type="text" name="email" id="email" placeholder="ex)abc@naver.com" class="inputField" required/><br>
				</div>
			</div>
			<button style="border:transparent;" type="submit" class="closeBtn2" id="fullBlueBtn" onclick="return validateEmail();">이메일 변경</button>
			</form>
	</div>
		
		
		<script> // 이메일변경 모달창 클릭시 이메일양식에 맞는지 유효성검사
		function validateEmail(){
			  var emailVal = $("#email").val();

			  var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			  // 검증에 사용할 정규식 변수 regExp에 저장
			  if (regExp.test(emailVal)) {
			    return true;
			  }
			  else {
			    khalert('이메일 형식이 다릅니다.');
			    return false;
			  }
		}
		</script>
	</div>
	
	<!-- 로그아웃,찜목록으로 포워딩 스크맆트 -->
	<script>
	document.getElementById("logOut").addEventListener("click",function(){
        location.href = "<%= request.getContextPath()%>/member/logout";
    })
    
    document.getElementById("wishList").addEventListener("click",function(){
        location.href = "<%= request.getContextPath()%>/member/wishList";
    })
	</script>
	
	<!-- 아이디변경 모달창 스크립트 -->
	<script> 
    const open3 = () => {
        document.querySelector(".modal3").classList.remove("hidden");
    }
    const close3 = () => {
        console.log('cdlose')
        document.querySelector(".modal3").classList.add("hidden");
    }
    document.querySelector("#updateId").addEventListener("click", open3);
    document.querySelector(".closeBtn3").addEventListener("click", close3);
    document.querySelector(".bg3").addEventListener("click", close3);
	</script>
	<!-- 아이디변경 스크립트 끝 -->
	
	<!--비밀번호변경 모달창 스크맆트-->
	<script> 
        const open = () => {
            document.querySelector(".modal").classList.remove("hidden");
        }
        const close = () => {
            console.log('cdlose')
            document.querySelector(".modal").classList.add("hidden");
        }
        document.querySelector("#updatePwd").addEventListener("click", open);
        document.querySelector(".closeBtn").addEventListener("click", close);
        document.querySelector(".bg").addEventListener("click", close);
    </script>
    <!-- 비밀번호변경 스크맆트 끝 -->
    
    <!-- 이름변경 모달창 스크맆트 -->
	<script> 
        const open1 = () => {
            document.querySelector(".modal1").classList.remove("hidden");
        }
        const close1 = () => {
            console.log('cdlose')
            document.querySelector(".modal1").classList.add("hidden");
        }
        document.querySelector("#updateName").addEventListener("click", open1);
        document.querySelector(".closeBtn1").addEventListener("click", close1);
        document.querySelector(".bg1").addEventListener("click", close1);
    </script>
    
     <!-- 이메일변경 모달창 스크맆트 -->
	<script> 
        const open2 = () => {
            document.querySelector(".modal2").classList.remove("hidden");
        }
        const close2 = () => {
            console.log('cdlose')
            document.querySelector(".modal2").classList.add("hidden");
        }
        document.querySelector("#updateEmail").addEventListener("click", open2);
        document.querySelector(".closeBtn2").addEventListener("click", close2);
        document.querySelector(".bg2").addEventListener("click", close2);
    </script>

 	  <script>
         document.getElementById("booking").addEventListener("click",function(){
        location.href = "<%=request.getContextPath()%>/booking/bookingView";
        })
      </script>
</body>
</html>