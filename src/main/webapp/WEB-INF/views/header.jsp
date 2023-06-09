<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.kh.breaktime.member.model.vo.Member"%>
<%@ page import="com.kh.breaktime.business.model.vo.Business"%>
<c:if test="${!empty param.condition}">
	<c:set var="sUrl"
		value="&condition=${param.condition }&keyword=${param.keyword }" />
</c:if>
<c:set var="m" value="${map}" />
<%
	Member loginUser = (Member) session.getAttribute("loginUser");
Business loginBusiness = (Business) session.getAttribute("loginBusiness");
String alertMsg = (String) session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<link rel="stylesheet" href="/breaktime/resources/css/font.css">
<title>헤더</title>

</head>
<body>


	<!-- alertMsg 사용하려고 코드추가 (석범) -->
	<c:if test="${ not empty alertMsg }">
		<script>
			alert( '${alertMsg}' );
		</script>
		<c:remove var="alertMsg" />
	</c:if>

	
    <div id="header">
        <div id="header-content">
            <div id="home-logo">
                <img src="<%=request.getContextPath()%>/resources/images/로고.png" alt="로고이미지">
            </div>
            <div id="header-navbar">
                <div class="header-openBtn" id="header-search" >
                   <img src="<%=request.getContextPath()%>/resources/images/흰돋보기.png" alt="로고이미지" >
                </div>

                <%if (loginUser == null && loginBusiness == null) {%>

                <div id="loginType">로그인</div>
                <% } else if (loginUser != null && loginBusiness == null){ %>
                <div id="userlogout">로그아웃</div>
                <% } else { %> 
                 <div id="bulogout">로그아웃</div>
                <% } %>   
                 <%if(loginBusiness  == null){ %>
                       <div id="mybooking">예약내역</div>

					<%} %>
                
                <div class="header-dropdown">
                  <span class="header-dropbtn">더보기</span>
                  <div class="header-dropdown-content">
                    <a href="#" id="notice">공지사항</a>
                    <%if(loginUser  != null){ %>
                    <a id="myPage">마이페이지</a>
					<%} %>
                    <a href="#" id="message">문의하기</a>
                    <a href="${contextPath}/decide/debasket" id="cart">장바구니</a>
                    <%if (loginBusiness != null) {%>
                    <a href="#" id="asd">사업자</a>
                    <% } %>

                  </div>
                </div> 
        
            </div>
        </div>
    </div>
    



	<!-- 검색 모달창 html -->
	<div class="header-modal hidden">
		<div class="bg"></div>
		<div class="header-modalBox">
			<button class="header-closeBtn">X</button>
			<div class="searchheader">
				<p>검색</p>
			</div>
			<div class="searchbody" style="overflow: auto;">
				<form action="<%=request.getContextPath()%>/list/search"
					method="GET">
					<select name="condition">
						<option value="address"
							${param.condition=='address' ? 'checked' : ''}>주소</option>
						<option value="title" ${param.condition=='title' ? 'checked' : ''}>상호명</option>
					</select>
					
					<input type="search" id="search-input" placeholder="조건으로 검색해보세요"
						value="${param.keyword }" name="keyword" onkeyup="enterkey()">
					

				</form>
			</div>
		</div>
	</div>


	<!-- 검색창 모달창 스크립트 -->
	<script>

            const open = () => {
                document.querySelector(".header-modal").classList.remove("hidden");
                
            }
            const close = () => {
				console.log('cdlose')
                document.querySelector(".header-modal").classList.add("hidden");
            }
            document.querySelector(".header-openBtn").addEventListener("click", open); 
            document.querySelector(".header-closeBtn").addEventListener("click", close); 
            document.querySelector(".bg").addEventListener("click", close); 

        </script>

	<!-- 검색창 엔터키 스크립트 -->
	<script>

    function enterkey() {
    	if (window.event.keyCode == 13) {
        	// 엔터키가 눌렸을 때
        }
    }
     
    </script>

    
      <script>
    document.getElementById("notice").addEventListener("click",function(){
         location.href = "<%=request.getContextPath()%>/notice/publicList";
      })
    </script> 
    
    <script>

          document.getElementById("loginType").addEventListener("click",function(){
        location.href = "<%=request.getContextPath()%>/loginType";
        })
     </script>

      
      <script>
      	document.getElementById("userlogout").addEventListener("click",function(){

        location.href = "<%=request.getContextPath()%>/member/logout";
        })
        
        document.getElementById("bulogout").addEventListener("click",function(){
        location.href = "<%=request.getContextPath()%>/business/logout";
        })
      </script>

	<script>
          document.getElementById("home-logo").addEventListener("click",function(){
        location.href = "<%=request.getContextPath()%>/main";
        })
      </script>

	<script>
          document.getElementById("mybooking").addEventListener("click",function(){
        location.href = "<%=request.getContextPath()%>/booking/bookingView";
        })
      </script>

	<script>
          document.getElementById("message").addEventListener("click",function(){
        location.href = "<%=request.getContextPath()%>/member/list";
        })
      </script>


	<script>
      <!-- 로그인 안된 상태에서 마이페이지 클릭시 알랏출력, 로그인유저세션에 값이있을시 마이페이지로  -->
      <%if (loginUser == null) {%> 
      document.getElementById("myPage").addEventListener("click",function(){
        alert("로그인 후 이용해주세요");
      })
      <%} else {%>
      document.getElementById("myPage").addEventListener("click",function(){
          location.href = "<%=request.getContextPath()%>/member/myPage"; 
        })
      <%}%>
      
      <%if (loginUser == null) {%> 
      document.getElementById("message").addEventListener("click",function(){
        location.href = "<%=request.getContextPath()%>/loginType"; 
      })
      <%}%>
      
      <%if (loginUser == null) {%> 
      document.getElementById("cart").addEventListener("click",function(){
        location.href = "<%=request.getContextPath()%>/loginType"; 
      })

      <% }%>

      </script>

</body>
</html>