<%@page import="com.spring.biz.myPage.BookingsVO"%>
<%@page import="java.util.List"%>
<%@page import="com.spring.biz.myPage.CalVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="pop" >
      <div id="inPopHead">< 예약정보 ></div><br>
      <div id="inPop">
      <% List<BookingsVO> resvCont = (List<BookingsVO>)request.getAttribute("resvCont"); 
        if(resvCont!=null){
        	for(int i=0; i<resvCont.size(); i++){
      %>
      - 예약번호 : <%=resvCont.get(i).getBooking_id() %><br>
      <%-- - 숙소명 : <%=resvCont.get(i).getHotel().getHotelname() %><br> --%>
	  - 투숙객 : <%=resvCont.get(i).getGuest_name() %><br>
	  - 연락망 : <%=resvCont.get(i).getGuest_email() %><br>
	  - 체크인 : <%=resvCont.get(i).getCheckin() %><br>
	  - 체크아웃 : <%=resvCont.get(i).getCheckout() %><br>
	  - 예약일 : <%=resvCont.get(i).getBooking_date() %><br>
	  - 예약상태 : <%=resvCont.get(i).getState() %><br>
	  <% } } %>
      </div><br>
	  <div id="close" onclick="self.close()">close</div>
</div>
</body>
</html>