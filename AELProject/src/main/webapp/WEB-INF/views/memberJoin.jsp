<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@page import="com.ifive.ael.vo.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>회원가입</title>
    <meta charset="utf-8">

    <!-- 스타일 -->
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
  </head>
  
<head>
<meta charset="UTF-8">
<title>memberJoin</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	function OnCheckPhone(oTa) {
		var oForm = oTa.form;
		var sMsg = oTa.value;
		var onlynum = "";
		var imsi = 0;
		onlynum = RemoveDash2(sMsg); //하이픈 입력시 자동으로 삭제함 
		onlynum = checkDigit(onlynum); // 숫자만 입력받게 함 
		var retValue = "";

		if (event.keyCode != 12) {
			if (onlynum.substring(0, 2) == 02) { // 서울전화번호일 경우  10자리까지만 나타나교 그 이상의 자리수는 자동삭제 
				if (GetMsgLen(onlynum) <= 1)
					oTa.value = onlynum;
				if (GetMsgLen(onlynum) == 2)
					oTa.value = onlynum + "-";
				if (GetMsgLen(onlynum) == 4)
					oTa.value = onlynum.substring(0, 2) + "-"
							+ onlynum.substring(2, 3);
				if (GetMsgLen(onlynum) == 4)
					oTa.value = onlynum.substring(0, 2) + "-"
							+ onlynum.substring(2, 4);
				if (GetMsgLen(onlynum) == 5)
					oTa.value = onlynum.substring(0, 2) + "-"
							+ onlynum.substring(2, 5);
				if (GetMsgLen(onlynum) == 6)
					oTa.value = onlynum.substring(0, 2) + "-"
							+ onlynum.substring(2, 6);
				if (GetMsgLen(onlynum) == 7)
					oTa.value = onlynum.substring(0, 2) + "-"
							+ onlynum.substring(2, 5) + "-"
							+ onlynum.substring(5, 7);
				;
				if (GetMsgLen(onlynum) == 8)
					oTa.value = onlynum.substring(0, 2) + "-"
							+ onlynum.substring(2, 6) + "-"
							+ onlynum.substring(6, 8);
				if (GetMsgLen(onlynum) == 9)
					oTa.value = onlynum.substring(0, 2) + "-"
							+ onlynum.substring(2, 5) + "-"
							+ onlynum.substring(5, 9);
				if (GetMsgLen(onlynum) == 10)
					oTa.value = onlynum.substring(0, 2) + "-"
							+ onlynum.substring(2, 6) + "-"
							+ onlynum.substring(6, 10);
				if (GetMsgLen(onlynum) == 11)
					oTa.value = onlynum.substring(0, 2) + "-"
							+ onlynum.substring(2, 6) + "-"
							+ onlynum.substring(6, 10);
				if (GetMsgLen(onlynum) == 12)
					oTa.value = onlynum.substring(0, 2) + "-"
							+ onlynum.substring(2, 6) + "-"
							+ onlynum.substring(6, 10);
			}
			if (onlynum.substring(0, 2) == 05) { // 05로 시작되는 번호 체크 
				if (onlynum.substring(2, 3) == 0) { // 050으로 시작되는지 따지기 위한 조건문 
					if (GetMsgLen(onlynum) <= 3)
						oTa.value = onlynum;
					if (GetMsgLen(onlynum) == 4)
						oTa.value = onlynum + "-";
					if (GetMsgLen(onlynum) == 5)
						oTa.value = onlynum.substring(0, 4) + "-"
								+ onlynum.substring(4, 5);
					if (GetMsgLen(onlynum) == 6)
						oTa.value = onlynum.substring(0, 4) + "-"
								+ onlynum.substring(4, 6);
					if (GetMsgLen(onlynum) == 7)
						oTa.value = onlynum.substring(0, 4) + "-"
								+ onlynum.substring(4, 7);
					if (GetMsgLen(onlynum) == 8)
						oTa.value = onlynum.substring(0, 4) + "-"
								+ onlynum.substring(4, 8);
					if (GetMsgLen(onlynum) == 9)
						oTa.value = onlynum.substring(0, 4) + "-"
								+ onlynum.substring(4, 7) + "-"
								+ onlynum.substring(7, 9);
					;
					if (GetMsgLen(onlynum) == 10)
						oTa.value = onlynum.substring(0, 4) + "-"
								+ onlynum.substring(4, 8) + "-"
								+ onlynum.substring(8, 10);
					if (GetMsgLen(onlynum) == 11)
						oTa.value = onlynum.substring(0, 4) + "-"
								+ onlynum.substring(4, 7) + "-"
								+ onlynum.substring(7, 11);
					if (GetMsgLen(onlynum) == 12)
						oTa.value = onlynum.substring(0, 4) + "-"
								+ onlynum.substring(4, 8) + "-"
								+ onlynum.substring(8, 12);
					if (GetMsgLen(onlynum) == 13)
						oTa.value = onlynum.substring(0, 4) + "-"
								+ onlynum.substring(4, 8) + "-"
								+ onlynum.substring(8, 12);
				} else {
					if (GetMsgLen(onlynum) <= 2)
						oTa.value = onlynum;
					if (GetMsgLen(onlynum) == 3)
						oTa.value = onlynum + "-";
					if (GetMsgLen(onlynum) == 4)
						oTa.value = onlynum.substring(0, 3) + "-"
								+ onlynum.substring(3, 4);
					if (GetMsgLen(onlynum) == 5)
						oTa.value = onlynum.substring(0, 3) + "-"
								+ onlynum.substring(3, 5);
					if (GetMsgLen(onlynum) == 6)
						oTa.value = onlynum.substring(0, 3) + "-"
								+ onlynum.substring(3, 6);
					if (GetMsgLen(onlynum) == 7)
						oTa.value = onlynum.substring(0, 3) + "-"
								+ onlynum.substring(3, 7);
					if (GetMsgLen(onlynum) == 8)
						oTa.value = onlynum.substring(0, 3) + "-"
								+ onlynum.substring(3, 6) + "-"
								+ onlynum.substring(6, 8);
					;
					if (GetMsgLen(onlynum) == 9)
						oTa.value = onlynum.substring(0, 3) + "-"
								+ onlynum.substring(3, 7) + "-"
								+ onlynum.substring(7, 9);
					if (GetMsgLen(onlynum) == 10)
						oTa.value = onlynum.substring(0, 3) + "-"
								+ onlynum.substring(3, 6) + "-"
								+ onlynum.substring(6, 10);
					if (GetMsgLen(onlynum) == 11)
						oTa.value = onlynum.substring(0, 3) + "-"
								+ onlynum.substring(3, 7) + "-"
								+ onlynum.substring(7, 11);
					if (GetMsgLen(onlynum) == 12)
						oTa.value = onlynum.substring(0, 3) + "-"
								+ onlynum.substring(3, 7) + "-"
								+ onlynum.substring(7, 11);
				}
			}

			if (onlynum.substring(0, 2) == 03 || onlynum.substring(0, 2) == 04
					|| onlynum.substring(0, 2) == 06
					|| onlynum.substring(0, 2) == 07
					|| onlynum.substring(0, 2) == 08) { // 서울전화번호가 아닌 번호일 경우(070,080포함 // 050번호가 문제군요) 
				if (GetMsgLen(onlynum) <= 2)
					oTa.value = onlynum;
				if (GetMsgLen(onlynum) == 3)
					oTa.value = onlynum + "-";
				if (GetMsgLen(onlynum) == 4)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 4);
				if (GetMsgLen(onlynum) == 5)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 5);
				if (GetMsgLen(onlynum) == 6)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 6);
				if (GetMsgLen(onlynum) == 7)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 7);
				if (GetMsgLen(onlynum) == 8)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 6) + "-"
							+ onlynum.substring(6, 8);
				;
				if (GetMsgLen(onlynum) == 9)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 7) + "-"
							+ onlynum.substring(7, 9);
				if (GetMsgLen(onlynum) == 10)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 6) + "-"
							+ onlynum.substring(6, 10);
				if (GetMsgLen(onlynum) == 11)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 7) + "-"
							+ onlynum.substring(7, 11);
				if (GetMsgLen(onlynum) == 12)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 7) + "-"
							+ onlynum.substring(7, 11);

			}
			if (onlynum.substring(0, 2) == 01) { //휴대폰일 경우 
				if (GetMsgLen(onlynum) <= 2)
					oTa.value = onlynum;
				if (GetMsgLen(onlynum) == 3)
					oTa.value = onlynum + "-";
				if (GetMsgLen(onlynum) == 4)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 4);
				if (GetMsgLen(onlynum) == 5)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 5);
				if (GetMsgLen(onlynum) == 6)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 6);
				if (GetMsgLen(onlynum) == 7)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 7);
				if (GetMsgLen(onlynum) == 8)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 7) + "-"
							+ onlynum.substring(7, 8);
				if (GetMsgLen(onlynum) == 9)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 7) + "-"
							+ onlynum.substring(7, 9);
				if (GetMsgLen(onlynum) == 10)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 6) + "-"
							+ onlynum.substring(6, 10);
				if (GetMsgLen(onlynum) == 11)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 7) + "-"
							+ onlynum.substring(7, 11);
				if (GetMsgLen(onlynum) == 12)
					oTa.value = onlynum.substring(0, 3) + "-"
							+ onlynum.substring(3, 7) + "-"
							+ onlynum.substring(7, 11);
			}

			if (onlynum.substring(0, 1) == 1) { // 1588, 1688등의 번호일 경우 
				if (GetMsgLen(onlynum) <= 3)
					oTa.value = onlynum;
				if (GetMsgLen(onlynum) == 4)
					oTa.value = onlynum + "-";
				if (GetMsgLen(onlynum) == 5)
					oTa.value = onlynum.substring(0, 4) + "-"
							+ onlynum.substring(4, 5);
				if (GetMsgLen(onlynum) == 6)
					oTa.value = onlynum.substring(0, 4) + "-"
							+ onlynum.substring(4, 6);
				if (GetMsgLen(onlynum) == 7)
					oTa.value = onlynum.substring(0, 4) + "-"
							+ onlynum.substring(4, 7);
				if (GetMsgLen(onlynum) == 8)
					oTa.value = onlynum.substring(0, 4) + "-"
							+ onlynum.substring(4, 8);
				if (GetMsgLen(onlynum) == 9)
					oTa.value = onlynum.substring(0, 4) + "-"
							+ onlynum.substring(4, 8);
				if (GetMsgLen(onlynum) == 10)
					oTa.value = onlynum.substring(0, 4) + "-"
							+ onlynum.substring(4, 8);
				if (GetMsgLen(onlynum) == 11)
					oTa.value = onlynum.substring(0, 4) + "-"
							+ onlynum.substring(4, 8);
				if (GetMsgLen(onlynum) == 12)
					oTa.value = onlynum.substring(0, 4) + "-"
							+ onlynum.substring(4, 8);
			}
		}
	}

	function RemoveDash2(sNo) {
		var reNo = ""
		for (var i = 0; i < sNo.length; i++) {
			if (sNo.charAt(i) != "-") {
				reNo += sNo.charAt(i)
			}
		}
		return reNo
	}

	function GetMsgLen(sMsg) { // 0-127 1byte, 128~ 2byte 
		var count = 0
		for (var i = 0; i < sMsg.length; i++) {
			if (sMsg.charCodeAt(i) > 127) {
				count += 2
			} else {
				count++
			}
		}
		return count
	}

	function checkDigit(num) {
		var Digit = "1234567890";
		var string = num;
		var len = string.length
		var retVal = "";

		for (i = 0; i < len; i++) {
			if (Digit.indexOf(string.substring(i, i + 1)) >= 0) {
				retVal = retVal + string.substring(i, i + 1);
			}
		}
		return retVal;
	}
	function passReset() {
		
	}
	//자바 스크립트 함수 선언
	function passConfirm() { // 세종
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
	var idCheck = 0;
	function idOverlap() {
		var id = (document.getElementById("ID").value);
		var idReg = /^(?=.*[0-9]+)[a-zA-Z][a-zA-Z0-9]{5,15}$/;		
		$.ajax({
			type : "post",
			url : "idOverlap",
			data : {
				"id" : joinForm.ID.value
			},
			dataType : "text",
			success : function(data) {
				
				if (data == "1") {	
					if(id == '' || !idReg.test(id)) {
						alert('아이디는 6~12자의 영문 소문자와 숫자로만 입력 첫글자는 영문자로 입력바랍니다.')
						idCheck = 3;
					}else {
						alert("이 아이디는 사용 가능합니다.");
						idCheck = 1;
					}
				} else {
					alert("이 아이디는 사용할 수 없습니다.");
					idCheck = 2;
				}
			},
			error : function() {
				alert("디비를 못가");
			}
		});
	}
	var emailCheck = 0;
	function createKey() { //세종
		var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		   if(document.getElementById("EMAIL").value != '' || emailReg.test(document.getElementById("EMAIL").value)){
			   var mail = document.getElementById("EMAIL").value;
		      $.ajax({
		         type:'post',
		         url:'createKey',
		         data:{"EMAIL":$('#EMAIL').val()},
		         dataType:'text',
		         success : function(data){
		            alert('메일이 전송되었습니다.');
		            emailCheck = 1;
					$('#mailKey').css('display','block');
		         },
		         error : function(){
		            alert('이메일 인증 실패');
		         }
		      });   
		   }else{
		      alert("이메일을 입력해 주세요");
		   }
		}
	//(1.28 수정) sendForm() 조건추가
	function sendForm() {
		console.log(idCheck);
		var id = (document.getElementById("ID").value);
		var pw = (document.getElementById("PW").value);
		var pwcon = (document.getElementById("PWCONFIRM").value);
		var name = (document.getElementById("NAME").value);
		var tel = (document.getElementById("TEL").value);
		var email = (document.getElementById("EMAIL").value);
		var who = (document.getElementById("WHO").value);
		var idReg = /^(?=.*[0-9]+)[a-zA-Z][a-zA-Z0-9]{5,15}$/;
		var pwReg = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{1,50}).{8,20}$/;
		var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if(id == ''){ //아이디 중복확인, 이메일 인증을 안했을시 알림이 뜨게 해보자아
				alert('아이디를 입력해주세요')
			}else if(id == '' || !idReg.test(id)) {
				alert('아이디는 6~12자의 영문 소문자와 숫자로만 입력 첫글자는 영문자로 입력바랍니다.')
			}else if(id == '' || !idReg.test(id) || pw == ''){
				alert('비밀번호를 입력해주세요')
			}else if(id == '' || !idReg.test(id) || pw == '' || !pwReg.test(pw)){
				alert('비밀번호는 영,숫자,특수문자를 포함하여 8~20자 이내로 기입해주세요.')
			}else if(id == '' || !idReg.test(id) || pw == '' || !pwReg.test(pw) || pwcon == ''){
				alert('비밀번호 확인을 입력해주세요')
			}else if(id == '' || !idReg.test(id) || pw == '' || !pwReg.test(pw) || pwcon == '' || pw != pwcon){
				alert('비밀번호와 확인이 일치하지 않습니다.')
			}else if(id == '' || !idReg.test(id) || pw == '' || !pwReg.test(pw) || pwcon == '' || pw != pwcon || name == ''){
				alert('이름을 입력해주세요')
			}else if(id == '' || !idReg.test(id) || pw == '' || !pwReg.test(pw) || pwcon == '' || pw != pwcon || name == '' || tel == ''){
				alert('전화번호를 입력해주세요')
			}else if(id == '' || !idReg.test(id) || pw == '' || !pwReg.test(pw) || pwcon == '' || pw != pwcon || name == '' || tel == '' || email == ''){
				alert('이메일을 입력해주세요')
			}else if(id == '' || !idReg.test(id) || pw == '' || !pwReg.test(pw) || pwcon == '' || pw != pwcon || name == '' || tel == '' || email == '' || !emailReg.test(email)){
				alert('이메일 형식에 맞게 입력해주세요')
			}else if(id == '' || !idReg.test(id) || pw == '' || !pwReg.test(pw) || pwcon == '' || pw != pwcon || name == '' || tel == '' || email == '' || !emailReg.test(email) || who == ''){
				alert('소속을 입력해주세요')
			}else if(id == '' || !idReg.test(id) || pw == '' || !pwReg.test(pw) || pwcon == '' || pw != pwcon || name == '' || tel == '' || email == '' || !emailReg.test(email) || who == '' || idCheck == 0){
				alert('아이디 중복체크를 해주세요.')
			}else if(id == '' || !idReg.test(id) || pw == '' || !pwReg.test(pw) || pwcon == '' || pw != pwcon || name == '' || tel == '' || email == '' || !emailReg.test(email) || who == '' || idCheck == 0 || idCheck == 2){
				alert('사용할 수 없는 아이디 입니다.')
			}else if(id == '' || !idReg.test(id) || pw == '' || !pwReg.test(pw) || pwcon == '' || pw != pwcon || name == '' || tel == '' || email == '' || !emailReg.test(email) || who == '' || idCheck == 0 || idCheck == 2 || emailCheck != 1){
				alert('이메일 인증을 해주세요.')
			}else{
		     if(document.getElementById("mailTestIn").value != ''){
		      $.ajax({
		         type:'post',
		         url:'checkKey',
		         data:{"key":$('#mailTestIn').val()},
		         dataType:'text',
		         success : function(data){
		            if(data == "1"){
		               document.getElementById("joinForm").submit();
		            }else{
		               alert("인증키가 다릅니다.");
		            }
		         },
		         error : function(){
		            alert('인증키 확인 실패');
		         }
		      });
		   }else{
		      alert("인증키를 입력해 주세요.");
		   }
			}
		}
	function idCheRe() {
		idCheck=0;
	}
	function fileName() { // 세종
		var imgFileName = $('#MImg').prop('files')[0].name;					
		if(new RegExp('jpg').test($('#MImg').val()) == true
				|| new RegExp('jpeg').test($('#MImg').val()) == true
				|| new RegExp('gif').test($('#MImg').val()) == true
				|| new RegExp('png').test($('#MImg').val()) == true){
			$('#imgName').val(imgFileName);
			//$('#imgName').val($('#MImg')[0].files[0].name);
		}else{
			alert("이미지 파일만 등록가능합니다.");
			$('#MImg').val('');
			$('#imgName').val('');
		}
	}
