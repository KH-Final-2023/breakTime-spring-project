<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page import="com.kh.breaktime.member.model.vo.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/breaktime/resources/css/header.css">
<link rel="stylesheet" href="/breaktime/resources/css/base.css">
<link rel="stylesheet" href="/breaktime/resources/css/font.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js" charset="UTF-8"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>Insert title here</title>
</head>
<body>
	
	<div id="wrapper">

		<jsp:include page="/WEB-INF/views/header.jsp" />
		

		<div style="margin-bottom:3%">
			<b class="sessionData"><%= loginUser.getUserName()%></b>
			<span>님 환영합니다.</span>
		</div>
		
	
	
	
	
		
		
		
	</div>



</body>
</html>