<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jsp"%><!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>InviteList Page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">
</head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<body>

	
	<h2>초대 현황</h2>
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col"></th>
				<th scope="col">고객명</th>
				<th scope="col">예약날짜/시간</th>
				<th scope="col">보낸 메세지</th>
				<th scope="col">인원</th>
				<th scope="col">상태</th>
			</tr>

		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(selectInviteList) > 0}">
					<c:forEach items="${selectInviteList}" var="invite" varStatus = "status">
						<tr>
							<th scope="row">${status.count}</th>
							<td>${invite.name}</td>
							<td>${invite.resv_date}</td>
							<td>${invite.message}</td>
							<td>${invite.mem_cnt}</td>
							<c:choose>
								<c:when test="${invite.isresv eq 'Y'}">
									<td>예약 확정</td>
								</c:when>
								<c:otherwise>
									<td>응답 대기</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan = "6">점주님의 초대 내역의 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
		integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
		integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
		crossorigin="anonymous"></script>
	


</body>
</html>