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

	<form method="post" action="/host/tag">
		<h3>분류</h3>
		<c:forEach var="tag" items="${hashTagList}">
			<c:if test="${tag.category.equals('분류') }">
				<input type="radio" name="classify" value="${tag.content}" />
				<c:out value="${tag.content }" />
			</c:if>
		</c:forEach>
		
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

		<input type="hidden" name="placeNo" value="${placeNo }" /> <input
			type="submit" value="전송" />
	</form>
	
	<form method="post" action="/host/back">
	<input type="hidden" name="placeNo" value="${placeNo }" />
	<input type="hidden" name="userNo" value="${userNo }" />
	<input type="submit" value="가입 취소" />
	</form>
</body>
</html>