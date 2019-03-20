<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>어때요?</title>
<!-- font -->
<link href="${pageContext.request.contextPath}/resources/css/font.css" 
	  rel="stylesheet" />

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/css/modern-business.css"
	rel="stylesheet"
>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
</head>
<body>
	<!-- Navigation --> 
	<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
		<div class="container">
			<header class="navbar-brand">
				 <a href="${pageContext.request.contextPath}/"><img src = "${pageContext.request.contextPath}/resources/logoImage/head-logo.png" width="120" height="28"> 
				 </a>
			</header>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<c:choose>
						<c:when test="${sessionScope.userId == null }">
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/login">Login</a></li>
						</c:when>
						<c:otherwise>
				<li class="nav-item">
					<a class="nav-link"><b>${sessionScope.userName }</b>님 환영합니다.</a>
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
