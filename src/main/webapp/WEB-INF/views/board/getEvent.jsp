<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>이벤트 상세</title>
<style type="text/css">
	.event_box{margin: 15px 330px;}
    h1{ float:left; width:100%; height:84px; background-color:#1457a8;text-align:center; font-family: 'NanumFont2'; color:#fff; font-size:35px; font-weight:bold; padding-top:18px; margin-bottom:10px}
	.event_list tr td:FIRST-CHILD{width:165px;  text-align:center;  font-family: 'NanumFont1'; color:#767676; font-size:25px; background-color:#f9f9f9; border-bottom:1px solid #e9e9e9; line-height:17px; padding:13px 0; border-top:1px solid #e9e9e9}
	.event_list .line_R{ border-right:1px solid #eaeaea}
	.event_list tr td{ font-weight:normal; line-height:17px; color:#555555; text-align:center; padding:13px 0; border-bottom:1px solid #e9e9e9; font-family: 'NanumFont2';}
	.event_list .line_N{ border-right:none}
	.event_list .line_B{ border-bottom:1px solid #acacac}
	.event_list td.title{ text-align:left; padding:11px 0 8px 12px;}
	a{ text-decoration: none; font-size:25px; font-weight:normal; line-height:17px; color:#555555; text-align:center; padding:13px 0; font-family: 'NanumFont2';}
	input{width: 98%;  height: 50px; font-size: 25px;}
	.textArea{width: 98%; height: 400px; font-size: 20px;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body style="margin-top: 100px;">
<jsp:include page="/WEB-INF/views/include/menu.jsp" /> 
	<center>
		<h1>이벤트</h1>
		<div class="event_box">
		<form action="updateEvent.do">
			<input name="seq" type="hidden" value="${event.seq}" />
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" >
			<input type="hidden" name="type" value="${pageMaker.cri.type}" >
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}" >
			
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td width="70">제목</td>
					<td align="left"><input name="title" type="text"
						value="${event.title }" /></td>
				</tr>
				<tr>
					<td >작성자</td>
					<td align="left"><input name="writer" value="${event.writer}" readonly></td>
				</tr>
				<tr>
					<td >내용</td>
					<td align="left"><textarea name="content" cols="40" rows="10">${event.content }</textarea></td>
				</tr>
				<tr>
					<td >등록일</td>
					<td align="left"><fmt:formatDate value="${event.regDate }" pattern="yyyy/MM/dd hh:mm"/></td>
				</tr>
				<tr>
					<td >조회수</td>
					<td align="left">${event.cnt }</td>
				</tr>
				<c:if test="${userName eq event.writer}">
				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="글 수정" /></td>
				</tr>
				</c:if>
			</table>
		</form>
		</div>
		<hr>
		<c:if test="${userName eq event.writer}">
		<a href="insertEventView.do">글등록</a>&nbsp;&nbsp;&nbsp; 
		</c:if>
		<c:if test="${userName eq event.writer}">
		<a href="deleteEvent.do?seq=${event.seq }&pageNum=${pageMaker.cri.pageNum}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">글삭제</a>&nbsp;&nbsp;&nbsp;
		</c:if>
		<a href="getEventList.do?pageNum=${pageMaker.cri.pageNum}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">글목록</a>
	</center>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
