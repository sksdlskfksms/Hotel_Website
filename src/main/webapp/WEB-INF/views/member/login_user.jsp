<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring"  uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="message.user.login.title"/></title>
	<!-- Bootstrap core CSS -->
	<link href="resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
	<!-- 스타일 CSS -->
	<link href="resources/css/agency.css" rel="stylesheet">
</head>
<% String error = request.getParameter("error"); %>
<body>
	<div align="center">
	<label><a class="navbar-brand js-scroll-trigger" href="index.do">@SpringHotel</a></label>
	<h1><spring:message code="message.user.login.title"/></h1>
		<form action="login.do" method="post">
			<table>
				<tr align="center">
					<td width="100">
					<a href="login.do?lang=en"><spring:message code="message.user.login.language.en"/></a>
					<a href="login.do?lang=ko"><spring:message code="message.user.login.language.ko"/></a>
					<a href="indexAdmin.do">관리자</a>
					</td>
				</tr>
				<tr height="80px">
					<td>
					<input type="text" name="id" placeholder="<spring:message code="message.user.login.id"/>" required autofocus
					 	   style="width: 300px; height: 50px;"/>
					</td>
				</tr>
				<tr>
					<td>
					<input type="password" name="password" placeholder="<spring:message code="message.user.login.password"/>" required
					 	   style="width: 300px; height: 50px;"/>
					</td>	
				</tr>
				<tr height="80px">
					<td style="border-bottom: #f8f7f9; border-bottom-style: inset;">
					<c:if test = "${error eq 1}">
					<div id="failMsg" align="center"><p style="color:red;margin-top: 15;">아이디 및 패스워드를 확인해 주세요</p></div>
					</c:if>
					<input type="submit" value=<spring:message code='message.user.login.loginBtn'/>
					 	   style="width: 300px; height: 50px;"/>
					</td>
				</tr>
			</table>
			<div style="margin-top: 10;">
				<label><a href="searchId.do">아이디 찾기</a></label>
				<span aria-hidden="true">|</span>
				<label><a href="searchPw.do">패스워드 찾기</a></label>
				<span aria-hidden="true">|</span>
				<label><a href="addmember.do">회원가입</a></label>
			</div>
			<% if (error != null) out.println("<p style='color:red;margin-top: 15;' align='center'>아이디 및 패스워드를 확인하세요</p>"); %>
		</form>
	</div>
</body>
</html>