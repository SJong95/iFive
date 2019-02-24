<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ifive.ael.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 문의</title>
<style>
a:link {
	text-decoration: none;
	color: #333333;
}

a:visited {
	text-decoration: none;
	color: #333333;
}

a:active {
	text-decoration: none;
	color: #333333;
}

a:hover {
	text-decoration: underline;
	color: red;
}

table {
	margin: auto;
}

h1 {
	text-align: center;
}
</style>
</head>
<body>
	<c:import url="nav.jsp" var="nav"></c:import>
	${nav }
</head>

<img style="height: 50px; width: 90px; margin-top: 20px; margin-bottom:20px; margin-left:48%; border-radius: 10%;"
		src="./img/QnA.jpg">
<body>
<div style="position: absolute; left: 16.5%; width: 66.5%; height: 100%; margin-top: 50px;">
	<table class="table table-striped table table-bordered container">

		<tr style="text-align: center;">
			<td>글번호</td>
			<td>작성자</td>
			<td >제목</td>
			<td>날짜</td>
		</tr>


		<c:choose>
			<c:when test="${!empty myQna }">
				<c:forEach var="qnamy" items="${myQna}">

					<tr style="text-align: center;">
						<td>${qnamy.QNUM }</td>
						<td>${qnamy.ID }</td> 
						<td style="text-align: center;"><a href="qnadetail?QNUM=${qnamy.QNUM}">${qnamy.QTITLE }</a>
						</td>
						<td>${qnamy.QDATE }</td>
					</tr>
					<c:forEach var="qnaRe" items="${qnaRe}">
						<c:choose>
							<c:when test="${qna.QNUM eq qnaRe.QRE }">

								<tr>
									<td colspan="4" style="text-align: center; color: orange;">답변이
										완료된 문의입니다.</td>

								</tr>

							</c:when>
						</c:choose>
					</c:forEach>
				</c:forEach>
			</c:when>
			
			
			<c:otherwise></c:otherwise>
		</c:choose>
		<tr>
			<td colspan="4" style="text-align: center;"><c:choose>
					<c:when test="${sessionScope.WHO ne '2' }">
						<button class="btn btn-default" onClick="location='qnaList?page=1'">돌아가기</button>
					</c:when>
				</c:choose> </td>
		</tr>
	</table>
	</div>
</body>
</html>