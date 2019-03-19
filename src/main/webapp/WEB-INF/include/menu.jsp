<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <meta name="description" content="">
 <meta name="author" content="">

<script type="text/javascript">
 	$(document).ready(function(){
 		$('.list-group a').on('click', function() {
 			$('a').removeClass('active')
 			$(this).addClass('active')
 		})
 	}) 
</script>

 <!-- Bootstrap core CSS -->
 <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

 <!-- Custom styles for this template -->
 <link href="${pageContext.request.contextPath}/resources/css/modern-business.css" rel="stylesheet">

 <title>어때요?</title>
</head>

<body>
 <div class="col-lg-2" style="margin-top: 45px; margin-right : 30px">
	<!-- <h1 class="my-4" align="center" style="font-family:Segoe Script" >Menu</h1> -->
	<div class="site-logo" style="font-family:Segoe Scrip;" align="center">
		<img class="menu-logo" src="resources/logoImage/menu1.jpg" width="130" height="50"/>
	</div>
	<div class="list-group" style="text-align:center; margin-top:30px;">
				
				<c:choose>
					<c:when test="${sessionScope.userType == 1 }">
						<a href="${pageContext.request.contextPath}/suggestionBoard" class="list-group-item active">초대장 모아보기</a>
						<a href="${pageContext.request.contextPath}/reservationList" class="list-group-item">나의 예약내역</a>
						<a href="${pageContext.request.contextPath}/historyList" class="list-group-item">나의 이용내역</a>
						<a href="${pageContext.request.contextPath}/reviewList" class="list-group-item">내가 남긴리뷰</a>
					</c:when>
					
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/host" class="list-group-item active">가게정보</a>
						<a href="${pageContext.request.contextPath}/guestList" class="list-group-item">고객현황</a>
						<a href="${pageContext.request.contextPath}/inviteList" class="list-group-item">초대현황</a>
						<a href="${pageContext.request.contextPath}/resvList" class="list-group-item">예약현황</a>
						<a href="${pageContext.request.contextPath}/review" class="list-group-item">가게리뷰</a>
						<a href="${pageContext.request.contextPath}/guestAnalysis" class="list-group-item">고객분석</a>
					</c:otherwise>
				</c:choose>
				</div>
			</div>
</body>
</html>
