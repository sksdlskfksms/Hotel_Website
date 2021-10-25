<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매니저 목록</title>
<style type="text/css">
a {
	text-decoration: none;
	font-size: 20px;
	font-weight: normal;
	line-height: 17px;
	color: #555555;
	text-align: center;
	padding: 13px 0;
	font-family: 'NanumFont2';
}

.event_search {
	float: left;
	width: 100%;
	margin-top: 40px;
	padding: 0 0 10px 0;
}

.event_search table {
	float: right;
	margin-right: 190px;
}

.event_box {
	align-content: center;
	width: 80%;
}

.event_list {
	width: 100%;
	float: left;
}

.event_list th {
	text-align: center;
	font-family: 'NanumFont1';
	color: #767676;
	font-size: 13px;
	background-color: #f9f9f9;
	border-bottom: 1px solid #e9e9e9;
	line-height: 17px;
	padding: 13px 0;
	border-top: 1px solid #e9e9e9
}

.event_list td {
	font-weight: normal;
	line-height: 17px;
	color: #555555;
	text-align: center;
	padding: 13px 0;
	border-bottom: 1px solid #e9e9e9;
	font-family: 'NanumFont2';
}

.event_list td.title {
	text-align: left;
	padding: 11px 0 8px 12px;
}

.event_list td a {
	font-weight: normal;
	line-height: 17px;
	color: #555555;
	text-align: center;
	padding: 13px 0;
	font-family: 'NanumFont2';
}
</style>
<script>
function managerRevoke(id) {
	if (confirm("해당 유저에 권한을 해제하시겠습니까?")){
		alert("권한을 해제했습니다.")
		window.location.replace("managerRevoke.do?id="+id);
	}
}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/menu.jsp" />
	<center style="margin-top: 180px;">
		<h1>매니저 목록</h1>
<%-- 
		<!-- 검색 시작 -->
		<div class="event_search">
			<form action="getRequestList.do" method="get">
				<table border="1" cellpadding="0" cellspacing="0">
					<tr>
						<td>
						<select name="searchCondition" class="selectBox01 fl">
								<c:forEach items="${conditionMap }" var="option">
									<option value="${option.value }">${option.key }
								</c:forEach>
						</select>
						<input name="searchKeyword" type="text" /> <input type="submit"	value="등록"></td>
						<br>
						<c:choose>
							<c:when test="${userRole ne 'guest'}">
								<a class="btn btn-primary text-uppercase js-scroll-trigger"
									href="insertEventView.do">글 등록</a>
							</c:when>
						</c:choose>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<!-- 검색 종료 -->
--%>	<table border="1" cellpadding="0" cellspacing="0" width="1200" class="request_List">
				<tr height="50" align="center">
					<th width="15%"
						style="background-color:#81DAF5; font-size: 20px">아이디</th>
					<th width="15%"
						style="background-color:#81DAF5; font-size: 20px">이름</th>
					<th width="20%"
						style="background-color:#81DAF5; font-size: 20px">이메일</th>
					<th width="15%"
						style="background-color:#81DAF5; font-size: 20px">가입날짜</th>
					<th width="15%"
						style="background-color:#81DAF5; font-size: 20px">요청날짜</th>
					<th width="20%" colspan="2"
						style="background-color:#81DAF5; font-size: 20px">기능</th>
				</tr>
				<c:forEach items="${managerList}" var="user">
					<tr height="50" align="center">
						<th>${user.id }</th>
						<th>${user.name }</th>
						<th>${user.mail }</th>
						<th><fmt:formatDate value="${user.regDate}" pattern="yyyy/MM/dd/ hh:mm" /></th>
						<th><fmt:formatDate value="${user.requestDate}" pattern="yyyy/MM/dd/ hh:mm" /></th>
						<th><button type="button" class="btn btn-info text-uppercase js-scroll-trigger" onclick="managerGrant('${user.id}')">호텔조회</button>
							<button type="button" class="btn btn-danger text-uppercase js-scroll-trigger" onclick="managerRevoke('${user.id}')">권한해제</button></th>
					</tr>
				</c:forEach>
				<br>
<%-- 			<!--  페이징 처리  -->
				<tr>
					<td colspan="7">
						<c:if test="${pageMaker.prev}">
							<a href="${pageMaker.startPage-1}">Previous ${pageMaker.prev}</a>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage}"	end="${pageMaker.endPage}">
							<a href="./getNoticeList.do?pageNum=${num}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">${num}</a>
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<a href="${pageMaker.endPage + 1}">Next ${pageMaker.next}</a>
						</c:if>
					</td>
				</tr>
--%>
			</table>
			<br>
	</center>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>