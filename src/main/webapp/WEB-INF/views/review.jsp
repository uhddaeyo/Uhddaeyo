<%@page import="com.ktds.uhddaeyo.common.AES256Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<style> textarea.autosize { min-height: 50px; } </style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>

<script type="text/javascript">

   var reply_form;
   
   function doDisplay(review_no,reply_no){
       var con = document.getElementById("reply_tr"+review_no);
       
       if(con.style.display=='none'){
           con.style.display = 'block';
       }
       
        reply_form = document.getElementById("reply"+review_no);
        reply_form.value="";
        reply_form.removeAttribute("readonly");
        reply_form.focus();
        return;
   }
   
   function setReply(reply_no, review_no) {
      
      reply = reply_form.value;
      if (reply == "") {
         alert("답글을 입력해 주세요.");
         return ;
      }
      
      $.ajax({
         type: "POST",
         url: "setReply",
         data : {reply_no : reply_no,
            review_no : review_no,
            reply : reply,
            },
         success: function(result) {
            alert("등록에 성공했습니다.");
          
            var set_reply_button = document.getElementById("set_reply_button");
            document.getElementById("reply"+review_no).setAttribute("readonly", "readonly");
            
         },
         error: function(e) {
            alert("등록에 실패했습니다.");
         }
      });
      
   }
   
   function press() {
      if (window.event.keyCode == 13) {
         console.log("clicked");
         $('#set_reply_button').trigger('click');
      }
   }
   
   function resize(obj) {
      obj.style.height = "1px";
      obj.style.height = (12+obj.scrollHeight)+"px";
    }
   
 </script>
<%@ include file="/WEB-INF/include/include-header.jsp"%>

<meta charset="UTF-8">

<!-- Bootstrap core CSS -->
<%@ include file="/WEB-INF/include/include-css.jsp"%>

