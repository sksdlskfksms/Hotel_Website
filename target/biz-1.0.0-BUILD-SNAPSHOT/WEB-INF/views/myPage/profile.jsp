<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보</title>
<script>
function checkPw() {
	if (document.updateForm.password.value != document.updateForm.password_confirm.value) {
		alert("비밀번호를 동일하게 입력해 주세요.");
		$("#password_confirm").focus();
		return false;
	} else {
		return true;
	}
}
function checkDel() {
	if (checkPw()) {
		window.location.replace("deleteUser.do");
	}
}
function roleUpdate() {
	if (confirm("매니저 권한을 요청하시겠습니까?"))
		if (checkPw()) {
			alert("권한 요청 메시지를 전송했습니다.")
			location.href="managerRequest.do";
		}
}
</script>
<script>
	function cardInfo() {
		var url = "cardInfo.do?";
		var name = "카드 등록";
		var option = "width = 600px, height = 600px, top = 100px, left = 500px, location = no";
		window.open(url, name, option);
	}
</script>
</head>
<body>
   <jsp:include page="/WEB-INF/views/include/menu.jsp" />
   <div class="container">
      <div class="menu-left">
         <section class="menu-section">
            <ul>
               <li class="menu-active">
                  <a href="#"><i class="fas fa-user-cog"></i>회원 정보</a>
               </li>
               <li class="menu-inactive" style="border-right-color: #003580;">
                  <a href="bookingsList.do"><i class="fas fa-list-alt"></i>예약 관리</a>
               </li>
               <li class="menu-inactive">
                  <a href="calendar.do"><i class="far fa-calendar-alt"></i>캘린더</a>
               </li>
               <li class="menu-inactive">
                  <a href="reviews.do"><i class="fas fa-star"></i>이용 후기</a>
               </li>
            </ul>
         </section>
      </div>
      <!-- main 시작 -->
      <div class="main">
         <!-- filter-Section 시작 -->
         <div class="filter-Section">
            <form action="updateUser.do" method="post" name="updateForm" onsubmit="return checkPw()">
               <label>아이디</label> <input type="text" name="id" value="${userInform.id }" readonly><br>
               <label>성 명</label> <input type="text" name="name" value="${userInform.name }"><br>
               <label>비밀번호</label> <input type="password" name="password" value="${userInform.password }"><br>
               <label>비밀번호확인</label> <input type="password" name="password_confirm" id="password_confirm"><br>
               <label>이메일</label> <input type="text" name="mail" maxlength="50" value="${userInform.mail }"><br>
               <!-- <label>전화번호</label> <input type="text" name="phone" value=""><br> -->
               <input class="btn btn-primary text-uppercase js-scroll-trigger" type="submit" value="수정">
               <input class="btn btn-light text-uppercase js-scroll-trigger" type="reset" value="취소">
               <a class="btn btn-danger text-uppercase js-scroll-trigger" role="submit" href="javascript:checkDel()" >계정삭제</a>
               <button type="button" class="btn btn-warning text-uppercase js-scroll-trigger" onclick="roleUpdate()" >매니저권한요청</button>
               
				<!-- 카드 등록 if문 넣기 -->	
               <button type="button" class="btn btn-info text-uppercase js-scroll-trigger" onclick="cardInfo()" >카드등록</button>
            </form>
         </div>
         <!-- filter-Section 끝 -->
      </div>
      <!-- main 끝  -->
   </div>
   <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>