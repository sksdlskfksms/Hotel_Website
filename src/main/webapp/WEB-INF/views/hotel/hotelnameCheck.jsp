<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
	function gethotelName(){
		document.getElementById("cIhotelname").value=opener.document.getElementById("hotelname").value;
	}
	
	//호텔 코드 값 -> 호텔 입력 페이지로 전덜
	/*function gethotelCode(h_code){
		//alert(h_code);
		opener.document.getElementById("hotelcode").value=h_code;
		self.close(); 
	}*/
	// 사용시 
	// href="javascript:gethotelCode('${hotel.hotelcode}');"
	
	function onmouseColor(){
		hotellist.style.color="Blue";
	}
	
	function novalueclose(){
		alert("중복된 값이 없습니다.");
		window.close();
	}
</script>
<style> /* 블릿 제거 */
ul {
	list-style: none;
}

a:link {
	color: black;
	text-decoration: none;
}
</style>

</head>
<body onload="gethotelName();">
	<!-- select 옵션으로 체크 onselect change-->
	<!-- 체크 시 창닫기 -->

	<ul>
		<%int i=0; %>
		<c:forEach var="hotel" items="${hotellist}">
			<li><a id="hotellist" 
			onmouseover="this.style.color='blue'" onmouseout="this.style.color='black'" title="기존 등록 여부를 확인해주세요!">호텔명
					: ${hotel.hotelname} 코드 : ${hotel.hotelcode} 주소 : ${hotel.address} ${hotel.addressdetail}</a></li>
			<br>
			<%i++; %>
		</c:forEach>
		총 <%=i%>개 조회됨
		<%if(i==0){%>
		<script>novalueclose();</script>
			
		<%} %>
		
	</ul>
	<input type="button" value="창닫기" onclick="window.close()">
</body>
</html>