<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>어때요? :: UH DDAE YO</title>

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/css/modern-business.css"
	rel="stylesheet">

<script type="text/javascript">

	var sugNo;
	function editMemo(writtenMemo, writtenSugNo) {
		document.getElementById("memoTextarea").value = writtenMemo;
		sugNo = writtenSugNo;
	}
	
	function saveMemo() {
		var memo = document.getElementById("memoTextarea").value;
		if (memo == "") {
			alert("답글을 입력해 주세요.");
			return;
		}
		
		$.ajax({
			type: "POST",
			url: "saveMemo",
			data : {memo : memo,
				sugNo : sugNo,
				},
			success: function(result) {
				alert("등록에 성공했습니다.");
				$("#myModal").hide();
				window.location.reload();
			},
			error: function(e) {
				alert("등록에 실패했습니다.");
			}
		});

	}
</script>
</body>

	<%@include file="header.jsp"%>

	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<%@ include file="../include/menu.jsp"%>

			<div class="col-lg-9">
				<h2 style="margin-top: 55px;">예약 현황</h2>
				<div class="row" style="margin-top: 40px;">

					<table class="table table-hover">

						<thead>
							<tr>
								<th scope="col" style="width: 5%; text-align: center"></th>
								<th scope="col" style="width: 20%; text-align: center">고객명</th>
								<th scope="col" style="width: 30%; text-align: center">예약날짜/시간</th>

								<th scope="col" style="width: 10%; text-align: center">인원</th>
								<th scope="col" style="width: 35%; text-align: center">메모</th>
							</tr>
						</thead>

						<tbody>

							<c:choose>
								<c:when test="${fn:length(resvList) > 0}">
									<c:forEach items="${resvList}" var="resv" varStatus="idx">
										<tr>
											<td style="vertical-align: middle; text-align: center">${idx.count}</td>
											<td style="vertical-align: middle; text-align: center">${resv.userName }</td>
											<td style="vertical-align: middle; text-align: center"><fmt:formatDate
													value="${resv.date }" pattern="yyyy-MM-dd HH:mm" /></td>
											<td style="vertical-align: middle; text-align: center">${resv.memCnt }</td>

											<c:choose>
												<c:when test="${resv.memo == ''}">
													<td style="vertical-align: middle; text-align: center">
														<button type="button" class="btn btn-outline-secondary"
															id="message" data-toggle="modal" data-target="#myModal";>메모쓰기</button>
													</td>


												</c:when>
												<c:otherwise>
													<td style="vertical-align: middle; text-align: center">
														<a data-toggle="modal" href="#myModal"
														onclick="editMemo('${resv.memo}', ${resv.sugNo});">${resv.memo}</a>
													</td>
												</c:otherwise>
											</c:choose>



										</tr>

										<!-- 모닱창 -->
										<div class="modal fade" id="myModal" role="dialog">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title">MEMO</h5>

													</div>
													<div class="modal-body">
														<textarea class="form-control" id="memoTextarea" rows="3"></textarea>
													</div>
													<div class="modal-footer">
														<button id="saveBtn" type="button" class="btn btn-primary"
															onclick="saveMemo();">저장</button>
														<button id="cancelBtn" type="button"
															class="btn btn-secondary" data-dismiss="modal">취소</button>
													</div>
												</div>
											</div>
										</div>
										
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="6">조회된 결과가 없습니다!</td>
									</tr>
								</c:otherwise>
							</c:choose>

						</tbody>


					</table>

				</div>

				<div style="text-align: center;">
					<div style="display: inline-block;">
						<ul class="pagination">
							<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a>
							</li>
							<li class="page-item active"><a class="page-link" href="#">1</a>
							</li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item"><a class="page-link" href="#">&raquo;</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>