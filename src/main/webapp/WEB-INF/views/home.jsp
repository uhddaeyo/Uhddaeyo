<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Home</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
	$(document).ready(function() {
		$('#exampleModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget) // Button that triggered the modal
			var recipient = button.data('whatever') // Extract info from data-* attributes
			var modal = $(this)
			/* modal.find('.modal-body input').val(recipient) */
			});
		$("#reqSend").click(function() {
			$.ajax({
				async : true,
				type : 'POST',
				cache : false,
				url : '<c:url value='/hashTagList' />',
				dataType : 'json',
				contentType : 'application/json; charset=UTF-8',
				success : function(data) {
					$.each(data, function(i, f) {
						if (f.category == '분류') {
							var s = '<input type="radio" name="tag" value="' + f.content + '" /> ' + f.content + ' ';
							$('#category').append(s);
						} else if (f.category == '방문목적') {
							var s = '<input type="checkbox" name="tag" value="' + f.content + '" /> ' + f.content + ' ';
							$('#purpose').append(s);
						} else if (f.category == '편의시설') {
							var s = '<input type="checkbox" name="tag" value="' + f.content + '" /> ' + f.content + ' ';
							$('#condition').append(s);
						} else {
							var s = '<input type="checkbox" name="tag" value="' + f.content + '" /> ' + f.content + ' ';
							$('#mood').append(s);
						}});
					},
					error : function(e) {
						alert(e);
						}
					});
			});
		});
</script>
</head>
<body>
	<%@include file="header.jsp"%>
	<h1>Hello world!</h1>
	<c:if test="${msg == 'success' }">
${sessionScope.userId}(${sessionScope.userName }) 
</c:if>

	<c:choose>
		<c:when test="${sessionScope.userId == null }">
			<a href="${path}/login">로그인</a>
		</c:when>
		<c:otherwise>
		${sessionScope.userName } 님이 로그인 중입니다.
		<a href="${path}/logout">로그아웃</a>
			<a href="${path}/historyList">나의 내역보기</a>
		</c:otherwise>
	</c:choose>
	<P></P>


	<button type="button" id="reqSend" class="btn btn-primary"
		data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">의뢰서
		보내기</button>

	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">의뢰서(맞춤 맛집 찾기)</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form method="POST" action="/test">
						<div id="tag"></div>

						<h6>
							<b>정보</b>
						</h6>
						<!-- 지역 애매하다.. -->
						<div class="form-group">
							<label for="place" class="col-form-label">지역</label> <input
								type="text" class="form-control" name="place" id="place">
						</div>

						<div class="form-group">
							<label for="date" class="col-form-label">날짜</label> <input
								type="datetime-local" class="form-control" id="date" name="date"
								step="1800" />
						</div>
						<div class="form-group">
							<label for="price" class="col-form-label">인당 가격</label> <input
								type="text" class="form-control" id="price" name="price"
								placeholder="인당 가격대를 입력해주세요." required />
						</div>
						<div class="form-group">
							<label for="member" class="col-form-label">인원</label> <input
								type="text" class="form-control" id="member" name="member"
								placeholder="예약 인원을 입력해주세요." required />
						</div>
						<div id="category">
							<h3>분류</h3>
						</div>

						<div id="purpose">
							<h3>방문 목적</h3>
						</div>

						<div id="mood">
							<h3>분위기</h3>
						</div>
						<div id="condition">
							<h3>편의 시설</h3>
						</div>

						<input type="hidden" name="placeNo" value="${placeNo }" />
						<div class="modal-footer">
							<button type="submit" class="btn btn-danger">확인</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
