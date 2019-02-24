<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.ifive.ael.vo.*"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>잘못된 접근</title>
<script type="text/javascript">
	$(document).ready(function() {
		alert(잘못 된 접근 방식 입니다.);
		location='http://192.168.0.27/ael/';
	});
</script>
</head>


<body>
<c:import url="nav.jsp" var="nav"></c:import>
${nav }


  <script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
</body>
</html>