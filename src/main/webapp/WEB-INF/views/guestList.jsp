<%@ page import="com.ktds.uhddaeyo.common.AES256Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jsp"%>
<%@ include file="/WEB-INF/include/include-css.jsp"%>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
$(document).ready(function(){
	$('#exampleModal').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget) // Button that triggered the modal
		  var recipient = button.data('whatever') // Extract info from data-* attributes
		  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		  var modal = $(this)
		});
});
function inviteClick(e){
	var n = e.id;
	$.ajax({
		type : 'POST',
		cache : false,
		url : '/invitation',
		dataType : 'json',
		contentType : 'application/json; charset=UTF-8',
		success : function(data){
			document.getElementById('name').innerHTML="";
			document.getElementById('tags').innerHTML="";
			$.each(data, function(i, f){
				if(i == 0){
					$('#name').append(f);
				} else {
					var s = '#' + f + ' ';
					$('#tags').append(s);
				}
			});
		
			var name = '<input type="hidden" name="info" value="' + n + '" />';
			$('#name').append(name);
		},
		error : function(e){
			alert(e);
		}
	});
}
function kakaoLink(e) {
	var userId = e.id;
	var url = "kakaoinvitelink/" + userId;
	
	Kakao.Link.sendCustom({
		templateId : 15212,
		templateArgs : {
			'des' : '제안서 보기를 클릭해서 도착한 제안서를 확인해보세요!',
			'title' : '고객님 여기 어때요?',
			'btn' : '제안서 보기',
			'url' : url,
		}
	});
}
</script>
<title>고객 현황</title>
</head>

<body>
	<%@include file="header.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-lg-2" style="margin-top: 45px; margin-right: 30px">
			<div class="site-logo" style="font-family: Segoe Scrip;" align="center">
				<img class="menu-logo" src="resources/logoImage/menu1.jpg" width="130" height="50" />
			</div>
			<div class="list-group" style="text-align: center; margin-top: 30px;">
				<a href="${pageContext.request.contextPath}/host" class="list-group-item">가게정보</a>
				<a href="${pageContext.request.contextPath}/guestList" class="list-group-item active"  style="text-align:center">고객현황</a>
				<a href="${pageContext.request.contextPath}/inviteList" class="list-group-item">초대현황</a>
				<a href="${pageContext.request.contextPath}/resvList" class="list-group-item">예약현황</a>
				<a href="${pageContext.request.contextPath}/review" class="list-group-item">가게리뷰</a>
				<a href="${pageContext.request.contextPath}/guestAnalysis" class="list-group-item">고객분석</a>
			</div>
	 	 </div>

			<div class="col-lg-9"  style = "font-size:15px">
				<h2 style="margin-top: 55px;">
					<b>고객 현황</b>
				</h2>
				<div class="row" style="margin-top: 40px;">

					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col" style="width: 5%; text-align: center"></th>
								<th scope="col" style="width: 15%; text-align: center">고객명</th>
								<th scope="col" style="width: 25%; text-align: center">예약날짜/시간</th>
								<th scope="col" style="width: 10%; text-align: center">인원</th>
								<th scope="col" style="width: 25%; text-align: center"></th>
								<th scope="col" style="width: 10%; text-align: center"></th>
							</tr>
						</thead>

						<tbody>
							<c:choose>
								<c:when test="${fn:length(guestList) > 0}">
									<c:forEach items="${guestList}" var="guest" varStatus="idx">
										<c:set var="userNo" value="${guest.userNo }"></c:set>
										<%
											AES256Util aes256Util = new AES256Util();
											String encryptUserNo = aes256Util.encrypt(String.valueOf(pageContext.getAttribute("userNo")));
										%>
										
										<tr align="center">
											<td width="50" style="vertical-align: middle;">${idx.count}</td>
											<td width="100" style="vertical-align: middle">${guest.userName }</td>
											<td width="200" style="vertical-align: middle"><fmt:formatDate
													value="${guest.date }" pattern="yyyy-MM-dd HH:mm" />
											<td style="vertical-align: middle">${guest.memCnt }</td>

											<td style="vertical-align: middle">
											<c:choose>
											<c:when test="${guest.sent eq 'N'}">
											<button type="button" class="btn btn btn-primary" data-toggle="modal"
													data-target="#exampleModal" onclick="inviteClick(this);"
													id="${guest.date },${guest.userNo},${guest.reqNo},${guest.idx}">초대장 작성하기
											</button>
											</c:when>
											<c:otherwise>
											<button type="button" class="btn btn btn-primary" data-toggle="modal"
													data-target="#exampleModal" onclick="inviteClick(this);"
													id="${guest.date },${guest.userNo},${guest.reqNo},${guest.idx}" disabled="disabled">초대장 작성하기
											</button>
											</c:otherwise>
											</c:choose>
											</td>
											<td style="vertical-align: middle"><button type="button"
													onclick="kakaoLink(this);" name="${guest.userName }"
													id=<%=encryptUserNo %> class="btn btn btn-outline-primary">알림</button></td>

										</tr>

									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td>조회된 결과가 없습니다!</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>

					</table>
				</div>
				<div style="text-align: center;">
					<div style="display: inline-block;">
						<ul class="pagination">
							<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
							<li class="page-item active"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item"><a class="page-link" href="#">&raquo;</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">초대장 보내기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<form action="/invite" method="post">
					<div class="modal-body">

						<div class="form-group">
							<label for="name" class="col-form-label"><b>가게 이름</b></label>
							<div id="name"></div>
							<label for="tags" class="col-form-label"><b>매장 정보</b></label>
							<div id="tags"></div>
						</div>
						
						<div class="form-group">
							<label for="message-text" class="col-form-label"><b>메세지</b></label>
							<textarea class="form-control" name="msg" id="message-text"
								required="required"></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소</button>
						<input type="submit" class="btn btn-primary" value="전송" />
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type='text/javascript'>
		Kakao.init('cd1e5dbbd5ca1a96ec393c7c7518dee7');
	</script>
</body>