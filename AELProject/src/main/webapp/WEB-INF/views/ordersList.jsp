<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@page import="com.ifive.ael.vo.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%
	String id = (String) session.getAttribute("ID");
	List<OrdersVO> ordersList = (List<OrdersVO>) request.getAttribute("ordersList");
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("dd");
	String nowDat = sdf.format(date);
	int nowDay = Integer.parseInt(nowDat);
	//int nowDay = Integer.parseInt(sdf.format(sdf));
	
%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
<style>
.pnt {
	cursor: pointer;         
	color: black;
	text-decoration: none;
}
</style> 
</head> 
<body> 
<c:import url="nav.jsp" var="nav"></c:import>  
${nav } 
	<img style="height: 100px; width: 100px; margin-left: 48%; margin-top:50px; border-radius: 50%;" 
	src="./proimg/${sessionScope.MIMG}"> 
	 <div style="position: absolute; left: 16.5%; width: 66.5%; height: 100%;">
	 <h3>주문내역</h3>
	<table class="table table-striped">
		<%if(!ordersList.isEmpty()){
			for (int i = 0; i < ordersList.size(); i++) {
				int cnt = 1;
				ordersList.get(i).setORPRICE(ordersList.get(i).getORPRICE() * ordersList.get(i).getOAMOUNT());
				if (i != ordersList.size() - 1) {
					for (int j = i + 1; j < ordersList.size(); j++) {
						if (ordersList.get(i).getONUM().equals(ordersList.get(j).getONUM())) {
							ordersList.get(i).setORPRICE(ordersList.get(i).getORPRICE()
									+ ordersList.get(j).getORPRICE() * ordersList.get(j).getOAMOUNT());
							ordersList.remove(j);
							cnt = cnt + 1;
							j--;
						}
					}
					//i+=cnt-1;
				}
				int oDay = Integer.parseInt(sdf.format(ordersList.get(i).getODATE()));
		%>
		<tr style = "font-size: 8pt"><td><%=ordersList.get(i).getODATE()%> <%=ordersList.get(i).getOTIME()%>  <span style="float: right; font-size: 8pt;"><%=ordersList.get(i).getOSTATUS()%> <%if(!ordersList.get(i).getOSTATUS().equals("주문 접수 중") && !ordersList.get(i).getOSTATUS().equals("배달 완료")){ %>(<%=ordersList.get(i).getOWAIT() %> 에 도착 예졍)<%} %></span></td></tr>
		<tr>
			<td style="text-align: center;"><b style="font-size: 17pt;"><a class="pnt"
					href="resDetail?RBNUM=<%=ordersList.get(i).getRBNUM()%>"><%=ordersList.get(i).getORNAME()%></a></b></td>
		</tr>
		<%
			if (cnt != 1) {
		%>
		<tr>
			<td style="text-align: center;"><%=ordersList.get(i).getOMENU()%> <%=ordersList.get(i).getOAMOUNT()%>개
				외 <%=cnt - 1%>메뉴 / <%=ordersList.get(i).getORPRICE()%>원</td>
		<tr>
			<%
				} else {
			%>
		
		<tr>
			<td style="text-align: center;"><%=ordersList.get(i).getOMENU()%> <%=ordersList.get(i).getOAMOUNT()%>개
				/ <%=ordersList.get(i).getORPRICE()%>원</td>
		</tr>
		<%
			}
		%>
		<tr> 
			<td style="text-align: center;"><button class="btn btn-success" style="width: 208px"<%if(nowDay - oDay <=7){ %>
					onclick="javascript:location.href='rWriteForm?ID=<%=id%>&RBNUM=<%=ordersList.get(i).getRBNUM()%>&ONUM=<%=ordersList.get(i).getONUM()%>'"<%} %>>리뷰작성하기</button>
			</td>
		</tr>
		<tr>
			<td style="text-align: center;"><button class="btn" style="width: 101px"
					onclick="javascript:location.href='ordersDetail?ONUM=<%=ordersList.get(i).getONUM()%>'">주문상세</button>
				<button class="btn" style="width: 101px"
					onclick="javascript:location.href='ordersRe?ONUM=<%=ordersList.get(i).getONUM()%>'">재주문하기</button>
			</td>  
		</tr> 
		 
		<%
			}
			}else{%>
			<tr><td>주문한 상품이 없습니다. ㅠㅠ<br>주문하러 가실까요오?<a>주문</a></td></tr>	
			
		<%}%>
	</table>
	
	</div>
	
</body>
</html>