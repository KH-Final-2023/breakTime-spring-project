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
        function deleteManage(){
								
			if(!confirm("해당 사업자를 탈퇴 처리하시겠습니까?")){
				return false;
			}else{
				location.href="<%=request.getContextPath()%>/manage/delete?buId=${b.buId}";
			}
			}
        
        $(document).ready(function() {
            var updateManage = '<c:out value="${updateManage}"/>';
            if(!(updateManage==''))
                alert("해당 사업자 정보수정에 성공하였습니다.");
        });
	</script>

</head>
<body>
	<%@ include file="/resources/admin/adminFrame.jsp"%>
	<main id="main" class="main">

		<div class="notice">
			<div id="notice_area">
				<span id="notice_title"> 사업자 정보 관리 </span>
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
							<c:forEach var="b" items="${selectManageList.list}"
								varStatus="vs">
								<tr>
									<td>${b.buUserName }</td>
									<td>${b.buTel }</td>
									<td>${b.buTitle }</td>
									<td>${b.buAddress }</td>
									<td>
										<button id="update-btn" type="submit"
											class="btn btn-outline-primary" data-text="수정"
											data-toggle="modal" data-target="#updateMember${vs.index }">
											<span>수정</span>
										</button>

									</td>
									<td><a href="javascript:void(0);"
										onclick="deleteManage();">
											<button type="button" class="btn btn-outline-danger"
												data-text="탈퇴">
												<span>탈퇴</span>
											</button>
									</a></td>
								</tr>

								<!--  수정 모달창 -->
								<form action="<%=  request.getContextPath() %>/manage/update"
									id="updateForm" method="post">
									<div id="updateMember${vs.index }" class="modal fade"
										id="registerModal" tabindex="-1" aria-labelledby="modalLabel"
										aria-hidden="true">
										<div
											class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">고객 정보 수정</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<p style="word-spacing: 8px;">
														사업자 : <input type="text" name="buUserName"
															value="${b.buUserName} ">
													</p>
													<p>
														전화번호 : <input type="text" name="buTel" value="${b.buTel} ">
													</p>
													<p>
														숙소이름 : <input type="text" name="buTitle"
															value="${b.buTitle} ">
													</p>
													<p style="word-spacing: 16px;">
														주소 : <input type="text" name="buAddress"
															value="${b.buAddress} ">
													</p>
												</div>
												<input type="hidden" name="buId"
													value="${empty b.buId ? 0 : b.buId}" />
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">취소</button>
													<a
														href="<%=request.getContextPath()%>/manage/update?buId=${b.buId}">
														<button type="submit" id="btn_register"
															class="btn btn-primary">확인</button>
													</a>
												</div>
											</div>
										</div>
									</div>
								</form>
							</c:forEach>
						</tbody>
					</table>
					<c:set var="url" value="list?cpage=" />
					<div class="paging">
						<ul class="pagination">
							<c:choose>
								<c:when test="${ selectManageList.pi.currentPage eq 1 }">
									<li class="page-item disabled"><a class="page-link"
										href="#">Previous</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="${url}${selectManageList.pi.currentPage -1 }${sUrl}">Previous</a></li>
								</c:otherwise>
							</c:choose>

							<c:forEach var="item" begin="${selectManageList.pi.startPage }"
								end="${selectManageList.pi.endPage }">
								<li class="page-item"><a class="page-link"
									href="${url}${item }${sUrl}">${item }</a></li>
							</c:forEach>

							<c:choose>
								<c:when
									test="${ selectManageList.pi.currentPage eq selectManageList.pi.maxPage }">
									<li class="page-item disabled"><a class="page-link"
										href="#">Next</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="${url}${selectManageList.pi.currentPage + 1 }${sUrl}">Next</a></li>
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