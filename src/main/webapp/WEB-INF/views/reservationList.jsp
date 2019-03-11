<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="ko">
<head>
	<title>Home</title>
	<meta charset="utf-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
</head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<body>
<%-- <h1>
	Hello world!  
</h1>
<c:if test="${msg == 'success' }">
${sessionScope.userId}(${sessionScope.userName }) 
</c:if>

<c:choose>
	<c:when test="${sessionScope.userId == null }">
		<a href = "${path}/login">로그인</a>
	</c:when>
	<c:otherwise>
		${sessionScope.userName } 님이 로그인 중입니다.
		<a href = "${path}/logout">로그아웃</a>
	</c:otherwise>
</c:choose>
<P></P> --%>

<h2>나의 예약내역</h2>
	<table class="table table-hover">
		<colgroup>
			<col width="10%"/>
			<col width="25%"/>
			<col width="30%"/>
			<col width="10%"/>
			<col width="20%"/>
			<col width="5%"/>
			
		</colgroup>
		<thead>
			<tr>
				<th scope="col">가게이름</th>
				<th scope="col">가게주소</th>
				<th scope="col">메세지</th>
				<th scope="col">예약자 명</th>
				<th scope="col">예약일</th>
				<th scope="col">예약취소</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(selectReservationList) > 0}">
					<c:forEach items="${selectReservationList}" var="resv">
						<tr>
							<td>${resv.place_name}</td>
							<td>${resv.address}</td>
							<td>${resv.message}</td>
							<td>${resv.name}</td>
							<td>${resv.resv_date}</td>
							<td><button type="button" class="btn btn-danger" data-toggle="modal" data-target="#cancleModal" data-backdrop="static">예약 취소</button></td>
							<!-- <td><input onclick="isresvChange();" type="button" id="cancle" value="취소하기" class="btn btn-danger" ></td> -->
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="6">고객님의 예약 내역이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>


		</tbody>
	</table>
	
	<div class="modal fade" id="cancleModal" tabindex="-1" role="dialog" aria-labelled="cancleModalLabel" aria-hidden="true">
		<div class = "modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="cancleModalLabel">예약 취소 확인</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					'확인'버튼을 누르면 해당 예약이 취소됩니다. <br>
					정말 예약을 취소하시겠습니까?
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal" id="cancleResv">확인</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	


	
	
	<!-- <script type="text/javascript">
	
	function isresvChange(){
		
		var check = confirm("정말 예약을 취소하시겠습니까?");
		
		
		if(check == true){
			
			document.form.submit();
			

			
		}else if(check == false){
			return;
		}
	}
	
	
	
	</script>
	 -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
	
</body>
</html>
