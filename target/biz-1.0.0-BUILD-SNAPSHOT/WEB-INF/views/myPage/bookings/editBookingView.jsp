<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;" content="no-cache">
<title>예약 상세</title>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<script type="text/javascript">
	function updateDate(){
		$('#removeDate').remove();
		var html="<form action='updateCheckin.do'>";
		html+="<input type='hidden' name='bookingId' value='${bookingId.booking_id}'>";
		html+="<input id='checkinCal' class='form-control' type='text' name='checkin' size='12' placeholder='${bookingId.checkin}' required>";
		html+="<input id='checkoutCal' class='form-control' type='text' name='checkout' size='12' placeholder='${bookingId.checkout}' required>";
		html+="<input type='submit' value='변경 완료' class='btn btn-primary text-uppercase js-scroll-trigger' style='float: left; margin: 0 5px;'>";
		html+="<input onClick='history.go(0)' type='button' value='취소' class='btn btn-secondary text-uppercase js-scroll-trigger' style='float: left;'></form>";
		$('#addDate').append(html);
	};
	
	function updateGuest(){
		$('#removeGuest1').remove();
		$('#removeGuest2').remove();
		var html1="<input type='hidden' name='bookingId' value='${bookingId.booking_id}'>";
		html1+="<input class='form-control' type='text' name='guest_email' id='guest_email' size='12' placeholder='${bookingId.guest_email}' required/>";
		var html2="<input class='form-control' type='text' name='guest_name' id='guest_name' size='12' placeholder='${bookingId.guest_name}' required/>";
		html2+="<input type='submit' value='변경 완료' class='btn btn-primary text-uppercase js-scroll-trigger' style='float: left; margin: 0 5px;'>";
		html2+="<input onClick='history.go(0)' type='button' value='취소' class='btn btn-secondary text-uppercase js-scroll-trigger' style='float: left;'>";
		$('#addGuest1').append(html1);
		$('#addGuest2').append(html2);
	};
</script>
<script type="text/javascript">
	function cancle_button(){
		if (confirm("정말 취소하시겠습니까??") == true){ 
		    document.cancleform.submit();
		}else{ 
		    return;
		}
	}
