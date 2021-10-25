<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
ul{list-style-type : disc;}
</style>
</head>

<body>
<%-- <jsp:include page="/WEB-INF/views/include/menu.jsp" /> --%>
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
function cancle() {
	    history.go(-1);
	    }
</script>
<script>
$(function() {
	
	$(function() {
	    $('#startMonth').change(function() {
	        //제이쿼리로 구현.!!
	    	var January = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31];
	        var February = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29];
	    	var March = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31];
	    	var April = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30];
	    	var May = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31];
	    	var June = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30];
	    	var July = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31];
	    	var August = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31];
	    	var September = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30];
	    	var October = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31];
	    	var November = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30];
	    	var December = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31];  
	    	
	        var changeItem;
	        switch(this.value){
	    	case "1" : changeItem = January; break;
	    	case "2" : changeItem = February; break;
	    	case "3" : changeItem = March; break;
	    	case "4" : changeItem = April; break;
	    	case "5" : changeItem = May; break;
	    	case "6" : changeItem = June; break;
	    	case "7" : changeItem = July; break;
	    	case "8" : changeItem = August; break;
	    	case "9" : changeItem = September; break;
	    	case "10" : changeItem = October; break;
	    	case "11" : changeItem = November; break;
	    	case "12" : changeItem = December; break;
	    	}
	        
	        $('#startDate').empty();
	        for (var count = 0; count < changeItem.length; count++) {
	            var option = $("<option>" + changeItem[count] + "</option>");
	            $('#startDate').append(option);
	        }
	    });
	});
	
    $('#monthSelect').change(function() {
        //제이쿼리로 구현.!!
    	var January = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31];
        var February = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29];
    	var March = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31];
    	var April = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30];
    	var May = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31];
    	var June = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30];
    	var July = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31];
    	var August = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31];
    	var September = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30];
    	var October = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31];
    	var November = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30];
    	var December = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31];  
    	
        var changeItem;
        switch(this.value){
    	case "1" : changeItem = January; break;
    	case "2" : changeItem = February; break;
    	case "3" : changeItem = March; break;
    	case "4" : changeItem = April; break;
    	case "5" : changeItem = May; break;
    	case "6" : changeItem = June; break;
    	case "7" : changeItem = July; break;
    	case "8" : changeItem = August; break;
    	case "9" : changeItem = September; break;
    	case "10" : changeItem = October; break;
    	case "11" : changeItem = November; break;
    	case "12" : changeItem = December; break;
    	}
        
        $('#dateSelect').empty();
        for (var count = 0; count < changeItem.length; count++) {
            var option = $("<option>" + changeItem[count] + "</option>");
            $('#dateSelect').append(option);
        }
    });
});
		 
</script>

<%
Calendar cal = Calendar.getInstance();
int yearInt = cal.get(Calendar.YEAR);

	
%>

<h1>< 예약하기 ></h1>

<form name="myForm" action="calRegister.do" method="post">
<input type="hidden" name="id"  value="${userId}" >
<!-- 나중에 아이디는 로그인했을 때 세션에서 받아서 밸류에서 ${id}로 입력한다 -->

 <h3>열심히 일한 ${userId} 당신! 주저말고 떠나라~!!</h3>  
 <ul>
 <li>숙소명 : <span><input type="text" name="hotelName" autofocus required></span></li><br> 
 <li>관리 유형 : 
 	<select id="TypeSelect" name="TypeSelect" required>
 			<option value="">--선택--</option>
			<option value="type_reservation" selected>예약</option>
			<option value="type_scheduling" disabled>스케줄링</option>
 </select>
 </li><br>
 <li>날짜 : 
 	<select id="startYear" name="startYear">
			<option selected="selected"><%=yearInt%></option>
			<option><%=yearInt+1%></option>
	</select>년
	<select id="startMonth" name="startMonth" required>
			<%-- <option selected="selected"><%=monthInt+1%></option> --%>
			<option value="">월</option>
			<option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option>
			<option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option>
			<option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>
	</select>월 
	<select id="startDate" name="startDate" required>
	<option value="">날짜</option>
	</select>일
	~
 	<select id="yearSelect" name="yearSelect">
			<option selected="selected"><%=yearInt%></option>
			<option><%=yearInt+1%></option>
	</select>년
	<select id="monthSelect" name="monthSelect" required>
			<%-- <option selected="selected"><%=monthInt+1%></option> --%>
			<option value="">월</option>
			<option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option>
			<option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option>
			<option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>
	</select>월 
	<select id="dateSelect" name="dateSelect" required>
	<option value="">날짜</option>
	</select>일
 </li><br>
 <li>메모</li>
 <textarea name="reservationMemo" cols="55" rows="10" placeholder="ex)호캉스 가즈아~"></textarea>
 </ul>
 
 <input type="submit" value="등록">
 <input type="button" value="취소" onclick="cancle();">

</form>
 
<%-- <jsp:include page="/WEB-INF/views/include/footer.jsp" /> --%>
</body>
</html>