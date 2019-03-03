<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<%@ include file="WEB-INF/views/header.jsp"%>
<h1>
	Hello world!  
</h1>
<c:if test="${msg == 'success' }">
${sessionScope.userId}(${sessionScope.userName }) 
</c:if>

<c:choose>
	<c:when test="${sessionScope.userId == null }">
		<a href = "${path}/login">로그인</a>
	</c:when>
	<c:otherwise>
		${sessionScope.userName } 님이 로그인 중입니다.
		<a href = "${path}/logout">로그아웃</a>
	</c:otherwise>
</c:choose>
<P></P>
</body>
</html>