</head>
<body>
  <%@include file="header.jsp"%>
   <!-- Page Content -->
   <div class="container">
      <div class="row">
       
		<div class="list-group" style="text-align: center; margin-top: 30px;">
			<c:set var="userNo" value="${sessionScope.userNo}"></c:set>
   			<%
				AES256Util aes256Util = new AES256Util();
				String encryptUserNo = aes256Util.encrypt(String.valueOf(pageContext.getAttribute("userNo")));
			%>
		   <a href="${pageContext.request.contextPath}/kakaoinvitelink/<%=encryptUserNo %>" class="list-group-item">초대장 모아보기</a>
		   <a href="${pageContext.request.contextPath}/reqList" class="list-group-item">나의 요청내역</a> 
	             <a href="${pageContext.request.contextPath}/reservationList" class="list-group-item">나의 예약내역</a> 
	             <a href="${pageContext.request.contextPath}/historyList" class="list-group-item">나의 이용내역</a>
	             <a href="${pageContext.request.contextPath}/reviewList" class="list-group-item active">내가 남긴리뷰</a>
       	</div>


         <div class="col-lg-9">
            <h2 style="margin-top: 55px;">가게 리뷰</h2>
            <div class="row" style="margin-top: 40px;">
               <c:choose>
                  <c:when test="${fn:length(reviews) > 0}">
                    <c:forEach items="${reviews }" var="review">
                    
                   <div class="card bg-secondary mb-3" style="width: 100%;">
                      <div class="card-body" style="margin-top:20px;margin-left:10px">   
                       
                  
                       <h5>${review.id}
                           <small class="text-muted">(${review.age}, <c:choose>
                                 <c:when test="${review.gender=='F'}">여</c:when>
                                 <c:otherwise>남</c:otherwise>
                              </c:choose>)
                           </small>
                        </h5>
                                 
                        <div style="margin-top:15px;margin-bottom:20px">
                           

                     <c:choose>
                        <c:when test="${review.star eq 5 }">
                           <div style>
                              <img src="resources/images/star.png" width="30" height="30"/>
                              <img src="resources/images/star.png" width="30" height="30"/>
                              <img src="resources/images/star.png" width="30" height="30"/>
                              <img src="resources/images/star.png" width="30" height="30"/>
                              <img src="resources/images/star.png" width="30" height="30"/>
                              
                           </div>
                        </c:when>
                        <c:when test="${review.star eq 4 }">
                           <div>
                              <img src="resources/images/star.png" width="30" height="30"/>
                              <img src="resources/images/star.png" width="30" height="30"/>
                              <img src="resources/images/star.png" width="30" height="30"/>
                              <img src="resources/images/star.png" width="30" height="30"/>
                           </div>
                        </c:when>
                        <c:when test="${review.star eq 3 }">
                           <div>
                              <img src="resources/images/star.png" width="30" height="30"/>
                              <img src="resources/images/star.png" width="30" height="30"/>
                              <img src="resources/images/star.png" width="30" height="30"/>
                           </div>
                        </c:when>
                        <c:when test="${reivew.star eq 2 }">
                           <div>
                              <img src="resources/images/star.png" width="30" height="30"/>
                              <img src="resources/images/star.png" width="30" height="30"/>
                           </div>
                        </c:when>
                        <c:otherwise>
                           <div>
                              <img src="resources/images/star.png" width="30" height="30"/>
                           </div>
                        </c:otherwise>
                     </c:choose>

                     
                     <h5><small class="text-muted">(<b>${review.star}</b> / 5)</small></h5>                  
                  

                  </div>
                        
                        
                        <p class="lead" >${review.review}</p>
                          
                          <c:choose>
                             <c:when test="${fn:length(review.reply) >0}">
                          
                                <a id="review_reply${review.review_no}" href="javascript:doDisplay(${review.review_no},${review.reply_no});" >답글수정</a> 
                                <div id="reply_tr${review.review_no}" style="display:block">
                          
                                    <hr class="my-4">
                                    <h5 style="margin-bottom:20px"><b>> 답글</b></h5>
                                    <div style="margin-left:15px;margin-right:15px">
                                    
                                     
                                       <textarea class="form-control" id="reply${review.review_no}" readonly="readonly" 
                                          onkeydown="resize(this);" onkeyup="press(); resize(this);" style="background-color:transparent;width:85%;float:left">${review.reply}</textarea>
                        
                                       <div style="text-align:right; margin-top:5px">
                                         <button class="btn btn-primary" id="set_reply_button${review.review_no}" value="등록하기" onclick="setReply(${review.reply_no},${review.review_no})">등록하기</button>
                                      
                                    </div>
                                 </div>
                                 </div>
                           
                   
                             </c:when>
                           
                              <c:otherwise>
                              
                                 <a id="review_reply${review.review_no}" href="javascript:doDisplay(${review.review_no},${review.reply_no});" >답글달기</a>                                                     
                                <div id="reply_tr${review.review_no}" style="display:none">
                          
                                    <hr class="my-4">
                                    <h5 style="margin-bottom:20px"><b>> 답글</b></h5>
                                    <div style="margin-left:15px;margin-right:15px">
                                          
                                       
                                       <textarea class="form-control" id="reply${review.review_no}" readonly="readonly" 
                                       onkeydown="resize(this);" onkeyup="press(); resize(this);" style="background-color:transparent;width:85%;float:left">${review.reply}</textarea>
                                    
                                       <div style="text-align:right; margin-top:5px">
                                         <button class="btn btn-primary" id="set_reply_button${review.review_no}" value="등록하기" 
                                            onclick="setReply(${review.reply_no},${review.review_no})">등록하기</button>
                                   </div>
                                 </div>
                                 </div>
                           </c:otherwise>
                        </c:choose>
                           
                        </div>
                     </div>
                     
                     </c:forEach>
                     </c:when>
                     <c:otherwise>등록된 리뷰가 없습니다.</c:otherwise>
                  </c:choose>
                  </div>
                  </div>
                  </div>
                  </div>
</body>
</html>