<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jsp"%>
<%@ include file="/WEB-INF/include/include-css.jsp"%>
<title>초대현황</title>

<script type="text/javascript">
   var sugNo;
   function editMemo(writtenMemo, writtenSugNo) {
      document.getElementById("memoTextarea").value = writtenMemo;
      sugNo = writtenSugNo;
   }
   
   function saveMemo() {
      var memo = document.getElementById("memoTextarea").value;
      if (memo == "") {
         alert("답글을 입력해 주세요.");
         return;
      }
      
      $.ajax({
         type: "POST",
         url: "saveMemo",
         data : {memo : memo,
            sugNo : sugNo,
            },
         success: function(result) {
            alert("등록에 성공했습니다.");
            $("#myModal").hide();
            window.location.reload();
         },
         error: function(e) {
            alert("등록에 실패했습니다.");
         }
      });

   }
</script>
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
				<a href="${pageContext.request.contextPath}/guestList" class="list-group-item"  style="text-align:center">고객현황</a>
				<a href="${pageContext.request.contextPath}/inviteList" class="list-group-item">초대현황</a>
				<a href="${pageContext.request.contextPath}/resvList" class="list-group-item active">예약현황</a>
				<a href="${pageContext.request.contextPath}/review" class="list-group-item">가게리뷰</a>
				<a href="${pageContext.request.contextPath}/guestAnalysis" class="list-group-item">고객분석</a>
			</div>
	  </div>

		<div class="col-lg-9"  style = "font-size:15px">
			<h2 style="margin-top: 55px;">
				<b>예약 현황</b>
			</h2>
			<div class="row" style="margin-top: 40px;">

				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col" style="width: 5%; text-align: center"></th>
							<th scope="col" style="width: 15%; text-align: center">고객명</th>
							<th scope="col" style="width: 25%; text-align: center">예약날짜/시간</th>
							<th scope="col" style="width: 10%; text-align: center">인원</th>
							<th scope="col" style="width: 35%; text-align: center">메모</th>
						</tr>
					</thead>

					<tbody>
						<c:choose>
							<c:when test="${fn:length(resvList) > 0}">
								<c:forEach items="${resvList}" var="resv" varStatus="idx">
									<tr align="center">
										<td width="50" style="vertical-align: middle;">${idx.count}</td>
										<td width="50" style="vertical-align: middle;">${resv.userName }</td>
										<td width="50" style="vertical-align: middle;"><fmt:formatDate
												value="${resv.date }" pattern="yyyy-MM-dd HH:mm" /></td>
										<td width="50" style="vertical-align: middle;">${resv.memCnt }</td>

										<c:choose>
											<c:when test="${resv.memo == ''}">
												<td width="50" style="vertical-align: middle;">
													<button type="button" class="btn btn btn-outline-primary"
														id="message" data-toggle="modal" data-target="#myModal";>메모쓰기</button>
												</td>


											</c:when>
											<c:otherwise>
												<td width="50" style="vertical-align: middle;"><a
													data-toggle="modal" href="#myModal"
													onclick="editMemo('${resv.memo}', ${resv.sugNo});">${resv.memo}</a>
												</td>
											</c:otherwise>
										</c:choose>

									</tr>
									<!-- 모닱창 -->
									<div class="modal fade" id="myModal" role="dialog">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">MEMO</h5>

												</div>
												<div class="modal-body">
													<textarea class="form-control" id="memoTextarea" rows="3"></textarea>
												</div>
												<div class="modal-footer">
													<button id="saveBtn" type="button" class="btn btn-primary"
														onclick="saveMemo();">저장</button>
													<button id="cancelBtn" type="button"
														class="btn btn-secondary" data-dismiss="modal">취소</button>
												</div>
											</div>
										</div>
									</div>

								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="6">조회된 결과가 없습니다!</td>
								</tr>
							</c:otherwise>
						</c:choose>

					</tbody>


				</table>

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