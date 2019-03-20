<%@page import="com.ktds.uhddaeyo.common.AES256Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="./header.jsp"%>
<%@ include file="/WEB-INF/include/include-header.jsp"%>
<%@ include file="/WEB-INF/include/include-css.jsp"%>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js">
</script>
<script src="http://malsup.github.com/jquery.cycle2.js">
</script>

<html>
<head>
<title>초대장 모아보기</title>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	if(${success } == true) {
		alert("예약이 완료되었습니다.");
		window.history.go(-2);
	} else {
		alert("예약이 불가능합니다.");
		window.history.go(-2);
	}
</script>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=27b7ba470a0448e650efe0a033ec1e1f"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=27b7ba470a0448e650efe0a033ec1e1f&libraries=services"></script>


</head>
<body style="font-family: Noto Sans KR;">
	<div class="container">
		<div class="row">
			<div class="col-lg-2" style="margin-top: 45px; margin-right: 30px">
				<div class="site-logo" style="font-family: Segoe Scrip;"
					align="center">
					<img class="menu-logo" src="${path }/resources/logoImage/menu1.jpg"
						width="130" height="50" />
				</div>

				<div class="list-group"
					style="text-align: center; margin-top: 30px;">
					<c:set var="userNo" value="${sessionScope.userNo}"></c:set>
					<%
						AES256Util aes256Util = new AES256Util();
						String encryptUserNo = aes256Util.encrypt(String.valueOf(pageContext.getAttribute("userNo")));
					%>
					<a
						href="${pageContext.request.contextPath}/kakaoinvitelink/<%=encryptUserNo %>"
						class="list-group-item active">초대장 모아보기</a> <a
						href="${pageContext.request.contextPath}/reqList"
						class="list-group-item">나의 요청내역</a> <a
						href="${pageContext.request.contextPath}/reservationList"
						class="list-group-item">나의 예약내역</a> <a
						href="${pageContext.request.contextPath}/historyList"
						class="list-group-item">나의 이용내역</a> <a
						href="${pageContext.request.contextPath}/reviewList"
						class="list-group-item">내가 남긴리뷰</a>
				</div>
			</div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9">
				<h2 style="margin-top: 55px;">
					<b>${sdto.place_name}</b>
				</h2>
				<div align="center">

					<div id="carouselExampleIndicators" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<c:forEach items="${pictures}" var="picture" varStatus="status">
								<c:choose>
									<c:when test="${status.index == 0}">
										<li data-target="#carouselExampleIndicators" data-slide-to="0"
											class="active"></li>
									</c:when>
									<c:otherwise>
										<li data-target="#carouselExampleIndicators"
											data-slide-to="${status.index}"></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ol>

						<div class="carousel-inner" data-cycle-fx="scrollHorz">
							<c:forEach items="${pictures}" var="picture" varStatus="status">
								<c:choose>
									<c:when test="${status.index == 0}">
										<div class="carousel-item active">
											<img class="d-block w-100"
												src="${pageContext.request.contextPath}/resources/placeImages/${picture}"
												alt="First slide">
										</div>
									</c:when>
									<c:otherwise>
										<div class="carousel-item">
											<img class="d-block w-100"
												src="${pageContext.request.contextPath}/resources/placeImages/${picture}"
												alt="Second slide">
										</div>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
						<a class="carousel-control-prev" href="#carouselExampleIndicators"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="carousel-control-next"
							href="#carouselExampleIndicators" role="button" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>

				</div>
				<!-- 이미지 슬라이드 끝 -->
				<br>
				<div class="card">
					<h5 class="card-header">식당정보</h5>
					<div class="card-body">
						<h5 class="card-title">초대 메시지</h5>
						<br>
						<h6>${sdto.message }</h6>
						<hr>
						<p class="card-text">
						<h6 class="info">● 전화번호 : ${sdto.place_tel }</h6>
						<h6 class="info" style="display: inline;">● 카테고리 :</h6>
						<c:forEach items="${tags }" var="tag">
							<h6
								style="display: inline; font-style: italic; font-weight: lighter; color: blue">#${tag}
							</h6>
						</c:forEach>
						<h6 class="info">● 수용인원 : ${sdto.capacity }</h6>
						<h6 class="info">● 영업시간 : ${sdto.start_time } ~
							${sdto.end_time}</h6>
						<h6 class="info">● 주소 : ${sdto.address }</h6>
					</div>
				</div>
				<br>

				<div align="center">

					<div id="map"
						style="width: 500px; height: 400px; margin-bottom: 50px"></div>
					<script>
							var container = document.getElementById('map');
							var infowindow = new daum.maps.InfoWindow({zIndex:1});
							var options = {
								center : new daum.maps.LatLng(${sdto.longitude}, ${sdto.latitude}),
								level : 3
							};
							var map = new daum.maps.Map(container, options);
							displayMarker('${sdto.place_name}');
							
							// 지도에 마커를 등록하는 함수
							function displayMarker(place_name) {
								// 마커를 생성하고 지도에 표시
								var marker = new daum.maps.Marker({
									map: map,
									position: new daum.maps.LatLng(${sdto.longitude}, ${sdto.latitude})
								});
								// 카머에 클릭이벤트를 등록
								daum.maps.event.addListener(marker, 'click', function() {
									console.log("clicked");
									// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
									infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place_name + '</div>');
									infowindow.open(map, marker);
								});
							}
						</script>

					<form action="${path}/acceptSuggestion" method="post">
						<input type="hidden" value="${sdto.place_no }" name="place_no">
						<input type="hidden" value="${sdto.user_no }" name="user_no">
						<input type="hidden" value="${sdto.sug_no }" name="sug_no">
						<input class="btn btn-primary" type="submit" value="예약"
							style="margin-right: 5px; width: 100px"> <input
							class="btn btn-outline-dark" type="button" value="보류"
							onclick="javascript:history.back();"
							style="margin-left: 5px; width: 100px">
					</form>

				</div>

			</div>

		</div>
	</div>

</body>
</html>