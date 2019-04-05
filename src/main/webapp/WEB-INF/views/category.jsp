<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function clickSubmit(){
	document.form1.action='/host/tag';
    document.form1.submit();
 }
function clickCancel(){
	document.form2.action='/host/back';
    document.form2.submit();
 }
 </script>
</head>
<body>
<div class="container" align="center">
<br />
<br />
	<%@include file="header.jsp"%>

	
	<div class="card">
  <h5 class="card-header"><b>가게 정보 입력</b></h5>
  <div class="card-body">
  <form method="post" name="form1" action="/host/tag">
    <h5 class="card-title"><b>분류</b></h5>
    <p class="card-text"><c:forEach var="tag" items="${hashTagList}">
			<c:if test="${tag.category.equals('분류') }">
				<input type="radio" name="classify" value="${tag.content}" />
				<c:out value="${tag.content }" />
			</c:if>
		</c:forEach></p>
		<br />
		<h5 class="card-title"><b>방문 목적</b></h5>
    <p class="card-text"><c:forEach var="tag" items="${hashTagList}">
			<c:if test="${tag.category.equals('방문목적') }">
				<input type="checkbox" name="tag" value="${tag.content}" />
				<c:out value="${tag.content }" />
			</c:if>
		</c:forEach></p>
		<br />
		<h5 class="card-title"><b>분위기</b></h5>
    <p class="card-text"><c:forEach var="tag" items="${hashTagList}">
			<c:if test="${tag.category.equals('분위기') }">
				<input type="checkbox" name="tag" value="${tag.content}" />
				<c:out value="${tag.content }" />
			</c:if>
		</c:forEach></p>
		<br />
		<h5 class="card-title"><b>편의 시설</b></h5>
    <p class="card-text"><c:forEach var="tag" items="${hashTagList}">
			<c:if test="${tag.category.equals('편의시설') }">
				<input type="checkbox" name="tag" value="${tag.content}" />
				<c:out value="${tag.content }" />
			</c:if>
		</c:forEach></p>
		<input type="hidden" name="placeNo" value="${placeNo }" />
	</form>
<form method="post" name="form2" action="/host/back">
	<input type="hidden" name="placeNo" value="${placeNo }" />
	<input type="hidden" name="userNo" value="${userNo }" />
	</form>
	 <div class="form-group" style="text-align: center; margin-top: 70px;">
                     <button type="button" class="btn btn-outline-primary" style="margin-right: 20px; width: 20%"
                        id="CancleBtn" onclick="clickCancel();" value="Cancle">가입취소</button>
                     <button type="button" class="btn btn-primary" style="width: 20%"
                        id="submitBtn" onclick="clickSubmit();" value="Sign Up">확인</button>
                  </div>
    	</div>
    	</div>
    	</div>
    	


</body>
</html>