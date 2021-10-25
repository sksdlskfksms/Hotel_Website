<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.spring.biz.myPage.CalVO"%>
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
	int newLine = 0;

	//오늘 날짜 저장.
	Calendar todayCal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
	int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));

	//model에 담긴 데이터 가져오기
	List<CalVO> resList = (List<CalVO>) request.getAttribute("resList");
	List<Integer> resDayList = new ArrayList<Integer>();
	Set<Integer> daySet = new HashSet<Integer>();
	String myHotelName = (String) request.getAttribute("myHhotelName");

	for (int i = 0; i < resList.size(); i++) {
		CalVO res = resList.get(i);
		System.out.println(res.getId() + ":" + res.getStartDate() + ":" + res.getDateSelect());
		int getStartYear = res.getStartYear();
		int getYearSelect = res.getYearSelect();
		int getStartMonth = Integer.parseInt(res.getStartMonth());
		int getMonthSelect = Integer.parseInt(res.getMonthSelect());
		if (getStartYear == year & getYearSelect == year & getStartMonth == month + 1
				& getMonthSelect == month + 1) {
			for (int j = res.getStartDate(); j <= res.getDateSelect(); j++) {
				daySet.add(j);
			}
		}
	}
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
		<!-- 검색 -->
		<div class="search-container">
			<form name="myForm" action="searchCal.do" method="post">
				<div class="search">
					<label><span>숙소명</span></label>
					<input type="text" name="hotelName"  placeholder="숙소명" required style="font-size:15px;">
				</div>
					<input class="btn btn-primary text-uppercase js-scroll-trigger" type="submit" value="검색">
			</form>
		</div><!-- 검색 끝 -->
		<!-- 오늘 버튼 -->
		<div style="float:right;">
			<input type="button" onclick="javascript:location.href='<c:url value='/cal.do?id=hong' />'" value="오늘"/>
		</div>
		<!--날짜 네비게이션  -->
		<div id="title">
			<h3>일정관리</h3>
			<a href="<c:url value='/cal.do' />?year=<%=year-1%>&amp;month=<%=month%>&id=hong" target="_self">
				<b>&lt;&lt;</b><!-- 이전해 -->
			</a>
			<%if(month > 0 ){ %>
				<a href="<c:url value='/cal.do' />?year=<%=year%>&amp;month=<%=month-1%>&id=hong" target="_self">
					<b>&lt;</b><!-- 이전달 -->
				</a>
			<%} else {%>
				<a href="<c:url value='/cal.do' />?year=<%=year%>&amp;month=<%=month-1%>&id=hong" target="_self">
				<b>&lt;</b><!-- 이전달(이전해) -->
				</a>
			<%} %>
			&nbsp;&nbsp;<%=year%>년 <%=month+1%>월&nbsp;&nbsp;
			<%if(month < 12 ){ %>
				<a href="<c:url value='/cal.do' />?year=<%=year%>&amp;month=<%=month+1%>&id=hong" target="_self">
					<b>&gt;</b><!-- 다음달 -->
				</a>
			<%}else{%>
				<a href="<c:url value='/cal.do' />?year=<%=year%>&amp;month=<%=month+1%>&id=hong" target="_self">
					<b>&gt;</b><!-- 다음달(다음해) -->
				</a>
			<%} %>
			<a href="<c:url value='/cal.do' />?year=<%=year+1%>&amp;month=<%=month%>&id=hong" target="_self">
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
				for(int index = 1; index < start ; index++ )
				{
				  out.println("<td >&nbsp;</td>");
				  newLine++;
				}
				
				for(int index = 1; index <= endDay; index++)
				{
					String color = "";
				
					if(newLine == 0){			color = "RED";
					}else if(newLine == 6){ 	color = "#529dbc";
					}else{						color = "BLACK"; };
				
					String sUseDate = Integer.toString(year);
				
					sUseDate += Integer.toString(month+1).length() == 1 ? "0" + Integer.toString(month+1) : Integer.toString(month+1);
					sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index) : Integer.toString(index);
				
					int iUseDate = Integer.parseInt(sUseDate);
					
					String backColor = "#EFEFEF";
					if(iUseDate == intToday ) {
						backColor = "#c9c9c9";
					}
					if(daySet.contains(index)){
						//if(iUseDate>=startB & iUseDate<=lastB) {
						//if(TypeSelect=="예약"){backColor = "#FF5A5A";} else if(TypeSelect=="스케줄링"){backColor = "#00C6ED";}  
						backColor = "#FF5A5A";
						out.println("<td bgcolor='"+backColor+"' nowrap>");
					}else{
					//else if(iUseDate<startB | iUseDate>lastB){
						out.println("<td bgcolor='"+backColor+"' nowrap>");	
					}
					%>
					<!-- 매우 매우 중요한 코드~!! a태그, 클래스, 스타일 -->
					<a href="javascript:openResv('hong',<%=index%>,<%=year%>,<%=month+1%>,'<%=myHotelName%>')" style="color:<%=color%>">
					   <%=index %>
					</a>
					<%-- ondblclick="location.href='schedule.do?year=<%=year%>&month=<%=month %>&date=<%=index%>'" --%>
					<!-- onclick="test()" -->
					<%-- <input type="hidden" class="iDate" value="<%=iUseDate%>" > --%>
					<br>
					<%if(iUseDate == intToday ) {%>
						<strong>Today</strong>
					<% }%>
					<%
					out.println("<br>");
					out.println(iUseDate);
					out.println("<br>");
					//기능 제거	
					out.println("</td>");
					newLine++;
				
					if(newLine == 7)
					{
					  out.println("</tr>");
					  if(index <= endDay)
					  {
					    out.println("<tr>");
					  }
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
</html>