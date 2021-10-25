<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/css/agency.css" rel="stylesheet">
<title>카드 등록</title>
<script>
  	function closefunction(){
  		self.close(); 
  	}
</script>
<script>
    function numberMaxLength(e){
        if(e.value.length > e.maxLength){
            e.value = e.value.slice(0, e.maxLength);
        }
    }
</script>
<style type="text/css">
	.form-group label{
		width: 100px;
	}
	.card_num{
		width: 70px;
	}
</style>
</head>
<body class="margintop" style="margin-top: 30px; margin-left:20px;">
	<h3>카드 등록</h3><br>
		<form action="insertCardInfo.do">
		<!-- 입력받은 시퀀스(num) 값 전달 -->
		<input type="text" value="${userId}" name="user_id" hidden />
		<div class="form-group">
			<label>카드 명의자</label>
			<input type="text" name="owner_name" required>
		</div>
		<div class="form-group">
			<label>카드사</label>
			<input type="text" name="card_name" required>
		</div> 
		<div class="form-group">
			<label>카드 번호</label>
			<input class="card_num" type="number" name="card_num1" maxlength="4" minlength="4" required oninput="numberMaxLength(this);">-
			<input class="card_num" type="number" name="card_num2" maxlength="4" minlength="4" required oninput="numberMaxLength(this);">-
			<input class="card_num" type="number" name="card_num3" maxlength="4" minlength="4" required oninput="numberMaxLength(this);">-
			<input class="card_num" type="number" name="card_num4" maxlength="4" minlength="4" required oninput="numberMaxLength(this);">
		</div>
		<div class="form-group">
			<label>카드 유효기간</label>
			<input class="card_num" type="number" name="card_month" maxlength="2" minlength="2" required oninput="numberMaxLength(this);">/
			<input class="card_num" type="number" name="card_year" maxlength="4" minlength="4" required oninput="numberMaxLength(this);">
		</div>
		<div class="form-group">
			<label>결제 비밀번호</label>
			<input type="password" name="card_pwd" maxlength="6" minlength="6" required oninput="numberMaxLength(this);">
		</div> 
		<br>
		&nbsp;&nbsp;<input type="submit" class="btn btn-primary text-uppercase js-scroll-trigger" value="전송">
		&nbsp;&nbsp;<input type="reset" class="btn btn-secondary text-uppercase js-scroll-trigger" value="창 닫기" onclick="closefunction()">
		</form>
	<!-- 시퀀스(출력 테스트):
	<c:out value="${param.num }" /> -->
<script src="resources/vendor/jquery/jquery.min.js"></script>
<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="resources/js/agency.min.js"></script>
</body>
</html>