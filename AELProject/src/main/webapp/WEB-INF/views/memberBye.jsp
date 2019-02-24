<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@page import="com.ifive.ael.vo.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<!-- 새로생김 -->
<script>
function memberBye(){
	var pw = (document.getElementById("NOWPW").value);
	var pw2 = (document.getElementById("PW").value);
	
	if(pw2 == ''){
		alert ('비밀번호를 입력해주세요')
	}else if(pw2 == '' || pw != pw2){
		alert ('비밀번호가 일치하지 않습니다.')
	}else{
		var result = confirm("정말로?");
		if(result){
			location="memberBye";
		}else{
			location="Page";
		}
	
	}
	
}
</script>
<style type="text/css">
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
<body>
<c:import url="nav.jsp" var="nav"></c:import>
${nav }
<img style="height: 100px; width: 100px; margin-left: 48%; margin-top:50px; border-radius: 50%;" 
	src="./proimg/${sessionScope.MIMG}">
	
	<div style="position: absolute; left: 16.5%; width: 66.5%; height: 100%; margin-top: 50px;">
		<section id="joinformArea">
			<form name="memberByeForm" id="memberByeForm" action="memberBye" method="POST" class="form-signin" enctype="multipart/form-data">
				<h2 class="form-signin-heading">회원 탈퇴</h2>
				<div class="form-group">
    				<label for="ID">아이디</label>
    				<input type="text" class="form-control" name="ID" value="${memberbye.ID}"
					readonly="readonly" />
					<input type="hidden" name="NOWPW" id="NOWPW"
					value="${memberbye.PW }" />
				</div>
				<div class="form-group">
					<label for="PW">비밀번호 확인 </label>
					<input type="password" class="form-control" name="PW" id="PW"
					required="required" />
				</div>
				<div class="row">
				<div class="btn-group col-md-8 col-md-offset-3"> 
					<button class="btn btn-lg btn-info" type="button" onclick="memberBye()">회원탈퇴</button>
					<button class="btn btn-lg btn-default"  type="button" onclick="javascript:history.back()">뒤로가기</button>
				</div>
					</div>	
			</form>
		</section>
	</div> 
	
</body>
</html>