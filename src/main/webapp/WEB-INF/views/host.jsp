<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jsp"%>
<%@ include file="/WEB-INF/include/include-css.jsp"%>   
</head>

<body">
<%@include file="header.jsp"%>

<div class="container">
   <div class="row">
      <div class="col-lg-2" style="margin-top: 45px; margin-right: 30px">
			<div class="site-logo" style="font-family: Segoe Scrip;" align="center">
				<img class="menu-logo" src="resources/logoImage/menu1.jpg" width="130" height="50" />
			</div>
			<div class="list-group" style="text-align: center; margin-top: 30px;">
				<a href="${pageContext.request.contextPath}/host" class="list-group-item active">가게정보</a>
				<a href="${pageContext.request.contextPath}/guestList" class="list-group-item"  style="text-align:center">고객현황</a>
				<a href="${pageContext.request.contextPath}/inviteList" class="list-group-item">초대현황</a>
				<a href="${pageContext.request.contextPath}/resvList" class="list-group-item">예약현황</a>
				<a href="${pageContext.request.contextPath}/review" class="list-group-item">가게리뷰</a>
				<a href="${pageContext.request.contextPath}/guestAnalysis" class="list-group-item">고객분석</a>
			</div>
	  </div>
      <div class="col-lg-9">

<c:choose>
   <c:when test="${sessionScope.userId == null }">
      <a href = "${path}/login">로그인</a>
   </c:when>
   
   <c:otherwise>
      <br> <br>
      <div class="card border-primary mb-3" style="margin-top:25px; padding:35px;">
        <h1><b>${placeInfo.placeName}</b></h1>
        
        <hr class="my-4">
        <table>
        	<tr height = "40">
        		<th><li>주소</li></th> 
        		<td>${placeInfo.address}</td>
        	</tr><br>
        	<tr height = "40">
        		<th><li>전화번호</li></th> 
        		<td>${placeInfo.placeTel}</td>
        	</tr>
        	<tr height = "40">
        		<th><li>태그정보</li></th> 
        		<td><c:forEach items="${placeTag}" var="tag">
     				#${tag}  
          			</c:forEach></td>
        	</tr>
			<tr height = "40">
        		<th><li>최대수용인원</li></th> 
        		<td>${placeInfo.capacity}</td>
        	</tr>
        	<tr height = "40">
        		<th><li>영업시간</li></th> 
        		<td>${placeInfo.startTime} ~ ${placeInfo.endTime}</td>
        	</tr>
        </table>
        <br><br>
        <p class="lead">
          <a class="btn btn-primary btn-lg" href="${path}/logout" role="button">LogOut</a>
        </p>
      </div>
      
   </c:otherwise>
</c:choose>
   </div>
   </div>
</div>
</body>
</html>