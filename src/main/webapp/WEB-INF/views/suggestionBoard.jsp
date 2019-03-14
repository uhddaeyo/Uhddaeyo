<%@page import="com.ktds.uhddaeyo.common.AES256Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<title>초대장 모아보기</title>

<script type="text/javascript">
 	function suggestionPopup(sug_no) {
		var popupWidth = 420;
		var popupHeight = 850;
		var sugUrl = "suggestion";
		
		console.log(sug_no);
		
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
<body style="font-family: Noto Sans KR;">
   <%@include file="header.jsp"%>
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
               <a href="${path}/<%=encryptUserNo %>" class="list-group-item active">초대장 모아보기</a>
               <a href="${pageContext.request.contextPath}/reservationList" class="list-group-item">나의 예약내역</a> 
               <a href="${pageContext.request.contextPath}/historyList" class="list-group-item">나의 이용내역</a>
            </div>
         </div>
         <!-- /.col-lg-3 -->

         <div class="col-lg-9">

            <h2 style="margin-top: 55px;">초대장 모아보기</h2>

            <!-- div row -->
            <div class="row" style="margin-top: 40px;">

               <c:choose>
                  <c:when test="${fn:length(suggestionList) > 0}">
                     <c:forEach items="${suggestionList}" var="suggestion">
                        <div class="col-lg-4 col-md-6 mb-4" style="height: 254px;">
                           <div class="card h-100" style="height: 252px; border-color: #BDBDBD;">
                              <div class="card-body"
                                 style="width: auto; margin-top: 20px;">
                                 <h4 class="card-title" style="margin-bottom:15px;"> <a class="text-primary"> ${suggestion.place_name} </a>
                                 </h4>
                                 <p class="card-text" style="height:90px;">${suggestion.message}</p>
                                 <button type="button" class="btn btn-outline-primary review"  id="suggest_btn"   onclick="suggestionPopup(${suggestion.sug_no})">자세히보기</button>   
                              </div>
                           </div>
                        </div>
                     </c:forEach>
                  </c:when>
                  <c:otherwise>

                     <h3>조회된 결과가 없습니다.</h3>

                  </c:otherwise>
               </c:choose>
            </div>
         </div>
      </div>
   </div>

</body>
</html>