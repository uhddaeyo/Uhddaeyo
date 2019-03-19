<%@page import="com.ktds.uhddaeyo.common.AES256Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<html>
<head>
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/include/include-header.jsp"%>
<%@ include file="/WEB-INF/include/include-css.jsp"%>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js">
</script>
<script src="http://malsup.github.com/jquery.cycle2.js">
</script>
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
            	document.getElementById("category").innerHTML="";
                document.getElementById("purpose").innerHTML="";
                document.getElementById("condition").innerHTML="";
                document.getElementById("mood").innerHTML="";
               $.each(data, function(i, f) {
                  var tmp = 0;
                  
                  if (f.category == '분류') {
                	  var s = '<input type="radio" name="tag" value="' + f.content + '" /> ' + f.content + ' ';
                     $('#category').append(s);
                  } else if (f.category == '방문목적') {
                     var s = '<input type="checkbox" name="tag" style="margin:5px;" value="' + f.content + '" /> ' + f.content + ' ';
                     $('#purpose').append(s);
                  } else if (f.category == '편의시설') {
                     var s = '<input type="checkbox" name="tag" style="margin:5px;" value="' + f.content + '" /> ' + f.content + ' ';
                     $('#condition').append(s);
                  } else {
                     var s = '<input type="checkbox" name="tag" style="margin:5px;" value="' + f.content + '" /> ' + f.content + ' ';
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
<style type="text/css">
.place_img {
	width: 328px;
	height: 187px;
}
.h-500{height: 200px !important}
</style>
</head>
<body style="font-family: Noto Sans KR;">
   <%@include file="header.jsp"%>

   <header>
      <div id="carouselExampleIndicators" class="carousel slide"
         data-ride="carousel">
         <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0"
               class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
         </ol>
         <div class="carousel-inner" role="listbox">
            <!-- Slide One - Set the background image for this slide in the line below -->
            <div class="carousel-item active"
               style="background-image: url('resources/images/table1.jpg')">
               <div class="carousel-caption d-none d-md-block">
                  <h3>
                     <b>컨셉에 맞는 식사 장소를 제안해 드립니다!</b>
                  </h3>
                  <!--  <p>This is a description for the first slide.</p>-->
               </div>
            </div>
            <div class="carousel-item"
               style="background-image: url('resources/images/table2.jpg')">
               <div class="carousel-caption d-none d-md-block">
                  <h1>
                     <b>멀리가지 말고 근처에서 회식하자!</b>
                  </h1>
                  <!--  <p>This is a description for the second slide.</p>-->
               </div>
            </div>
            <!-- Slide Three - Set the background image for this slide in the line below -->
            <div class="carousel-item"
               style="background-image: url('resources/images/table3.jpg')">
               <div class="carousel-caption d-none d-md-block">
                  <h1>
                     <b>숨겨진 맛집공간을 찾아서!</b>
                  </h1>
                  <!-- <p>This is a description for the third slide.</p>-->
               </div>
            </div>
         </div>
         <a class="carousel-control-prev" href="#carouselExampleIndicators"
            role="button" data-slide="prev"> <span
            class="carousel-control-prev-icon" aria-hidden="true"></span> <span
            class="sr-only">Previous</span>
         </a> <a class="carousel-control-next" href="#carouselExampleIndicators"
            role="button" data-slide="next"> <span
            class="carousel-control-next-icon" aria-hidden="true"></span> <span
            class="sr-only">Next</span>
         </a>
      </div>
   </header>

     <!-- Button -->
   <c:choose>
      <c:when test="${sessionScope.userType != 1 }"></c:when>
      <c:otherwise>
   <div class="container" style="margin-top:20px;">
      <div style="text-align: center; margin-top: 50px; margin-bottom: 50px;">
         <button type="button" id="reqSend" class="btn btn-primary btn-lg" style="margin-right: 50px; padding-top: 16px; width: 200px; height: 80px;"
            data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">
            <h4><b>어디가지? 고민말고<br>요청서 보내기</b></h4>
         </button>
         <c:set var="userNo" value="${sessionScope.userNo}"></c:set>
         <%
										AES256Util aes256Util = new AES256Util();
										String encryptUserNo = aes256Util.encrypt(String.valueOf(pageContext.getAttribute("userNo")));
									%>
         <button type="button" class="btn btn-outline-primary" style="width: 200px; padding-top: 16px; height: 80px;"
         
            onclick="location='${path}/kakaoinvitelink/<%=encryptUserNo %>'">
             <h4><b>My Page</b></h4></button>
      </div>
   </div>
      </c:otherwise>
   </c:choose>
   <!-- Button -->
   
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
               <form method="POST" action="/customerReq">
                  <div id="tag"></div>

                  <h5><b>정보</b></h5>
                  <!-- 지역 애매하다.. -->
                  <div class="form-group">
                     <label for="place" class="col-form-label">지역</label>
                     <input type="text" class="form-control" name="place" id="place">
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
                  
                  <h5 style="margin-top:10px; margin-bottom:15px;"><b>분류</b></h5>
                  <div class="form-group" id="category">
                  </div>

                  <h5 style="margin-top:10px; margin-bottom:15px;"><b>방문 목적</b></h5>
                  <div class="form-group" id="purpose">
                  </div>

                  <h5 style="margin-top:10px; margin-bottom:15px;"><b>분위기</b></h5>
                  <div class="form-group" id="mood">
                  </div>
                  
                  <h5 style="margin-top:10px; margin-bottom:15px;"><b>편의 시설</b></h5>
                  <div class="form-group" id="condition">
                  </div>

                  <input type="hidden" name="placeNo" value="${placeNo }" />
                  <div class="modal-footer">
                     <button type="button" class="btn btn-secondary"
                        data-dismiss="modal">취소</button>
                     <button type="submit" class="btn btn-primary">확인</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>

   <!-- Page Content -->
   <div class="container" style="margin-top:45px;">

      <h2 class="my-4" align="center">
         <b>오늘의 추천맛집</b>
      </h2>


      <!-- Marketing Icons Section -->
      <div class="row">
      <c:forEach items="${placeList}" var="place" varStatus="idx">
         <div class="col-lg-4 col-sm-6 portfolio-item">
            <div class="card h-100">
            
            <div class="cycle-slideshow" data-cycle-fx=scrollHorz data-cycle-timeout=1000>
            <c:forEach items="${picList }" var="pic">
            
               <c:if test="${pic.place_no eq place.placeNo }">
			<img width="328" height="187" class="place_img" alt="No Image" 
			src="${pageContext.request.contextPath}/resources/placeImages/${pic.photo_name }" />

			</c:if>
			
			</c:forEach>
			</div>
			
               <div class="card-body">
                  <h4 class="card-title">
                    <b><font color="#D9230F">${place.placeName }</font></b>
                     <c:choose>
                     	<c:when test="${place.star eq 5 }">
                     		<c:out value="🌟🌟🌟🌟🌟" />
                     	</c:when>
                     	<c:when test="${place.star eq 4 }">
                     		<c:out value="🌟🌟🌟🌟" />
                     	</c:when>
                     	<c:when test="${place.star eq 3 }">
                     		<c:out value="🌟🌟🌟" />
                     	</c:when>
                     	<c:when test="${place.star eq 2 }">
                     		<c:out value="🌟🌟"/>
                     	</c:when>
                     	<c:otherwise>
                     		<c:out value="🌟"/>
                     	</c:otherwise>
                     </c:choose>
                   
                  </h4>
                  <p class="card-text">
                     <i><b>
                     <c:forEach items="${hashList}" var="hash" varStatus="idx">
                     	<c:if test="${hash.place_no eq place.placeNo }">
                     		<c:out value="#${hash.tag_contents }" />
                     	</c:if>
                     </c:forEach></b> <br>
                     <br></i> ${place.placeExp }  <br><b>영업시간</b>
                     ${place.startTime } ~ ${place.endTime }<br><b>주소</b>&nbsp;${place.address }
                  </p>

               </div>
            </div>
            
         </div>
         </c:forEach>

         </div>
         <!-- /.row -->
         <!-- Portfolio Section -->
         <h2 class="my-4" align="center">
            <b>리뷰 ZONE</b>
         </h2>

         <div class="row">
         <c:forEach items="${reviewList}" var="row">
            <div class="col-lg-4 col-sm-6 portfolio-item">
               <div class="card h-500">
                  <div class="card-body">
                     <h4 class="card-title">
                       <b><font color="#D9230F">${row.place_name }</font></b>
                     
                     <c:choose>
                     	<c:when test="${row.star eq 5 }">
                     		<c:out value="🌟🌟🌟🌟🌟" />
                     	</c:when>
                     	<c:when test="${row.star eq 4 }">
                     		<c:out value="🌟🌟🌟🌟" />
                     	</c:when>
                     	<c:when test="${row.star eq 3 }">
                     		<c:out value="🌟🌟🌟" />
                     	</c:when>
                     	<c:when test="${row.star eq 2 }">
                     		<c:out value="🌟🌟"/>
                     	</c:when>
                     	<c:otherwise>
                     		<c:out value="🌟"/>
                     	</c:otherwise>
                     </c:choose>
                     <div align="right">
                     <br />
                     <h6>
                     <c:choose>
                     <c:when test="${row.gender eq 'F' }">
                     		<c:out value="${row.age }대 여"/>
                     	</c:when>
                     	<c:otherwise>
                     		<c:out value="${row.age }대 남"/>
                     	</c:otherwise>
                     </c:choose>
                     </h6>
                     </div>
                     </h4>
                     <br />
                     <p class="card-text">${row.review }</p>
                  </div>
               </div>
            </div>
            </c:forEach>
            
         <!-- /.row -->
      
      <hr>
</div>
      <!-- Call to Action Section -->
      <div class="row mb-4">
         <div class="col-md-8">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
               Molestias, expedita, saepe, vero rerum deleniti beatae veniam harum
               neque nemo praesentium cum alias asperiores commodi.</p>
         </div>
         <div class="col-md-4">
            <a class="btn btn-lg btn-secondary btn-block" href="#">Call to
               Action</a>
         </div>
      </div>
   </div>
   <!-- /.container -->

      <!-- Footer -->
      <footer class="py-5 bg-dark">
         <div class="container">
            <p class="m-0 text-center text-white">Copyright &copy; UH DDAE
               YO 2019</p>
         </div>
      </footer>


</body>
</html>