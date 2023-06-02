<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
</head>
<body>
	<%@ include file="/resources/admin/adminFrame.jsp"%>
	<main id="main" class="main">

		<div class="notice">
			<div id="notice_area">
				<span id="notice_title"> 공지사항 </span>
				<hr>
				<form action="<%=  request.getContextPath() %>/notice/update"
					id="updateForm" method="post">

					<div id="enrollWrap">
						<div style="font-size: larger; font-weight: 600;">
							<input id="textInput" type="text" name="noticeTitle" value="${notice.noticeTitle }" required style="width: 100%;">
						</div>
						
						<br>
						
						<textarea id="summernote" name="noticeContent" > ${notice.noticeContent }</textarea>
					</div>
					
					<input type="hidden" name="mode" value="${param.mode}" /> 
					<input type="hidden" name="noticeNo" value="${empty notice.noticeNo ? 0 : notice.noticeNo}" />
					
					<div id="box" style="float: right;">
						<button type="submit" class="btn btn-primary" data-text="등록"
							style="width: 100px;">
							<span>등록</span>
						</button>
						<button type="reset" class="btn btn-danger" data-text="취소"
							style="width: 100px;">
							<span>취소</span>
						</button>
					</div>

				</form>
			</div>
			<script>
				$(document).ready(function() {
					  $('#summernote').summernote({
				 	    	placeholder: 'content',
					        minHeight: 370,
					        maxHeight: null,
					        focus: true, 
					        lang : 'ko-KR',
					        	toolbar: [
					                ['fontname', ['fontname']],     // 글꼴 설정
					                ['fontsize', ['fontsize']],    // 글자 크기 설정
					                ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']], // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
					                ['color', ['forecolor','color']],    // 글자색
					                ['table', ['table']],    // 표만들기
					                ['para', ['ul', 'ol', 'paragraph']],    // 글머리 기호, 번호매기기, 문단정렬
					                ['height', ['height']],    // 줄간격
					                ['insert',['picture','link','video']]
					                  // 코드보기, 확대해서보기, 도움말
					    ],
					      // 추가한 글꼴
					    fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
					     // 추가한 폰트사이즈
					    fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
					  });
					});
			</script>
		</div>
	</main>
</body>
</html>