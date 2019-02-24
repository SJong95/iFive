<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.ifive.ael.vo.*"%>
<%@ page import="java.util.List"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%
    String id = (String) session.getAttribute("ID");
    List<BasketVO> basList = (List<BasketVO>) request.getAttribute("basList"); 
	List<ResVO> resList = (List<ResVO>) request.getAttribute("resList"); 
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
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
	td{
	text-align: center;
	}
    </style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-2.0.20.min.js" type="application/javascript"></script>
<script>
function amountModify(rbnum, id, bmenu, admi) {
	$.ajax({
		type:"post",
		url:"amountModify",
		cache : false,
		data:{"RBNUM":rbnum,"ID":id,"BMENU":bmenu,"admi":admi},
		dataType:"text",
		success : function(data) { // db에서 확인 후
			if(data == '1'){
				location="http://192.168.0.27/ael/myBas";
				
			}else {
				alert("수량 추가 실패");
			}
		},
		error : function() { // db와 통신 실패 시 
			alert("ajax 통신 실패.");
		}
	});
}
function basketCancle(rbnum, id, bmenu) {
	$.ajax({
		type:"post",
		url:"basketCancle",
		cache : false,
		data:{"RBNUM":rbnum,"ID":id,"BMENU":bmenu},
		dataType:"text",
		success : function(data) { // db에서 확인 후
			if(data === "999"){
				location="http://192.168.0.27/ael/";
			}else if(data != '0') {
				alert("상품 삭제 성공");
				location="http://192.168.0.27/ael/myBas";
			}else{
				alert("상품 삭제 실패");
			}
		},
		error : function() { // db와 통신 실패 시 
			alert("ajax 통신 실패.");
		}
	});
}
function payForm(rbnum) { 
	$("#payForm").html('<input type="hidden" id="RBNUM" name="RBNUM">');
	$("#RBNUM").val(rbnum);
	document.getElementById("payForm").submit();
}
</script>
</head>
<body>
<c:import url="nav.jsp" var="nav"></c:import>
${nav }

<div class="container ">
			<div class="row">
			<div class="col-md-8 col-md-offset-2">
<h1 style="text-align: center;" >장바구니</h1>
</div></div></div><br>
<div class="container ">
			<div class="row">
			<div class="col-md-8 col-md-offset-2">
			
			
<table class="table">
<%if(!basList.isEmpty()){
for(int i=0;i<resList.size();i++){
int resCheck =0;
int totalPrice=0;%>
	<%for(int j=0;j<basList.size();j++){%>
		<%if(resList.get(i).getRBNUM().equals(basList.get(j).getRBNUM())){
		resCheck++;}}
		
		if(resCheck !=0){%>
			<tr><td colspan="4" style="text-align: center;"><a href="resDetail?RBNUM=<%=resList.get(i).getRBNUM() %>"><%=resList.get(i).getRNAME() %></a></td></tr>
			<tr><th style="text-align: center;">메뉴명</th><th style="text-align: center;">수량</th><th style="text-align: center;">가격</th><th style="text-align: center;">증감</th></tr>
			<%for(int j=0;j<basList.size();j++){
				if(resList.get(i).getRBNUM().equals(basList.get(j).getRBNUM())){
				totalPrice+=basList.get(j).getBAMOUNT()*basList.get(j).getBPRICE();%>
					<tr><td><%=basList.get(j).getBMENU() %></td>
					<td><%=basList.get(j).getBAMOUNT() %></td>
					<td><%=basList.get(j).getBAMOUNT()*basList.get(j).getBPRICE() %> 원</td>
					<td><button class="btn btn-default" onclick="amountModify('<%=basList.get(j).getRBNUM()%>', '<%=basList.get(j).getID()%>', '<%=basList.get(j).getBMENU()%>', 1)">+</button>&nbsp;
					<button class="btn btn-default" <%if(basList.get(j).getBAMOUNT()>1){ %>onclick="amountModify('<%=basList.get(j).getRBNUM()%>', '<%=basList.get(j).getID()%>', '<%=basList.get(j).getBMENU()%>', -1)"<%} %>>-</button>&nbsp;&nbsp;&nbsp;
					<button class="btn btn-default" onclick="basketCancle('<%=basList.get(j).getRBNUM()%>', '<%=basList.get(j).getID()%>', '<%=basList.get(j).getBMENU()%>')">취소</button>					
					</td></tr>
			<%}}%>
			<tr><td>총 가격</td><td colspan="3"><%=totalPrice %>원</td></tr>
			<tr><td colspan="4"><button class="btn btn-success" onclick="payForm('<%=resList.get(i).getRBNUM()%>')"><%=totalPrice %>원 결제하기</button></td></tr>
		<%}%>
		
<% }}else{%>
<tr><td>담은 음식이 없습니다.<br>음식 담으러 가기 -> <a>go?</a></td></tr>
<%} %>
</table>
</div>
			</div>
</div>
<form action="payForm" method="post" id="payForm">
</form>
</body>
</html>