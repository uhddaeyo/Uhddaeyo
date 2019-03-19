<%@page import="com.ktds.uhddaeyo.common.AES256Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js">
	
</script>


<%@ include file="/WEB-INF/include/include-header.jsp"%>
<!-- Bootstrap core CSS -->
<%@ include file="/WEB-INF/include/include-css.jsp"%>
<meta charset="UTF-8">

</head>
<body>
	<%@include file="header.jsp"%>
	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<div class="col-lg-2" style="margin-top: 45px; margin-right: 30px">
				<div class="site-logo" style="font-family: Segoe Scrip;" align="center">
					<img class="menu-logo" src="resources/logoImage/menu1.jpg" width="130" height="50" />
				</div>
				<div class="list-group" style="text-align: center; margin-top: 30px;">
				<c:set var="userNo" value="${sessionScope.userNo}"></c:set>
         <%
										AES256Util aes256Util = new AES256Util();
										String encryptUserNo = aes256Util.encrypt(String.valueOf(pageContext.getAttribute("userNo")));
									%>
			   <a href="${pageContext.request.contextPath}/kakaoinvitelink/<%=encryptUserNo %>" class="list-group-item">초대장 모아보기</a>
               <a href="${pageContext.request.contextPath}/reservationList" class="list-group-item">나의 예약내역</a> 
               <a href="${pageContext.request.contextPath}/historyList" class="list-group-item">나의 이용내역</a>
               <a href="${pageContext.request.contextPath}/reviewList" class="list-group-item active">내가 남긴리뷰</a>
               
            </div>
				</div>


			<div class="col-lg-9">
				<h2 style="margin-top: 55px;">
					<b>내가 남긴 리뷰</b>
					</h2>
				<div class="row" style="margin-top: 40px;">
					<c:choose>
						<c:when test="${fn:length(reviewList) > 0}">
							<c:forEach items="${reviewList}" var="reviewList">

								<div class="card bg-secondary mb-3" style="width: 100%;">
									<div class="card-body"
										style="margin-top: 20px; margin-left: 10px">


										<h5><strong>${reviewList.place_name}</strong></h5>
										<p>리뷰 날짜 : ${reviewList.review_date}</p>
										<p>
											
											<c:choose>
												<c:when test="${reviewList.star eq 5 }">
													<img class="star-icon" align="left" src="resources/images/star.png" width="20px"/>
													<img class="star-icon" align="left" src="resources/images/star.png" width="20px"/>
													<img class="star-icon" align="left" src="resources/images/star.png" width="20px"/>
													<img class="star-icon" align="left" src="resources/images/star.png" width="20px"/>
													<img class="star-icon" src="resources/images/star.png" width="20px"/>
												</c:when>
												<c:when test="${reviewList.star eq 4 }">
													<img class="star-icon" align="left" src="resources/images/star.png" width="20px"/>
													<img class="star-icon" align="left" src="resources/images/star.png" width="20px"/>
													<img class="star-icon" align="left" src="resources/images/star.png" width="20px"/>
													<img class="star-icon" src="resources/images/star.png" width="20px"/>
												</c:when>
												<c:when test="${reviewList.star eq 3 }">
													<img class="star-icon" align="left" src="resources/images/star.png" width="20px"/>
													<img class="star-icon" align="left" src="resources/images/star.png" width="20px"/>
													<img class="star-icon" src="resources/images/star.png" width="20px"/>
												</c:when>
												<c:when test="${reviewList.star eq 2 }">
													<img class="star-icon" align="left" src="resources/images/star.png" width="20px"/>
													<img class="star-icon" src="resources/images/star.png" width="20px"/>
												</c:when>
												<c:otherwise>
													<img class="star-icon" src="resources/images/star.png" width="20px"/>
												</c:otherwise>
											</c:choose>
										</p>
										<p class="lead">${reviewList.review}</p>

										<c:choose>
											<c:when test="${fn:length(reviewList.reply) >0}">
<hr>
												<div class="reply-icon" >
													<img class="reply-icon" align="left" src="resources/images/reply.png"/>
													<h6 style = "padding-top : 10px;"><strong>${reviewList.place_name}</strong>님께서 남긴 답글</h6>
												</div>
												<p class="lead">${reviewList.reply}</p>
												<%--  <hr class="my-4">
                                    <textarea class="form-control" id="reply${reviewList.review_no}" readonly="readonly" onkeyup="press();">${reviewList.reply}</textarea> --%>

											</c:when>

											<c:otherwise>

												<hr class="my-4">
												<div class="reply-icon" >
													<img class="reply-icon" align="left" src="resources/images/reply.png"/>
													<h6 style = "padding-top : 10px;">아직 고객님의 리뷰에 대한 답글이 안달렸습니다.</h6>
												</div>
											</c:otherwise>
										</c:choose>

									</div>
								</div>

							</c:forEach>
						</c:when>
						<c:otherwise>등록된 리뷰가 없습니다.</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</body>
</html>