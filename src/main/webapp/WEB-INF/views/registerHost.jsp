<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/include/include-header.jsp"%>
<%@ include file="/WEB-INF/include/include-css.jsp"%>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
		} 
		else {
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
	<div class="container" align="center">
		<br /> <br /> <br /> <br />
		<h2>점주 회원가입</h2>
		<table width="450px" style="margin-top: 50px;">
			<tr>
				<td>
					<h4 style="margin-bottom: 40px;">기본정보</h4>
					
					<form:form commandName="host" id="form1" name="form1" method="post"
						class="form-signin" action="/host/signUp"
						enctype="multipart/form-data">
						
						<div class="form-group row">
							<label class="col-form-label"
								style="margin-right: 82px; padding-left: 15px; padding-right: 15px;">아이디</label>
							<div>
								<input type="text" class="form-control" id="id" name="id"
									placeholder="아이디를 입력하세요" required autofocus>
							</div>
							
							<button type="button" id="idck" class="btn btn-outline-primary" style="margin-left:10px;">중복확인</button>
						</div>
						
						<div class="form-group row">
							<label class="col-form-label"
								style="margin-right: 67px; padding-left: 15px; padding-right: 16px;">비밀번호</label>
							<div style="width: 58%;">
								<input type="password" class="form-control" id="passwd" name="passwd"
									placeholder="비밀번호를 입력하세요" required autofocus>
							</div>
						</div>
						
						<div class="form-group row">
							<label class="col-form-label"
								style="margin-right: 32px; padding-left: 15px; padding-right: 23px;">비밀번호
								확인</label>
							<div style="width: 58%;">
								<input type="password" class="form-control" id="passwdCon" name="passwdCon"
									placeholder="비밀번호를 입력하세요" required autofocus>
							</div>
						</div>
						
						<div class="form-group row">
							<label class="col-form-label"
								style="margin-right: 100px; padding-left: 15px; padding-right: 8px;">이름</label>
							<div style="width: 58%;">
								<input type="text" class="form-control" id="name" name="name"
									placeholder="이름을 입력하세요" required autofocus>
							</div>
						</div>
						
						<div class="form-group row">
							<label class="col-form-label"
								style="margin-right: 48px; padding-left: 15px; padding-right: 18px;">휴대폰
								번호</label>
							<div style="width: 58%;">
								<input type="text" class="form-control" id="tel" name="tel"
									placeholder="휴대폰 번호를 입력하세요" required autofocus>
							</div>
						</div>
						
						<h4 style="margin-top: 60px; margin-bottom: 40px;">가게 정보</h4>
						
						<div class="form-group row">
							<label class="col-form-label"
								style="margin-right: 82px; padding-left: 15px; padding-right: 15px;">상호명</label>
							<div style="width: 58%;">
								<input type="text" class="form-control" id="place.placeName" path="place.placeName"
									placeholder="상호명을 입력하세요" required autofocus>
							</div>
						</div>
						
						<div class="form-group row">
							<label class="col-form-label"
								style="margin-right: 67px; padding-left: 15px; padding-right: 16px;">전화번호</label>
							<div style="width: 58%;">
								<input type="text" class="form-control" id="place.placeTel" path="placeTel"
									placeholder="전화번호를 입력하세요" required autofocus>
							</div>
						</div>
						
						<div class="form-group row">
							<label class="col-form-label"
								style="margin-right: 28px; padding-left: 15px; padding-right: 25px;">최대 수용 인원</label>
							<div style="width: 58%;">
								<input type="text" class="form-control" id="place.capacity" path="place.capacity"
									placeholder="수용인원을 입력하세요" required autofocus>
							</div>
						</div>
						
						<div class="form-group row">
							<label class="col-form-label"
								style="margin-right: 65px; padding-left: 15px; padding-right: 15px;">영업 시간</label>
							<div style="width: 58%;">
								<p style="margin-top:7px; margin-bottom:10px;">오픈 시간</p> <form:input type="time" class='form-control' step="1800"
									path="place.startTime" id="place.startTime" required="required"/> 
								<p style="margin-top:10px; margin-bottom:10px;">마감 시간</p><form:input type="time" class='form-control' step="1800"
									path="place.endTime" id="place.endTime" required="required"/>
							</div>	
						</div>
						
						<div class="form-group row" style="maring-top:10px;">
						<label class="col-form-label"
								style="margin-right: 100px; padding-left: 15px; padding-right: 8px;">주소</label>
							<div class="form-group" style="width:57%;">
								<button type="button" class="btn btn-outline-primary"
									onclick="execPostCode();" style="margin-bottom:10px;">주소 찾기
								</button>
								<form:input class="form-control" path="place.address" placeholder="주소 찾기 버튼을 눌러 주소를 입력해주세요!"
									name="addr2" id="addr2" type="text" readonly="readonly" />
							</div>
						</div>
						
						<div class="form-group row">
							<label class="col-form-label"
								style="margin-right: 100px; padding-left: 15px; padding-right: 8px;">사진</label>
							<div id="pic" style="width: 58%;" >
								<input type="file" multiple="multiple" id="pic1"
								class="form-control" name="pic" required="required">
							</div>
						</div>
						
						<div class="form-group"  style="text-align: center; margin-top: 70px;">
							<button type="button" class="btn btn-outline-primary"  style="margin-right: 20px; width: 20%"
								onclick="location.href='/login'">취소</button>
                     		<button type="button" class="btn btn-primary" style="width: 20%"
                     			id="submitBtn" onclick="clickSubmit();" value="Sign Up">다음</button>
                		</div>
          				
					</form:form></td>
			</tr>
		</table>
		<br /> <br />
	</div>
</body>
</html>