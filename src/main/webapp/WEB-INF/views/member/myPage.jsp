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
<style>
	#wrapper{
	width: 100%;
    height: 800px;
    border: 1px solid black;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
	}
	
	#content1{
	border: 1px solid black;
    width: 20%;
    height: 30px;
    margin-bottom: 50px;
    display: flex;
    justify-content: space-between;
    }
    .borderBottom{
    border-bottom: 1px solid gray;
    }
</style>
</head>
<body>
	<div id="wrapper" >
		<h1 style="margin-bottom:50px;">마이페이지</h1>
		<div id="content1">
			<button>내 정보</button>
			<button>예약내역</button>
			<button>기타</button>
		</div>
		
		<div id="content2" style="border:1px solid black; width: 45%; height:400px"> 
			<p><%= loginUser.getUserName() %></p>
			<div class="borderBottom">
				<b>아이디변경</b>
				<input type="textarea"/>
			</div>
			<div class="borderBottom">
				비밀번호변경
			</div>
			<div>
				
			</div>
		</div>
	</div>
	
	
</body>
</html>