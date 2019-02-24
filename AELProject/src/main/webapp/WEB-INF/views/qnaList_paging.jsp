<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@page import="com.ifive.ael.vo.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script>
function secret(QPASS,QNUM){
   if(${sessionScope.WHO} != 2){
      var result = prompt("비밀번호를 입력하세요.");
      /* var password = qnaList.QPASS; */
      if(result == QPASS){
         location="qnadetail?QNUM="+QNUM;   
      } else if(result != null) {      
         alert("비밀번호가 다릅니다.");
      }
   }else {
      location="qnadetail?QNUM="+QNUM;
   }
   
}
</script>
<title>QnA</title>
<meta charset="UTF-8">
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
	

	<img style="height: 50px; width: 90px;  margin-left:48%; border-radius: 10%;"
		src="./adImg/QnA.jpg">

	<br>
	
	<div style="position: absolute; left: 16.5%; width: 66.5%; height: 100%; margin-top: 50px;">
	<table class="table table-striped table table-bordered container">
		<tr style="text-align: center;">
			<td>글번호</td>
			<td>작성자</td>
			<td>제목</td>
			<td>날짜</td>
		</tr>
		<c:choose><c:when test="${!empty qnaList }">
		<c:forEach var="qna" items="${qnaList}">
			
				<tr style="text-align: center;">
					<td>${qna.QNUM }</td>
					<td>${qna.ID }</td>
					<td>
					<c:choose>
					<c:when test="${qna.QPASS eq '' || qna.QPASS eq null }">
					<a href="qnadetail?QNUM=${qna.QNUM}">${qna.QTITLE }</a>
					</c:when>
					<c:otherwise>
					<a onclick="secret('${qna.QPASS}','${qna.QNUM}')">비밀글입니다.🔒</a>
					</c:otherwise>
					
					</c:choose>
					</td>
					<td>${qna.QDATE }</td>
				</tr>
				<c:forEach var="qnaRe" items="${qnaRe}">
					<c:choose>
					<c:when test="${qna.QNUM eq qnaRe.QRE }">
					
					<tr>
							<td colspan="4" style="text-align: center; color: orange;">답변이 완료된 문의입니다. </td>
							
					</tr>
					
					</c:when>
					</c:choose>
			</c:forEach>
		</c:forEach>
		</c:when>
		<c:otherwise>
		등록된 QnA가 없습니다.
		</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="4" style="text-align: center;"><c:choose><c:when test="${sessionScope.WHO ne '2' }">
			<button class="btn btn-default" onClick="location='qnaWriteList'">문의하기</button></c:when></c:choose>
			
			<button class="btn btn-default" style="text-alian: center;" onclick="location='myQnA'">내문의 보기</button> </td>
		</tr>
	</table>
	<div style="text-align: center;">
	<nav>
  <ul class="pagination">
    <li>
	<c:choose>
		<c:when test="${pageVO.page<=1}">
			<a href="#" aria-label="Previous">&laquo;&nbsp;</a>
			</c:when>

		<c:when test="${pageVO.page>1}">
			<a href="qnaList?page=${pageVO.page-1}">&laquo;</a>&nbsp;
			</c:when>
	</c:choose>

	<c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}" var="i">
		<a href="qnaList?page=${i}">${i}</a>
	</c:forEach>

	<c:choose>
		<c:when test="${pageVO.page>=pageVO.maxPage}">
			<a href="#" aria-label="Next">&raquo;&nbsp;</a>
			</c:when>
		<c:when test="${pageVO.page<pageVO.maxPage}">
			<a href="qnaList?page=${pageVO.page+1}">&raquo;</a>&nbsp;
			</c:when>
	</c:choose>
				 </li>
  </ul>
</nav>
	</div>

</div>
	
	<!-- Bootstrap core JavaScript -->
	<script src="./resources/vendor/jquery/jquery.min.js"></script>
	<script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>