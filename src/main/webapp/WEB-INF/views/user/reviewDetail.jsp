<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
</head>
<script>
	function sendReview()
	{
		var params = $("#sendReview").serialize();
		$.ajax(
		{
			url : '<c:url value="insertReview" />',
			data : params,
			success : function(result){		
				window.close();
			},
			error : function(error){
				alert("Error occurs");
			}
	});
}
</script>
<body>
	<form id="sendReview">
		<field style = "width:250">
			<legend>Review</legend>
			<input type="hidden" name="place_no" value="${placeNo}"/>
			가게 이름 : ${placeName} <br>
			별점 평가  : <input type="text" name="star"/><br>
			<input type="text" name="review" placeholder="리뷰를 남겨주세요:)"></textarea>
			<br><br>
			<input type="button" onclick="sendReview()" value="전송"/>
			<input type="button" onclick="self.close()" value="취소"/>
	</form>
</body>

</html>