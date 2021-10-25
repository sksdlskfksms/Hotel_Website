<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>호텔 리스트 게시판</title>
<!-- 스타일 CSS -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
<!-- 페이지 스타일 CSS - 나라씨꺼 -->
<link href="resources/css/myPage.css?var=5" rel="stylesheet">
<!-- regularFunction 함수 - 주소를 영문, 한글  10글자 까지만 출력 -->
<!-- 로그인 경고창 css -->
<link href="resources/css/myPage.css" rel="stylesheet">
<link href="resources/jquery-ui-1.12.1/jquery-ui.css" rel="stylesheet">
<script>
	function regularFunction(address) {
		var regExp = "^[ㄱ-힝a-zA-Z ]{2,10}[^0-9]";
		document.write(address.match(regExp));
	}
</script>
<style>/* 페이징 처리 디자인 */
ul {
	list-style: none;
}

li {
	display: inline-block;
}

li a {
	text-decoration: none;
}
</style>
</head>
<body class="margintop" style="margin-top: 50px;">
	<p>
	<jsp:include page="/WEB-INF/views/include/menu.jsp" />
	</p>
	<br>
	<br>
	<br>
	<!-- 로그인 경고창 -->
	<c:if test="${empty userId}"> <!-- 로그인 경고창 -->
		<div class="ui-widget" style="height: 40px; display: inline-block; width: 100%;">
			<div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
				<p style="margin: 40px;"> 
					<span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
					<strong>로그인 후 이용해주세요 </strong><br> 
					<a href="login.do" style="color:blue;">로그인</a>
					하고 다시 이용하시겠습니까?
				</p>
			</div>
		</div>
	</c:if><!-- 로그인 경고창 끝 -->
	
	<center>
		<div class="container">
		<!-- main 시작 -->
		<div class="main">
			<!-- 필터 섹션 시작 -->
			<div class="filter-Section">
				<!-- 조회옵션 -->
				<div class="filter-container">
					<span class="filter-option active">호텔 리스트</span>
					<span class="seperator"></span>

				</div><!-- 조회옵션 끝 -->
				<!-- 검색 창 -->
				<div class="search-container">
					<!-- 검색 시작 -->
			<form action="getHotelList.do">
				<table  cellpadding="30" cellspacing="30" width="900">
					<tr>
						<td align="right">
						<select name="type" style="height:30px">
								<c:forEach items="${conditionMap }" var="option">
									<option value="${option.value }">${option.key}
								</c:forEach>
						</select> <input name="keyword" type="text" /> 
						<input type="submit" class="btn btn-primary" value="검색" />
					</tr>
				</table>
			</form>
			<!-- 검색 종료 -->
				</div><!-- 검색창 끝 -->
			</div><!-- 필터 섹션 끝 -->
			<!-- 예약 리스트 시작 -->
			<!-- 출력 테스트 userRole : ${userRole}<br>-->
			<!-- userName : ${userName}<br> -->
			
			<c:forEach items="${hotelList}" var="hotel">
			<c:if test="${userRole eq 'manager' }">
					<div class="booking-list" align="left"> <!-- 주소 left설정함 -->
						<div class="list-header">
							<div class="list-header-left" >
								<div class="list-header-left" style="margin-top: 3px;"></div>
							</div>
							<div class="list-header-left" style="margin-top: 4px;">
								<i class="fas fa-map-marker-alt"></i>
							</div>
							<div class="list-header-left">
								<script>
									regularFunction("${hotel.address}");
								</script>
							</div>
						</div><!-- list header 끝 -->
						<!-- 호텔정보 카드 섹션 -->
						<section class="booking-list-main ">
							<div class="list-main-card">
								<div class="hotel-picture">
									<figure>
										<img
								src="http://<%=request.getServerName()%>:<%=request.getServerPort()%>/img/${hotel.org_file_name}"
								width="100" height="100"/>
									</figure>
								</div>
								<div class="info-container" align="left">
									<ul>
										<li class="hotel-title">${hotel.hotelname}</li>
										
										<p>
										<li class="info-title">체크 인:<span class="info">${hotel.checkin}</span></li>
										<li class="info-title">체크 아웃:<span class="info">${hotel.checkout}</span></li></p>
									
										<p>
										<li class="info-title">성인:<span class="info">${hotel.oldcount}</span></li>
										<li class="info-title">어린이:<span class="info">${hotel.youngcount}</span></li></p>
										
					
									</ul>
									<div class="booking-price">
										<div class="price-currency">KRW</div>
										<div class="price-ammount">${hotel.hotelprice}</div>
									</div>
								</div>
								
								
								<div class="bottom-left"><a href="https://map.naver.com/v5/search/${hotel.address }${hotel.addressdetail }?">숙소 위치 확인하기</a></div>
								<a href="getHotel.do?num=${hotel.num }&pageNum=${pageMaker.cri.pageNum}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}"
								class="btn btn-primary text-uppercase js-scroll-trigger bottom-right" role="button">상세정보</a>
							</div>
						</section><!-- 카드섹션 끝 -->
					</div><!-- 예약 리스트 끝 -->
					</c:if>
			</c:forEach>
		</div><!-- main 끝  -->

		


			<br>
			<!--  페이징 처리  -->
			<div>
				<ul>
					<c:if test="${pageMaker.prev}">
						<li><a href="${pageMaker.startPage-1}">Previous
								${pageMaker.prev}</a></li>
					</c:if>

					<c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}">
						<li><a
							href="./getHotelListmy.do?pageNum=${num}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">${num}</a></li>
					</c:forEach>
					
					<c:if test="${pageMaker.next}">
						<li><a href="${pageMaker.endPage + 1}">Next
								${pageMaker.next}</a></li>
					</c:if> 
				</ul>
			</div>
		</div>
	</center>
	<!-- container 종료 -->
	
	<p>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</p>
</body>
</html>