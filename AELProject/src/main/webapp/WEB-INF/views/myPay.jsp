<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.ifive.ael.vo.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제</title>
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
<script src="https://cdn.bootpay.co.kr/js/bootpay-2.0.20.min.js" type="application/javascript"></script>
<script>
function pay(rbnum, id, totalP) { 
	var payList = new Array();
	var menuCount =0;
	var point = $('#usePoint').val();
	var USEPOINT = 0;
	if(point != undefined && point != ""){
		totalP = totalP-$('#usePoint').val();
		USEPOINT = point;
	}
	$.ajax({
		type:"post",
		url:"payList",
		cache : false,
		data:{"RBNUM":rbnum,"ID":id},
		dataType:"json",
		success : function(data) { // db에서 확인 후
			for(var i=0;i<data.length;i++){
				menuCount+=data[i].BAMOUNT;
				console.log(data[i].BMENU);
			}
			var payName='';
			if(menuCount>1){
				payName = data[0].BMENU+" 외 "+String(menuCount-1)+"개";	
			}else{
				payName = data[0].BMENU;
			}
			  console.log($('#OCALL').val());
			BootPay.request({
				price: totalP, //실제 결제되는 가격
				application_id: "5c4e55deb6d49c226be2ab96",
				name: payName, //결제창에서 보여질 이름
				pg: 'kakao',
				method: 'easy', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
				show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
				items: [
					{
						item_name: payName, //상품명
						qty: menuCount, //수량
						unique: "123", //해당 상품을 구분짓는 primary key
						price: totalP
					}
				],
				user_info: {
					username: '사용자 이름',
					email: '사용자 이메일',
					addr: '사용자 주소',
					phone: '010-4189-1820'
				},
				order_id: '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
				params: {item_name: '1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'}
			   }).error(function (data) { 
			        // 결제가 실패했을 때 호출되는 함수입니다.
			        var msg = "결제 에러입니다.: " + JSON.stringify(data);
			        alert(msg);
			        console.log(data);
			    }).cancel(function (data) {
			        // 결제창에서 결제 진행을 하다가 취소버튼을 눌렀을때 호출되는 함수입니다.
			        var msg = "결제 취소입니다.: " + JSON.stringify(data.message);
			        alert(msg);
			        console.log(data);
			    }).confirm(function (data) {
			        // 결제가 진행되고 나서 승인 이전에 호출되는 함수입니다.
			        // 일부 결제는 이 함수가 호출되지 않을 수 있습니다. ex) 가상계좌 및 카드 수기결제는 호출되지 않습니다.        
			        // 만약 이 함수를 정의하지 않으면 바로 결제 승인이 일어납니다.
			          
			        if (confirm('결제를 하시겠습니까?')) {
			            //console.log("do confirm data: " + JSON.stringify(data));
			            console.log(data);
			            $.ajax({
							type:"post",
							url:"payOrders",
							cache : false,
							data:{"RBNUM":rbnum,"ID":id,"OCALL":$('#OCALL').val(),"OCHOICE":$("input[name='OCHOICE']:checked").val(),"OJTOTALADDR":$('#OJTOTALADDR').html()+" "+$('#OJTOTALADDR2').val(), "USEPOINT": USEPOINT },
							dataType:"text",
							success : function(data) {
								console.log(data);
								if(data == "1"){
									alert("주문이 완료 되었습니다.");
									location="http://192.168.0.27/ael/main"; // 추후 어디로 보낼지
								}else{
									alert("결제 에러입니다.");
									location="http://192.168.0.27/ael/myPay";
								}
								
							},
							error : function() { // db와 통신 실패 시 
								alert("서버 통신 실패.");
								location="http://192.168.0.27/ael/myPay";
							}
						});
			            this.transactionConfirm(data);
			        } else {
			            var msg = "승인거절되었습니다.: " + JSON.stringify(data);
			            alert(msg);
			            console.log(data);
			        }
			    }).done(function (data) {
			        // 결제가 모두 완료되었을 때 호출되는 함수입니다.
			        
			        alert("결제가 완료되었습니다.");
			        console.log(data);
			    }).ready(function (data) {
			        // 가상계좌 번호가 체번(발급) 되었을 때 호출되는 함수입니다.
			        console.log(data);
			    });
		},
		error : function() { // db와 통신 실패 시 
			alert("ajax 통신 실패.");
		}
	});
	
}
function pointUse() {
	if($('#nowPoint').val()>= 5000){
		if($('#pointUse').css('display')=='none'){
			$('#pointUse').css('display','block');
			$('#pointBtn').html('취소');
		}else{
			$('#pointUse').css('display','none');
			$('#pointBtn').html('사용');
		}
	}else{
		alert('5000point 이상 사용 가능 합니다.');
	}
	
}
</script>
</head>
<body>
<c:import url="nav.jsp" var="nav"></c:import>
${nav }
<%
String id = (String) session.getAttribute("ID");
MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
List<BasketVO> basList = (List<BasketVO>) request.getAttribute("basList"); 
ResVO resVO = (ResVO) request.getAttribute("resVO");
int total = (int) request.getAttribute("total");
JusoVO jusoVO = (JusoVO) request.getAttribute("jusoVO");%>

