<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 달력 제이쿼리  -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="resources/jquery-ui-1.12.1/jquery-ui.min.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="resources/jquery-ui-1.12.1/jquery-ui.min.js"></script>
  <script src="resources/jquery-ui-1.12.1/datepicker-ko.js"></script>
  <script>
	 $(function(){
		$("#date1").datepicker({
			//showOn: "both", // focus - 포커스가 오면 팝업, button - 버튼 클릭 시 팝업, both -두가지 경우 모두 달력 팝업
			buttonImage: "resources/img/calendar.gif",//입력 필드 옆에 표시될 이미지
		    buttonImageOnly: false, //true : 입력필드 옆에 이미지만 표시 
		    //buttonText: "Select date", //button에 표시되는 글자
		    minDate:0 //오늘날짜부터 선택가능
		});//날짜를 다룰 때 UI형식으로 날짜를 선택하도록 도와주는 역할 수행(DOM)
	 });
	 
	 $(function(){
			$("#date2").datepicker({
				//showOn: "both", // focus - 포커스가 오면 팝업, button - 버튼 클릭 시 팝업, both -두가지 경우 모두 달력 팝업
				buttonImage: "resources/img/calendar.gif",//입력 필드 옆에 표시될 이미지
			    buttonImageOnly: false, //true : 입력필드 옆에 이미지만 표시 
			    buttonText: "Select date", //button에 표시되는 글자
			    minDate:1
			});//날짜를 다룰 때 UI형식으로 날짜를 선택하도록 도와주는 역할 수행(DOM)
		 });
  </script>

<!-- 주소 검색 스크립트 -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					//document.getElementById("extraAddress").value = extraAddr;

				} //else {
				//	document.getElementById("extraAddress").value = '';
				//}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailAddress").focus();
			}
		}).open();
	}
</script>
</head>
<!-- 스타일 CSS -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
 <!-- 주소 검색 스크립트 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 
<body class="margintop" style="margin-top: 100px;">
	<jsp:include page="/WEB-INF/views/include/menu.jsp" />
	
	<br>
	<h1>호텔 정보 수정</h1>
	<hr>      
	
	<!-- 전달할 데이터 입력 - 시작 -->
	<form action="updateProcessHotel.do" class="form-horizontal"
		method="get" enctype="multipart/form-data">

		<!-- 유저id -->
		<input type="hidden" name="userid" id="userid" class="form-control"
			value="${userId}">
		<!-- 유저이름 -->
		<input type="hidden" name="username" id="username"
			class="form-control" value="${userName}">

		<!--  호텔num -->
		<input type="hidden" name="num" id="num" class="form-control"
			value="${hotel.num}">

		<!-- <form action="addHoteltest.jsp" class="form-horizontal" method="post"> -->
		<div class="form-group row">
			<label class="col-sm-2">호텔코드</label>
			<div class="col-sm-3">
				<input type="text" id="hotelcode" class="form-control"
					name="hotelcode" value="${hotel.hotelcode}" required readonly />
			</div>
		</div>

		<!-- 조회수 증가를 위해 초기값 0을 지정해주어야 함 (null -> 0)-->
		<input type="text" id="hit" value="0" hidden>

		<div class="form-group row">
			<label class="col-sm-2">호텔명</label>
			<div class="col-sm-3">
				<input type="text" id="hotelname" class="form-control"
					name="hotelname" required value="${hotel.hotelname}">
			</div>
		</div>


		<div class="form-group row">
			<label class="col-sm-2">주소1</label>
			<div class="col-sm-5">
				<input type="text" name="address" id="address" class="form-control"
					placeholder="address" required value="${hotel.address}">
			</div>
		</div>


		<div class="form-group row">
			<label class="col-sm-2">우편번호</label>
			<div class="col-sm-5">
				<input type="text" name="zipcode" id="postcode" class="form-control"
					placeholder="zipcode" required value="${hotel.zipcode}"><a
					href="javascript:execDaumPostcode()" class="btn btn-secondary"
					role="button"> 우편번호 &raquo;</a>
			</div>
		</div>


		<div class="form-group row">
			<label class="col-sm-2">상세주소</label>
			<div class="col-sm-5">
				<input type="text" name="addressdetail" id="detailAddress"
					class="form-control" placeholder="address" required
					value="${hotel.addressdetail}">
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-2">객실종류</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="roomtype"
					name="roomtype" required value="${hotel.roomtype}">
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-2">요금</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="hotelprice"
					name="hotelprice" required value="${hotel.hotelprice}">
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-2">인원</label>
			<div class="col-sm-3">
				성인:<input type="text" class="form-control" id="hotelprice"
					name="oldcount" required value="${hotel.oldcount}"> 어린이:<input
					type="text" class="form-control" id="hotelprice" name="youngcount"
					required value="${hotel.youngcount}">
			</div>
		</div>



		<div class="form-group row" id="datehidden">
			<label class="col-sm-2">투숙 시작일</label> 
			<input type="text" name="checkin" id="date1" size="12" value="${hotel.checkin}" /> 
				<label
				class="col-sm-2">투숙 종료일</label> 
				<input type="text" name="checkout" id="date2" size="12" value="${hotel.checkout}" />
		</div>



		<div class="form-group row">
			<label>투숙실 정보 </label>
			<div class="col-sm-5">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				싱글 침대 <input type="number" min="0" max="5" name="singlebed"
					value="${hotel.singlebed}"> 더블 침대<input type="number"
					min="0" max="5" name="doublebed" value="${hotel.doublebed}">
			</div>
		</div>

		<div class="form-group row">
		<label class="col-sm-2">편의 시설</label>
			<div class="col-sm-3">
				 <input type="text"
					class="form-control" id="chkinfo" name="chkinfo" required
					value="${hotel.chkinfo}">
			</div>
		</div>




		<div class="form-group row">
		<label class="col-sm-2">기타 정보</label>
			<div class="col-sm-3">
				 <input type="text"
					class="form-control" id="otherinfo" name=otherinfo required
					value="${hotel.otherinfo}">
			</div>
		</div>

		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10">


				<input type="submit" class="btn btn-primary" value="수정"
					onclick="onsubmit()"> <input type="reset"
					class="btn btn-primary" value="리셋">
			</div>
		</div>
	</form>
	 <!-- 달력 제이쿼리 -->
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="resources/jquery-ui-1.12.1/jquery-ui.min.js"></script>
  <script src="resources/jquery-ui-1.12.1/datepicker-ko.js"></script>

	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>