<%@page import="com.ktds.uhddaeyo.common.AES256Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/include/include-header.jsp"%>

<title>어때요? :: UH DDAE YO</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=27b7ba470a0448e650efe0a033ec1e1f"></script>
</head>
<body>
	<div id="map" style="width: 500px; height: 400px;"></div>
	<script>
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(37.482530057110390, 127.004802928372910),
			level : 3
		};
		var map = new daum.maps.Map(container, options);
	</script>
</body>

</html>
