<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>새글등록</title>
<style type="text/css">
	.notice_box{margin: 15px 330px;}
    h1{ float:left; width:100%; height:84px; background-color:#1457a8;text-align:center; font-family: 'NanumFont2'; color:#fff; font-size:35px; font-weight:bold; padding-top:18px; margin-bottom:10px}
	.notice_list tr td:FIRST-CHILD{width:165px;  text-align:center;  font-family: 'NanumFont1'; color:#767676; font-size:25px; background-color:#f9f9f9; border-bottom:1px solid #e9e9e9; line-height:17px; padding:13px 0; border-top:1px solid #e9e9e9}
	.notice_list .line_R{ border-right:1px solid #eaeaea}
	.notice_list tr td{ font-weight:normal; line-height:17px; color:#555555; text-align:center; padding:13px 0; border-bottom:1px solid #e9e9e9; font-family: 'NanumFont2';}
	.notice_list .line_N{ border-right:none}
	.notice_list .line_B{ border-bottom:1px solid #acacac}
	.notice_list td.title{ text-align:left; padding:11px 0 8px 12px;}
	a{ text-decoration: none; font-size:25px; font-weight:normal; line-height:17px; color:#555555; text-align:center; padding:13px 0; font-family: 'NanumFont2';}
	input{width: 98%;  height: 50px; font-size: 25px;}
	.textArea{width: 98%; height: 400px; font-size: 20px;}
</style>
</head>
<body style="margin-top: 100px;">
<jsp:include page="/WEB-INF/views/include/menu.jsp" /> 
	<center>
		<h1>공지사항</h1>
		<div class="notice_box">
			<form action="insertNotice.do" method="post" enctype="multipart/form-data">
				<table border="1" cellpadding="0" cellspacing="0" class="notice_list">
					<tr>
						<td bgcolor="white" width="70" >제목</td>
						<td align="left"><input type="text" name="title" /></td>
					</tr>
					<tr>
						<td >작성자</td>
						<td align="left"><input type="text" name="writer" value="${userName}" size="30" readonly/></td>
					</tr>
					<tr>
						<td >내용</td>
						<td align="left"><textarea name="content" cols="180" rows="60" class="textArea"></textarea></td>
					</tr>
					<tr>
						<td >파일</td>
						<td align="left"><input type="file" name="uploadFile"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
						<input type="submit" value=" 새글 등록 " /></td>
					</tr>
				</table>
			</form>
		</div>
		<hr>
		<a href="getNoticeList.do">글 목록 가기</a>
	</center>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>