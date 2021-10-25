<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;">
  <title>메뉴</title>
  <!-- Bootstrap core CSS -->
  <link href="resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
  <!-- 아이콘을 문자화 -->
  <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <!-- 스타일 CSS -->
  <link href="resources/css/agency.css" rel="stylesheet">
  <!-- 한글 폰트 -->
  <link href="resources/vendor/fontawesome-free/css/korean.css" rel="stylesheet" type="text/css">
  <link href="resources/vendor/fontawesome-free/css/korean2.css" rel="stylesheet" type="text/css">
  <!-- 마이페이지 스타일 CSS -->
  <link href="resources/css/myPage.css?ver=38" rel="stylesheet">
  <link href="resources/jquery-ui-1.12.1/jquery-ui.css" rel="stylesheet">
</head>
<body id="page-top">
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav" style="background: #003580;">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="index.do">@SpringHotel</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav text-uppercase ml-auto">
       	  <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#">
            	<img src="resources/img/korea.png" height="21px">
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#">￦</a>
          </li>
<!--           <li class="nav-item"> -->
<!--             <a class="nav-link js-scroll-trigger" href="#services">최근 검색한 호텔</a> -->
<!--           </li> -->
		  <li class="nav-item">
         	<a class="nav-link" href="getHotelList.do">호텔 리스트</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="calendar.do">일정관리</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link js-scroll-trigger" href="#">고객지원</a>
            <ul class="navbar-nav text-uppercase ml-auto">
		     <li class="nav-item"><a class="nav-link" href="getNoticeList.do">공지사항</a></li>
		     <li class="nav-item"><a class="nav-link" href="getEventList.do">이벤트</a></li>
		     <li class="nav-item"><a class="nav-link" href="getQnAList.do">Q&A</a></li>
		    </ul>
          </li>
          <li class="nav-item dropdown">
			<c:choose>
			<c:when test = "${empty userName}">
				<a class="nav-link js-scroll-trigger" href="#">Sign in</a>
	            <ul class="navbar-nav text-uppercase ml-auto">
			     <li class="nav-item"><a class="nav-link" href="login.do">로그인</a></li>
			     <li class="nav-item"><a class="nav-link" href="addmember.do">회원가입</a></li>
			    </ul>
         	</c:when>
         	<c:when test="${userName eq '관리자'}">
         		<a class="nav-link js-scroll-trigger" href="#" style="min-width: 91px;">
				<i class="fas fa-user-circle" style="font-size:18px; margin-right: 3px;"></i>
				${userName}
				</a>
	            <ul class="navbar-nav text-uppercase ml-auto">
   				    <li class="nav-item"><a class="nav-link" href="managerList.do">매니저관리</a></li>
				    <li class="nav-item"><a class="nav-link" href="requestUserList.do">권한요청확인</a></li> 
				    <li class="nav-item"><a class="nav-link" href="logout.do">로그아웃</a></li>
			    </ul>
         	</c:when>
         	<c:when test="${userRole eq 'manager'}">
         		<a class="nav-link js-scroll-trigger" href="#" style="min-width: 91px;">
				<i class="fas fa-user-circle" style="font-size:18px; margin-right: 3px;"></i>
				${userName}
				</a>
	            <ul class="navbar-nav text-uppercase ml-auto">
	            	<li class="nav-item"><a class="nav-link" href="profile.do">마이페이지</a></li>
				    <li class="nav-item"><a class="nav-link" href="hbtest.do">호텔등록</a></li>
   					<li class="nav-item"><a class="nav-link" href="getHotelListmy.do">호텔리스트</a></li>
				    <li class="nav-item"><a class="nav-link" href="logout.do">로그아웃</a></li>
			    </ul>
         	</c:when>
          	<c:otherwise>
          		<a class="nav-link js-scroll-trigger" href="#" style="min-width: 91px;">
					<i class="fas fa-user-circle" style="font-size:18px; margin-right: 3px;"></i>
					${userName}
				</a>
	            <ul class="navbar-nav text-uppercase ml-auto">
				    <li class="nav-item"><a class="nav-link" href="profile.do">마이페이지</a></li>
				    <li class="nav-item"><a class="nav-link" href="bookingsList.do">예약관리</a></li>
				    <li class="nav-item"><a class="nav-link" href="logout.do">로그아웃</a></li>
			    </ul>
	        </c:otherwise>
	      </c:choose>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <!-- Bootstrap core JavaScript -->
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="resources/js/agency.min.js"></script>
</body>
</html>
