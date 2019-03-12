<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="header.jsp"%>
	<div align="center">
		<h2>예약 현황</h2>
		<c:choose>
			<c:when test="${fn:length(resvList) > 0}">
				<table width="500">
					<tr>
						<td>
							<table class="table table-hover">
								<thead>
									<tr align="center">
										<th scope="col">&nbsp;</th>
										<th scope="col">고객명</th>
										<th scope="col">예약날짜/시간</th>
										<th scope="col">인원</th>
										<th scope="col">&nbsp;&nbsp;</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach items="${resvList}" var="resv" varStatus="idx">
										<tr align="center">
											<td style="vertical-align: middle">${idx.count}</td>
											<td style="vertical-align: middle">${resv.userName }</td>
											<td style="vertical-align: middle"><fmt:formatDate
													value="${resv.date }" pattern="yyyy-MM-dd HH:mm" /></td>
											<td style="vertical-align: middle">${resv.memCnt }</td>
											<td style="vertical-align: middle">메모</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</td>
					</tr>
				</table>
			</c:when>
			<c:otherwise>
				<tr>
					<td>조회된 결과가 없습니다!</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>