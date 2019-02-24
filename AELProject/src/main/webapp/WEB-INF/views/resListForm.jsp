<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ifive.ael.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나중 안씀</title>
</head>
<body>
<c:import url="nav.jsp" var="nav"></c:import>
${nav }
	<h1>음식점 페이지</h1>
	<h3>세션 아이디 확인 : ${sessionScope.ID }님이 로그인 하셨습니다.</h3>
			<a href="resList?cate=치킨">치킨</a>
			<br>
			<a href="resList?cate=피자/양식">피자/양식</a>
			<br>
			<a href="resList?cate=중식">중식</a>
			<br>
			<a href="resList?cate=한식">한식</a>
			<br>
			<a href="resList?cate=일식/돈까스">일식/돈까스</a>
			<br>
			<a href="resList?cate=족발/보쌈">족발/보쌈</a>
			<br>
			<span style="cursor: pointer;" onclick="javascript:location='main'">이전으로</span>
			<br>
			<a href="logout">로그아웃</a>

</body>
</html>