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
    width: 40%;
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
    color: rgba(0,0,0,0.56);
	}
	
	li{
	margin-bottom : 26px;
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
</style>
</head>
<body>
	
	<div id="wrapper" >
		<div style="width:100%; display: contents;">
			<h1 style="margin-bottom:100px; border-top: 1px solid black; border-bottom: 1px solid black;">MEMBER INFO</h1>
		</div>
		<div style="width:100%; display: flex; flex-direction: row;">
			<div id="content1">
				<ul style="list-style:none;">
					<li><a class="sideMenu">내 정보</a></li>
					<li><a class="sideMenu">예약내역</a></li>
					<li><a class="sideMenu">찜한 목록</a></li>
					<li><a class="sideMenu">문의쪽지</a></li>
					<li><a class="sideMenu">쿠폰함(미정)</a></li>
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
						<button class="btn btn-primary btn-ghost btn-slash" id="promptStart">아이디수정</button>
						<button class="btn btn-primary btn-ghost btn-slash">비밀번호수정</button>
					</div>			
					
					<div style="display:flex; margin-bottom:1%">
						<b>예약자이름</b>
						<b class="sessionData"><%= loginUser.getUserName() %></b>
					</div>
					<div style="margin-bottom:3%">
						<button class="btn btn-primary btn-ghost btn-slash">예약자이름수정</button>
					</div>
					<div style="display:flex; margin-bottom:1%">
						<b>이메일</b>
						<b class="sessionData"><%= loginUser.getEmail() %></b>
					</div>
					<div style="margin-bottom:3%">
						<button class="btn btn-primary btn-ghost btn-slash">이메일 수정</button>
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
	
	<!-- 아이디수정 모달창 -->
	<script>

	
	  $("#promptStart").click(function () {
		    
		    (async () => {
		        const { value: 'text'.val() } = await Swal.fire({
		            title: '아이디 변경',
		            text: '4~12자 영문 대소문자, 숫자만 입력하세요.',
		            input: 'text',
		            inputPlaceholder: '변경할 아이디입력'
		        })

		        // 이후 처리되는 내용.
		        if ('text'.val()) {
		        	  $.ajax({
		        		   type : "POST",
							url : "${contextPath}/member/updateId",
							data : 'text'.val(),
							success : function (){			
									location.href="${contextPath}/member/myPage";
							}
						}) 	
			         Swal.fire(`변경성공`)
		        }
		    })()
		  });
	</script>
	
	<script>
	document.getElementById("logOut").addEventListener("click",function(){
        location.href = "<%= request.getContextPath()%>/member/logout";
    })
	</script>
	
</body>
</html>