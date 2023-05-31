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
<link rel="stylesheet" href="/breaktime/resources/css/header.css">
<link rel="stylesheet" href="/breaktime/resources/css/base.css">
<link rel="stylesheet" href="/breaktime/resources/css/main.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js" charset="UTF-8"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
	#wrapper{
	width: 100%;
    height: 800px;
    border: 1px solid black;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
    justify-content: space-evenly;
	}
	
	#content1{
	border: 1px solid green;
    width: 30%;
    margin-bottom: 50px;
    display: flex;
    flex-direction: column;
    align-items: flex-end;
    }
	
	#content2{
	border: 1px solid yellowgreen;
	padding-left:20%;
	width: 70%; 
	height:400px;
	display: flex;
    flex-direction: column;
	}
</style>
</head>
<body>
	
	<div id="wrapper" >
		<div style="width:100%; display: contents;">
			<h1 style="margin-bottom:50px; border-top: 1px solid black; border-bottom: 1px solid black;">MEMBER INFO</h1>
		</div>
		<div style="width:100%; display: flex; flex-direction: row;">
			<div id="content1">
				<button>내 정보</button>
				<button>예약내역</button>
				<button>기타</button>
			</div>
		
			<div id="content2"> 
				<div style="height:25%;">
					<b><%= loginUser.getUserName() %></b>님 환영합니다.
					<b>리뷰횟수</b>
				</div>
				<div>
					<button>아이디변경</button><br>
					<button>비밀번호변경</button>
				</div>
			</div>
		</div>
	</div>
	
	
</body>
</html>