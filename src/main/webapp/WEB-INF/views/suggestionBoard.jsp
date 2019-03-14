<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<title>초대장 모아보기</title>

<script type="text/javascript">
 	function suggestionPopup(sug_no) {
		//		var sugForm = document.sug_form;
		var popupWidth = 420;
		var popupHeight = 850;
		var sugUrl = "suggestion";
		
		console.log(sug_no);
		
		var form = document.createElement("form");
		form.setAttribute("charset", "UTF-8");
		form.setAttribute("method", "Post");
		form.setAttribute("action", sugUrl);

		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "width");
		hiddenField.setAttribute("value", popupWidth);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "height");
		hiddenField.setAttribute("value", popupHeight);
		form.appendChild(hiddenField);

		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "sug_no");
		hiddenField.setAttribute("value", sug_no);
		form.appendChild(hiddenField);
		
		var url = "suggest"
		var title = "suggest"
		var status = "width=" + popupWidth + ", height= " + popupHeight
				+ ", left=" + (window.screen.width - popupWidth) / 2 + ", top="
				+ (window.screen.height - popupHeight) / 2
				+ ", resizable=no, scrollbars=no, status=no;";
		window.open("", title, status);
		form.target = title;
		
		document.body.appendChild(form);
		form.submit();
	}
 </script>

</head>
<body>
	<h2>초대장 모아보기</h2>
	<table class="suggestion_board">
		<colgroup>
			<col width="10%" />
			<col width="*" />
			<col width="15%" />
			<col width="20%" />
		</colgroup>

		<thead>
			<tr>
				<th scope="col">매장명</th>
				<th scope="col">받은 메세지</th>
				<th scope="col">초대장</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(suggestionList) > 0}">
					<c:forEach items="${suggestionList}" var="suggestion">
						<tr>
							<td>${suggestion.place_name}</td>
							<td>${suggestion.message}</td>
							<td>
								<button class="form_btn" type="button" id="suggest_btn"
									onclick="suggestionPopup(${suggestion.sug_no})">자세히
									보기</button>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</body>
</html>