</script>
</head>
<body>
<c:import url="nav.jsp" var="nav"></c:import>
${nav }
	<div style="position: absolute; left: 16.5%; width: 66.5%; height: 100%; margin-top: 50px;">
		<section id="joinformArea">
			<form name="joinForm" id="joinForm" action="memberJoin" method="post" class="form-signin" enctype="multipart/form-data">
				<h2 class="form-signin-heading">회원가입</h2>
				<div class="form-group">
    				<label for="ID">아이디</label>
    				<div class="input-group">
   					<input type="text" name="ID" id="ID" class="form-control" placeholder="ID" >
   					<div class="input-group-addon" style="padding: 0px;">
   					<button class="btn" onclick="idOverlap()" style="padding: 5px 12px;" type="button">중복확인</button>
					</div>
   					</div>
				</div>
				<div class="form-group has-feedback">
    				<label for="PW">비밀번호</label>
   					<input type="password" class="form-control" name="PW" id="PW" placeholder="비밀번호" onkeyup="passConfirm()">
   					<small id="passHelp" class="form-text text-muted"></small>
   					<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
				</div>
				<div class="form-group has-feedback"> 
    				<label for="PWCONFIRM">비밀번호 확인</label>
   					<input type="password" class="form-control" name="PWCONFIRM" id="PWCONFIRM" placeholder="비밀번호 확인" onkeyup="passConfirm()">
   					<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
				</div>
				<div class="form-group">
					<label for="NAME">이름</label>
					<input type="text" class="form-control" name="NAME" id="NAME" placeholder="이름"/>
				</div>
				<div class="form-group">
					<label for="TEL">전화번호</label>
					<input type="text" class="form-control" name="TEL" id="TEL" placeholder="전화번호" onfocus="OnCheckPhone(this)" onKeyup="OnCheckPhone(this)"/>
				</div>
				<div class="form-group">
    				<label for="EMAIL">이메일</label>
    				<div class="input-group">
   					<input type="text" name="EMAIL" id="EMAIL" class="form-control" placeholder="email@email.com" >
   					<div class="input-group-addon" style="padding: 0px;">
   					<button class="btn" onclick="createKey()" style="padding: 5px 12px;" type="button">이메일 인증</button>
					</div>
   					</div>
				</div>
				<div class="form-group" style="display: none;" id="mailKey">
    				<label for="mailTestIn">인증 번호</label>
   					<input type="text" name="mailTestIn" id="mailTestIn" class="form-control" placeholder="인증번호 입력란">
				</div>
				<div class="form-group">
				<label for="MImg">프로필 사진</label>
					<div class="form-group form_file input-group">
  					<input class="form-control" type="text" title="첨부된 파일명" readonly placeholder="프로필 사진" id="imgName">
  					<div class="file_load input-group-addon" style="padding: 0px;">
        				<input type="file" name="MImg" id="MImg" style="display: none;" onchange="fileName()">
        				<button class="btn" onclick="javascript:$('#MImg').click()" style="padding: 5px 12px;" type="button">파일 선택</button>
    				</div>
					</div>
				</div>
				
				<div class="form-group">
				<label for="WHO">소속 </label>
				<div class="input-group">
					<div class="btn-group btn-group-toggle" data-toggle="buttons">
						<label class="btn btn-default">
							<input type="radio" name="WHO" value="0" checked="checked" id="WHO" />개인회원
						</label>
						<label class="btn btn-default">
							<input type="radio" name="WHO" value="1" />사장님
						</label>
					</div>
   					</div>
				</div>
				<div class="row">
				<div class="btn-group col-md-8 col-md-offset-3"> 
					<button class="btn btn-lg btn-info"  type="button" onclick="sendForm()">회원가입</button>
					<button class="btn btn-lg btn-default"  type="button" onclick="javascript:joinform.reset()">다시작성</button>
				</div>
					</div>	
			</form>
		</section>
	</div>
	
	<!-- 자바스크립트 ================================================== -->
    <!-- 페이지를 빨리 읽어들이도록 문서 마지막에 배치 -->
	 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
</body>
</html>