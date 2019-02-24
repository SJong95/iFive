<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.ifive.ael.vo.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>resadList</title>
</head>
<script>
function resno(rbnum){
	var result = prompt("거절 사유:\n2: 사업자 등록번호 조회 불가\n3: 사업자 등록번호 조회시 정보가 다른경우");
	if(result == 2 || result == 3){
		location="resno?RBNUM="+rbnum+"&DIVI="+result;	
	}
	
	
}
</script>
<body>
<c:import url="nav.jsp" var="nav"></c:import>
${nav }
<h3>
사업자 인증
</h3>
<!-- 1월 31일 수정(전체) -->
<table border="1">
<c:choose><c:when test="${!empty resadList }">
	<c:forEach var="res" items="${resadList}">
			<tr>
				<td>${res.ID}</td>
				<td>${res.RBNUM }</td>
				<td>${res.RNAME }</td>
				<td>${res.RADDR }</td>
				<td>${res.RTEL }</td>
				<td>${res.RCATE }</td>
				<td><a href="resDelAction?RBNUM=${res.RBNUM}">삭제승인</a></td>
				<td><a onclick="resno('${res.RBNUM}')">거절</a></td>
			</tr>	
		</c:forEach>
	</c:when><c:otherwise>삭제요청한 음식점이 없습니다.</c:otherwise> </c:choose>
	</table>
	2: 사업자 등록번호 조회 불가
	3: 사업자 등록번호 조회시 정보가 다른경우
</body>
</html>