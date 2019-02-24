<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.ifive.ael.vo.*"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기</title>
<style type="text/css">
td{
text-align: center;
}
td > div{
font-size: 150%;
font-weight: bold;
}
</style>
</head>
<body>
<c:import url="nav.jsp" var="nav"></c:import>
${nav }
<img style="height: 100px; width: 100px; margin-left: 48%; margin-top:50px; border-radius: 50%;" 
   src="./proimg/${sessionScope.MIMG}"> 
   <div style="position: absolute; left: 16.5%; width: 66.5%; height: 100%; margin-top: 50px;">
<table class="table table-striped table table-bordered container">
<tr>
<td><div>식당이름</div></td>
<td><div>삭제</div></td>
</tr>
<c:choose><c:when test="${!empty favlist }">
<c:forEach var="fav" items="${favlist }">
<tr>
<td><a style="text-decoration: none; color: red; font-size: 120%;" href="resDetail?RBNUM=${fav.RBNUM }">${fav.FRNAME }</a></td>
<td><button class="btn" onClick="location='favDel?RBNUM=${fav.RBNUM}'">즐겨찾기 삭제</button></td>
</tr>
</c:forEach>
</c:when><c:otherwise>즐겨찾기한 음식점이 없습니다.</c:otherwise> </c:choose>
</table>
</div>
</body>
</html>