<div style="position: absolute; left: 16.5%; width: 66.5%; height: 100%; margin-top: 50px;">
		<section id="payformArea">
			<form name="joinForm" id="joinForm" class="form-signin">
				<h2 class="form-signin-heading">주문 정보</h2>
				<div class="form-group">
    				<label id="OJTOTALADDR"></label>
   					<input type="text" class="form-control" readonly value="<%=jusoVO.getJTOTALADDR().substring(0, jusoVO.getJTOTALADDR().indexOf(")",0)+1) %>">
   					<div class="input-group-addon" style="padding: 0px;">
   					</div>
				</div>
				<div class="form-group">
    				<label for="PW">주소</label>
   					<input class="form-control" class="form-control" type="text" id="OJTOTALADDR2" value="<%=jusoVO.getJDETAILADDR() %>">
   					<small id="passHelp" class="form-text text-muted"></small>
				</div>
				<div class="form-group"> 
    				<label for="PWCONFIRM">연락처</label>
   					<input class="form-control" class="form-control" type="text" value="<%=memberVO.getTEL() %>">
				</div>
				<div class="form-group">
					<label for="NAME">요청 사항</label>
					<input class="form-control" class="form-control" type="text" placeholder="요청 사항을 입력하세요" name="OCALL" id="OCALL">
				</div>
				
				<div class="form-group">
				<label for="OCHOICE">주문 방법</label>
				<div class="input-group">
					<div class="btn-group btn-group-toggle" data-toggle="buttons">
						<%if(resVO.getRCHOICE().indexOf(",") != -1){
							int cnt=0;
							StringTokenizer st = new StringTokenizer(resVO.getRCHOICE(),",");
							while(st.hasMoreTokens()){
								cnt++;
								String choice = st.nextToken();%>
								<label class="btn btn-default">
								<input type="radio" name="OCHOICE" id="OCHOICE" value="<%=choice%>"<%if(cnt==1){ %>checked<%} %>><%=choice%>
								</label>
								
							<%}
						}else{%>
							<label class="btn btn-default">
							<input type="radio" name="OCHOICE" id="OCHOICE" value="<%=resVO.getRCHOICE()%>" checked><%=resVO.getRCHOICE()%>
							</label>
						<%}%>
					</div>
   					</div>
				</div>
				<div class="form-group">
					<label for="totalPrice">총 결제 금액</label>
					<input type="number" class="form-control" id="totalPrice" value="<%=total %>" readonly>
				</div>
				<div class="form-group">
					<label for="paySel">결제 방법</label>
					<select class="form-control" id="paySel">
      					<option>카카오 페이</option>
      					<option>신용 카드</option>
      					<option>현장 카드</option>
      					<option>현장 현금</option>
      					<option>휴대폰</option>
    				</select>
				</div>
				<div class="form-group">
    				<label for="EMAIL">포인트</label>
    				<div class="input-group">
   					<input type="number" class="form-control" id="nowPoint" value="<%=memberVO.getPOINT() %>" readonly>
   					<div class="input-group-addon" style="padding: 0px;">
   					<button class="btn" onclick="pointUse()" style="padding: 5px 12px;" type="button">포인트 사용</button>
					</div>
   					</div>
				</div>
				<div class="form-group" style="display: none;" id="pointUse">
    				<label for="usePoint">사용할 포인트</label>
   					<input type="number" name="usePoint" id="usePoint" class="form-control" placeholder="사용할 포인트 입력">
				</div>
				
				
				<div class="row">
				<div class="btn-group col-md-8 col-md-offset-3"> 
					<button class="btn btn-lg btn-success" type="button" onclick="pay('<%=basList.get(0).getRBNUM()%>', '<%=session.getAttribute("ID")%>', <%=total%>)">결제하기</button>
					<button class="btn btn-lg btn-default" type="button" onclick="javascript:history.back()">뒤로가기</button>
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