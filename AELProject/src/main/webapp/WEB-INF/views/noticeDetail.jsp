<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@page import="com.ifive.ael.vo.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>상세 글</title>
<style type="text/css">
table {
	margin: auto;
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
		<img style="height: 100px; width: 400px; margin-left:38%; border-radius: 10%;"
		src="./adImg/notice.png">
	<br>

	 <div style="position: absolute; left: 16.5%; width: 66.5%; height: 100%; margin-top: 50px;">
			<section id="noticeWriteformArea">
			<form action="noticeWrite" method="post" class="form-signin" >
				<h2 class="form-signin-heading">공지사항 작성</h2>
				<div class="form-group">
    				<label for="NTITLE">작성날짜</label> 
   					<input type="text" value="${noticeDetail.NDATE }" class="form-control" readonly="readonly">
   					
				</div>
				<div class="form-group">
				<label for="NDIVI">구분</label>
				<div class="input-group">
					<div class="btn-group btn-group-toggle" data-toggle="buttons">
					<c:choose>
						<c:when test="${noticeDetail.NDIVI == '0'}"> 
						<label class="btn btn-default">
							이벤트
						</label>
						</c:when>
						<c:otherwise>
						<label class="btn btn-default">
							공지
						</label>
						</c:otherwise>
					</c:choose>
					</div>
   					</div>
				</div>
				<div class="form-group">
    				<label for="NTITLE">제목</label>
   					<input type="text" id="NTITLE" name="NTITLE" class="form-control" value="${noticeDetail.NTITLE}" readonly="readonly">
				</div>
				<div class="form-group">
					<label for="NCONTENT">글내용</label>
					<textarea rows="7" class="form-control" name="NCONTENT" id="NCONTENT" required readonly style="resize: none;">${noticeDetail.NCONTENT }</textarea>
				</div>
				
				<div class="row">
				<div class="btn-group col-md-4 col-md-offset-4">
						<button class="btn btn-lg btn-default" type="button" onClick="javascript:history.back()">목록으로</button>
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