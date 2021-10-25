<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>호텔 상세 보기</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
<!-- 호텔 이미지 스타일 적용 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<!-- 로그인 경고창 css -->
<link href="resources/css/myPage.css" rel="stylesheet">
<link href="resources/jquery-ui-1.12.1/jquery-ui.css" rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<style>
.swiper-container {
	height: 420px;
	border: 5px solid silver;
	border-radius: 7px;
	box-shadow: 0 0 20px #ccc inset;
}

.swiper-slide {
	text-align: center;
	display: flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
	align-items: center; /* 위아래 기준 중앙정렬 */
	justify-content: center; /* 좌우 기준 중앙정렬 */
}

.swiper-slide img {
	box-shadow: 0 0 5px #555;
	max-width: 100%; /* 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
	/* 이 예제에서 필요해서 설정했습니다. 상황에따라 다를 수 있습니다. */
}
</style>
<script>
	function test(num) {
		var url = "booking.do?num=" + num;
		var name = "예약 하기";
		var option = "width = 600, height = 400, top = 100, left = 200, location = no";
		window.open(url, name, option);
	}
</script>

</head>
<body class="margintop" style="margin-top: 100px;">
	<p>
		<jsp:include page="/WEB-INF/views/include/menu.jsp" />
	</p>
	
	<!-- 로그인 경고창 끝 -->
	<form action="updateHotel.do">
		
			<input name="seq" type="hidden" value="${hotel.num}" />
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="type" value="${pageMaker.cri.type}">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">



			<!-- 다중 이미지 출력(스타일 적용됨) -->
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<c:forEach var="hotelimages" items="${hotelimages}">

						<div class="swiper-slide">
							<img
								src="http://<%=request.getServerName()%>:<%=request.getServerPort()%>/img/${hotelimages}"
								class="imagestyle" />
						</div>

					</c:forEach>
				</div>
				<!-- 네비게이션 -->
				<div class="swiper-button-next"></div>
				<!-- 다음 버튼 (오른쪽에 있는 버튼) -->
				<div class="swiper-button-prev"></div>
				<!-- 이전 버튼 -->

				<!-- 페이징 -->
				<div class="swiper-pagination"></div>

				<div style="text-align: center; margin-top: 5px;">슬라이드 랜덤사진
					갤러리</div>


			</div>
			<br>
			<h3>&nbsp;&nbsp;${hotel.hotelname }</h3>
			<p>
				&nbsp;&nbsp;<b>주소:</b>${hotel.address } ${hotel.addressdetail }
			<p>
				&nbsp;&nbsp;<b>예약가능일:</b>${hotel.checkin}~${hotel.checkout}
			<p>
				&nbsp;&nbsp;<b>인원 성인:</b>${hotel.oldcount} <b>어린이:</b>${hotel.youngcount}
			<hr>
			<p>
				&nbsp;&nbsp;<b>싱글 침대 개수:</b>${hotel.singlebed}<b>더블 침대 개수:</b>${hotel.doublebed}
			<p>
				&nbsp;&nbsp;<b>편의 시설:</b>${hotel.chkinfo}
			<p>
				&nbsp;&nbsp;<b>기타 정보:</b>${hotel.otherinfo}
			<hr>
		&nbsp;<b>조회수:</b>${hotel.hit}<br>
			<br> &nbsp;&nbsp;
			<!-- 로그인아이디와 세션아이디가 동일 or 세션의 롤이 admin -->



			<c:if
				test="${userId eq hotel.userid or userRole eq 'admin' or userName eq '관리자'}">
				<a
					href="deleteHotel.do?num=${hotel.num }&pageNum=${pageMaker.cri.pageNum}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}"
					class="btn btn-danger text-uppercase js-scroll-trigger">삭제</a>&nbsp;&nbsp;&nbsp; 
			</c:if>
			<c:if
				test="${userId eq hotel.userid or userRole eq 'admin' or userName eq '관리자'}">
				<a
					href="updateHotel.do?num=${hotel.num }&pageNum=${pageMaker.cri.pageNum}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}"
					class="btn btn-primary text-uppercase js-scroll-trigger">수정</a>&nbsp;&nbsp;&nbsp;
			</c:if>
			<a
				href="getHotelList.do?pageNum=${pageMaker.cri.pageNum}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}"
				class="btn btn-primary text-uppercase js-scroll-trigger">목록</a>&nbsp;&nbsp;&nbsp;
			
			<a href="#" class="btn btn-primary text-uppercase js-scroll-trigger"
				onclick="test('${hotel.num}')">예약 하기</a> 


			<p>
		
	</form>
	<p>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</p>
	<!-- 호텔 이미지 적용 자바스크립트 적용  -->
	<script>
		//※ 클래스명 myswiper 사용

		new Swiper('.swiper-container', {

			slidesPerView : 1, // ** 동시에 보여줄 슬라이드 갯수
			spaceBetween : 30, // ** 슬라이드간 간격
			slidesPerGroup : 1, // ** 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

			// ** 그룹수가 맞지 않을 경우 빈칸으로 메우기
			// ** 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
			loopFillGroupWithBlank : true,

			loop : true, // 무한 반복

			pagination : { // 페이징
				el : '.swiper-pagination',
				clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
			},
			navigation : { // 네비게이션
				nextEl : '.swiper-button-next', // 다음 버튼 클래스명
				prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
			},
		});
	</script>
</body>
</html>