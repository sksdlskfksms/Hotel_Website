<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>예약 하기</title>
<link href="resources/css/myPage.css?var=5" rel="stylesheet">
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="resources/jquery-ui-1.12.1/jquery-ui.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="resources/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script src="resources/jquery-ui-1.12.1/datepicker-ko.js"></script>
<script>
	$(function(){
		$("#date1").datepicker({
			showOn: "both", // focus - 포커스가 오면 팝업, button - 버튼 클릭 시 팝업, both -두가지 경우 모두 달력 팝업
			buttonImage: "resources/img/calendar.gif",//입력 필드 옆에 표시될 이미지
		    buttonImageOnly: true, //true : 입력필드 옆에 이미지만 표시 
		    buttonText: "Select date", //button에 표시되는 글자
		    minDate: new Date('${hotel.checkin}'),
			maxDate: new Date('${hotel.checkout}')
		});//날짜를 다룰 때 UI형식으로 날짜를 선택하도록 도와주는 역할 수행(DOM)
	 });
	 $(function(){
			$("#date2").datepicker({
				showOn: "both", // focus - 포커스가 오면 팝업, button - 버튼 클릭 시 팝업, both -두가지 경우 모두 달력 팝업
				buttonImage: "resources/img/calendar.gif",//입력 필드 옆에 표시될 이미지
			    buttonImageOnly: true, //true : 입력필드 옆에 이미지만 표시 
			    buttonText: "Select date", //button에 표시되는 글자
			    minDate: new Date('${hotel.checkin}'),
			    maxDate: new Date('${hotel.checkout}')
			});//날짜를 다룰 때 UI형식으로 날짜를 선택하도록 도와주는 역할 수행(DOM)
		 });
</script>
<script>
  	function closefunction(){
  		self.close(); 
  	}
  </script>
</head>
<body class="margintop" style="margin-top: 30px; margin-left:20px;">
	<!-- 예약 페이지 구현 - 현범 -->
	<h3>예약 정보 입력</h3><br>
	<c:if test="${not empty userId}">
		<form action="payment.do">
		<!-- 입력받은 시퀀스(num) 값 전달 -->
		<input type="text" value="${param.num }" name="hotel_num" hidden />
		<div class="form-group row">
			<label class="col-sm-2">&nbsp;&nbsp;예약자 <br>&nbsp;&nbsp;아아디</label>
			<div class="col-sm-3">
				<input style="background-color: #e2e2e2;" type="text" name="user_id" value="${userId}" readonly>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">&nbsp;투숙객 이름</label>
			<div class="col-sm-3">
				<input type="text" name="guest_name" value="${userName}">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">&nbsp;투숙객 이메일</label>
			<div class="col-sm-3">
				<input type="text" name="guest_email">
			</div>
		</div>
		<!-- 투숙객 인원 : 등록한 호텔 범위내 값만 입력 가능-->
		<div class="form-group row">
			<label class="col-sm-2">&nbsp;투숙객 인원</label>
			<div class="col-sm-3">
				<select name="adult">	
				<c:forEach var="index" begin="1" end="${hotel.oldcount}">
					<option value="${index}">성인${index}명</option>
				</c:forEach>
				</select> 
				<select name="child">
					<c:forEach var="index" begin="0" end="${hotel.youngcount}">
					<option value="${index}">어린이${index}명</option>
				</c:forEach>
				</select>
			</div>	
		</div>
		 <div class="form-group row" id="datehidden">
			<label class="col-sm-2">&nbsp;투숙 시작일</label> 
			<input type="text" name="checkin" id="date1" size="12" value="${hotel.checkin}"/> 
			<label class="col-sm-2">&nbsp;투숙 종료일</label>
			<input type="text" name="checkout" id="date2" size="12" value="${hotel.checkout}" />
		</div>
		<br>
		&nbsp;&nbsp;<input type="submit" class="btn btn-primary" value="전송">
		&nbsp;&nbsp;<input type="reset" class="btn btn-primary" value="창 닫기" onclick="closefunction()">
		</form>
	</c:if>
	<!-- 로그인 경고창 -->
	<c:if test="${empty userId}">
		<div class="ui-widget" style="height: 20px; display: inline-block; width: 460px; margin-left: 20px;">
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
	<!-- 시퀀스(출력 테스트):
	<c:out value="${param.num }" /> -->
	<!-- 달력 제이쿼리 -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="resources/jquery-ui-1.12.1/jquery-ui.min.js"></script>
	<script src="resources/jquery-ui-1.12.1/datepicker-ko.js"></script>
</body>
</html>