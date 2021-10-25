<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;">
  <title>호텔 사이트</title>
  <!-- Bootstrap core CSS -->
  <link href="resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
  
  <!-- 스타일 CSS -->
  <link href="resources/css/agency.css" rel="stylesheet">

  <!-- 아이콘을 문자화 -->
  <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <!-- 영어 폰트 -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
  <!-- 한글 폰트 -->
  <link href="resources/vendor/fontawesome-free/css/korean.css" rel="stylesheet" type="text/css">
  <link href="resources/vendor/fontawesome-free/css/korean2.css" rel="stylesheet" type="text/css">

  <!-- 달력 제이쿼리  -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="resources/jquery-ui-1.12.1/jquery-ui.min.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="resources/jquery-ui-1.12.1/jquery-ui.min.js"></script>
  <script src="resources/jquery-ui-1.12.1/datepicker-ko.js"></script>
  <script>
	 $(function(){
		$("#date1").datepicker({
			showOn: "both", // focus - 포커스가 오면 팝업, button - 버튼 클릭 시 팝업, both -두가지 경우 모두 달력 팝업
			buttonImage: "resources/img/calendar.png",//입력 필드 옆에 표시될 이미지
		    buttonImageOnly: true, //true : 입력필드 옆에 이미지만 표시 
		    buttonText: "Select date", //button에 표시되는 글자
		    minDate:0 //오늘날짜부터 선택가능
		});//날짜를 다룰 때 UI형식으로 날짜를 선택하도록 도와주는 역할 수행(DOM)
	 });
	 
	 $(function(){
			$("#date2").datepicker({
				showOn: "both", // focus - 포커스가 오면 팝업, button - 버튼 클릭 시 팝업, both -두가지 경우 모두 달력 팝업
				buttonImage: "resources/img/calendar.png",//입력 필드 옆에 표시될 이미지
			    buttonImageOnly: true, //true : 입력필드 옆에 이미지만 표시 
			    buttonText: "Select date", //button에 표시되는 글자
			    minDate:1
			});//날짜를 다룰 때 UI형식으로 날짜를 선택하도록 도와주는 역할 수행(DOM)
		 });
  </script>
</head>
<body id="page-top">
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="#page-top">@SpringHotel</a>
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

  <!-- Header -->
  <header class="masthead">
	    <div class="container">
	      <div class="intro-text">
	        <div class="intro-text1">호텔을 예약하세요</div>
	        <div class="intro-text2 text-uppercase">Search your travel destination.</div>
	      </div>
	    </div>
		<div class="container">
		    <div class="searchForm">         
				<form action="MainSearch.do">
					<fieldset>
						<label>여행지</label>
						<input class="form-control" type="text" name="location" placeholder="모든 위치" required>
						<div class="inline">
							<div><label>체크인</label></div>
							<input class="form-control" type="text" name="checkin" id="date1" size="12" placeholder="년.월.일" required/>
						</div>	
						<div class="inline">
							<div><label>체크아웃</label></div>
							<input class="form-control" type="text" name="checkout" id="date2" size="12" placeholder="년.월.일" required/>
						</div>
						<div class="inline">
						<label>성인</label>
						<select name="oldcount">
							<option value="1">성인1명</option>
							<option value="2">성인2명</option>
							<option value="3">성인3명</option>
							<option value="4">성인4명</option>
							<option value="5">성인5명</option>
							<option value="6">성인6명</option>
							<option value="7">성인7명</option>
							<option value="8">성인8명</option>
							<option value="9">성인9명</option>
							<option value="10">성인10명</option>
						</select>
						</div>
						<div class="inline">
						<label>어린이</label>
						<select name="youngcount">
							<option value="1">어린이1명</option>
							<option value="2">어린이2명</option>
							<option value="3">어린이3명</option>
							<option value="4">어린이4명</option>
							<option value="5">어린이5명</option>
						</select>
						</div>
						<input type="submit" value="검색" class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" >
					</fieldset>
				</form>
			</div>                                                                                                                                                                                                                                                                                                                                                                                       
		</div>
	</header>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
    <!-- Bootstrap core JavaScript -->
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Contact form JavaScript -->
  <script src="resources/js/jqBootstrapValidation.js"></script>
  <script src="resources/js/contact_me.js"></script>

  <!-- Custom scripts for this template -->
  <script src="resources/js/agency.min.js"></script>
  
  <!-- 달력 제이쿼리 -->
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="resources/jquery-ui-1.12.1/jquery-ui.min.js"></script>
  <script src="resources/jquery-ui-1.12.1/datepicker-ko.js"></script> 
</body>
</html>
