<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.spring.biz.myPage.CalVO"%>
<%@page import="com.spring.biz.myPage.BookingsVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	//달력 관련 정보
	Calendar cal = Calendar.getInstance();

	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");

	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH);
	int date = cal.get(Calendar.DATE);

	if (strYear != null) {
		year = Integer.parseInt(strYear);
		month = Integer.parseInt(strMonth);
		if (month == -1) {
			year = year - 1;
			month = 11;
		}
		if (month == 12) {
			year = year + 1;
			month = 0;
		}
	} else {

	}

	//년도/월 셋팅
	cal.set(year, month, 1);

	int startDay = cal.getMinimum(java.util.Calendar.DATE);
	int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
	int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
	int newLine = 0; //요일인덱스 (일요일 = 0, color=red, 토요일=7)

	//오늘 날짜 저장.
	Calendar todayCal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
	int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
	
	/* 모델에 저장된 체크인 날짜 가져오는 부분  */
	Set<Integer> daySet = new HashSet<Integer>();
	List<BookingsVO> bookingsList = (List<BookingsVO>) request.getAttribute("bookingsList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;" content="no-cache">
<title>캘린더</title>
<!-- 마이페이지 스타일 CSS -->
<link href="resources/css/myPage.css?var=17" rel="stylesheet">
<script type="text/javaScript" language="javascript"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/menu.jsp" />
<div class="container">
	<!-- 왼쪽 메뉴 -->
	<div class="menu-left">
		<section class="menu-section">
		<ul>
			<li class="menu-inactive"><a href="bookingsList.do"><i class="fas fa-list-alt"></i>예약 관리</a></li>
			<li class="menu-active" style="border-right-color: #003580;"><a href="cal.do"><i class="far fa-calendar-alt"></i>캘린더</a></li>
			<li class="menu-inactive"><a href="reviews.do"><i class="fas fa-star"></i>이용 후기</a></li>
			<li class="menu-inactive"><a href="profile.do"><i class="fas fa-user-cog"></i>회원 정보</a></li>
		</ul>
		</section>
	</div><!-- 왼쪽 메뉴 끝 -->
	<div class="main">
		<!-- 오늘 버튼 -->
		<div style="float:right;">
			<input type="button" onclick="javascript:location.href='<c:url value='/searchCal.do' />?id=${userId}&startYear=<%=year%>&startMonth=<%=month+1%>'" value="오늘"/>
		</div>
		<!--날짜 네비게이션  -->
		<div id="title">
			<h3>일정관리</h3>
			<a href="<c:url value='/searchCal.do' />?year=<%=year-1%>&amp;month=<%=month%>&id=${userId}&startYear=<%=year-1%>&startMonth=<%=month+1%>" target="_self">
				<b>&lt;&lt;</b><!-- 이전해 -->
			</a>
			<%if(month > 0 ){ %>
				<a href="<c:url value='/searchCal.do' />?year=<%=year%>&amp;month=<%=month-1%>&id=${userId}&startYear=<%=year%>&startMonth=<%=month%>" target="_self">
					<b>&lt;</b><!-- 이전달 -->
				</a>
			<%} else {%>
				<a href="<c:url value='/searchCal.do' />?year=<%=year%>&amp;month=<%=month-1%>&id=${userId}&startYear=<%=year%>&startMonth=<%=month%>" target="_self">
				<b>&lt;</b><!-- 이전달(이전해) -->
				</a>
			<%} %>
			&nbsp;&nbsp;<%=year%>년 <%=month+1%>월&nbsp;&nbsp;
			<%if(month < 12 ){ %>
				<a href="<c:url value='/searchCal.do' />?year=<%=year%>&amp;month=<%=month-1%>&id=${userId}&startYear=<%=year%>&startMonth=<%=month%>" target="_self">
					<b>&gt;</b><!-- 다음달 -->
				</a>
			<%}else{%>
				<a href="<c:url value='/searchCal.do' />?year=<%=year%>&amp;month=<%=month+1%>&id=${userId}&startYear=<%=year%>&startMonth=<%=month+2%>" target="_self">
					<b>&gt;</b><!-- 다음달(다음해) -->
				</a>
			<%} %>
			<a href="<c:url value='/searchCal.do' />?year=<%=year+1%>&amp;month=<%=month%>&id=${userId}&startYear=<%=year+1%>&startMonth=<%=month+1%>" target="_self">
				<b>&gt;&gt;</b><!-- 다음해 -->
			</a>
		</div><!-- 날짜 네비게이션 끝 -->
		<!-- 달력  -->
		<table id="content">
			<tr bgcolor="#CECECE">
				<th style="color:red;">일</th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
				<th style="color:#529dbc;">토</th>
			</tr>
			<tr>
				<%//처음 빈공란 표시
				for(int index = 1; index < start ; index++ ){
				  out.println("<td >&nbsp;</td>");
				  newLine++;
				}
				
				for(int index = 1; index <= endDay; index++){
					String color = "";
					String backColor = "#EFEFEF";
					
					if(newLine == 0) color = "RED";
					else if(newLine == 6) color = "#529dbc";
					else color = "BLACK";

					String sUseDate = Integer.toString(year);
					sUseDate += Integer.toString(month+1).length() == 1 ? "0" + Integer.toString(month+1) : Integer.toString(month+1);
					sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index) : Integer.toString(index);
					
					List<String> hotelName = new ArrayList<String>();
					
					/* 모델에서 예약 리스트 가져오는 부분  */
					for (int i = 0; i < bookingsList.size(); i++) {
						BookingsVO res = bookingsList.get(i);
						
						//체크인 체크아웃 날짜 데이터 추출
						String checkin = res.getCheckin().substring(0, 4) + res.getCheckin().substring(6, 8) + res.getCheckin().substring(10, 12);
						String checkout = res.getCheckout().substring(0, 4) + res.getCheckout().substring(6, 8) + res.getCheckout().substring(10, 12);
						int checkinDay = Integer.parseInt(checkin.substring(6));
						int checkoutDay = Integer.parseInt(checkout.substring(6));
						
						//id와 체크인 날짜 일치 여부 확인
						if ( res.getUser_id().equals(session.getAttribute("userId")) && sUseDate.equals(checkin)) {
							int cnt=0;
							for (int j = checkinDay; j <= checkoutDay; j++){
					            if(cnt==0) hotelName.add(res.getHotel().getHotelname());
								daySet.add(j);
					            cnt++;
							}
					      }
					}
					
					
					
					if(daySet.contains(index)){
					%>
						<td bgcolor='#FF5A5A' nowrap><%=index %><br>
						<a href="javascript:openResv('${userId}',<%=index%>,<%=year%>,<%=month+1%>)" style="color:<%=color%>">
							<%= %>
						</a><br>
					<%
					}
					else{
						out.println("<td bgcolor='"+backColor+"' nowrap>" + index);	
					}
					
					//Today표기
					int iUseDate = Integer.parseInt(sUseDate);
					if(iUseDate == intToday ) {
						backColor = "#c9c9c9";
						out.println("<br><strong>Today</strong>");
					}
					out.println("</td>");
					
					//요일 인덱스
					newLine++;
					if(newLine == 7){
					  out.println("</tr>");
					  if(index <= endDay)
					    out.println("<tr>");
					  newLine=0;
					}
				}
				
				//마지막 공란 LOOP
				while(newLine > 0 && newLine < 7)
				{
				  out.println("<td>&nbsp;</td>");
				  newLine++;
				}
				%>
			</tr>
		</table>
	</div><!-- #content 끝 -->
</div><!-- #container 끝 -->
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
<script>
function openResv(id,resvDate,startYear,startMonth,hotelName){	
    href="calclick.do?id="+id+"&startMonth="+startMonth+"&startYear="+startYear+"&resvDate="+resvDate;
    window.open(href,"pop",'top=200px, left=100px, height=250px, width=300px');
}
</script>
</html>