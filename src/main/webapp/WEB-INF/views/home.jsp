<%@page import="com.ktds.uhddaeyo.common.AES256Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap core CSS -->
<%@ include file="/WEB-INF/include/include-css.jsp"%>

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
                  <h3>
                     <b>멀리가지 말고 근처에서 회식하자!</b>
                  </h3>
                  <!--  <p>This is a description for the second slide.</p>-->
               </div>
            </div>
            <!-- Slide Three - Set the background image for this slide in the line below -->
            <div class="carousel-item"
               style="background-image: url('resources/images/table3.jpg')">
               <div class="carousel-caption d-none d-md-block">
                  <h3>
                     <b>숨겨진 맛집공간을 찾아서!</b>
                  </h3>
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
   <div class="container" style="margin-top:20px;">
      <div style="text-align: center; margin-top: 50px; margin-bottom: 50px;">
         <button type="button" id="reqSend" class="btn btn-primary btn-lg" style="margin-right: 50px; width: 200px; height: 80px;"
            data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">
            어디가지? 고민말고<br>요청서 보내기
         </button>
         <c:set var="userNo" value="${sessionScope.userNo}"></c:set>
         <%
										AES256Util aes256Util = new AES256Util();
										String encryptUserNo = aes256Util.encrypt(String.valueOf(pageContext.getAttribute("userNo")));
									%>
         <button type="button" class="btn btn-outline-primary" style="width: 200px; height: 80px;"
         
            onclick="location='${path}/<%=encryptUserNo %>'">
            My Page</button>
      </div>
   </div>
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
         <div class="col-lg-4 col-sm-6 portfolio-item">
            <div class="card h-100">
               <a href="#"><img class="card-img-top"
                  src="resources/images/table4.jpg" alt=""></a>
               <div class="card-body">
                  <h4 class="card-title">
                     <a href="#">우마이돈</a>
                  </h4>
                  <p class="card-text">
                     <i><b>#점심 #만원이내 #가성비</b> <br>
                     <br></i> 방배 맛집 Top 1.<br> 돈까스가 맛있는 일식집 우마이돈 <br>영업시간
                     11:00AM ~ 24:00AM<br>서초구 서초동1489-1 B1층
                  </p>

               </div>
            </div>
         </div>
         <div class="col-lg-4 col-sm-6 portfolio-item">
            <div class="card h-100">
               <a href="#"><img class="card-img-top"
                  src="resources/images/table5.jpg" alt=""></a>
               <div class="card-body">
                  <h4 class="card-title">
                     <a href="#">둘둘치킨</a>
                  </h4>
                  <p class="card-text">
                     <i><b>#푸짐한 #회식 #주차가능</b><br>
                     <br></i> 퇴근후 치맥 한잔하기 좋은 곳 <br>영업시간 15:00AM ~ 23:00PM<br>서초구
                     방배동 935-40
                  </p>
               </div>
            </div>
         </div>
         <div class="col-lg-4 col-sm-6 portfolio-item">
            <div class="card h-100">
               <a href="#"><img class="card-img-top"
                  src="resources/images/table6.jpg" alt=""></a>
               <div class="card-body">
                  <h4 class="card-title">
                     <a href="#">아빠는 요리사</a>
                  </h4>
                  <p class="card-text">
                     <i><b>#가성비좋은 #저렴한</b><br>
                     <br></i> 즉석떡볶이 맛집 <br>영업시간 11:00AM ~ 20:00PM<br>서초구
                     방배동 1001-35
                  </p>
               </div>
            </div>
         </div>
         </div>
         <!-- /.row -->

         <!-- Portfolio Section -->
         <h2 class="my-4" align="center">
            <b>리뷰 ZONE</b>
         </h2>

         <div class="row">
            <div class="col-lg-4 col-sm-6 portfolio-item">
               <div class="card h-100">
                  <a href="#"><img class="card-img-top"
                     src="http://placehold.it/700x400" alt=""></a>
                  <div class="card-body">
                     <h4 class="card-title">
                        <a href="#">Project One</a>
                     </h4>
                     <p class="card-text">Lorem ipsum dolor sit amet, consectetur
                        adipisicing elit. Amet numquam aspernatur eum quasi sapiente
                        nesciunt? Voluptatibus sit, repellat sequi itaque deserunt,
                        dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
                  </div>
               </div>
            </div>
            <div class="col-lg-4 col-sm-6 portfolio-item">
               <div class="card h-100">
                  <a href="#"><img class="card-img-top"
                     src="http://placehold.it/700x400" alt=""></a>
                  <div class="card-body">
                     <h4 class="card-title">
                        <a href="#">Project Two</a>
                     </h4>
                     <p class="card-text">Lorem ipsum dolor sit amet, consectetur
                        adipiscing elit. Nam viverra euismod odio, gravida pellentesque
                        urna varius vitae.</p>
                  </div>
               </div>
            </div>
            <div class="col-lg-4 col-sm-6 portfolio-item">
               <div class="card h-100">
                  <a href="#"><img class="card-img-top"
                     src="http://placehold.it/700x400" alt=""></a>
                  <div class="card-body">
                     <h4 class="card-title">
                        <a href="#">Project Three</a>
                     </h4>
                     <p class="card-text">Lorem ipsum dolor sit amet, consectetur
                        adipisicing elit. Quos quisquam, error quod sed cumque, odio
                        distinctio velit nostrum temporibus necessitatibus et facere
                        atque iure perspiciatis mollitia recusandae vero vel quam!</p>
                  </div>
               </div>
            </div>
            <div class="col-lg-4 col-sm-6 portfolio-item">
               <div class="card h-100">
                  <a href="#"><img class="card-img-top"
                     src="http://placehold.it/700x400" alt=""></a>
                  <div class="card-body">
                     <h4 class="card-title">
                        <a href="#">Project Four</a>
                     </h4>
                     <p class="card-text">Lorem ipsum dolor sit amet, consectetur
                        adipiscing elit. Nam viverra euismod odio, gravida pellentesque
                        urna varius vitae.</p>
                  </div>
               </div>
            </div>
            <div class="col-lg-4 col-sm-6 portfolio-item">
               <div class="card h-100">
                  <a href="#"><img class="card-img-top"
                     src="http://placehold.it/700x400" alt=""></a>
                  <div class="card-body">
                     <h4 class="card-title">
                        <a href="#">Project Five</a>
                     </h4>
                     <p class="card-text">Lorem ipsum dolor sit amet, consectetur
                        adipiscing elit. Nam viverra euismod odio, gravida pellentesque
                        urna varius vitae.</p>
                  </div>
               </div>
            </div>
            <div class="col-lg-4 col-sm-6 portfolio-item">
               <div class="card h-100">
                  <a href="#"><img class="card-img-top"
                     src="http://placehold.it/700x400" alt=""></a>
                  <div class="card-body">
                     <h4 class="card-title">
                        <a href="#">Project Six</a>
                     </h4>
                     <p class="card-text">Lorem ipsum dolor sit amet, consectetur
                        adipisicing elit. Itaque earum nostrum suscipit ducimus nihil
                        provident, perferendis rem illo, voluptate atque, sit eius in
                        voluptates, nemo repellat fugiat excepturi! Nemo, esse.</p>
                  </div>
               </div>
            </div>
         </div>
         <!-- /.row -->
      
      <hr>

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