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
		var popupHeight = 700;
/* 		var popUrl = "suggestion?width=" + popupWidth + "&height="
				+ popupHeight; //팝업창에 출력될 페이지 URL
 */
 		var sugUrl = "suggestion";
 		var popOption = "width=" + popupWidth + ", height= " + popupHeight
				+ ", left=" + (window.screen.width - popupWidth) / 2 + ", top="
				+ (window.screen.height - popupHeight) / 2
				+ ", resizable=no, scrollbars=yes, status=no;"; //팝업창 옵션(optoin)
		window.open("", "sug_form", popOption);
		sugForm.width = popupWidth;
		sugForm.height = popupHeight;
		sugForm.action = sugUrl;
		sugForm.method = "post";
		sugForm.target = "sug_form";
		sugForm.submit();
	}
</script>

</head>
<body>
	<form name="sug_form" method="post" class="form-signin">
		<input type="hidden" name="width">
		<input type="hidden" name="height">
		<input type="text" name="place_no">
		<button class="form_btn" type="button"
			id="suggest_btn" onclick="suggestionPopup()">상세보기</button>
	</form>

	<!-- <a href="javascript:suggestionPopup();">제안서 보기</a> -->

</body>
</html>