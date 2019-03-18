<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jsp"%>
<%@ include file="/WEB-INF/include/include-css.jsp"%>
<title>초대현황</title>
</head>

<body>
	<%@include file="header.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-lg-2" style="margin-top: 45px; margin-right: 30px">
			<div class="site-logo" style="font-family: Segoe Scrip;" align="center">
				<img class="menu-logo" src="resources/logoImage/menu1.jpg" width="130" height="50" />
			</div>
			<div class="list-group" style="text-align: center; margin-top: 30px;">
				<a href="${pageContext.request.contextPath}/host" class="list-group-item">가게정보</a>
				<a href="${pageContext.request.contextPath}/guestList" class="list-group-item"  style="text-align:center">고객현황</a>
				<a href="${pageContext.request.contextPath}/inviteList" class="list-group-item active">초대현황</a>
				<a href="${pageContext.request.contextPath}/resvList" class="list-group-item">예약현황</a>
				<a href="${pageContext.request.contextPath}/review" class="list-group-item">가게리뷰</a>
				<a href="${pageContext.request.contextPath}/guestAnalysis" class="list-group-item">고객분석</a>
			</div>
	 		</div>

			<div class="col-lg-9"  style = "font-size:15px">
				<h2 style="margin-top: 55px;">
					<b>초대 현황</b>
				</h2>
				<div class="row" style="margin-top: 40px;">

					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col" style="width: 5%; text-align: center"></th>
								<th scope="col" style="width: 15%; text-align: center">고객명</th>
								<th scope="col" style="width: 20%; text-align: center">예약날짜/시간</th>
								<th scope="col" style="width: 10%; text-align: center">인원</th>
								<th scope="col" style="width: 30%; text-align: center">보낸 메세지</th>
								<th scope="col" style="width: 10%; text-align: center">상태</th>
							</tr>
						</thead>

						<tbody>
							<c:choose>
								<c:when test="${fn:length(selectInviteList) > 0}">
									<c:forEach items="${selectInviteList}" var="invite"
										varStatus="status">

										<tr align="center">
											<td width="50" style="vertical-align: middle;">${status.count}</td>
											<td width="100" style="vertical-align: middle;">${invite.name}</td>
											<td width="200" style="vertical-align: middle"><fmt:formatDate
													value="${invite.resv_date}" pattern="yyyy-MM-dd HH:mm" />
											<td style="vertical-align: middle;">${invite.mem_cnt}</td>
											<td style="vertical-align: middle;">${invite.message}</td>

											<c:choose>
												<c:when test="${invite.isresv eq 'Y'}">
													<td style="color: #D9230F; vertical-align: middle;">예약 확정</td>
												</c:when>

												<c:otherwise>
													<td width="50" style="vertical-align: middle;">응답 대기</td>
												</c:otherwise>
											</c:choose>
										</tr>
									</c:forEach>
								</c:when>

								<c:otherwise>
									<tr>
										<td colspan="6">점주님의 초대 내역의 없습니다.</td>
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