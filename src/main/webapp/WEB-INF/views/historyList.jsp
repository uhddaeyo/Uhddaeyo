<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<%@ include file="/WEB-INF/include/include-header.jsp" %>
</head>
<script>
	$(document).ready(function(){
		$('.review').on("click",function(){
			var popUrl = "/reviewDetail?place_no="+$(this).attr("id");
			var popOption = "width=350, height=450, resizeable=no, scrollbar=no, status=no";
			window.open(popUrl,"",popOption);
		})
	});
</script>
<body>
	<h2>나의 이용내역</h2>
	<table class="history_list">
		<colgroup>
			<col width="10%"/>
			<col width="*"/>
			<col width="15%"/>
			<col width="20%"/>
		</colgroup>

		<thead>
			<tr>
				<th scope="col">가게이름</th>
				<th scope="col">가게주소</th>
				<th scope="col">예약일</th>
				<th scope="col">리뷰작성</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(historyList) > 0}">
					<c:forEach items="${historyList}" var="row">
						<tr>
							<td>${row.place_name}</td>
							<td>${row.address}</td>
							<td>${row.resv_date}</td>
							<td class="review" id="${row.place_no}"><a href="#">리뷰작성하기</a></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4"> 조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</body>
</html> 