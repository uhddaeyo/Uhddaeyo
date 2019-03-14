<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jsp"%><!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- Bootstrap core CSS -->
<%@ include file="/WEB-INF/include/include-css.jsp"%>
</head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<body style="font-family: Noto Sans KR;">
   <%@include file="header.jsp"%>
   
   <!-- Page Content -->
   <div class="container">
      <div class="row">
      
         <%@include file="/WEB-INF/include/menu.jsp"%>
   
         <div class="col-lg-9">
      
            <h2 style="margin-top:55px;">초대 현황</h2>
            
            <div class="row" style="margin-top: 40px;">
            
               <table class="table table-hover">
               
                  <thead>
                     <tr>
                        <th scope="col" style="width:5%;text-align:center">&nbsp;</th>
                        <th scope="col" style="width:15%;text-align:center">고객명</th>
                        <th scope="col" style="width:25%;text-align:center">예약날짜/시간</th>
                        <th scope="col" style="width:25%;text-align:center">보낸 메세지</th>
                        <th scope="col" style="width:10%;text-align:center">인원</th>
                        <th scope="col" style="width:20%;text-align:center">상태</th>
                     </tr>
                  </thead>
                  
                  <tbody>
                           
                     
                     <c:choose>
                        <c:when test="${fn:length(selectInviteList) > 0}">
                           <c:forEach items="${selectInviteList}" var="invite" varStatus = "status">
                              <tr>
                                 <th scope="row" style="text-align:center;vertical-align: middle">${status.count}</th>
                                 <td style="text-align:center;vertical-align: middle">${invite.name}</td>
                                 <td style="text-align:center;vertical-align: middle">${invite.resv_date}</td>
                                 <td style="text-align:center;vertical-align: middle">${invite.message}</td>                        
                                 <td style="text-align:center;vertical-align: middle">${invite.mem_cnt}</td>
                                 <c:choose>
                                    <c:when test="${invite.isresv eq 'Y'}">
                                       <td style="text-align:center;vertical-align: middle">예약 확정</td>
                                    </c:when>
                                    <c:otherwise>
                                       <td style="text-align:center;vertical-align: middle">응답 대기</td>
                                    </c:otherwise>
                                 </c:choose>
                              </tr>
                           </c:forEach>
                        </c:when>
                        <c:otherwise>
                           <tr>
                              <td colspan = "6">점주님의 초대 내역의 없습니다.</td>
                           </tr>
                        </c:otherwise>
                     </c:choose>
                     
                  </tbody>
                  
               </table>
            </div>
            
            <div style="text-align: center;">
                  <div style="display:inline-block;">
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
                     
         </div>
      </div>
   </div>
   
   <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
      integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
      crossorigin="anonymous"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
      integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
      crossorigin="anonymous"></script>
   <script
      src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
      integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
      crossorigin="anonymous"></script>

</body>
</html>