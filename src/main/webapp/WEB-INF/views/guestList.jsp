<%@page import="com.ktds.uhddaeyo.common.AES256Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-header.jsp"%>
<%@ include file="/WEB-INF/include/include-css.jsp"%>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
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
function inviteClick(e){
	var n = e.id;
	$.ajax({
		type : 'POST',
		cache : false,
		url : '/invitation',
		dataType : 'json',
		contentType : 'application/json; charset=UTF-8',
		success : function(data){
			document.getElementById('name').innerHTML="";
			document.getElementById('tags').innerHTML="";
			$.each(data, function(i, f){
				if(i == 0){
					$('#name').append(f);
				} else {
					var s = '#' + f + ' ';
					$('#tags').append(s);
				}
			});
		
			var name = '<input type="hidden" name="info" value="' + n + '" />';
			$('#name').append(name);
		},
		error : function(e){
			alert(e);
		}
	});
}
function kakaoLink(e) {
	var userId = e.id;
	var url = "kakaoinvitelink/" + userId;
	
	Kakao.Link.sendCustom({
		templateId : 15212,
		templateArgs : {
			'des' : '제안서 보기를 클릭해서 도착한 제안서를 확인해보세요!',
			'title' : '고객님 여기 어때요?',
			'btn' : '제안서 보기',
			'url' : url,
		}
	});
}
</script>
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp"%>
<div class="container">
      <div class="row">
   
      <%@include file="/WEB-INF/include/menu.jsp"%>
      
      <div class="col-lg-9">
   
      <h2 style="margin-top:55px;">고객 현황</h2>
      
      <div class="row" style="margin-top: 40px;">
      
      <table class="table table-hover">
         <thead>
            <tr>
               <th scope="col" style="width:5%;text-align:center"></th>
               <th scope="col" style="width:15%;text-align:center">고객명</th>
               <th scope="col" style="width:25%;text-align:center">예약날짜/시간</th>
               <th scope="col" style="width:10%;text-align:center">인원</th>
               <th scope="col" style="width:25%;text-align:center"></th>
               <th scope="col" style="width:10%;text-align:center"></th>
            </tr>
         </thead>

						    <tbody>
            <c:choose>
               <c:when test="${fn:length(guestList) > 0}">

								<c:forEach items="${guestList}" var="guest" varStatus="idx">
									<c:set var="userNo" value="${guest.userNo }"></c:set>
									<%
										AES256Util aes256Util = new AES256Util();
										String encryptUserNo = aes256Util.encrypt(String.valueOf(pageContext.getAttribute("userNo")));
									%>
									<tr align="center">
										  <td width="50" style="vertical-align: middle;">${idx.count}</td>
                        <td width="100" style="vertical-align: middle">${guest.userName }</td>
                        <td width="200" style="vertical-align: middle"><fmt:formatDate
                                       value="${guest.date }" pattern="yyyy-MM-dd HH:mm" /></td>
                        <td style="vertical-align: middle">${guest.memCnt }</td>
										<td style="vertical-align: middle"><button type="button" class="btn btn btn-outline-primary" data-toggle="modal" 
										data-target="#exampleModal" onclick="inviteClick(this);" id="${guest.date },${guest.userNo},${guest.reqNo}">초대장 작성하기</button></td>
										<td style="vertical-align: middle"><button type="button"
												onclick="kakaoLink(this);" name="${guest.userName }"
												id=<%=encryptUserNo %> class="btn btn btn-outline-primary">알림</button></td>
										
							     </tr>
                  </c:forEach>
               </c:when>
               <c:otherwise>
                  <tr>
                     <td>조회된 결과가 없습니다!</td>
                  </tr>
         </c:otherwise>
            </c:choose>
         </tbody>
      
      </table>
      </div>
      </div>
      </div>
   </div>
   

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">초대장 보내기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="/invite" method="post">
      <div class="modal-body">

          <div class="form-group">
            <label for="name" class="col-form-label"><b>가게 이름</b></label>
            <div id="name">
            </div>
            <label for="tags" class="col-form-label"><b>매장 정보</b></label>
            <div id="tags">
            </div>
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label"><b>메세지</b></label>
            <textarea class="form-control" name="msg" id="message-text" required="required"></textarea>
          </div>
          </div>
                <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <input type="submit" class="btn btn-primary" value="전송" />
      </div>
          </form>
      </div>
    </div>
  </div>
   <script type='text/javascript'>
      Kakao.init('cd1e5dbbd5ca1a96ec393c7c7518dee7');
   </script>
</body>
