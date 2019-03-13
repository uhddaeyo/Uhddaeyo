<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript">
	function editText(reply_no, review_no) {
		if ($('#set_reply_button').length) {
			// 만약 이미 답글 등록 버튼을 누른 상태라면 함수를 바로 종료.
			return false;
		}
		
		reply_form = document.getElementById("reply"+review_no);
		reply_form.value="";
		reply_form.removeAttribute("readonly");
		reply_form.focus();
		
		reply_tr = document.getElementById("reply_tr" + review_no);
		
		var set_reply_button = document.createElement("button");
		set_reply_button.setAttribute("id", "set_reply_button");
		set_reply_button.innerText = '등록하기';
		set_reply_button.setAttribute("onClick", "setReply(" + reply_no + ", " + review_no + " , reply_form.value)");
		reply_tr.appendChild(set_reply_button);

 		return true;
	}
	
	function setReply(reply_no, review_no, reply) {
		
		if (reply == "") {
			alert("답글을 입력해 주세요.");
			return;
		}
		
		$.ajax({
			type: "POST",
			url: "setReply",
			data : {reply_no : reply_no,
				review_no : review_no,
				reply : reply,
				},
			success: function(result) {
				alert("등록에 성공했습니다.");
				var set_reply_button = document.getElementById("set_reply_button");
				set_reply_button.parentNode.removeChild(set_reply_button);
				
				document.getElementById("reply"+review_no).setAttribute("readonly", "readonly");
			},
			error: function(e) {
				alert("등록에 실패했습니다.");
			}
		});
	}
	
	function press() {
		if (window.event.keyCode == 13) {
			console.log("clicked");
			$('#set_reply_button').trigger('click');
		}
	}
 </script>
<title>Insert title here</title>
</head>
<body>
	<h1>가게 리뷰</h1>

	<c:forEach items="${reviews }" var="review">
		<table>
			<tr>
				<td>별점 : ${review.star}</td>
				<td style="font-size: 12px">(${review.age},<c:choose>
						<c:when test="${review.gender=='F'}">여</c:when>
						<c:otherwise>남</c:otherwise>
					</c:choose>)
				<td><a href="#" onclick="return editText(${review.reply_no}, ${review.review_no})">답글달기</a></td>
			</tr>
			<tr>
				<td colspan="3">${review.review}</td>
			</tr>
			<tr id="reply_tr${review.review_no}">
				<td colspan="3"><input id="reply${review.review_no}" type="text"
					readonly="readonly" value="${review.reply}" onkeyup="press();"></td>
			</tr>
		</table>
	</c:forEach>
</body>
</html>
