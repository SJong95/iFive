<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@page import="com.ifive.ael.vo.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>패스워드 변경</title>
<meta charset="utf-8">
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
<script>
	//자바 스크립트 함수 선언
	function passConfirm() {
		// 비밀번호, 비밀번호 확인 입력창에 입력된 값을 비교해서 같다면 비밀번호 일치, 다르면 비밀번호 불일치라는 텍스트를 출력함.
		var password = document.getElementById('PW');
		var passwordConfirm = document.getElementById('PWCONFIRM');
		var passHelp = document.getElementById("passHelp");
		if (password.value == passwordConfirm.value) {
			$("#PW").parent().removeClass('has-error').addClass('has-success');
			$("#PWCONFIRM").parent().removeClass('has-error').addClass('has-success');
			$('.glyphicon').removeClass('glyphicon-remove').addClass('glyphicon-ok');
			passHelp.style.color = "#3c763d";
			passHelp.innerHTML = "비밀번호가 일치합니다.";
		} else {
			$("#PW").parent().addClass('has-error'); 
			$("#PWCONFIRM").parent().addClass('has-error');
			if($('.glyphicon').hasClass('glyphicon-ok')){
				$('.glyphicon').removeClass('glyphicon-ok').addClass('glyphicon-remove');
			}else{
				$('.glyphicon').addClass('glyphicon-remove')
				$('.glyphicon').addClass('glyphicon-remove')	
			}
			passHelp.style.color = "#a94442";
			passHelp.innerHTML = "비밀번호가 일치 하지 않습니다.";
		}
	}
	function pwcheck() {
		var pw = (document.getElementById("PWPW").value);
		var nowpw = (document.getElementById("NOWPW").value);
		var newpw = (document.getElementById("PW").value);
		var newpwcon = (document.getElementById("PWCONFIRM").value);
		var pwReg = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{1,50}).{8,20}$/;

		if (nowpw == '') {
			alert('현재 비밀번호를 입력해주세요.')
		}else if (nowpw == '' || pw != nowpw){
			alert('현재 비밀번호가 일치하지않습니다.')
		}else if (nowpw == '' || pw != nowpw || newpw == ''){
			alert('새 비밀번호를 입력해주세요.')
		}else if (nowpw == '' || pw != nowpw || newpw == '' || !pwReg.test(newpw)){
			alert('비밀번호는 영,숫자,특수문자를 포함하여 8~20자 이내로 기입해주세요.')
		}else if (nowpw == '' || pw != nowpw || newpw == '' || !pwReg.test(newpw) || nowpw == newpw){
			alert('새 비밀번호가 기존 비밀번호와 일치합니다.')
		}else if (nowpw == '' || pw != nowpw || newpw == '' || !pwReg.test(newpw) || nowpw == newpw || newpwcon == ''){
			alert('비밀번호 확인을 입력해주세요.')
		}else if (nowpw == '' || pw != nowpw || newpw == '' || !pwReg.test(newpw) || nowpw == newpw || newpwcon == '' || newpw != newpwcon){
			alert('새 비밀번호와 중복확인이 일치하지 않습니다.')
		}else{
			document.getElementById("pwchangeForm").submit();
		}
	   }
</script>
<body>
<c:import url="nav.jsp" var="nav"></c:import>
${nav }
<img style="height: 100px; width: 100px; margin-left: 48%; margin-top:50px; border-radius: 50%;" 
	src="./proimg/${sessionScope.MIMG}"> 
							 
	<div style="position: absolute; left: 16.5%; width: 66.5%; height: 100%; margin-top: 50px;">
		<section id="pwchangeformArea">
			<form name="pwchangeForm" id="pwchangeForm" action="pwchange" method="POST" class="form-signin">
				<h2 class="form-signin-heading">비밀번호 변경</h2>
				<div class="form-group">
    				<input type="hidden" name="ID" value="${pwchange.ID}" />
					<input type="hidden" name="PWPW" id="PWPW" value="${pwchange.PW }" />
				</div>
				<div class="form-group ">
    				<label for="NOWPW">현재 비밀번호 입력</label>
   					<input type="password" name="NOWPW" class="form-control" id="NOWPW" required="required" placeholder="현재 비밀번호"/>
				</div>
				<div class="form-group has-feedback">
    				<label for="PW">새 비밀번호 입력</label>
   					<input type="password" class="form-control" name="PW" id="PW" placeholder="새 비밀번호" onkeyup="passConfirm()">
   					<small id="passHelp" class="form-text text-muted"></small>
   					<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
				</div>
				<div class="form-group has-feedback"> 
    				<label for="PWCONFIRM">새 비밀번호 확인</label>
   					<input type="password" class="form-control" name="PWCONFIRM" id="PWCONFIRM" placeholder="비밀번호 확인" onkeyup="passConfirm()">
   					<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
				</div>
				<div class="row">
				<div class="btn-group col-md-8 col-md-offset-3"> 
					<button class="btn btn-lg btn-info" onclick="pwcheck()" type="button">변경하기</button>
					<button class="btn btn-lg btn-default"  type="button" onclick="javascript:history.back()">뒤로가기</button>
				</div>
					</div>	
			</form>
		</section>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
</body>
</html>