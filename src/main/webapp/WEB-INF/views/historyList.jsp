<%@page import="com.ktds.uhddaeyo.common.AES256Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jsp"%>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Bootstrap core CSS -->
<%@ include file="/WEB-INF/include/include-css.jsp"%>
<script src="//code.jquery.com/jquery.min.js"></script>
   
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
.star-input>output{display:inline-block;width:auto; font-size:18px;text-align:right; vertical-align:middle;}
</style>

<script>
   $(document).ready(
      function() {
         $('.review').on("click", function() {
            $('div.modal').modal({
               
            });
            var popUrl = "/reviewDetail?place_no="
            + $(this).attr("id");
            var popOption = "width=350, height=450, resizeable=no, scrollbar=no, status=no";
            window.open(popUrl, "", popOption);
         })
      });
   
   function sendReview() {
      var params = $("#sendReview").serialize();
      $.ajax({
         url : '<c:url value="insertReview" />',
         data : params,
         success : function(result) {
            window.close();
         },
         error : function(error) {
            alert("Error occurs");
         }
      });
   }
/*    
   $(function(){
      $('.list-group-item').each(function() {
         $(this).click(function() {
            $(this).addClass("active");
            $(this).siblings().removeClass("active");
         });
      });
   }); */
</script>


<script src="${pageContext.request.contextPath}/resources/js/star.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
</head>
<body style="font-family: Noto Sans KR;">
   <%@include file="header.jsp"%>
   <!-- Page Content -->
   <div class="container">
      <div class="row">
         <!-- 요기 div 태그 안을 바꿔주면 됩니당 -->

         <div class="col-lg-3" style="margin-top: 40px;">
            <h1 class="my-4" align="center">MENU</h1>
            <div class="list-group">
<c:set var="userNo" value="${sessionScope.userNo}"></c:set>
         <%
										AES256Util aes256Util = new AES256Util();
										String encryptUserNo = aes256Util.encrypt(String.valueOf(pageContext.getAttribute("userNo")));
									%>
               <a href="${pageContext.request.contextPath}/kakaoinvitelink/<%=encryptUserNo %>" class="list-group-item">초대장 모아보기</a>
               <a href="${pageContext.request.contextPath}/reservationList" class="list-group-item">나의 예약내역</a> 
               <a href="${pageContext.request.contextPath}/historyList" class="list-group-item active">나의 이용내역</a>
            </div>
         </div>

         <div class="col-lg-9">

            <h2 style="margin-top: 55px;">나의 이용내역</h2>

            <!-- div row -->
            <div class="row" style="margin-top: 40px;">

               <c:choose>
                  <c:when test="${fn:length(historyList) > 0}">
                     <c:forEach items="${historyList}" var="row">
                        <div class="col-lg-4 col-md-6 mb-4" style="height: 254px;">
                           <div class="card h-100" style="height: 252px; border-color: #BDBDBD;">
                              <div class="card-body" style="width:auto; margin-top:20px;">
                                 <h4 class="card-title" style="margin-bottom:15px;">
                                    <a class="text-primary">${row.place_name}</a>
                                 </h4>
                                 <h5>${row.resv_date}</h5>
                                 <p class="card-text" style="height:70px;">${row.address}</p>
                                 <button type="button" class="btn btn-outline-primary review" id="${row.place_no}" data-toggle="modal" data-target="#myModal">리뷰작성</button>
                                 <%-- <a class="review" id="${row.place_no} href="#">리뷰작성</a>
                                  --%>
                                  
                                  <!-- modal 창 -->
                                 <div class="modal fade" id="myModal" role="dialog">
                                    <div class="modal-dialog" role="document">
                                       <div class="modal-content">
                                          <div class="modal-header">
                                             <h5 class="modal-title">Review</h5>
                                             <button type="button" class="close" data-dismiss="modal"
                                                aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                             </button>
                                          </div>
                                          <form id="sendReview">
                                          <div class="modal-body">
                                             <field style = "width:250">
                                                <input type="hidden" name="place_no" value="${placeNo}"/>
                                                <h5><small class="text-muted" style="margin-bottom:10px;">가게 이름  </small></h5>
                                                 <h5 class="text-primary"><strong>${row.place_name}</strong></h5><br>
                                                <h5><small class="text-muted">별점 평가 </small><br></h5>
                                                <span class="star-input">
                                                   <span class="input">
                                                       <input type="radio" name="star-input" value="1" id="p1">
                                                       <label for="p1">1</label>
                                                       <input type="radio" name="star-input" value="2" id="p2">
                                                       <label for="p2">2</label>
                                                       <input type="radio" name="star-input" value="3" id="p3">
                                                       <label for="p3">3</label>
                                                       <input type="radio" name="star-input" value="4" id="p4">
                                                       <label for="p4">4</label>
                                                       <input type="radio" name="star-input" value="5" id="p5">
                                                       <label for="p5">5</label>
                                                     </span>
                                                     <output for="star-input"><b>0</b>점</output>                  
                                                </span>
                                                <br>
                                                <div class="form-group" style="margin-top:30px;">
                                                   <h5><small class="text-muted" style="margin-bottom:10px;">리뷰작성 </small><br></h5>
                                                   <textarea class="form-control" id="exampleTextarea" rows="5" name="review" placeholder="리뷰를 남겨주세요:)" style=""></textarea>
                                                </div>
                                                <br><br>
                                                <!-- <input type="button" onclick="sendReview()" value="전송"/>
                                                <input type="button" onclick="self.close()" value="취소"/> -->
                                             <!-- <p>Modal body text goes here.</p> -->
                                          </div>
                                          <div class="modal-footer">
                                             <button type="button" class="btn btn-primary" onclick="sendReview()">Save</button>
                                             <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                          </div>
                                          </form>
                                       </div>
                                    </div>
                                 </div>
                                 <!-- modal 창 -->
                                 
                              </div>
                           </div>
                        </div>
                     </c:forEach>
                     
                  </c:when>
                  <c:otherwise>
                     <h3>조회된 결과가 없습니다.</h3>
                  </c:otherwise>
               </c:choose>

               <!-- div row -->

               <!-- page number -->
               <!-- <div style="text-align: center;">
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
         </div> -->
               <!-- page number -->

               <!-- /.row -->

            </div>
            <!-- /.card -->

         </div>
         <!-- /.col-lg-9 -->

      </div>

   </div>
   <!-- /.container -->

</body>
</html>