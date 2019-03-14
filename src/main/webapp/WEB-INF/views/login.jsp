<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap core CSS -->
<%@ include file="/WEB-INF/include/include-css.jsp"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script>
   $(document).ready(function() {
      $("#btnLogin").click(function() {
         var id = $("#id").val();
         var passwd = $("#passwd").val();

         if (id == "") {
            alert("아이디를 입력하세요!");
            $("#id").focus();
            return;
         }
         if (passwd == "") {
            alert("비밀번호를 입력하세요!");
            $("#passwd").focus();
            return;
         }

         document.form1.action = "${path}/loginCheck";
         document.form1.submit();
      });
   });
</script>
</head>
<body style="font-family: Noto Sans KR;">
   <%@include file="header.jsp"%>
   <div class="container">
      <div align="center">
         <br /> <br /> <br /> <br />
         <legend>로그인</legend>
         <table width="300px">
            <tr>
               <td>
                  <form name="form1" method="post" class="form-signin">
                     <div class="form-group row"></div>
                     <div class="form-group">
                        <input type="email" class="form-control" id="id" name="id"
                           aria-describedby="emailHelp" placeholder="아이디" required autofocus>
                     </div>
                     <div class="form-group">
                        <input type="password" class="form-control" id="passwd" name="passwd"
                           id="exampleInputPassword1" placeholder="비밀번호">
                     </div>
                     <button class="btn btn-primary btn-lg btn-block" type="button"
                        id="btnLogin">Sign in</button>
                  </form>
               </td>
            </tr>
         </table>
   
         <form style="margin-top:15px;" method="GET" action="/guest/signUp" id="form1">
            <button type="button" class="btn btn-outline-primary" onclick="document.getElementById('form1').submit();">고객 회원가입</button>
         </form>
         <form style="margin-top:10px;" method="GET" action="/host/signUp" id="form2">
            <button type="button" class="btn btn-outline-primary" onclick="document.getElementById('form2').submit();">점주 회원가입</button>
         </form>
         
      </div>
   </div>
   
</body>
</html>