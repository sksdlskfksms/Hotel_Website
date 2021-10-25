<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;" content="no-cache">
<title>리뷰 관리</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/menu.jsp" />
	<div class="container">
		<div class="menu-left">
			<section class="menu-section">
			<ul>
				<li class="menu-inactive"><a href="profile.do"><i class="fas fa-user-cog"></i>회원 정보</a></li>
				<li class="menu-inactive" style="border-right-color: #003580;">
					<a href="bookingsList.do"><i class="fas fa-list-alt"></i>예약 관리</a>
				</li>
				<li class="menu-inactive"><a href="calendar.do"><i class="far fa-calendar-alt"></i>캘린더</a></li>
				<li class="menu-active"><a href="reviews.do"><i class="fas fa-star"></i>이용 후기</a></li>
			</ul>
			</section>
		</div>
		<!-- main 시작 -->
		<div class="main">
			리뷰페이지
		</div><!--main 끝  -->
	</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
