<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring"  uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 로그인</title>
	<!-- Bootstrap core CSS -->
	<link href="resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
	<!-- 스타일 CSS -->
	<link href="resources/css/agency.css" rel="stylesheet">
</head>
<% String error = request.getParameter("error"); %>
<body>
<div align="center">
	<label><a class="navbar-brand js-scroll-trigger" href="index.do">@SpringHotel</a></label>
	<h1>관리자</h1>
		<form action="j_security_check" method="post">
			<table>
			<tr align="center">
				<td>
					<a href="login.do">유저로그인</a>
				</td>
				</tr>
				<tr height="80px">
					<td>
					<input type="text" name='j_username' placeholder="아이디" required autofocus
					 	   style="width: 300px; height: 50px;"/>
					</td>
				</tr>
				<tr>
					<td>
					<input type="password" name='j_password' placeholder="비밀번호" required
					 	   style="width: 300px; height: 50px;"/>
					</td>	
				</tr>
				<tr height="80px">
					<td style="border-bottom: #f8f7f9; border-bottom-style: inset;">
					<input type="submit" id="checkId" value="로그인"
					 	   style="width: 300px; height: 50px;"/>
					</td>
				</tr>
			</table>
			<% if (error != null) out.println("<p style='color:red;margin-top: 15;' align='center'>아이디 및 패스워드를 확인하세요</p>"); %>
		</form>
	</div>
</body>
</html>