<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;" content="no-cache">
<title>예약완료 리스트</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/menu.jsp" />
	<div class="container">
		<div class="menu-left">
			<section class="menu-section">
			<ul>
				<li class="menu-inactive"><a href="profile.do"><i class="fas fa-user-cog"></i>회원 정보</a></li>
				<li class="menu-active" style="border-right-color: #003580;">
					<a href="bookingsList.do"><i class="fas fa-list-alt"></i>예약 관리</a>
				</li>
				<li class="menu-inactive"><a href="calendar.do"><i class="far fa-calendar-alt"></i>캘린더</a></li>
				<li class="menu-inactive"><a href="reviews.do"><i class="fas fa-star"></i>이용 후기</a></li>
			</ul>
			</section>
		</div>
		<!-- main 시작 -->
		<div class="main">
			<!-- 필터 섹션 시작 -->
			<div class="filter-Section">
				<!-- 조회옵션 -->
				<div class="filter-container">
					<span class="filter-option" onclick="location.href='bookingsList.do';">투숙 예정 예약</span>
					<span class="seperator"></span>
					<span class="filter-option active" onclick="location.href='completeList.do';">투숙 완료 예약</span>
					<span class="seperator"></span>
					<span class="filter-option" onclick="location.href='cancleList.do';">취소된 예약</span>
				</div><!-- 조회옵션 끝 -->
			</div><!-- 필터 섹션 끝 -->
			<!-- 전체 리스트 -->
			<c:forEach items="${bookingsList}" var="bookingsList">
				<c:if test="${userId eq bookingsList.user_id}">
					<div class="booking-list">
						<div class="list-header">
							<div class="list-header-left" style="margin-top: 4px;">
								<i class="fas fa-map-marker-alt"></i>
							</div>
							<div class="list-header-left">${bookingsList.hotel.address}</div>
							<div class="list-header-right">예약일: ${bookingsList.booking_date}</div>
						</div><!-- list header 끝 -->
						<!-- 호텔정보 카드 섹션 -->
						<section class="booking-list-main ">
							<div class="list-main-card">
								<div class="hotel-picture">
									<figure>
										<img class="hotel-img" src="http://<%=request.getServerName()%>:<%=request.getServerPort()%>/img/${bookingsList.hotel.org_file_name}">
									</figure>
								</div>
								<div class="info-container">
									<ul>
										<li class="hotel-title">${bookingsList.hotel.hotelname}</li>
										<li class="info-title">예약 번호:<span class="info">${bookingsList.booking_id}</span></li>
										<li class="info-title">체크 인:<span class="info">${bookingsList.checkin}</span>
										</li>
										<li class="info-title">체크 아웃:<span class="info">${bookingsList.checkout}</span>
										<li style="color:#32a923; margin-left: 19px;">
											<i class="fas fa-check-circle"></i>
											<span>결제일: 2020년 4월 14일 화요일</span>
										</li>
									</ul>
									<div class="booking-price">
										<div class="price-currency">KRW</div>
										<div class="price-ammount">${bookingsList.hotel.hotelprice}</div>
									</div>
								</div>
								<div class="bottom-left"><a href="https://map.naver.com/v5/search/${bookingsList.hotel.address }${bookingsList.hotel.addressdetail }?">숙소 위치 확인하기</a></div>
								<button onclick="location.href='editBooking.do?bookingId=${bookingsList.booking_id}'"  class="btn btn-primary text-uppercase js-scroll-trigger bottom-right">예약 상세</button>
							</div>
						</section><!-- 카드섹션 끝 -->
					</div><!-- 예약 리스트 끝 -->
				</c:if>
			</c:forEach>
			<!-- 로그인 경고창 -->
			<c:if test="${empty userId}">
				<div class="ui-widget" style="height: 20px; display: inline-block; width: 100%;">
					<div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
						<p style="margin: 15px;"> 
							<span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
							<strong>로그인 후 이용해주세요 </strong><br> 
							<a href="login.do" style="color:blue;">로그인</a>
							하고 다시 이용하시겠습니까?
						</p>
					</div>
				</div>
			</c:if><!-- 로그인 경고창 끝 -->
		</div><!--main 끝  -->
	</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
