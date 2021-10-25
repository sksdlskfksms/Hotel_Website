<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>패스워드 찾기</title>
	<!-- Bootstrap core CSS -->
	<link href="resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
	<!-- 스타일 CSS -->
	<link href="resources/css/agency.css" rel="stylesheet">
</head>
<% String pw = (String)session.getAttribute("searchPw"); %>
<body>
<div align="center">
	<label><a class="navbar-brand js-scroll-trigger" href="index.do">@SpringHotel</a></label>
	<h1>패스워드 찾기</h1>
		<form action="searchPw.do" method="post">
			<table>
			<tr align="center">
				<td>
					<a href="login.do">유저로그인</a>
					<span aria-hidden="true">|</span>
					<label><a href="searchId.do">아이디 찾기</a></label>
				</td>
				</tr>
				<tr height="70px">
					<td>
					<input type="text" name='id' placeholder="아이디" required autofocus
					 	   style="width: 300px; height: 50px;"/>
					</td>
				</tr>
				<tr height="70px">
					<td>
					<input type="text" name='name' placeholder="이름" required autofocus
					 	   style="width: 300px; height: 50px;"/>
					</td>
				</tr>
				<tr height="70px">
					<td >
					<input type="text" name='mail' placeholder="Email" required
					 	   style="width: 300px; height: 50px;"/>
					</td>	
				</tr>
				<tr height="70px">
					<td style="border-bottom: #f8f7f9; border-bottom-style: inset;">
					<input type="submit" value="검색" style="width: 300px; height: 50px;"/>
					</td>
				</tr>
			</table>
		<% if(pw != "fail" & pw != null){ out.println("<p align='center'>패스워드는 <p style='color:blue;margin-top: 15;'>"+ pw +"</p> 입니다.</p>"); }
						else if(pw == "fail"){ out.println("<p style='color:red;margin-top: 15;' align='center'>가입되지 않은 회원 정보 입니다.</p>"); }%>
		</form>
	</div>
</body>
</html>