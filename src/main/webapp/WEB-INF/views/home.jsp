<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
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
<P></P>

<button onclick="location='reservationList'">나의 예약내역</button>

<%-- <h2>나의 예약내역</h2>
	<table>
		<colgroup>
			<col width="10%"/>
			<col width="30%"/>
			<col width="30%"/>
			<col width="25%"/>
			<col width="10%"/>
			
		</colgroup>
		<thead>
			<tr>
				<th scope="col">가게이름</th>
				<th scope="col">가게주소</th>
				<th scope="col">메세지</th>
				<th scope="col">예약일</th>
				<th scope="col">예약취소</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(ReservationList) > 0}">
					<c:forEach items="${ReservationList}" var="resv">
						<tr>
							<td>${resv.place_name}</td>
							<td>${resv.address}</td>
							<td>${resv.message}</td>
							<td>${resv.resv_date}</td>
							<td><input onclick="isresvChange()" type="button" id="cancle" value="취소하기"></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5">고객님의 예약 내역이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>


		</tbody>
	</table>
	
	<script type="text/javascript">
	
	function isresvChange(){
		if(confrim("정말 예약을 취소하시겠습니까?") == true){
			document.form.submit()
		}else{
			return;
		}
	}
	
	</script> --%>
</body>
</html>
