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
	   var userNo = "<%=session.getAttribute("userNo") %>"
      $('#exampleModal').on('show.bs.modal', function(event) {
    	  if(userNo == 'null'){
    		  alert('로그인이 필요한 서비스입니다!');
    		  window.location.href="/login";
    	  } else{
    		  var button = $(event.relatedTarget) // Button that triggered the modal
    	         var recipient = button.data('whatever') // Extract info from data-* attributes
    	         var modal = $(this)
    	  }
         
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
                  // 창열기  
                     function openWin( winName ) {  
                        var blnCookie    = getCookie( winName );  
                        var obj = eval( "window." + winName );  
                        if( !blnCookie ) {  
                            obj.style.display = "block";  
                        }  
                     }  
                       
                     // 창닫기  
                     function closeWin(winName, expiredays) {   
                        setCookie( winName, "done" , expiredays);   
                        var obj = eval( "window." + winName );  
                        obj.style.display = "none";  
                     }  
                     function closeWinAt00(winName, expiredays) {   
                        setCookieAt00( winName, "done" , expiredays);   
                        var obj = eval( "window." + winName );  
                        obj.style.display = "none";  
                     }  
                       
                     // 쿠키 가져오기  
                     function getCookie( name ) {  
                        var nameOfCookie = name + "=";  
                        var x = 0;  
                        while ( x <= document.cookie.length )  
                        {  
                            var y = (x+nameOfCookie.length);  
                            if ( document.cookie.substring( x, y ) == nameOfCookie ) {  
                                if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )  
                                    endOfCookie = document.cookie.length;  
                                return unescape( document.cookie.substring( y, endOfCookie ) );  
                            }  
                            x = document.cookie.indexOf( " ", x ) + 1;  
                            if ( x == 0 )  
                                break;  
                        }  
                        return "";  
                     }  
                       
                       
                     // 24시간 기준 쿠키 설정하기  
                     // expiredays 후의 클릭한 시간까지 쿠키 설정  
                     function setCookie( name, value, expiredays ) {   
                        var todayDate = new Date();   
                        todayDate.setDate( todayDate.getDate() + expiredays );   
                        document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"   
                     }  
                       
                     // 00:00 시 기준 쿠키 설정하기  
                     // expiredays 의 새벽  00:00:00 까지 쿠키 설정  
                     function setCookieAt00( name, value, expiredays ) {   
                         var todayDate = new Date();   
                         todayDate = new Date(parseInt(todayDate.getTime() / 86400000) * 86400000 + 54000000);  
                         if ( todayDate > new Date() )  
                         {  
                         expiredays = expiredays - 1;  
                         }  
                         todayDate.setDate( todayDate.getDate() + expiredays );   
                          document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"   
                       }  



</script>
<style type="text/css">
.place_img {
	width: 328px;
	height: 187px;
}
.h-500{height: 200px !important}
#pop{
  width:300px; height:400px; background:#3d3d3d; color:#fff; 
  position:absolute; top:10px; left:100px; text-align:center; 
  border:2px solid #000;
   }
.close div{float:left; text-align:right;}
 #check{font-size:12px; font-family:'돋움'; padding-left:70px;}
 #close{font-size:13px; padding:5px; font-weight:bold;}
 #video { 
     position: absolute;
     top: 0px;
     left: 0px;
     min-width: 100%;
     min-height: 100%;
     width: auto;
     height: auto;
     z-index: -1;
     overflow: hidden;
}

</style>
</head>
<body style="font-family: Noto Sans KR;">
   <%@include file="header.jsp"%>

   <header>
    <div style="width:100%;height:500px;position:relative;top:0;bottom:0;">
    <div align="center">

<div align="center" style="position: relative;align:center; top: 120px;"><img width="540px" height="175px" src="${pageContext.request.contextPath}/resources/images/main_text.png"></img>

</div>

<c:choose>
						<c:when test="${sessionScope.userType eq 2 }">
						
						</c:when>
						<c:otherwise>
				<button name="test2" id="reqSend" class="btn btn-outline-light" type="button" 
     data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo" 
    style="padding-top:13px;width:200px;height:70px;cursor:hand;position:relative;top:200px;z-index:100">
    <h4><b>내가 원하는 그곳은?</b></h4>
    </button>
			</c:otherwise>
			</c:choose>
    </div>
   <video id="video" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
      <source src="${pageContext.request.contextPath}/resources/images/main_video.mp4">
</video>
</div>
   </header>
<section style="background-color:#FCFCFC;">

   <!-- Button -->
   
   <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLabel"><b>의뢰서(맞춤 맛집 찾기)</b></h5>
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
<br />
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
<%-- <div id="div_laypopup" align="center" style="border-width:0px;Z-INDEX: 201; POSITION: absolute;left:100px; top:100px;">  
    <span><img width="400px" height="320px" src="${pageContext.request.contextPath}/resources/images/ad.png" /><br/>
    <input type="checkbox" name="close" value="OK" onclick="javascript:closeWin('div_laypopup', 1);"/>
    <font color="white">닫기</font>
    </span> 
 </div>  
   
 <script type="text/javascript">  

    openWin('div_laypopup');  
 
 </script>   --%>

      <!-- Call to Action Section -->
   </div>
   </section>
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