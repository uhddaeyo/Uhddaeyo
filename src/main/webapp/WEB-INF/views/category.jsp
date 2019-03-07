<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="header.jsp"%>
	<h2>
		<c:out value="${placeNo}" />
	</h2>
	<form method="post" action="/host/tag">
		<h3>방문 목적</h3>
		<c:forEach var="tag" items="${hashTagList}">
			<c:if test="${tag.category.equals('방문목적') }">
				<input type="checkbox" name="tag" value="${tag.content}" />
				<c:out value="${tag.content }" />
			</c:if>
		</c:forEach>

		<h3>분위기</h3>
		<c:forEach var="tag" items="${hashTagList}">
			<c:if test="${tag.category.equals('분위기') }">
				<input type="checkbox" name="tag" value="${tag.content}" />
				<c:out value="${tag.content }" />
			</c:if>
		</c:forEach>

		<h3>편의 시설</h3>
		<c:forEach var="tag" items="${hashTagList}">
			<c:if test="${tag.category.equals('편의시설') }">
				<input type="checkbox" name="tag" value="${tag.content}" />
				<c:out value="${tag.content }" />
			</c:if>
		</c:forEach>

		<h3>인당 가격</h3>
		<c:forEach var="tag" items="${hashTagList}">
			<c:if test="${tag.category.equals('인당가격') }">
				<input type="checkbox" name="tag" value="${tag.content}" />
				<c:out value="${tag.content }" />
			</c:if>
		</c:forEach>
		<input type="hidden" name="placeNo" value="${placeNo }" /> <input
			type="submit" value="전송" />
	</form>
</body>
</html>