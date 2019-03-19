<%@page import="com.ktds.uhddaeyo.model.dto.SuggestionDto"%>
<%@page import="com.ktds.uhddaeyo.model.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js">
</script>
<script src="http://malsup.github.com/jquery.cycle2.js">
</script>

<style>
.textClass {
	margin-left: 15px;
	margin-top: 20px;
}

.info {
	margin-left: 15px;
	opacity: 0.5;
}
</style>
<title>Insert title here</title>
<script type="text/javascript">
	if(${success } == true) {
		alert("예약이 완료되었습니다.");
		self.close();
	} else {
		alert("예약이 불가능 합니다. 오루 : ");
		self.close();
	}
</script>
<script type="text/javascript">
	function showAllImages() {
		alert("hi");
	}
</script>

<style type="text/css">
.place_img {
	width: 100%;
}
</style>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=27b7ba470a0448e650efe0a033ec1e1f"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=27b7ba470a0448e650efe0a033ec1e1f&libraries=services"></script>
</head>

<body>
	<div class="cycle-slideshow" data-cycle-fx=scrollHorz data-cycle-timeout=1000>
		<c:forEach items="${pictures }" var="picture">
			<img class="place_img" alt="No Image" src="${pageContext.request.contextPath}/resources/placeImages/${picture }">
		</c:forEach>
	
	</div>

	<h3 class="textClass">${SugDto.place_name}</h3>
	<h5 style="opacity: 0.5; margin-left: 20px;">초대 메시지</h5>
	<h6
		style="boder-left: 0px; padding-left: 20px; font-style: inherit; font-weight: normal;">
		${SugDto.message }</h6>
	<hr>
	<h4 class="textClass">식당 정보</h4>

	<h6 class="info">● 전화번호 : ${SugDto.place_tel }</h6>
	<h6 class="info" style="display: inline;">● 카테고리 :</h6>
	<c:forEach items="${tags }" var="tag">
		<h6
			style="display: inline; font-style: italic; font-weight: lighter; color: blue">#${tag}
		</h6>
	</c:forEach>
	<h6 class="info">● 수용인원 : ${SugDto.capacity }</h6>
	<h6 class="info">● 영업시간 : ${SugDto.start_time } ~
		${SugDto.end_time}</h6>
	<h6 class="info">● 주소 : ${SugDto.address }</h6>

	<div align="center">
		<table>
			<tr>
				<td>
					<form action="${path}/acceptSuggestion" method="post">
						<input type="hidden" value="${SugDto.place_no }" name="place_no">
						<input type="hidden" value="${SugDto.user_no }" name="user_no">
						<input type="hidden" value="${SugDto.sug_no }" name="sug_no">
						<input type="submit" value="예약"> <br> 
						<input type="submit" value="보류" onclick="self.close()">
					</form>
				</td>
			</tr>
			<tr>
				<td>
					<div id="map" style="width: 500px; height: 400px;"></div>
						<script>
							var container = document.getElementById('map');
							var infowindow = new daum.maps.InfoWindow({zIndex:1});
							var options = {
								center : new daum.maps.LatLng(${SugDto.longitude}, ${SugDto.latitude}),
								level : 3
							};
							var map = new daum.maps.Map(container, options);
							displayMarker('${SugDto.place_name}');
							
							// 지도에 마커를 등록하는 함수
							function displayMarker(place_name) {
								// 마커를 생성하고 지도에 표시
								var marker = new daum.maps.Marker({
									map: map,
									position: new daum.maps.LatLng(${SugDto.longitude}, ${SugDto.latitude})
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
				
				</td>
			</tr>
		</table>
	</div>
</body>
</html>