<%@page import="com.spring.biz.myPage.CalVO"%>
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


<%
Calendar cal = Calendar.getInstance();
int yearInt = cal.get(Calendar.YEAR);

List<CalVO> HotelNameList = (List<CalVO>)request.getAttribute("HotelNameList");
System.out.println("테스트 : "+HotelNameList);	
%>

<h2>< 호텔 예약 검색  ></h2>

<form name="myForm" action="searchCal.do" method="post">

<!-- 나중에 아이디는 로그인했을 때 세션에서 받아서 밸류에서 ${id}로 입력한다 -->

 <!-- <h3>○○○님의 예약 및 스케줄링</h3> -->  
 <ul>
 <li>아이디 : <span><input type=text name="id"  value="${userId}"></span></li><br>
 <li>숙소명 : <select id="hotelName" name="hotelName" required>
 			<option value="">선택</option>
			<%for(int i=0; i<HotelNameList.size(); i++){
				CalVO hotelnamelist = HotelNameList.get(i); %>
			<option value="<%=hotelnamelist.getHotelName()%>"><%=hotelnamelist.getHotelName()%></option><%} %>
			</select>
 </li><br>
 <!-- <span><input type="text" name="hotelName" autofocus required></span></li><br> --> 
 <li>시작날짜 : 
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
	
 </li><br>
 </ul>
 
 <input type="submit" value="검색">
 <input type="button" value="취소" onclick="cancle();">

</form>
 
<%-- <jsp:include page="/WEB-INF/views/include/footer.jsp" /> --%>
</body>
</html>