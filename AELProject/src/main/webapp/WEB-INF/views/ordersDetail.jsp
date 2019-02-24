<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@page import="com.ifive.ael.vo.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<%
	String id = (String) session.getAttribute("ID");
	List<OrdersVO> ordersDetail = (List<OrdersVO>) request.getAttribute("ordersDetail");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 주문 정보</title>
<style type="text/css">
.pnt {
	cursor: pointer;
	color: black;
	text-decoration: none;
}
</style>
</head>
<body>
<c:import url="nav.jsp" var="nav"></c:import>
${nav }
<br>  
<div style="position: absolute; left: 25.5%; width: 50.5%; height: 100%;">
	<table class="table table-striped">  
		<tr>    
			<td colspan="2" style="font-size: 17pt; text-align: center;"><b><a
					class="pnt"
					href="resDetail?RBNUM=<%=ordersDetail.get(0).getRBNUM()%>"><%=ordersDetail.get(0).getORNAME()%></a></b>
				</td> 
		</tr>
		<%
			int a = 0;
			for (int i = 0; i < ordersDetail.size(); i++) {
				a += ordersDetail.get(i).getORPRICE() * ordersDetail.get(i).getOAMOUNT();
		%>
		<tr>
			<td><b><%=ordersDetail.get(i).getOMENU()%> <%=ordersDetail.get(i).getOAMOUNT()%>개</b></td>
			<td style="text-align: right"><%=ordersDetail.get(i).getORPRICE() * ordersDetail.get(i).getOAMOUNT()%>원</td>
		</tr>
		<%
			}
		%> 
		<tr>
			<td><b>총액</b></td>
			<td style="text-align: right"><%=a%>원</td>
		</tr>
		<tr>
			<td style="font-size:20px ;text-align : center;" colspan="2"><br> 주소 : <%=ordersDetail.get(0).getOJTOTALADDR() %> </td>
		</tr>
		<tr>
			<td style="font-size:20px ;text-align: center;" colspan="2"><br> 주문일시 : <%=ordersDetail.get(0).getODATE()%> <%=ordersDetail.get(0).getOTIME()%> </td>
		</tr>
		<tr>
			<td style="font-size:20px ;text-align: center;" colspan="2">주문번호 : <%=ordersDetail.get(0).getONUM()%>
			</td>
		</tr>
		<tr>
		<td colspan="2" style="text-align: right">
		<button class="btn" onclick = "history.go(-1);">뒤로가기</button>
		
		</td>
		</tr>
		
	</table>
	</div>
</body>
</html>