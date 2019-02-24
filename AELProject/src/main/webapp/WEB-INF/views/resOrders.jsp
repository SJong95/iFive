<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ifive.ael.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 현황</title>
</head>
<script>
	function orderTime(onum) {
		var result = prompt("30분 이상 입력하세요");
		if (result >= 5 && result <= 60) {
			location = "ordersPer?ONUM=" + onum + "&time=" + result;
		} else {
			alert("30분 이상 입력하세요");
		}
	}
</script>
<body>
	<c:import url="nav.jsp" var="nav"></c:import>
	${nav }
	<br>
	<!-- 1월 31일 수정(전체) -->
	<table class="table table-hover"
		style="font-size: 15pt; margin: auto; text-align: center;">
		<tr style="font-weight: bold;">
			<td>주문번호</td>
			<td>주문자</td>
			<td>가격</td>
			<td>메뉴이름</td>
			<td>수량</td>
			<td>구분</td>
			<td>요청사항</td>
			<td colspan="2">Y/N</td>
		</tr>
		<c:choose>
			<c:when test="${!empty resOrders }">
				<c:forEach var="res" items="${resOrders}">
					<tr>
						<td>${res.ONUM}</td>
						<td>${res.ID}</td>
						<td>${res.ORPRICE }</td>
						<td>${res.OMENU }</td>
						<td>${res.OAMOUNT }</td>
						<td>${res.OCHOICE }</td>
						<td>${res.OCALL }</td>
						<td><a onclick="orderTime('${res.ONUM}')">승인</a></td>
						<td><a onclick="resno1('${res.RBNUM}')">거절</a></td>
					</tr>
				</c:forEach>
			</c:when>
<<<<<<< HEAD
			<c:otherwise><tr><td colspan="8">주문현황이 없습니다.</td></tr></c:otherwise>
=======
			<c:otherwise>주문현황이 없습니다.</c:otherwise>
>>>>>>> branch 'master' of https://github.com/SJong95/iFive.git
		</c:choose>
	</table>

</body>
</html>