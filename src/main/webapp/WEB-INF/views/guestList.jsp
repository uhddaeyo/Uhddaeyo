<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%@include file="header.jsp"%>
	<div align="center">
		<h2>고객 현황</h2>


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
								<c:forEach items="${guestList}" var="guest" varStatus="idx">
									<tr align="center">
										<td style="vertical-align:middle">${idx.count}</td>
										<td style="vertical-align:middle">${guest.userName }</td>
										<td style="vertical-align:middle"><fmt:formatDate value="${guest.date }" pattern="yyyy-MM-dd HH:mm" /></td>
										<td style="vertical-align:middle">${guest.memCnt }</td>
										<td style="vertical-align:middle"><button type="button" class="btn btn-outline-danger">초대장 보내기</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</td>
				</tr>
			</table>

	</div>
</body>
</html>