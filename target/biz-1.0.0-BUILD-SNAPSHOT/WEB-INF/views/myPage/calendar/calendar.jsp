<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Date"%>
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	int newLine = 0; //요일인덱스 (일요일=0,red / 토요일=6,blue / 7=tr줄바꿈)

	//오늘 날짜 저장.
	Calendar todayCal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
	int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
	
	/* 모델에서 예약 리스트 데이터 가져오는 부분  */
	Set<Integer> daySet = new HashSet<Integer>();
	List<BookingsVO> bookingsList = (List<BookingsVO>) request.getAttribute("bookingsList");
	
	List<String> hotelName = new ArrayList<String>();
	List<String> checkin = new ArrayList<String>();
	List<String> checkout = new ArrayList<String>();
	Map<Integer, String> map1 = new HashMap<>();
	
	for (int i = 0; i < bookingsList.size(); i++) {
		BookingsVO res = bookingsList.get(i);
		//체크인 체크아웃 날짜 데이터 추출
		checkin.add(res.getCheckin().substring(0, 4) + res.getCheckin().substring(6, 8) + res.getCheckin().substring(10, 12));
		checkout.add(res.getCheckout().substring(0, 4) + res.getCheckout().substring(6, 8) + res.getCheckout().substring(10, 12));
		int checkinDay = Integer.parseInt(checkin.get(i).substring(6));
		int checkoutDay = Integer.parseInt(checkout.get(i).substring(6));
		 
		if(!(res.getState().equals("취소"))){
			//id와 체크인 날짜 일치 여부 확인
			if ( res.getUser_id().equals(session.getAttribute("userId")) & 
				Integer.parseInt(res.getCheckin().substring(0,4))==year & 
				Integer.parseInt(res.getCheckin().substring(6,8))==month+1) {
		// 			int cnt=0;
					for (int j = checkinDay; j <= checkoutDay; j++){
						hotelName.add(res.getHotel().getHotelname());
					  for(int k=0; k<hotelName.size(); k++){
		            	daySet.add(j);
			            map1.put(j,hotelName.get(k));
						}
					}
		      }
		 }//state체크 if문
	} 
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;" content="no-cache">
<title>캘린더</title>
<style type="text/css">
/* 여기 */
	table#content tr td{ 
	  max-height: 100px; 
	  max-width: 119px;  
	  background: #EFEFEF;
	  vertical-align: top;
	  padding: 3px;
	 }
	div.hotelNameDiv1 {
	  white-space: nowrap; 
	  width: 119px;
	  height: 65px;
	  overflow: hidden;
	  text-overflow: ellipsis; 
	  display: table-cell;
	  vertical-align: bottom;
	  max-width: 119px;
	  position: relative;
	  overflow: hidden;
	  line-height: 18px;
	  cursor: pointer;
	  white-space: nowrap;
	}
	
	.hotelNameDiv2{
	  background: yellowgreen;`
      height: 23px;
      padding-top: 4px;
	  display: inline-block;
      *display: inline;
      overflow: hidden;
      text-overflow: ellipsis;
      zoom: 1;
      white-space: nowrap;
	}
	div.hotelNameDiv2 a{
	  font-size: 16px;
	  width: 119px;
	  color: black;
	  margin: 2px;
	  text-overflow:ellipsis;
	}
	.hoteltd{
	  padding-top: 5px !important;
	}
</style>
<!-- 마이페이지 스타일 CSS -->
<link href="resources/css/myPage.css?var=17" rel="stylesheet">
<script type="text/javaScript" language="javascript"></script>
</head>
<body>
<!-- 로그인 경고창 -->
	<c:if test="${empty userId}">
		<div class="ui-widget" style="height: 20px; display: inline-block; width: 100%;">
			<div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
				<p style="margin: 15px;"> 
					<span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
					<strong>로그인 후 이용해주세요 </strong><br> 
					<a href="login.do" style="color:blue;">로그인</a>
					하고 다시 이용하시겠습니까?
				</p>
			</div>
		</div>
	</c:if>
<!-- 로그인 경고창 끝 -->
<jsp:include page="/WEB-INF/views/include/menu.jsp" />
<div class="container">
	<!-- 왼쪽 메뉴 -->
	<div class="menu-left">
		<section class="menu-section">
		<ul>
			<li class="menu-inactive"><a href="profile.do"><i class="fas fa-user-cog"></i>회원 정보</a></li>
			<li class="menu-inactive"><a href="bookingsList.do"><i class="fas fa-list-alt"></i>예약 관리</a></li>
			<li class="menu-active" style="border-right-color: #003580;"><a href="calendar.do"><i class="far fa-calendar-alt"></i>캘린더</a></li>
			<li class="menu-inactive"><a href="reviews.do"><i class="fas fa-star"></i>이용 후기</a></li>
		</ul>
		</section>
	</div><!-- 왼쪽 메뉴 끝 -->
	<div class="main">
		<!-- 오늘 버튼 -->
		<div style="float:right;">
			<input type="button" onclick="javascript:location.href='<c:url value='/calendar.do' />'" value="오늘"/>
		</div>
		<!--날짜 네비게이션  -->
		<div id="title">
			<h3>일정관리</h3>
			<a href="<c:url value='/calendar.do' />?year=<%=year-1%>&amp;month=<%=month%>" target="_self" style="margin-right:8px;">
<!-- 				<b>&lt;&lt;</b> 이전해-->
				<i class="fas fa-chevron-circle-left"></i>
			</a>
			<%if(month > 0 ){ %>
				<a href="<c:url value='/calendar.do' />?year=<%=year%>&amp;month=<%=month-1%>" target="_self">
					<b>&lt;</b><!-- 이전달 -->
				</a>
			<%} else {%>
				<a href="<c:url value='/calendar.do' />?year=<%=year%>&amp;month=<%=month-1%>" target="_self">
				<b>&lt;</b><!-- 이전달(이전해) -->
				</a>
			<%} %>
			&nbsp;&nbsp;<%=year%>년 <%=month+1%>월&nbsp;&nbsp;
			<%if(month < 12 ){ %>
				<a href="<c:url value='/calendar.do' />?year=<%=year%>&amp;month=<%=month+1%>" target="_self">
					<b>&gt;</b><!-- 다음달 -->
				</a>
			<%}else{%>
				<a href="<c:url value='/calendar.do' />?year=<%=year%>&amp;month=<%=month+1%>" target="_self">
					<b>&gt;</b><!-- 다음달(다음해) -->
				</a>
			<%} %>
			<a href="<c:url value='/calendar.do' />?year=<%=year+1%>&amp;month=<%=month%>" target="_self" style="margin-left:8px;">
<!-- 				<b>&gt;&gt;</b>다음해 --><i class="fas fa-chevron-circle-right"></i>
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
				int listIndex = 0;
				String sUseDateChange2 = "";//전역변수 선언
				
				for(int index = 1; index < start ; index++ ){
				  out.println("<td >&nbsp;</td>");
				  newLine++;
				}
				
				for(int index = 1; index <= endDay; index++){
					String color = "";
					
					if(newLine == 0) color = "RED";
					else if(newLine == 6) color = "#529dbc";
					else color = "BLACK";

					String sUseDate = Integer.toString(year);
					sUseDate += Integer.toString(month+1).length() == 1 ? "0" + Integer.toString(month+1) : Integer.toString(month+1);
					sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index) : Integer.toString(index);

					int iUseDate = Integer.parseInt(sUseDate);
					
					if(daySet.contains(index) ){ 
						SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyymmdd");
						SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy-mm-dd");
						Date sUseDateChange = null;
						
						sUseDateChange = beforeFormat.parse(sUseDate);
						sUseDateChange2 = afterFormat.format(sUseDateChange);
						/* 여기 */
					%>
					<%if(iUseDate == intToday ){%>
						<td class="hoteltd" style="background-color: #FFE400"><%=index %><br>
						<div class="hotelNameDiv1">
							<div class="hotelNameDiv2">
							<a href="javascript:openResv('${userId}','<%=sUseDateChange2%>')">
								<%=map1.get(index) %>
							</a></div>
						</div>
						</td><!-- td 닫는 태그 추가 -->
					<%}else{ %>
						<td class="hoteltd"><%=index %><br>
						<div class="hotelNameDiv1">
							<div class="hotelNameDiv2">
							<a href="javascript:openResv('${userId}','<%=sUseDateChange2%>')">
								<%=map1.get(index) %>
							</a></div>
						</div>
						</td><!-- td 닫는 태그 추가 -->
					<%} %>
					<%
						listIndex++;
					}
					else{
						if(iUseDate == intToday ) {
						out.println("<td nowrap style=\"background-color:#FFE400\"><p>" + index + "</p>");
						}else{
						out.println("<td nowrap style=\"color:"+color+ "\"><p>" + index + "</p>");	
						}
							
					}
					
					/* //Today표기
					iUseDate = Integer.parseInt(sUseDate);
					if(iUseDate == intToday ) {
						//out.println("<br><strong>Today</strong>");
					} */
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
function openResv(user_id,checkinDate){	
    href="calclick.do?user_id="+user_id+"&checkinDate="+checkinDate;
    window.open(href,"pop",'top=200px, left=100px, height=250px, width=300px');
}
</script>
</html>