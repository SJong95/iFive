<%@page import="com.ifive.ael.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@page import="com.ifive.ael.vo.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 주소</title>
</head>
<body>
<c:import url="nav.jsp" var="nav"></c:import>
${nav }
<img style="height: 100px; width: 100px; margin-left: 48%; margin-top:50px; border-radius: 50%;" 
	src="./proimg/${sessionScope.MIMG}"> 
	<div style="position: absolute; left: 16.5%; width: 66.5%; height: 100%; margin-top: 50px;">
	<table class="table table-striped table table-bordered container">
<c:choose><c:when test="${!empty jusoList }">

	<c:forEach var="juso" items="${jusoList}">
		<c:choose>
			<c:when test="${juso.JBEST eq '1'}">
					<tr>
						<th scope="col" style="text-align: center; vertical-align: middle;">대표 주소</th>
						<td colspan="2" style="vertical-align: middle; font-size: 25px; font-weight:bold; text-align: center;"> ${juso.JTOTALADDR}</td>
						<td style="text-align: center;"><button class="btn btn-danger" onclick="location='jusoDel?JTOTALADDR=${juso.JTOTALADDR}'">주소삭제</button></td>
					</tr>
			</c:when>
		</c:choose>
	</c:forEach>
	<c:forEach var="juso" items="${jusoList}">
	<c:choose>
			<c:when test="${juso.JBEST eq '0'}">
					<tr>
					<th scope="col" style=" vertical-align: middle; text-align: center;">등록된 주소</th>
					<td style="vertical-align: middle;">${juso.JTOTALADDR}</td>
					<td style="vertical-align: middle; text-align: center;"><button class="btn btn-success" onclick="location='mainjuso?JTOTALADDR=${juso.JTOTALADDR}'">대표주소로 설정</button></td>
					<td style="vertical-align: middle; text-align: center;"><button class="btn btn-danger" onclick="location='jusoDel?JTOTALADDR=${juso.JTOTALADDR}'">주소삭제</button></td>
					</tr>
			</c:when>
	<c:otherwise>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	</c:when>
	<c:otherwise>
	등록된 주소가 없습니다. 주소를 등록해 주세요~
	</c:otherwise>
	
	</c:choose>
	
	</table>
	</div>
	
</body>
</html>