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
	height: ${imgHeight*0.8}px;
}
</style>
</head>

<body>


	<div class="cycle-slideshow" data-cycle-fx=scrollHorz data-cycle-timeout=1000>
		<img class="place_img" alt="No Image" src="/resources/images/elba1.jpg">
		<img class="place_img" alt="No Image" src="/resources/images/elba2.jpg">
		<img class="place_img" alt="No Image" src="/resources/images/elba3.jpg">
	</div>

	<h3 class="textClass">${SugDto.place_name}</h3>
	<h4 class="textClass">메세지</h4>
	<h5 style="opacity: 0.5; margin-left: 20px;">점주가 보낸 메세지</h5>
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
						<input type="submit" value="예약"> <br> <input
							type="submit" value="보류" onclick="self.close()">
					</form>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>