<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
   <%@ include file="/WEB-INF/include/include-header.jsp"%>
   <%@ include file="/WEB-INF/include/include-css.jsp"%>
   
</head>
<body style="font-family:Noto Sans KR;">
<%@include file="header.jsp"%>

<div class="container">
   <div class="row">
      <%@include file="/WEB-INF/include/menu.jsp"%>
      <div class="col-lg-9">

<c:choose>
   <c:when test="${sessionScope.userId == null }">
      <a href = "${path}/login">로그인</a>
   </c:when>
   
   <c:otherwise>
      
      <br> <br>
      <div class="card border-primary mb-3" style="margin-top:25px; padding:35px;">
        <h3 class="display-4" style="font-family:Do Hyeon;">${placeInfo.placeName}</h3>
        <!-- <img class="card-img-top" src="resources/images/table5.jpg"> -->
        
        <hr class="my-4">
        <h5>주소    : ${placeInfo.address}</h5> <br>
        <h5>전화번호    : ${placeInfo.placeTel}</h5> <br>
        <h5>태그정보   : 
           <c:forEach items="${placeTag}" var="tag">
             #${tag}  
          </c:forEach>
        </h5> <br>
        <h5>최대 수용 인원 : ${placeInfo.capacity}</h5> <br>
        <h5>영업 시간    : ${placeInfo.startTime} ~ ${placeInfo.endTime}</h5><br>
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