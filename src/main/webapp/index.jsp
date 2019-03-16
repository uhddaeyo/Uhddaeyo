<%@page import="com.ktds.uhddaeyo.common.AES256Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/include/include-header.jsp"%>
<title>어때요? :: UH DDAE YO</title>
</head>

<body>

   <%@ include file="WEB-INF/views/header.jsp"%>

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
   <c:choose>
      <c:when test="${sessionScope.userType != 1 }"></c:when>
      <c:otherwise>
         <div class="container" style="margin-top:20px;">
            <div
               style="text-align: center; margin-top: 50px; margin-bottom: 50px;">
               <button type="button" class="btn btn-primary btn-lg"
                  style="margin-right: 50px; width: 200px; height: 80px;">
                  어디가지? 고민말고<br>요청서 보내기
               </button>
               <%-- <a href = "${pageContext.request.contextPath}/historyList">나의 내역보기</a> --%>
               <c:set var="userNo" value="${sessionScope.userNo}"></c:set>
         <%
										AES256Util aes256Util = new AES256Util();
										String encryptUserNo = aes256Util.encrypt(String.valueOf(pageContext.getAttribute("userNo")));
									%>
               <button type="button" class="btn btn-outline-primary"
                  style="width: 200px; height: 80px;"
                  onclick="location='${path}/<%=encryptUserNo %>'">My
                  Page</button>
            </div>
         </div>
      </c:otherwise>
   </c:choose>

   <!-- Button -->


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
