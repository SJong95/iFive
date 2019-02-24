<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@page import="com.ifive.ael.vo.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소 등록</title>
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
<script>
function jusocheck(){
	$.ajax({
		type: "post",
		url: "jusocheck",
		data: {
			"ID": juso.ID.value,
			"JROADADDR": juso.JROADADDR.value,
			"JDETAILADDR": juso.JDETAILADDR.value,
			"JEXTRAADDR" :juso.JEXTRAADDR.value
		},
		dataType: "text",
		success: function(data){
			if(data == "1"){
				  var form = document.juso;
				    
				    form.submit();
			}else{
				alert("사용불가");
				
			}
		},
		error : function(){
			alert("디비를 못가");
		}
	});
}
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	// 주소 검색 API 
	function execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('JPOSTCODE').value = data.zonecode;
						document.getElementById("JROADADDR").value = roadAddr;
						document.getElementById("JIBUNADDR").value = data.jibunAddress;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("JEXTRAADDR").value = extraRoadAddr;
						} else {
							document.getElementById("JEXTRAADDR").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}
</script>
<body> 
<c:import url="nav.jsp" var="nav"></c:import> 
${nav }
<img style="height: 100px; width: 100px; margin-left: 48%; margin-top:50px; border-radius: 50%;" 
	src="./proimg/${sessionScope.MIMG}"> 
	<div style="position: absolute; left: 16.5%; width: 66.5%; height: 100%; margin-top: 50px;">
		<section id="jusoformArea">
			<form name="juso" action="juso" method="post" class="form-signin">
				<h2 class="form-signin-heading">주소 등록</h2>
				<div class="form-group">
    				<label for="RADDR">내 주소 </label>
    				<div class="input-group">
    				<input type="hidden" name="ID" value="${sessionScope.ID }">
   					<input type="text" class="form-control" name="JPOSTCODE" id="JPOSTCODE" placeholder="우편번호">
   					<div class="input-group-addon" style="padding: 0px;">
   					<button type="button" class="btn" style="padding: 5px 12px;" onclick="execDaumPostcode()" value="우편번호 찾기">우편번호 찾기</button>
					</div></div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6" style="padding-left: 0px;">
					<input class="form-control" type="text" name="JROADADDR" id="JROADADDR" placeholder="도로명주소">
					</div>
					<div class="form-group col-md-6" style="padding-right: 0px;">
               		<input type="text" class="form-control" name="JIBUNADDR" id="JIBUNADDR" placeholder="지번주소">
               		</div>
               		<span id="guide" style="color: #999; display: none"></span>
               	</div>
               	<div class="form-row">
               		<div class="form-group col-md-6" style="padding-left: 0px;">
               		<input class="form-control" type="text" name="JDETAILADDR" id="JDETAILADDR" placeholder="상세주소">
               		</div>
               		<div class="form-group col-md-6" style="padding-right: 0px;">
               		<input class="form-control" type="text" name="JEXTRAADDR" id="JEXTRAADDR" placeholder="참고항목">
               		</div>
   				</div>
				<div class="row">
				<div class="btn-group col-md-8 col-md-offset-3"> 
					<button class="btn btn-lg btn-info" >주소 등록</button>
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