<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>


<script type="text/javascript">
        function approvalCancle(){
								
			if(!confirm("해당 사업자를 가입 취소 처리하시겠습니까?")){
				return false;
			}else{
				location.href="<%=request.getContextPath()%>/manage/delete?buId=${b.buId}";
			}
			}
        
        $(document).ready(function() {
            var approvalAccept = '<c:out value="${approvalAccept}"/>';
            if(!(approvalAccept==''))
                alert("해당 사업자 가입 승인에 성공하였습니다.");
        });
	</script>

</head>
<body>
	<%@ include file="/resources/admin/adminFrame.jsp"%>
	<main id="main" class="main">
		<div class="notice">
			<div id="notice_area">
				<span id="notice_title"> 사업자 가입 승인 </span>
				<hr>
				<div id="enrollWrap">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>사업자</th>
								<th>전화번호</th>
								<th>숙소 이름</th>
								<th>주소</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="b" items="${selectApprovalList.list}">
								<tr>
									<td>${b.buUserName }</td>
									<td>${b.buTel }</td>
									<td>${b.buTitle }</td>
									<td>${b.buAddress }</td>
									<td><a
										href="<%=request.getContextPath()%>/approval/update?buId=${b.buId}">
											<button type="button" class="btn btn-outline-primary"
												data-text="승인">
												<span>승인</span>
											</button>
									</a></td>
									<td><a href="javascript:void(0);"
										onclick="approvalCancle();">
											<button type="button" class="btn btn-outline-danger"
												data-text="취소">
												<span>취소</span>
											</button>
									</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<c:set var="url" value="list?cpage=" />
					<div class="paging">
						<ul class="pagination">
							<c:choose>
								<c:when test="${ selectApprovalList.pi.currentPage eq 1 }">
									<li class="page-item disabled"><a class="page-link"
										href="#">Previous</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="${url}${selectApprovalList.pi.currentPage -1 }${sUrl}">Previous</a></li>
								</c:otherwise>
							</c:choose>

							<c:forEach var="item" begin="${selectApprovalList.pi.startPage }"
								end="${selectApprovalList.pi.endPage }">
								<li class="page-item"><a class="page-link"
									href="${url}${item }${sUrl}">${item }</a></li>
							</c:forEach>

							<c:choose>
								<c:when
									test="${ selectApprovalList.pi.currentPage eq selectApprovalList.pi.maxPage }">
									<li class="page-item disabled"><a class="page-link"
										href="#">Next</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="${url}${selectApprovalList.pi.currentPage + 1 }${sUrl}">Next</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</main>
</body>
</html>