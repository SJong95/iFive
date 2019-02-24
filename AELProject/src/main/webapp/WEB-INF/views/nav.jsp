<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/font.css" rel="stylesheet">
 <link href="./css/landing-page.min.css" rel="stylesheet">
<style>
body{
 background-color: #f5f5f5;
}
.navbar {
  min-height: 70px;
  background-color: #DC1400;
  margin-bottom: 0px;
}
.navbar-brand {
  padding: 0 15px;
  height: 70px;
  line-height: 70px;
}
@media (min-width: 768px) {
  .navbar-nav > li > a{
    /* (80px - line-height of 27px) / 2 = 26.5px */
    padding-top: 24.5px;
    padding-bottom: 24.5px;
    line-height: 25px;
    color: white;
  }
  .navbar-nav > li > button{
  margin-right: 15px;
  	margin-top: 17.5px;
    margin-bottom: 17.5px;
    line-height: 25px;
  }
  .navbar-nav > li > div{
  margin-right: 15px;
 	margin-top: 14.5px;
    margin-bottom: 14.5px;
    line-height: 25px;
  }
}
.navbar-nav>li>a:hover{color:#000;background-color:#FF7171;}
.navbar-nav>li>a{
border-radius: 8px;
}
.btn-primary, .btn-primary:hover {
	background-color: #ff8a00;
	border-color: #ff8a00;
}
.btn-primary:hover{
color:#000;
}
.photo3 {
	width: 100px;
	height: 100px;
	object-fit: cover;
	border-radius: 50%;
}

</style>
</head>
<body>
<%
		String ID = (String) session.getAttribute("ID");
	%>

	<!-- Navigation -->
	<nav class="navbar navbar-light bg-light navbar-fixed-top">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header" style="cursor: pointer;"><img class="navbar-brand" src="./adImg/logo.jpg" onclick="javascript:location='http://192.168.0.27/ael/'">
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse">
      <ul class="nav navbar-nav">
        <li class="active"><a href="http://192.168.0.27/ael/">Main <span class="sr-only">(current)</span></a></li>
        <li><a href="noticeList?page=1">공지사항</a></li>
        <li><a href="qnaList?page=1">QnA</a></li>
      </ul>
	<ul class="nav navbar-nav navbar-right">
			<%
				if (ID == null) {
			%>
			<li><button class="btn btn-primary navbar-btn" onclick="location.href='loginForm'">로그인</button></li>
			
			<li><button class="btn btn-primary navbar-btn"
				onclick="location.href='memberJoinForm'">회원 가입</button></li>
			<%
				} else {
			%>
			<li><button class="btn btn-primary navbar-btn" onclick="location.href='logout'">로그아웃</button></li>
			
			<%
				}
			%>

			<c:choose>
				<c:when test="${sessionScope.WHO eq '0' }">
					<li><button class="btn btn-primary navbar-btn"
						onclick="location.href='Page'">내정보</button></li>
					<li><div class="" style="width: 45px; height: 45px">
						<img class="photo3"
							style="height: 100%; width: auto; margin-top: 0px"
							src="./proimg/${sessionScope.MIMG}">
					</div></li>
				</c:when>

				<c:when test="${sessionScope.WHO eq '1' }">
					<li><button class="btn btn-primary navbar-btn"
						onclick="location.href='Page'">매장
						관리</button></li>
					<li><div style="width: 45px; height: 45px">
						<img class="photo3"
							style="height: 100%; width: auto; margin-top: 0px"
							src="./proimg/${sessionScope.MIMG}">
					</div></li>
				</c:when>

				<c:when test="${sessionScope.WHO eq '2' }">
					<li><button class="btn btn-primary navbar-btn"
						onclick="location.href='adminPage'">관리자
						모드</button></li>
				</c:when>

			</c:choose>
		</ul>

		</div>
		</div>
	</nav>
	<nav class="navbar navbar-light bg-light navbar-static-top" style="margin-bottom: 5px;">
	</nav>
	
	<c:set var="location">
        <script>document.write(location.pathname);</script>
    </c:set>
    <c:choose>
    <c:when test="${sessionScope.WHO eq '0' && (location ne '/ael/myBas' && location ne '/ael/payForm')}">
    <button class="btn btn-default navbar-fixed-bottom pull-right photo3" onclick="location='myBas'" type="button" style="background-color:#DC1400; bottom: 15px; right: 15px; left: unset; width: 65px; height: 65px;">
    	<i class="fa fa-shopping-bag" style="color: white;font-size: 40px;" aria-hidden="true"></i>
	</button>
    </c:when>
    
    </c:choose>
	
	
	
</body>
</html>