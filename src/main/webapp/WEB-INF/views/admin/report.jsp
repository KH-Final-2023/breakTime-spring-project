<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
.page-item.active a {
    background-color: #f8f9fa;
    color: #007bff;
}
</style>
</head>
<body>
	<%@ include file="/resources/admin/adminFrame.jsp"%>
	<main id="main" class="main">

		<div class="notice">
			<div id="notice_area">
				<span id="notice_title"> 신고 리뷰 관리 </span>
				<hr>


				<div id="RenrollWrap">
					<c:if test="${empty selectReportList.list}">
								<div style="font-weight:bold; text-align:center;">신고된 리뷰 목록이 없습니다.</div>
								<br>
					</c:if>
					<c:forEach var="r" items="${selectReportList.list}">
						<div id="content">
							<div id="content2">
								<div id="reviewBackground" style="width:100%;">
									<div id="review-star-rating">
										<div class="fa fa-star" >
											<c:choose>
												<c:when test="${r.starScore == '1' }">★</c:when>
												<c:when test="${r.starScore == '2' }">★★</c:when>
												<c:when test="${r.starScore == '3' }">★★★</c:when>
												<c:when test="${r.starScore == '4' }">★★★★</c:when>
												<c:when test="${r.starScore == '5' }">★★★★★</c:when>
											</c:choose>	
										</div>
									</div>
									<div id="reviewNickname">
										<div>${r.userName }|${r.createDate }</div>
									</div>
									<div id="reviewRoomName">
										<div id="reviewRoomNameList">객실명</div>
										<div id="reviewRoomNameInfo">${r.roomName }</div>
									</div>
									<div id="review">${r.reviewContent }</div>
									<c:if test="${r.reviewContentReply ne null}">
										<div id="buReviewList">
											<span style="font-size: larger;"><b>숙소 답변</b></span>
											<p class="buReview">${r.reviewContentReply }</p>
										</div>
									</c:if>
								</div>
							</div>
							<hr style="color: rgba(0, 0, 0, 0.5);">
							
								<button type="button" onclick="deleteReview(${r.reviewNo})"class="btn btn-outline-danger">삭제</button>

							<a href="<%=request.getContextPath()%>/report/update?reviewNo=${r.reviewNo}">
								<button type="submit" class="btn btn-outline-success" data-text="유지">유지</button>
							</a>
						</div>
					</c:forEach>

					<c:set var="url" value="list?cpage=" />
					<div class="paging">
						<ul class="pagination">
							<c:choose>
								<c:when test="${ selectReportList.pi.currentPage eq 1 }">
									<li class="page-item disabled"><a class="page-link"
										href="#">Previous</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="${url}${selectReportList.pi.currentPage -1 }${sUrl}">Previous</a></li>
								</c:otherwise>
							</c:choose>

							<c:forEach var="item" begin="${selectReportList.pi.startPage }"
								end="${selectReportList.pi.endPage }">
								<c:set var="currentPage" value="${selectReportList.pi.currentPage}" />
								    <li class="page-item ${currentPage == item ? 'active' : ''}">
								        <a class="page-link" href="${url}${item}${sUrl}">${item}</a>
								    </li>
							</c:forEach>

							<c:choose>
								<c:when
									test="${ selectReportList.pi.currentPage eq selectReportList.pi.maxPage }">
									<li class="page-item disabled"><a class="page-link"
										href="#">Next</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="${url}${selectReportList.pi.currentPage + 1 }${sUrl}">Next</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</main>
	
	<script type="text/javascript">
		$(document).ready(function() {
			var reportKeep = '<c:out value="${reportKeep}"/>';
			if(!(reportKeep==''))
			alert("해당 리뷰를 반려 처리였습니다.");
		});
		
		function deleteReview(reviewNo) {
		    if (!confirm("해당 리뷰를 삭제 처리하시겠습니까?")) {
		        return false;
		    } else {
		        location.href = "<%=request.getContextPath()%>/report/delete?reviewNo=" + reviewNo;
		        alert("성공적으로 삭제 처리되었습니다.");
		    }
		}
	</script>
</body>
</html>