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

<%-- <!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet"/>

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/css/modern-business.css"
	rel="stylesheet" /> --%>
	<script src="//code.jquery.com/jquery.min.js"></script>
<script>


var sug_no = 0;
$(document).ready(function(){
	
	
	$('#exampleModal').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget) // Button that triggered the modal
		  var recipient = button.data('whatever') // Extract info from data-* attributes
		  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		  var modal = $(this)
		});
	
});
	function cancelResv() {
		$.ajax({
			type: "POST",
			url : "/cancelResv",
			data: {
				sug_no : sug_no
			},
			success : function(result) {
				alert("해당 예약이 취소되었습니다.");
				$("#exampleModal").modal("hide");
				history.go(0);
			},
			error : function(e) {
				alert("해당 예약 취소에 실패했습니다.");
			}
		});
	}

	function cancelBtn(e){
		var s = e.id;
		sug_no = s;
		
	}
	
	function suggestionPopup(place_no, sug_no) {
		var popupWidth = 420;
		var popupHeight = 850;
		var sugUrl = "suggestionResv";
	
		
		var form = document.createElement("form");
		form.setAttribute("charset", "UTF-8");
		form.setAttribute("method", "Post");
		form.setAttribute("action", sugUrl);

		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "width");
		hiddenField.setAttribute("value", popupWidth);

		form.appendChild(hiddenField);
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "height");
		hiddenField.setAttribute("value", popupHeight);
		form.appendChild(hiddenField);

		form.appendChild(hiddenField);
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "place_no");
		hiddenField.setAttribute("value", place_no);
		form.appendChild(hiddenField);
		
		form.appendChild(hiddenField);
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "sug_no");
		hiddenField.setAttribute("value", sug_no);
		form.appendChild(hiddenField);

		var url = "suggest"
		var title = "suggest"
		var status = "width=" + popupWidth + ", height= " + popupHeight
				+ ", left=" + (window.screen.width - popupWidth) / 2 + ", top="
				+ (window.screen.height - popupHeight) / 2
				+ ", resizable=no, scrollbars=no, status=no;";
		window.open("", title, status);
		form.target = title;
		document.body.appendChild(form);
		
		form.submit();
	}
 </script>


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
									<c:forEach items="${selectReservationList}" var="resv"
										varStatus="status">
										<tr>
											<th scope="row">${status.count}</th>
											<td style="text-align: center";>${resv.place_name}</td>
											<td style="text-align: center";>${resv.mem_cnt}</td>
											<td style="text-align: center";>${resv.resv_date}</td>
											<td><button class="btn btn-danger" type="button" id="suggest_btn"
									onclick="suggestionPopup(${resv.place_no}, ${resv.sug_no })">자세히 보기</button></td>
											<td>
											
											<button type="button" class="btn btn-danger" data-toggle="modal"
											data-target="#exampleModal" onclick="cancelBtn(this)" id="${resv.sug_no }" data-whatever="@getbootstrap">예약 취소</button>
											
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


<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

      <div id="inner">
        '확인'버튼을 누르면 해당 예약이 취소됩니다. <br>
					정말 예약을 취소하시겠습니까?
      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" onclick="cancelResv();"  class="btn btn-danger">확인</button>
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