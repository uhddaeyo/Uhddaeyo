<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jsp"%>
<%@ include file="/WEB-INF/include/include-css.jsp"%>
<title>초대현황</title>
</head>

<body>
	<%@include file="header.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-lg-2" style="margin-top: 45px; margin-right: 30px">
			<div class="site-logo" style="font-family: Segoe Scrip;" align="center">
				<img class="menu-logo" src="resources/logoImage/menu1.jpg" width="130" height="50" />
			</div>
			<div class="list-group" style="text-align: center; margin-top: 30px;">
				<a href="${pageContext.request.contextPath}/host" class="list-group-item">가게정보</a>
				<a href="${pageContext.request.contextPath}/guestList" class="list-group-item"  style="text-align:center">고객현황</a>
				<a href="${pageContext.request.contextPath}/inviteList" class="list-group-item">초대현황</a>
				<a href="${pageContext.request.contextPath}/resvList" class="list-group-item">예약현황</a>
				<a href="${pageContext.request.contextPath}/review" class="list-group-item">가게리뷰</a>
				<a href="${pageContext.request.contextPath}/reviewAnalysis" class="list-group-item active">리뷰분석</a>
				<a href="${pageContext.request.contextPath}/guestAnalysis" class="list-group-item">고객분석</a>
			</div>
	 		</div>

			<div class="col-lg-9"  style = "font-size:15px">
				<h2 style="margin-top: 55px;">
					<b>리뷰 분석</b>
				</h2>
				<div class="row">
				<table>
					<tr>
						<c:choose>
   					   			<c:when test="${userNo == 210}" > 		<!-- 추후에 해당 userNo로 바꿔야함 -->
   					   				<td>
   										<img src="resources/images/wc_dummy.jpg" style="width:570px; height:570px;">
   									</td>
   									<td>
   										<img src="resources/images/kw_dummy.jpg" style="width:320px; height:170px;">
   									</td>
   								</c:when>
   								
   								<c:otherwise>
   								<td>
   									<img src="resources/images/wc_secondFloor.png" style="width:570px; height:570px;">
   								</td>
   								<td>
   									<img src="resources/images/kw_secondFloor.jpg" style="width:320px; height:170px;">
   								</td>
   								</c:otherwise>
   							</c:choose>
					</tr>
				</table>
			
				
				
				</div>
			</div>
			 
		</div>
	</div>
</body>
</html>