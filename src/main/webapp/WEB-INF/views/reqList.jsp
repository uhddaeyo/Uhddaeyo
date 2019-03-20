<%@page import="com.ktds.uhddaeyo.common.AES256Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.lang.String.*" %>
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
.h-500{height: 100% !important}
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
         <!-- 요기 div 태그 안을 바꿔주면 됩니당 -->

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
					   <a href="${pageContext.request.contextPath}/kakaoinvitelink/<%=encryptUserNo %>" class="list-group-item">초대장 모아보기</a>
               <a href="${pageContext.request.contextPath}/reqList" class="list-group-item active">나의 요청내역</a>
               <a href="${pageContext.request.contextPath}/reservationList" class="list-group-item">나의 예약내역</a> 
               <a href="${pageContext.request.contextPath}/historyList" class="list-group-item">나의 이용내역</a>
               <a href="${pageContext.request.contextPath}/reviewList" class="list-group-item">내가 남긴 리뷰</a>
            </div>
				</div>
	

			<div class="col-lg-9">
			<h2 style="margin-top: 55px;">
				<b>나의 요청 내역</b>
			</h2>
			<div class="row" style="margin-top: 40px;">

               <c:choose>
                  <c:when test="${fn:length(reqList) > 0}">
                     <c:forEach items="${reqList}" var="row" varStatus="idx">
                     
                        <div class="col-lg-4 col-md-6 mb-4" style="height: 254px;">
                           <div class="card h-500" style="height: 252px; border-color: #BDBDBD;">
                              <div class="card-body" style="width:auto; margin-top:20px;">
                                 <h4 class="card-title" style="margin-bottom:15px;">
                                    <a class="text-primary"><b>No.${idx.count}</b></a>
                                 </h4>
                                 <h5><b>요청 날짜 </b><fmt:formatDate value="${row.date }" pattern="yyyy-MM-dd HH:mm" /></h5>
                                 <c:set var="tagMsg" value="${row.tagMsg}"></c:set>
                                  <p class="card-text" style="height:70px;"><b>
                                 <%
                                 	
                                 	String[] tags = ((String) pageContext.getAttribute("tagMsg")).split("[|]");
                                 for(int i = 0; i<tags.length;i++ ){
                                	 out.println("#" + tags[i] + " ");
                                 }
                                 %></b><br /><br />
                                <b>가격대 </b>${row.price }<br />
                                <b>인원 </b>${row.memCnt }<br />
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
			

         </div>
		</div>
	</div>

	


</body>
</html>