<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<script type="text/javascript">
	function suggestionPopup() {
		var sugForm = document.sug_form;
		var popupWidth = 430;
		var popupHeight = 800;
 		var sugUrl = "suggestion";
 		var popOption = "width=" + popupWidth + ", height= " + popupHeight
				+ ", left=" + (window.screen.width - popupWidth) / 2 + ", top="
				+ (window.screen.height - popupHeight) / 2
				+ ", resizable=no, scrollbars=yes, status=no;"; //팝업창 옵션(optoin)
		window.open("", "sug_form", popOption);
		sugForm.width.value = popupWidth;
		sugForm.height.value = popupHeight;
		sugForm.action = sugUrl;
		sugForm.method = "post";
		sugForm.target = "sug_form";
		sugForm.submit();
	}
</script>

</head>
<body>
	<form name="sug_form" method="post" class="form-signin" id="sug_form">
		<input type="hidden" name="width" id="width">
		<input type="hidden" name="height" id="height">
		<input type="text" name="place_no">
		<button class="form_btn" type="button"
			id="suggest_btn" onclick="suggestionPopup()">상세보기</button>
	</form>
</body>
</html>