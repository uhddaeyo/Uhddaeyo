<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">


<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>어때요? :: UH DDAE YO</title>

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/css/modern-business.css"
	rel="stylesheet">

</head>


<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<body>

	<%@include file="header.jsp"%>

	<!-- Page Content -->
	<div class="container">
		<div class="row">

			<!-- div 태그 바꾸기 -->

			<div class="col-lg-3" style="margin-top: 40px;">
				<h1 class="my-4" align="center">MENU</h1>
				<div class="list-group">
					<a href="#" class="list-group-item">초대장 모아보기</a> <a href="#"
						class="list-group-item active">나의 예약내역</a> <a href="#"
						class="list-group-item">나의 이용내역</a>
				</div>
			</div>

			<div class="col-lg-9">

				<h2 style="margin-top: 55px;">나의 예약내역</h2>

				<div class="row" style="margin-top: 40px;">

					<table class="table table-hover">

						<thead>
							<tr>
								<th scope="col" style="width: 5%; text-align: center"></th>
								<th scope="col" style="width: 30%; text-align: center">매장명</th>
								<th scope="col" style="width: 10%; text-align: center">인원</th>
								<th scope="col" style="width: 30%; text-align: center">예약날짜/시간</th>
								<th scope="col" style="width: 10%; text-align: center">초대장
									명</th>
								<th scope="col" style="width: 10%; text-align: center">예약</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${fn:length(selectReservationList) > 0}">
									<c:forEach items="${selectReservationList}" var="resv" varStatus ="status">
										<tr>
											<th scope = "row">${status.count}</th>
											<td style="text-align: center";>${resv.place_name}</td>
											<td style="text-align: center";>${resv.mem_cnt}</td>
											<td style="text-align: center";>${resv.resv_date}</td>
											<td><button type="button" class="btn btn-danger"
													data-toggle="modal" data-target="#checkModal"
													data-backdrop="static">초대장 확인</button></td>
											<td><button type="button" class="btn btn-danger"
													data-toggle="modal" data-target="#cancleModal"
													data-backdrop="static">예약 취소</button></td>
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
					
					</div>



					<div class="modal fade" id="cancleModal" tabindex="-1"
						role="dialog" aria-labelled="cancleModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="cancleModalLabel">예약 취소 확인</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									'확인'버튼을 누르면 해당 예약이 취소됩니다. <br> 정말 예약을 취소하시겠습니까?
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-danger"
										data-dismiss="modal" id="cancleResv">확인</button>
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소</button>
								</div>
							</div>
						</div>
					</div>


				
				
				
				
				
				<div style="text-align: center;">
					<div style="display: inline-block;">
						<ul class="pagination">
							<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a>
							</li>
							<li class="page-item active"><a class="page-link" href="#">1</a>
							</li>
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


</body>
</html>