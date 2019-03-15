<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap core CSS -->
<%@ include file="/WEB-INF/include/include-css.jsp"%>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
   $(document).ready(function() {
      $("#idck").click(function() {
         var userId = $("#id").val();
         $.ajax({
            async : true,
            type : 'POST',
            data : userId,
            cache : false,
            url : '<c:url value='/idCheck' />',
            dataType : 'json',
            contentType : 'application/json; charset=UTF-8',
            success : function(data) {
               if (data.cnt > 0) {
                  alert('아이디가 존재합니다. 다른 아이디를 입력해주세요');
                  $('#id').focus();
                  $('#submitBtn').attr("disabled", "disabled");
               } else {
                  alert('사용 가능한 아이디입니다.');
                  $('#passwd').focus();
                  // 아이디가 중복하지 않으면
                  $('#submitBtn').removeAttr("disabled");
               }
            },
            error : function(e) {
               alert('아이디를 입력하세요!');
            }
         });
      });
      
   });
   
   function clickSubmit(){
      var passwd = document.getElementById('passwd').value;
      var passwdCon = document.getElementById('passwdCon').value;
      var target = document.getElementById('age');
      if(passwd != passwdCon){
         alert('비밀번호가 일치하지 않습니다!');
         return;
      } else if(target.options[target.selectedIndex].value == '나이대 선택'){
         alert('나이를 선택하세요!');
         return;
      } else {
         document.form1.action='/guest/signUp';
         document.form1.submit();
      }
   }
</script>
</head>
<body style="font-family: Noto Sans KR;">
   <%@include file="header.jsp"%>
   <div class="container" align="center">
      <br /> <br /> <br /> <br />
      <h2>고객 회원가입</h2>
      <table width="450px" style="margin-top: 50px;">
         <tr>
            <td>
               <h4 style="margin-bottom: 40px;">기본정보</h4>
               
               <form id="form1" name="form1" method="post" class="form-signin"
                  action="/guest/signUp">
                  <div class="form-group row">
                     <label class="col-form-label"
                        style="margin-right: 82px; padding-left: 15px; padding-right: 15px;">아이디</label>
                     <div>
                        <input type="text" class="form-control" id="id" name="id"
                           placeholder="아이디를 입력하세요" required autofocus>
                     </div>
                     
                     <button type="button" id="idck" class="btn btn-outline-primary" style="margin-left:10px;">중복확인</button>
                  </div>
                  
                  <div class="form-group row">
                     <label class="col-form-label"
                        style="margin-right: 67px; padding-left: 15px; padding-right: 16px;">비밀번호</label>

                     <div style="width: 58%;">
                        <input type="password" class="form-control" id="passwd" name="passwd"
                           placeholder="비밀번호를 입력하세요" required autofocus>
                     </div>
                  </div>
                  
                  <div class="form-group row">
                     <label class="col-form-label"
                        style="margin-right: 32px; padding-left: 15px; padding-right: 23px;">비밀번호
                        확인</label>
                     <div style="width: 58%;">
                        <input type="password" class="form-control" id="passwdCon" name="passwdCon"
                           placeholder="비밀번호를 입력하세요" required autofocus>
                     </div>
                  </div>
                  
                  <div class="form-group row">
                     <label class="col-form-label"
                        style="margin-right: 100px; padding-left: 15px; padding-right: 7px;">이름</label>
                     <div style="width: 58%;">
                        <input type="text" class="form-control" id="name" name="name"
                           placeholder="이름을 입력하세요" required autofocus>
                     </div>
                  </div>
                  
                  <div class="form-group row">
                     <label class="col-form-label"
                        style="margin-right: 48px; padding-left: 15px; padding-right: 18px;">휴대폰
                        번호</label>
                     <div style="width: 58%;">
                        <input type="text" class="form-control" id="tel" name="tel"
                           placeholder="휴대폰 번호를 입력하세요" required autofocus>
                     </div>
                  </div>
                  
                  <h4 style="margin-top: 60px; margin-bottom: 40px;">추가정보(선택가능)</h4>
                  
                  <div class="form-group row">
                     <label class="col-form-label"
                        style="margin-right: 120px; padding-left: 15px; padding-right: 15px;">성별</label>

                     <div class="form-group row">
                        <div class="custom-control custom-radio"
                           style="margin-right: 80px;">
                           <input type="radio" id="customRadio1" name="gender"
                              class="custom-control-input" value="M" checked=""> <label
                              class="custom-control-label" for="customRadio1">남</label>
                        </div>
                        <div class="custom-control custom-radio">
                           <input type="radio" id="customRadio2" name="gender"
                              class="custom-control-input"  value="F"> <label
                              class="custom-control-label" for="customRadio2">여</label>
                        </div>
                     </div>
                  </div>
                  
                  <div class="form-group row">
                     <label class="col-form-label"
                        style="margin-right: 85px; padding-left: 15px; padding-right: 15px;">연령대</label>
                     <select class="form-control" id="age" style="width: 58%">
                        <option selected>나이대 선택</option>
                        <option value=10>10대</option>
                        <option value=20>20대</option>
                        <option value=30>30대</option>
                        <option value=40>40대</option>
                        <option value=50>50대</option>
                        <option value=60>60대</option>
                     </select>
                  </div>
                  
                  <div class="form-group" style="text-align: center; margin-top: 70px;">
                     <button type="button" class="btn btn-outline-primary" style="margin-right: 20px; width: 20%"
                        id="CancleBtn" onclick="location.href='/login'" value="Cancle">취소</button>
                     <button type="button" class="btn btn-primary" style="width: 20%"
                        id="submitBtn" onclick="clickSubmit();" disabled="disabled" value="Sign Up">확인</button>
                  </div>
                  <!-- <input type="button" class="btn btn-outline-primary"
                   id="submitBtn" onclick="clickSubmit();"  value="Sign Up" style="margin-right: 20px; width: 25%; height: 50px;">
                   <input type="button" class="btn btn-primary btn-lg btn-block"
                   id="CancleBtn" onclick="location.href='/login'"  value="Cancle" style="width: 25%"> -->
               </form>
               <!--  <button type="button" onclick="location.href='/login'">취소</button>-->
            </td>
         </tr>
      </table>
      <br /> <br />
   </div>
</body>
</html>