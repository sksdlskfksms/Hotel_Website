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
	
	//ȣ�� �ڵ� �� -> ȣ�� �Է� �������� ����
	/*function gethotelCode(h_code){
		//alert(h_code);
		opener.document.getElementById("hotelcode").value=h_code;
		self.close(); 
	}*/
	// ���� 
	// href="javascript:gethotelCode('${hotel.hotelcode}');"
	
	function onmouseColor(){
		hotellist.style.color="Blue";
	}
	
	function novalueclose(){
		alert("�ߺ��� ���� �����ϴ�.");
		window.close();
	}
</script>
<style> /* �� ���� */
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
	<!-- select �ɼ����� üũ onselect change-->
	<!-- üũ �� â�ݱ� -->

	<ul>
		<%int i=0; %>
		<c:forEach var="hotel" items="${hotellist}">
			<li><a id="hotellist" 
			onmouseover="this.style.color='blue'" onmouseout="this.style.color='black'" title="���� ��� ���θ� Ȯ�����ּ���!">ȣ�ڸ�
					: ${hotel.hotelname} �ڵ� : ${hotel.hotelcode} �ּ� : ${hotel.address} ${hotel.addressdetail}</a></li>
			<br>
			<%i++; %>
		</c:forEach>
		�� <%=i%>�� ��ȸ��
		<%if(i==0){%>
		<script>novalueclose();</script>
			
		<%} %>
		
	</ul>
	<input type="button" value="â�ݱ�" onclick="window.close()">
</body>
</html>