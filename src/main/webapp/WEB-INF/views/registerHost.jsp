<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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

	function clickSubmit() {
		var passwd = document.getElementById('passwd').value;
		var passwdCon = document.getElementById('passwdCon').value;
		var target = document.getElementById('age');
		if (passwd != passwdCon) {
			alert('비밀번호가 일치하지 않습니다!');
			return;
		} else if (target.options[target.selectedIndex].value == '나이대 선택') {
			alert('나이를 선택하세요!');
			return;
		} else {
			document.form1.action = '/host/signUp';
			document.form1.submit();
		}
	}
</script>
</head>
<body>
	<%@include file="header.jsp"%>
	<div align="center">
		<br /> <br />
		<h1>점주 회원가입</h1>
		<h2>기본 정보</h2>
		<table width="600px">
			<tr>
				<td><form:form commandName="host" id="form1" name="form1" method="post"
						class="form-signin" action="/host/signUp"
						enctype="multipart/form-data">
						<label for="id">아이디</label>
						<form:input type="text" id="id" path="id" cssClass="form-control"
							placeholder="아이디를 입력하세요" required="required" />
						<input type="button" id="idck"
							class="btn btn-outline-danger my-2 my-sm-0" value="중복 확인" /><br />
						<label for="passwd">비밀번호</label>
						<form:input type="password" id="passwd" path="passwd"
							class="form-control" placeholder="비밀번호를 입력하세요"
							required="required" />
						<br />
						<label for="passwd">비밀번호 확인</label>
						<input type="password" id="passwdCon" name="passwdCon"
							class="form-control" placeholder="비밀번호를 입력하세요"
							required="required">
						<br />
						<label for="name">이름</label>
						<form:input type="text" id="name" path="name" class="form-control"
							placeholder="이름을 입력하세요" required="required" />
						<label for="tel">휴대폰 번호</label>
						<form:input type="text" id="tel" path="tel" class="form-control"
							placeholder="휴대폰 번호를 입력하세요" required="required" />
						<br />

						<h2>가게 정보</h2>
						<label for="placeName">상호명</label>
						<form:input type="text" path="place.placeName"
							id="place.placeName" required="required" /><br />
						<label for="placeTel">전화번호</label>
						<form:input type="text" path="place.placeTel" id="place.placeTel"
							required="required" /><br />
						<label for="capacity">최대 수용 인원</label>
						<form:input type="text" path="place.capacity" id="place.capacity"
							required="required" /><br />
						<label>영업시간</label>
						<form:input type="time" class='form-control' step="1800"
							path="place.startTime" id="place.startTime" required="required" />
						<form:input type="time" class='form-control' step="1800"
							path="place.endTime" id="place.endTime" required="required" /><br />
						<label for="address">주소</label>
						<form:input type="text" path="place.address" id="place.address"
							required="required" /><br />
						<label for="picture">사진</label>
						<div id="pic">
							<input type="file" multiple="multiple" id="pic1"
								class="form-control" name="pic" required="required">
						</div>
						<input type="submit" class="btn btn-ln btn-danger btn-block"
							id="submitBtn" onclick="clickSubmit();" value="Sign Up"
							disabled="disabled">
							<button type="button" onclick="location.href='/login'">취소</button>
					</form:form></td>
			</tr>
		</table>
		<br /> <br />
	</div>
</body>
</html>