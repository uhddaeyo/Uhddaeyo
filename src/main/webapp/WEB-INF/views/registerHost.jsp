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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
	function execPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				console.log(data.zonecode);
				console.log(fullRoadAddr);

				/*                $("[name=addr1]").val(data.zonecode); */
				/* $("[name=addr2]").val(fullRoadAddr); */
				document.getElementById('addr2').value = fullRoadAddr;
				/* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
				document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
			}
		}).open();
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
				<td><form:form commandName="host" id="form1" name="form1"
						method="post" class="form-signin" action="/host/signUp"
						enctype="multipart/form-data">
						<label for="id">아이디</label>
						<form:input type="text" id="id" path="id" cssClass="form-control"
							placeholder="아이디를 입력하세요" required="required" />
						<input type="button" id="idck"
							class="btn btn-outline-danger my-2 my-sm-0" value="중복 확인" />
						<br />
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
						<form:input type="tel" id="tel" path="tel" class="form-control"
							placeholder="휴대폰 번호를 입력하세요" required="required" />
						<br />

						<h2>가게 정보</h2>

						<label for="placeName">상호명</label>
						<form:input type="text" path="place.placeName"
							id="place.placeName" required="required" />
						<br />
						<label for="placeTel">전화번호</label>
						<form:input type="text" path="place.placeTel" id="place.placeTel"
							required="required" />
						<br />
						<label for="capacity">최대 수용 인원</label>
						<form:input type="text" path="place.capacity" id="place.capacity"
							required="required" />
						<br />
						<label>영업시간</label>
						<form:input type="time" class='form-control' step="1800"
							path="place.startTime" id="place.startTime" required="required" />
						<form:input type="time" class='form-control' step="1800"
							path="place.endTime" id="place.endTime" required="required" />
						<br />

						<div class="form-group">
							<button type="button" class="btn btn-default"
								onclick="execPostCode();">
								<i class="fa fa-search"></i> 주소 찾기
							</button>
						</div>
						<div class="form-group">
							<form:input class="form-control" path="place.address"
								style="top: 5px;" placeholder="주소 찾기 버튼을 눌러 주소를 입력해주세요!"
								name="addr2" id="addr2" type="text" readonly="readonly" />
						</div>
<%-- 						<label for="address">주소</label>
						<form:input type="text" path="place.address" id="place.address"
							required="required" /> --%>
						<br />
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