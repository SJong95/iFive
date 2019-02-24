<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.ifive.ael.vo.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>

<html lang="ko">
<head>

<title>문의 하기</title>

  <meta charset="utf-8">
<style>
table {
margin : auto;
}
h1 {
text-align: center;
}
body {
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }

      .form-signin {
        width:500px;
        padding: 19px 29px 29px;
        margin: 0 auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      .form-signin .form-signin-heading,
      .form-signin .checkbox {
        margin-bottom: 10px;
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
	<section id="noticeWriteformArea">
			<form action="qnaWrite" method="post" class="form-signin" >
				<h2 class="form-signin-heading">QnA 작성</h2>
				<div class="form-group">
    				<label for="ID">작성자</label>
   					<input type="text" name="ID" id="ID" required="required" class="form-control" value="${sessionScope.ID }" readonly>
				</div>
				<div class="form-group">
    				<label for="QPASS">비밀번호</label>
   					<input type="password" class="form-control" name="QPASS" id="QPASS">
   					
				</div>
				<div class="form-group">
    				<label for="NTITLE">제목</label>
   					<input type="text" name="QTITLE" id="QTITLE" class="form-control" required="required">
				</div>
				<div class="form-group">
					<label for="NCONTENT">문의 내용</label>
					<textarea class="form-control"  rows="10" style="resize: none;" name="QCONTENT" id="QCONTENT"></textarea>
				</div>
				<div class="row">
						<div class="btn-group col-md-8 col-md-offset-3"> 
						<button class="btn btn-lg btn-info">글 쓰기</button>
						<button class="btn btn-lg btn-default"  type="button" onclick="javascript:history.back()">뒤로가기</button>
						</div>
						</div>
			</form>
			
		</section>
	</div>
	
	<!-- Bootstrap core JavaScript -->
  <script src="./resources/vendor/jquery/jquery.min.js"></script>
  <script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>