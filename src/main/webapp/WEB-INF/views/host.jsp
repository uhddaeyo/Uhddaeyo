<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix ="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
점주페이지 
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
		
		<div class="card"">
		    <h5 class="card-title">${placeInfo.placeName}</h5>
		    <p>전화번호 : ${placeInfo.placeTel} </p>
		    <p>분류 :
		    	<c:forEach items="${placeTag}" var="tag">
		    		#${tag}  
		    	</c:forEach> 
			</p>
		    <p>최대 수용 인원 : ${placeInfo.capacity} </p>
		    <p>영업 시간 : ${placeInfo.startTime} ~ ${placeInfo.endTime} </p>
		    <p>주소 : ${placeInfo.address} </p>
		   
		  </div>
		</div>
		<a href = "${path}/logout">로그아웃</a>
	</c:otherwise>
</c:choose>
<P></P>

<button onclick="location='inviteList'">초대 현황</button>
</body>
</html>
