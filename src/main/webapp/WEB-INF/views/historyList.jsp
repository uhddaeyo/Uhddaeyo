<%@page import="com.ktds.uhddaeyo.common.AES256Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jsp"%>
<%@ include file="/WEB-INF/include/include-css.jsp"%>

<script src="//code.jquery.com/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/star.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
   
<!-- 별점 -->
<style>
.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('${pageContext.request.contextPath}/resources/images/grade_img.png')no-repeat;}
.star-input{display:inline-block; white-space:nowrap;width:auto;height:auto;line-height:30px;}
.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
.star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-input>.input>label:hover~label{background-image: none;}
.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
.star-input>output>b{display:inline-block;width:auto; font-size:18px;text-align:right; vertical-align:middle;}
</style>

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
      
 //review Detail 창 가져오기
function reviewClick(e) {
	console.log(e.name);
	document.getElementById('placeName').innerHTML = "";
	$('#placeName').append(e.name);
	
	var place_no = '<input type="hidden" name="place_no" value="' + e.id + '"/>';
	$('#placeName').append(place_no);
 }
</script>

<title>나의 이용내역</title>
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
					<c:set var="userNo" value="${sessionScope.userNo}"></c:set>
					<%
						AES256Util aes256Util = new AES256Util();
						String encryptUserNo = aes256Util.encrypt(String.valueOf(pageContext.getAttribute("userNo")));
					%>
					<a href="${path}/<%=encryptUserNo %>" class="list-group-item">초대장
						모아보기</a> <a href="${pageContext.request.contextPath}/reservationList"
						class="list-group-item">나의 예약내역</a> <a
						href="${pageContext.request.contextPath}/historyList"
						class="list-group-item active">나의 이용내역</a>
				</div>
			</div>

			<div class="col-lg-9">
			<h2 style="margin-top: 55px;">
				<b>나의 이용 내역</b>
			</h2>
			<div class="row" style="margin-top: 40px;">

               <c:choose>
                  <c:when test="${fn:length(historyList) > 0}">
                     <c:forEach items="${historyList}" var="row">
                     
                        <div class="col-lg-4 col-md-6 mb-4" style="height: 254px;">
                           <div class="card h-100" style="height: 252px; border-color: #BDBDBD;">
                              <div class="card-body" style="width:auto; margin-top:20px;">
                                 <h4 class="card-title" style="margin-bottom:15px;">
                                    <a class="text-primary"><b>${row.place_name}</b></a>
                                 </h4>
                                 <h5>${row.resv_date}</h5>
                                 <p class="card-text" style="height:70px;">${row.address}</p>
                                 <button type="button" class="btn btn btn-outline-primary" data-toggle="modal" 
                                 data-target="#exampleModal" onclick="reviewClick(this);" id="${row.place_no}" name="${row.place_name}" >리뷰작성</button>
                              </div>
                           </div>
                        </div>
                     </c:forEach>
                  </c:when>
                  
                  <c:otherwise>
                     <h4>조회된 결과가 없습니다.</h4>
                  </c:otherwise>
               </c:choose>
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
					<h5 class="modal-title" id="exampleModalLabel">리뷰 전송</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<form action="/insertReview" method="post">
					<div class="modal-body">
					
						<div class="form-group">
							<label for="placeName" class="col-form-label"><b>가게 이름</b></label>
							<div id="placeName"></div>
						</div>
						
						<div class="form-group">
							<label for="star-rating" class="col-form-label"><b>별점평가</b></label>
							<span class="star-input" name="star" id="star-rating"> 
								<span class="input"> 
								<input type="radio" name="star" value="1" id="p1"> 
									<label for="p1">1</label> 
								<input type="radio" name="star" value="2" id="p2"> 
									<label for="p2">2</label> 
								<input type="radio" name="star" value="3" id="p3"> 
									<label for="p3">3</label> 
								<input type="radio" name="star" value="4" id="p4">
									<label for="p4">4</label>
								<input type="radio" name="star" value="5" id="p5"> 
									<label for="p5">5</label>
								</span> 
 								<!--<output for="star-input">
									<b>0</b>점
								</output>-->
 							</span> <br>
						</div>
						
						<div class="form-group">
							<label for="message-text" class="col-form-label"><b>리뷰작성</b></label>
							<textarea class="form-control" name="msg" id="rivew-text"
								required="required" placeholder="리뷰를 남겨주세요:)"></textarea>
						</div>
					</div>
					
					<div class="modal-footer">
						<input type="submit" class="btn btn-primary" value="전송"/>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>