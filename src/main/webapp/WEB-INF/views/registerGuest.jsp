<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<title>Insert title here</title>
<script>
	$(document).ready(function() {
		$("#idck").click(function() {
			var userId = $("#id").val();
			$.ajax({
				async : true,
				type : 'POST',
				data : userId,
				cache : false,
				url : '<c:url value='/idCheck' />',
				dataType : 'json',
				contentType : 'application/json; charset=UTF-8',
				success : function(data) {
					if (data.cnt > 0) {
						alert('아이디가 존재합니다. 다른 아이디를 입력해주세요');
						$('#id').focus();
						$('#submitBtn').attr("disabled", "disabled");
					} else {
						alert('사용 가능한 아이디입니다.');
						$('#passwd').focus();
						// 아이디가 중복하지 않으면
						$('#submitBtn').removeAttr("disabled");
					}
				},
				error : function(e) {
					alert('아이디를 입력하세요!');
				}
			});
		});
		
	});
	
	function clickSubmit(){
		var passwd = document.getElementById('passwd').value;
		var passwdCon = document.getElementById('passwdCon').value;
		var target = document.getElementById('age');
		if(passwd != passwdCon){
			alert('비밀번호가 일치하지 않습니다!');
			return;
		} else if(target.options[target.selectedIndex].value == '나이대 선택'){
			alert('나이를 선택하세요!');
			return;
		} else {
			document.form1.action='/guest/signUp';
			document.form1.submit();
		}
	}
</script>
</head>
<body>
	<%@include file="header.jsp"%>
	<div align="center">
		<br /> <br />
		<h2>고객 회원가입</h2>
		<h1>기본 정보</h1>
		<table width="600px">
			<tr>
				<td>
					<form id="form1" name="form1" method="post" class="form-signin"
						action="/guest/signUp">
						<label for="id">아이디</label> <input type="text" id="id" name="id"
							class="form-control" placeholder="아이디를 입력하세요" required autofocus>
						<input type="button" class="btn btn-outline-danger my-2 my-sm-0"
							id="idck" value="중복 확인" /> <label for="passwd">비밀번호</label> <input
							type="password" id="passwd" name="passwd" class="form-control"
							placeholder="비밀번호를 입력하세요" required><br /> <label
							for="passwd">비밀번호 확인</label> <input type="password"
							id="passwdCon" name="passwdCon" class="form-control"
							placeholder="비밀번호를 입력하세요" required><br /> <label
							for="name">이름</label> <input type="text" id="name" name="name"
							class="form-control" placeholder="이름을 입력하세요" required> <label
							for="tel">휴대폰 번호</label> <input type="text" id="tel" name="tel"
							class="form-control" placeholder="휴대폰 번호를 입력하세요" required><br />
						<label for="gender">성별</label> <input type="radio" name="gender"
							id="gender" value="M" checked> 남자 <input type="radio"
							name="gender" id="gender" value="F"> 여자 <label for="age">나이</label>
						<div class="input-group mb-3">
							<select class="custom-select" id="age" name="age">
								<option selected>나이대 선택</option>
								<option value=10>10대</option>
								<option value=20>20대</option>
								<option value=30>30대</option>
								<option value=40>40대</option>
								<option value=50>50대</option>
								<option value=60>60대</option>
							</select>
						</div>
						<input type="button" class="btn btn-ln btn-danger btn-block"
						 id="submitBtn" onclick="clickSubmit();" disabled="disabled" value="Sign Up">
					</form>
					<button type="button" onclick="location.href='/login'">취소</button>
				</td>
			</tr>
		</table>
		<br /> <br />
	</div>
</body>
</html>