</script>
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
		</div><!-- menu-left끝  -->
		<!-- main 시작 -->
		<div class="main main-block">
		<c:if test="${not empty userId}">
			<section class="title-section" style="padding-top: 150px;" >
				<div>
					<h3 class="title">
						<a href="#">${bookingId.hotel.hotelname}</a>
					</h3>
					<p>
						<i class="fas fa-map-marker-alt"></i>
						<span>${bookingId.hotel.extraAddress}, ${bookingId.hotel.addressdetail}, ${bookingId.hotel.address}</span>
						<a href="https://map.naver.com/v5/search/${bookingId.hotel.address }${bookingId.hotel.addressdetail }?"class="atag">숙소 위치 확인</a>
					</p>
				</div>
			</section>
			<img class="hotelImg" src="http://<%=request.getServerName()%>:<%=request.getServerPort()%>/img/${bookingId.hotel.org_file_name}">
			<div class="info-part">
				<section class="info-section">
					<h5>예약 번호</h5>
					<div class="info-content">
						${bookingId.booking_id}
					</div>
					<a href="calendar.do" class="atag">내 캘린더에 일정 확인하기</a>
				</section>
				<section class="info-section">
					<hr>
					<div class="group-label">
						<h5>체크인</h5>
						<h5>체크아웃</h5>
					</div>
					<div id="addDate" class="info-content" style="width: 430px;">
						<div id="removeDate">
							<div id="checkin">${bookingId.checkin}</div>
							<div id="checkout">${bookingId.checkout}</div>
							<div>1박</div>
							<c:if test="${bookingId.state eq '예정'}">
								<a href="javascript:void(0);" class="atag" onclick="updateDate()">날짜 변경하기</a>
							</c:if>
						</div>
					</div>
				</section>
				<form action='updateGuest.do'>
				<section class="info-section">
					<hr><h5>투숙객 연락처</h5>
					<div id="addGuest1"  class="info-content">
						<div id="removeGuest1">${bookingId.guest_email}</div>
					</div>
				</section>
				<section class="info-section">
					<hr><h5>투숙객 이름</h5>
					<div id="addGuest2" class="info-content">
						<div id="removeGuest2">
							<div>${bookingId.guest_name}</div>
							<c:if test="${bookingId.state eq '예정'}">
								<a href="javascript:void(0);" class="atag" onclick="updateGuest()">투숙객 정보 변경하기</a>
							</c:if>
						</div>
					</div>
				</section>
				</form>
				<section class="info-section">
					<hr><h5>총 예약 인원</h5>
					<div class="info-content">
						<div class="info-content">성인 ${bookingId.adult}명</div>
						<div class="info-content">어린이 ${bookingId.child}명</div>
					</div>
				</section>
			</div> <!-- 첫번째 info-part 끝 -->
			<div class="info-part">
				<section class="info-section">
					<hr><h5>객실 종류</h5>
					<div class="info-content">
						<div>${bookingId.hotel.roomtype}</div>
					</div>
				</section>
				<section class="info-section">
					<hr><h5>결제 정보</h5>
					<div class="info-content">
						<div>
							<span style="color:#32a923;">
								<i class="fas fa-check-circle "></i>
								<c:choose>
									<c:when test="${bookingId.state eq '예정'}">자동 결제 예정일 : 2020년 4월 14일 화요일</c:when>
									<c:when test="${bookingId.state eq '완료'}">결제일 : 2020년 4월 14일 화요일</c:when>
									<c:otherwise>결제 취소</c:otherwise>
								</c:choose>
							</span>
						</div>
					</div>
					<div>
						<hr class="half-section">
						<section class="payment-section">
							<div class="payment-div">
								<div>
									<div class="room">객실 1개 x 1박</div>
									<div class="currency">KRW</div>
									<div class="price">${bookingId.hotel.hotelprice}</div>
								</div>
							</div>
							<hr class="half-section">
							<div class="payment-div">
								<div class="room">결제 금액</div>
								<div class="currency">KRW</div>
								<div class="price priceBold">${bookingId.hotel.hotelprice}</div>
							</div>
							<div class="price-footnote">
								<p><span>스프링호텔 이용 약관에 의거하여 통화 환율을 사용해 'KRW'(으)로 결제됩니다.</span></p>
								<p><span>포함: 세금 및 봉사료 $ 7.59</span></p>
							</div>
						</section>
					</div>
				</section>
				<div class="info-section">
					<hr><h5>결제 방법</h5>
					<div class="content-payment">
						<div class="cardDiv">
							<div class="card-label">카드 명의자</div>
							<div class="card-value">Nara Lee</div>
						</div>
						<div class="cardDiv">
							<div class="card-label">카드 종류</div>
							<div class="card-value">MasterCard</div>
						</div>
						<div class="cardDiv">
							<div class="card-label">카드 번호</div>
							<div class="card-value">xxxx-xxxx-xxxx-6084</div>
						</div>
					</div>
				</div>
				<c:if test="${bookingId.state eq '예정'}">
					<section class="info-section">
						<hr><h5>취소 정책</h5>
						<div class="info-content">
							<div>
								지금 예약 취소 시, <span class="state-free">예약 무료 취소 가능</span>
							</div>
							<div>
								<ul class="cancle">
									<li>2020년 4월 15일 (수)까지 예약 취소 시, 예약 무료 취소 가능</li>
									<li>체크인 날짜 전 7일 이내 예약 취소 시 총 숙박 요금이 취소 요금으로 부과됩니다.</li>
									<li>예약한 숙소에 체크인하지 않거나 예약 취소 시 요금이 환불되지 않습니다.</li>
								</ul>
								<form action="cancleBooking.do?bookingId=${bookingId}" name="cancleform">
									<input type="hidden" name="bookingId" value="${bookingId.booking_id}">
									<input onclick="cancle_button();" class="btn btn-dark text-uppercase js-scroll-trigger" value="예약취소" type="button" style="cursor: pointer; width: 420px;">
								</form>
							</div>
						</div>
					</section>
				</c:if>
			</div><!-- 두번째 info-part끝 -->
			</c:if>
			<!-- 로그인 경고창 -->
			<c:if test="${empty userId}">
				<div class="ui-widget" style="height: 20px; display: inline-block; width: 460px; padding-top: 150px">
					<div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
						<p style="margin: 15px;"> 
							<span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
							<strong>로그인 후 이용해주세요 </strong><br> 
							<a href="login.do" style="color:blue;">로그인</a>
							하고 이용하시겠습니까?
						</p>
					</div>
				</div>
			</c:if><!-- 로그인 경고창 끝 -->
		</div><!--main 끝  -->
	</div> <!-- container 끝 -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
