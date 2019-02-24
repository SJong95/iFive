<%@page import="java.util.List"%>
<%@page import="com.ifive.ael.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>음식점 관리</title>

</head>

<body>
	<c:import url="nav.jsp" var="nav"></c:import>
	${nav }


	<%
		List<ResVO> resList = (List<ResVO>) request.getAttribute("resList");
	%>
	<%
		for (int i = 0; i < resList.size(); i++) {
	%>



	<div style="text-align: center;">
		<br> <img src="./rImg/<%=resList.get(i).getRES_IMG()%>"
			class="photo3" style="width: 70px; height: 70px"> <br> <b
			style="font-size: 20pt">매장명 : <%=resList.get(i).getRNAME()%></b> <br>
		<%
			if (resList.get(i).getDIVI().equals("1")) {
		%>
		<button class="btn btn-default"
			onclick="javascript:location.href='resModifyForm?RBNUM=<%=resList.get(i).getRBNUM()%>'">매장정보수정</button>
		<button class="btn btn-default"
			onclick="javascript:location.href='menuAddForm?RBNUM=<%=resList.get(i).getRBNUM()%>'">메뉴등록</button>
		<button class="btn btn-default"
			onclick="javascript:location.href='menuAdmin?RBNUM=<%=resList.get(i).getRBNUM()%>'">메뉴관리</button>
		<button class="btn btn-default"
			onclick="javascript:location.href='resOrders?RBNUM=<%=resList.get(i).getRBNUM()%>'">주문현황</button>
		<br>
		<%
			}
		%>
		<br>
		<!-- DIVI부분 다수정됨 -->
		<b>나의 음식점 상태 : 
		<%
			if (resList.get(i).getDIVI().equals("0")) {
		%> 
		승인진행중
		<%
			} else if (resList.get(i).getDIVI().equals("1")) {
		%>
		승인완료 <a href="resDel?RBNUM=<%=resList.get(i).getRBNUM()%>">[삭제 요청]</a>
		<%
			} else if (resList.get(i).getDIVI().equals("2")) {
		%>
		관리자에 의해 승인거절되었습니다. (사업자 등록번호 조회 불가) <a
			href="resPer?RBNUM=<%=resList.get(i).getRBNUM()%>">[재승인 요청]</a>
		<%
			} else if (resList.get(i).getDIVI().equals("3")) {
		%>
		관리자에 의해 승인거절되었습니다. (사업자 등록번호 조회 결과 회원정보와 일치하지 않음) <a
			href="resPer?RBNUM=<%=resList.get(i).getRBNUM()%>">[재승인 요청]</a>
		<%
			}
		%>
		<br>
		<%
			}
		%>
		</b>
	</div>
	<hr>
	<div style ="text-align: center;">
	<b><a href="Page">리스트로 돌아가기</a></b>
	</div>


	<!-- Bootstrap core JavaScript -->
	<script src="./resources/vendor/jquery/jquery.min.js"></script>
	<script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>