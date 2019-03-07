<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#btnLogin").click(function() {
			var id = $("#id").val();
			var passwd = $("#passwd").val();

			if (id == "") {
				alert("아이디를 입력하세요!");
				$("#id").focus();
				return;
			}
			if (passwd == "") {
				alert("비밀번호를 입력하세요!");
				$("#passwd").focus();
				return;
			}

			document.form1.action = "${path}/loginCheck";
			document.form1.submit();
		});
	});
</script>
</head>
<body>
	<%@include file="header.jsp"%>
	<div align="center">
		<br /> <br />
		<h2>로그인</h2>
		<table width="300px">
			<tr>
				<td>
					<form name="form1" method="post" class="form-signin">
						<label for="inputId" class="sr-only">ID</label> <input type="text"
							id="id" name="id" class="form-control"
							placeholder="Enter your ID" required autofocus> <label
							for="inputPassword" class="sr-only">Password</label> <input
							type="password" id="passwd" name="passwd" class="form-control"
							placeholder="Password" required><br />
						<button class="btn btn-ln btn-danger btn-block" type="button"
							id="btnLogin">Sign in</button>
					</form>
				</td>
			</tr>
		</table>

		<form method="GET" action="/guest/signUp">
			<input type="submit" value="회원가입">
		</form>
		
		<form method="GET" action="/host/signUp">
			<input type="submit" value="점주회원가입">
		</form>
	</div>
</body>
</html>