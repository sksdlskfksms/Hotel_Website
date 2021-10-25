<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이벤트</title>
<style type="text/css">
	a{ text-decoration: none; font-size:16px; font-weight:normal; line-height:17px; color:#555555; text-align:center; padding:13px 0; font-family: 'NanumFont2';}
	.event_search{ float:left;width:100%;margin-top:40px;padding:0 0 10px 0;}
	.event_search table{float: right; margin-right: 138px; }
	.event_box{ align-content: center;  width: 80%;}
	.event_list{ width:100%; float:left; margin-bottom: 50px;}
	.event_list th{ text-align:center;  font-family: 'NanumFont1'; color:#767676; font-size:13px; background-color:#f9f9f9; border-bottom:1px solid #e9e9e9; line-height:17px; padding:13px 0; border-top:1px solid #e9e9e9}
	.event_list td{  font-weight:normal; line-height:17px; color:#555555; text-align:center; padding:13px 0; border-bottom:1px solid #e9e9e9; font-family: 'NanumFont2';}
	.event_list td.title{ text-align:left; padding:11px 0 8px 12px;}
	.event_list td a{ font-weight:normal; line-height:17px; color:#555555; padding:13px 10px; font-family: 'NanumFont2';}
 	.submit {float:left; margin-left: 154px; margin-top: 17px;}
  	.submit a{float:left;}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/menu.jsp" /> 
	<center style="margin-top:180px;">
		<h1>이벤트</h1>
		<!-- 검색 시작 -->
		<div class="event_search">
			<div class="submit">
					<c:if test="${userRole ne 'guest' && not empty userId}">  
                <a class="btn btn-primary text-uppercase js-scroll-trigger" href="insertEventView.do">글 등록</a>
           			 </c:if>
			</div>
			<form action="getEventList.do" method="get">
				<table border="1" cellpadding="0" cellspacing="0">
					<tr>
						<td>
						<select name="type"  class="selectBox01 fl">
							<c:forEach items="${conditionMap }" var="option">
								<c:if test="${option.value eq 'TITLE'}">
									<option value="${option.value }" selected="selected">${option.key }
								</c:if>
								<c:if test="${option.value eq 'CONTENT'}">
									<option value="${option.value }">${option.key }
								</c:if>
							</c:forEach>							
						</select> 
						<input name="keyword" type="text" /> 
						<input type="submit" value="검색"></td><br>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<!-- 검색 종료 -->
		<div class="event_box">
		<table border="1" cellpadding="0" cellspacing="0" width="700"  class="event_list">
			<tr>
				<th width="80" >번호</th>
				<th width="500" style="border-left:1px solid #e6e6e6;border-bottom:1px solid #e6e6e6;font-weight:normal;font-size:16px">제목</th>
				<th width="100" style="border-left:1px solid #e6e6e6;border-bottom:1px solid #e6e6e6;font-weight:normal;font-size:16px">작성자</th>
				<th width="120" style="border-left:1px solid #e6e6e6;border-bottom:1px solid #e6e6e6;font-weight:normal;font-size:16px">등록일</th>
				<th width="80" style="border-left:1px solid #e6e6e6;border-bottom:1px solid #e6e6e6;font-weight:normal;font-size:16px">조회수</th>
			</tr>
			<c:forEach items="${eventList}" var="event">
				<tr>
					<td>${event.seq }</td>
					<td class="title"><a href="getEvent.do?seq=${event.seq }">${event.title }</a></td>
					<td>${event.writer }</td>
					<td><fmt:formatDate value="${event.regDate}" pattern="yyyy.MM.dd"/></td>
					<td>${event.cnt }</td>
				</tr>
			</c:forEach>
			<br>
		<!--  페이징 처리  -->
		   <tr>
			  <td colspan="5">
			     <c:if test="${pageMaker.prev}">
			   	 	<a href="${pageMaker.startPage-1}">Previous ${pageMaker.prev}</a>
			     </c:if>
			     <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			     	<a href="./getEventList.do?pageNum=${num}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">${num}</a>
			     </c:forEach>
			     <c:if test="${pageMaker.next}">
			     	 <a href="${pageMaker.endPage + 1}">Next ${pageMaker.next}</a>
			     </c:if>
			  </td>
			</tr>
		</table> 
		</div>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</center>
</body>
</html>