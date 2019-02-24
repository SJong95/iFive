<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.ifive.ael.vo.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 신고 접수</title>
<style>
table {
margin : auto;
}
h1 {
text-align: center;
}
</style>
</head>
<body>
<c:import url="nav.jsp" var="nav"></c:import>
${nav }
<h1>매장 신고 접수</h1>
	<form action="resReportAccept" method="POST">
		<table border="1">
			<tr>
				<td>
					<input type="hidden" name="RBNUM" id="RBNUM" value="${resVO.RBNUM}">
					매장명
				</td>
				<td>
					<input type="text" name="RNAME" id="RNAME" value="${resVO.RNAME }" readonly>
				</td>	
			</tr>
			<tr>
				<td>작성자</td>
				<td>
				<input type="text" name="ID" id="ID" value="${sessionScope.ID }" readonly>
				</td>
			</tr>
			<tr>
				<td>분류</td>
				<td>
					<select name="RDVI" id="RDVI">
					<option value="1">문의</option>
					<option value="2">불만</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="20" cols="40" name="RCONTENT" id="RCONTENT" required="required" style="width:500px; height:200px;"></textarea></td>
			</tr>
			<tr>
				<td colspan=2 align="center">
				<input type="submit" value="글쓰기"> 
				<input type="reset" value="다시작성"></td>
			</tr>
		</table>
	</form>
</body>
</html>