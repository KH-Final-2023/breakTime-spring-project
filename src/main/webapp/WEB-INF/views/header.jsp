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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/header.css">
    <title>Document</title>
</head>
<body>
    <div id="header">
        <div id="header-content">
            <div id="home-logo">
                <img src="resources/images/로고.png" alt="로고이미지">
            </div>
            <div id="navbar">
                <div id="search">
                   <img src="resources/images/흰돋보기.png" alt="로고이미지">
                </div>

                <%if (loginUser == null && loginBusiness == null) {%>

                <div id="loginType">로그인</div>
                <% } else { %>
                <div id="logoutType">로그아웃</div>
                <% } %>   
                <div id="mybooking">예약내역</div>
                <div class="dropdown">
                  <span class="dropbtn">더보기</span>
                  <div class="dropdown-content">
                    <a href="#" id="notice">공지사항</a>
                    <a href="#" id="myPage">마이페이지</a>
                    <a href="#" id="message">쪽지함</a>
                    <a href="#" id="cart">장바구니</a>
                    <a href="#" id="review">리뷰관리</a>

                    <%if (loginBusiness != null) {%>
                    <a href="#" id="asd">사업자</a>
                    <% } %>

                  </div>
                </div> 
                
                
                
                
            </div>
        </div>
    </div>
    
 	  <script>
    document.getElementById("notice").addEventListener("click",function(){
         location.href = "<%=request.getContextPath()%>/notice/publicList";
      })
    </script> 
    
    
    <script>
    document.getElementById("review").addEventListener("click",function(){
         location.href = "<%=request.getContextPath()%>/decideReview";
      })
    </script>
    
    <script>
          document.getElementById("loginType").addEventListener("click",function(){
        location.href = "<%=request.getContextPath()%>/loginType";
        })
      </script>
      
      <script>
          document.getElementById("logoutType").addEventListener("click",function(){
        location.href = "<%=request.getContextPath()%>/member/logoutType";
        })
      </script>
      
      <script>
          document.getElementById("home-logo").addEventListener("click",function(){
        location.href = "<%=request.getContextPath()%>/main";
        })
      </script>
      
      
      <script>
      
      <%if (loginUser == null) {%> 
      document.getElementById("myPage").addEventListener("click",function(){
        location.href = "<%=request.getContextPath()%>/loginType"; 
      })
      <% }%>
      
      <%if (loginUser == null) {%> 
      document.getElementById("message").addEventListener("click",function(){
        location.href = "<%=request.getContextPath()%>/loginType"; 
      })
      <% }%>
      
      <%if (loginUser == null) {%> 
      document.getElementById("cart").addEventListener("click",function(){
        location.href = "<%=request.getContextPath()%>/loginType"; 
      })
      <% }%>
      
      <%if (loginUser == null) {%> 
      document.getElementById("review").addEventListener("click",function(){
        location.href = "<%=request.getContextPath()%>/loginType"; 
      })
      <% }%>
      
      <%if (loginUser == null) {%> 
      document.getElementById("mybooking").addEventListener("click",function(){
        location.href = "<%=request.getContextPath()%>/loginType"; 
      })
      <% }%>
      

      
      
      </script>

    
    
    
</body>
</html>