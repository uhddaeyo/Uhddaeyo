<%@page import="com.ktds.uhddaeyo.common.AES256Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jsp"%>
<%@ include file="/WEB-INF/include/include-css.jsp"%>
<title>초대장 모아보기</title>

<script type="text/javascript">
 	function suggestionPopup(sug_no) {
		var url = "/suggestionDetail";
		console.log(sug_no);
		
		var form = document.createElement("form");
		form.setAttribute("charset", "UTF-8");
		form.setAttribute("method", "Post");
		form.setAttribute("action", url);
    
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "sug_no");
		hiddenField.setAttribute("value", sug_no);
		form.appendChild(hiddenField);
		document.body.appendChild(form);
		form.submit();
	}
 	
 	var latitude = '';
 	var longitude = '';
 	
 	navigator.geolocation.getCurrentPosition(function(pos) {
 	    latitude = pos.coords.latitude;
 	    longitude = pos.coords.longitude;
 	});
 	
 	
 	
 	function sortByDic(){
 		console.log(latitude);
 	 	console.log(longitude);
 	$.ajax({
 		url : "/sortByDistance",
 		type : 'POST',
 		async : false,
 		data : {
 			latitude : latitude,
 			longitude : longitude,
 		},
 		success : function(data){
 			document.getElementById('cardPart').innerHTML="";
 			$.each(data, function(i, f){ 
 				var s = '<div class="col-lg-4 col-md-6 mb-4" style="height: 254px;"><div class="card h-500"' +
						'style="height: 252px; border-color: #BDBDBD;"><div class="card-body" style="width: auto; margin-top: 20px;">' +
							'<h4 class="card-title" style="margin-bottom: 15px;"><a class="text-primary"><b>'
							+ f.place_name + '</b></a></h4><p class="card-text" style="height: 90px;">'
							+ '<b>초대 메세지</b><br />'
							+ f.message + '<br /><br />현재 내 위치로 부터 약 <b><font color="#D9230F">'+ f.distance.toFixed(2) +
							'</font></b>km</p><button type="button" class="btn btn-outline-primary review" id="suggest_btn"'
							+ 'onclick="suggestionPopup(' + f.sug_no + ')">자세히보기</button></div></div></div>';
							

				$('#cardPart').append(s);			
								
 			});
 		},
         error: function(e) {
            alert("등록에 실패했습니다.");
         } 
 	});
 	}
 </script>
<style>
.h-500 {
	height: 100% !important
}
</style>
</head>
<body style="font-family: Noto Sans KR;">
	<%@include file="header.jsp"%>
	<div class="container">
		<div class="row">
			<!-- 요기 div 태그 안을 바꿔주면 됩니당 -->

			<div class="col-lg-2" style="margin-top: 45px; margin-right: 30px">
				<div class="site-logo" style="font-family: Segoe Scrip;"
					align="center">
					<img class="menu-logo" src="${path }/resources/logoImage/menu1.jpg"
						width="130" height="50" />
				</div>
				<div class="list-group"
					style="text-align: center; margin-top: 30px;">
					<c:set var="userNo" value="${sessionScope.userNo}"></c:set>
					<%
						AES256Util aes256Util = new AES256Util();
						String encryptUserNo = aes256Util.encrypt(String.valueOf(pageContext.getAttribute("userNo")));
					%>
					<a
						href="${pageContext.request.contextPath}/kakaoinvitelink/<%=encryptUserNo %>"
						class="list-group-item active">초대장 모아보기</a> <a
						href="${pageContext.request.contextPath}/reqList"
						class="list-group-item">나의 요청내역</a> <a
						href="${pageContext.request.contextPath}/reservationList"
						class="list-group-item">나의 예약내역</a> <a
						href="${pageContext.request.contextPath}/historyList"
						class="list-group-item">나의 이용내역</a> <a
						href="${pageContext.request.contextPath}/reviewList"
						class="list-group-item">내가 남긴리뷰</a>
				</div>
			</div>


			<div class="col-lg-9">
				<h2 style="margin-top: 55px;margin-bottom: 10px"><b>초대장 모아보기</b></h2>
<div align="right" >
<button type="button" class="btn btn-primary review" id="sortBtn" onclick="sortByDic();">거리순으로 보기</button></div>
				<!-- div row -->
				<div id="cardPart" class="row" style="margin-top: 40px;">

					<c:choose>
						<c:when test="${fn:length(suggestionList) > 0}">
							<c:forEach items="${suggestionList}" var="suggestion">
								<div class="col-lg-4 col-md-6 mb-4" style="height: 254px;">
									<div class="card h-500"
										style="height: 252px; border-color: #BDBDBD;">
										<div class="card-body" style="width: auto; margin-top: 20px;">
											<h4 class="card-title" style="margin-bottom: 15px;">
												<a class="text-primary"><b> ${suggestion.place_name}</b>
												</a>
											</h4>
											
											<p class="card-text" style="height: 90px;"><b>초대 메세지</b><br />${suggestion.message}</p>
											<button type="button" class="btn btn-outline-primary review"
												id="suggest_btn"
												onclick="suggestionPopup(${suggestion.sug_no})">자세히보기</button>
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