<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta charset="UTF-8">
</head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
	$(document).ready(function(){
		$("#cancel").on("click",function(){
			
		});
		$("#send").on("click",function(){
			
		});
	});
</script>
<body>
	Name : ${placeName}<br>
	별점 평가 : <br>
	리뷰 <br>
	<textarea>리뷰작성</textarea><br>
	<a href="#" class="btn" id="cancel">취소</a>
	<a href="#" class="btn" id="send">전송</a>
</body>
</html>