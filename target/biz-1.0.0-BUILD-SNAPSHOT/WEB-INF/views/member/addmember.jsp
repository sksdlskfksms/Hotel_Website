<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
var isChk = false;
$(document).ready(function() {
   $('#checkId').on('click', function() {
      var userid = $('#id').val();
      $.ajax({
         async: true,
         type : 'POST',
         url : 'getUserConfirm.do',
         data: {"userid" : userid},
            success : function(data) {
            if (data) {
               $('#checkMsg').html('<p style="color:blue">사용 가능한 아이디입니다.</p>');
               $("#password").focus();
               isChk = true;
            } else {
               $('#checkMsg').html('<p style="color:red">이미 사용중인 아이디입니다.</p>');
               $("#id").focus();
            }
         }
      });//End ajax
   });//End on
});
function checkFrm() {
   if(confirm("회원가입 하시겠습니까?")){
       if(isChk==false){
           alert('아이디 중복체크를 해주세요');
           return false;
       }else{
       alert("회원가입을 축하합니다");
       return true;
       }
   }
}
</script>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<!-- Bootstrap core CSS -->
   <link href="resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
   <!-- 스타일 CSS -->
   <link href="resources/css/agency.css" rel="stylesheet">
   
   <link href="resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
   <style type="text/css">
   #checkId {
      position: absolute;
       left: 820px;
       top: 122px;
   }
   </style>
</head>
<body>
   <div align="center">
      <label><a class="navbar-brand js-scroll-trigger" href="index.do">@SpringHotel</a></label>
      <h1>회원가입</h1>
         <form action="addmember.do" method="post" onsubmit="return checkFrm()">
         <table>
            <tr>
               <td>
               <input type="text" name="id" id="id" placeholder="아이디" required autofocus
                      style="width: 300px; height: 50px; margin: 10;"/>
               </td>
               <td>
               <button type="button" id="checkId" class="btn btn-primary text-uppercase js-scroll-trigger"
                         style="margin-left: -110;">중복확인</button>
               </td>
            </tr>
            <tr>
               <td>
               <input type="password" id="password" name="password" placeholder="비밀번호" required
                      style="width: 300px; height: 50px; margin: 10;"/>
               </td>   
            </tr>
            <tr>
               <td>
               <input type="text" name="name" placeholder="이름" required
                      style="width: 300px; height: 50px; margin: 10;"/>
               </td>
            </tr>
            <tr>
               <td>
               <input type="text" name="mail" maxlength="50" placeholder="Email" required
                      style="width: 300px; height: 50px; margin: 10;"/>
               </td>
            </tr>
            <tr>
               <td style="border-bottom: #f8f7f9; border-bottom-style: inset;">
               <input type="submit" value="가입하기"
                      style="width: 300px; height: 50px; margin: 10;"/>
               </td>
            </tr>
            <tr>
            <td align="center">
               <div id="checkMsg"></div>
            </td>
            </tr>
         </table>
      </form>
   </div>         
</body>
</html>