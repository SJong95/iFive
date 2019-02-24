<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@page import="com.ifive.ael.vo.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
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
 
	
	<br> 
	<img style="height: 100px; width: 400px; margin-left:38%; border-radius: 10%;"
		src="./adImg/notice.png">
	<br>
 
	 <div style="position: absolute; left: 16.5%; width: 66.5%; height: 100%; margin-top: 50px;">
	<table class="table table-striped table table-bordered container">
	<tr>
			<td>구분</td>
			<td>제목</td>
			<td>작성자</td>
			<td>날자</td>
			</tr>
		<c:forEach var="notice" items="${noticeList}">

			
			<tr>
				<td style="color: red;"><c:choose>
						<c:when test="${notice.NDIVI == '0'}"> 
					이벤트
					</c:when>
						<c:otherwise>
				         공지
					   </c:otherwise>
					</c:choose></td>
				<td style="width: 600px;">
				<a href="noticeDetail?NNUM=${notice.NNUM}">${notice.NTITLE }</a></td>
				<td>관리자</td>
				<td><a>${notice.NDATE }</a>
				</td>
			</tr>
		</c:forEach>
		
		<c:choose>
			<c:when test="${sessionScope.WHO eq '2' }">
		<tr>
			<td colspan="5" >
					<button class="btn" onClick="location='noticerWrite'">공지하기</button>
			</td>
		</tr>
			</c:when>
		</c:choose>
	</table>
	
	
	<div style="margin: auto; text-align: center;">
		<form id="search" name="search" action="noticeList" method="GET">
			<input type="hidden"  name="page" value="1">
			<div class="input-group" style="margin : auto;"> 
			<div class="input-group-addon" style= " width: 66.5%; padding: 0px;">
			<input class="form-control" type="text" name="NTITLE" id="NTITLE" placeholder="검색" value="">
			 <button class="btn" onclick="sendForm()">검색</button></div></div>

			
		</form>
	</div>
	
	
	<!--  -->
	
	
	<div style="text-align: center;">
	<nav>
  <ul class="pagination">
    <li>
		<c:choose>
		
		
			<c:when test="${pageVO.page<=1}">
			<a href="#" aria-label="Previous">&laquo;&nbsp;</a>
			</c:when>

			<c:when test="${pageVO.page>1}">
				<a href="noticeList?page=${pageVO.page-1}">&laquo;</a>&nbsp;
			</c:when>
		</c:choose>

		<c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}" var="i">
			<c:choose>
				<c:when test="${pageVO.NTITLE ne ''}">
					<a href="noticeList?page=${i}&NTITLE=${pageVO.NTITLE}" aria-label="Previous">${i}</a>
				</c:when>
				<c:otherwise>
					<a href="noticeList?page=${i}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<c:choose>
			<c:when test="${pageVO.page>=pageVO.maxPage}">
			<a href="#" aria-label="Next">&raquo;&nbsp;</a>
			</c:when>
			<c:when test="${pageVO.page<pageVO.maxPage}">
				<a href="noticeList?page=${pageVO.page+1}" aria-label="Next">&raquo;</a>&nbsp;
			</c:when>
			
		</c:choose>
		 </li>
  </ul>
</nav>
		
		</div>
	<%-- <div style="text-align: center;">
		<c:choose>
			<c:when test="${pageVO.page<=1}">
			[이전]&nbsp;
			</c:when>

			<c:when test="${pageVO.page>1}">
				<a href="noticeList?page=${pageVO.page-1}">[이전]</a>&nbsp;
			</c:when>
		</c:choose>

		<c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}" var="i">
			<c:choose>
				<c:when test="${pageVO.NTITLE ne ''}">
					<a href="noticeList?page=${i}&NTITLE=${pageVO.NTITLE}">${i}</a>
				</c:when>
				<c:otherwise>
					<a href="noticeList?page=${i}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<c:choose>
			<c:when test="${pageVO.page>=pageVO.maxPage}">
			[다음]&nbsp;
			</c:when>
			<c:when test="${pageVO.page<pageVO.maxPage}">
				<a href="noticeList?page=${pageVO.page+1}">[다음]</a>&nbsp;
			</c:when>
		</c:choose>
		</div> --%>
	</div>
	<!-- 검색 -->
	<!-- Bootstrap core JavaScript -->
	<script src="./resources/vendor/jquery/jquery.min.js"></script>
	<script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>