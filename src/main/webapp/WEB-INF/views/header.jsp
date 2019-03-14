<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>어때요?</title>

  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/resources/css/modern-business.css" rel="stylesheet">
</head>
<body>
 <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light fixed-top">
    <div class="container">
       <a class="navbar-brand" href="#">어때요?</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
        <c:choose>
           <c:when test="${sessionScope.userId == null }">
              <li class="nav-item">
               <a class="nav-link" href="${pageContext.request.contextPath}/login">Login</a>                 
              </li>
         </c:when>
         <c:otherwise>
            <li class="nav-item">
               <a class="nav-link">${sessionScope.userName }님 환영합니다.</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" href = "${pageContext.request.contextPath}/logout">Logout</a>
            </li>
         </c:otherwise>
        </c:choose>
          <li class="nav-item">
          </li>
        </ul>
      </div>
    </div>
  </nav>
</body>
</html>