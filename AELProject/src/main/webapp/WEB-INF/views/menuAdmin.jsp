<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ifive.ael.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴관리</title>
</head>
<body>
	<c:import url="nav.jsp" var="nav"></c:import>
	${nav }
	<br>
	<div style="width: 70%; text-align: center; margin: auto;">
		<table class="table table-hover" style="font-size:15pt;margin: auto;">
			<tr>
				<td>사진</td>
				<td>음식 이름</td>
				<td>가격</td>
				<td>정보</td>
				<td>수정</td>
				<td>삭제</td>
			</tr>

			<c:choose>
				<c:when test="${!empty menuAdmin }">
					<c:forEach var="menu" items="${menuAdmin}">
						<tr>
							<td style="width: 123px; height: 82.5px; padding: 0;">
							<img style="width: 100%; height: 100%;" alt="${menu.MNAME}" src="./mImg/${menu.MIMG}">
							</td>
							<td style="vertical-align: middle;"><b>${menu.MNAME }</b></td>
							<td style="vertical-align: middle;">${menu.MPRICE }</td>
							<td style="vertical-align: middle;">${menu.MTMI }</td>
							<td style="vertical-align: middle;">
							<button class="btn btn-success" onclick="javascript:location.href='menuModifyForm?RBNUM=${menu.RBNUM }&MNAME=${menu.MNAME }'">메뉴 수정</button></td>
							<td style="vertical-align: middle;">
							<button class="btn btn-danger" onclick="location='menuDelete?MNAME=${menu.MNAME}&RBNUM=${menu.RBNUM}'">메뉴 삭제</button>
							</td>
						</tr>

					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td>메뉴를 등록 후 이용해 주세요</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
</body>
</html>
