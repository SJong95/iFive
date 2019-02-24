<%@page import="com.ifive.ael.vo.ResVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@page import="com.ifive.ael.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	List<ResVO> res = (List<ResVO>) request.getAttribute("resList");
	String RCATE = (String) request.getAttribute("RCATE");
	String search = (String) request.getAttribute("search");
	String align = "";
	if(request.getAttribute("align") != null){
		align = (String) request.getAttribute("align");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	function favoriteIn(FRNAME, RBNUM) {
		$.ajax({
			type : "post",
			url : "favoriteIn",
			cache : false,
			data : {
				"ID" : '${sessionScope.ID }',
				"RBNUM" : RBNUM,
				"FRNAME" : FRNAME
			},
			dataType : "text", // json, text, xml 등 사용 가능
			success : function(data) { // db에서 확인 후
				if (data == 1) {
					alert("즐겨찾기가 추가되었습니다.");
					var loc = location.href;
					location = loc;
				} else if (data == 2) {
					alert("즐겨찾기 취소");
					var loc = location.href;
					location = loc;
				} else {
					alert("즐겨찾기 실패");
					var loc = location.href;
					location = loc;
				}
			},
			error : function() { // db와 통신 실패 시 
				alert("중복확인 ajax 실패.");
			}
		});
	}
</script>
<title>음식점</title>
</head>
<body>
	<c:import url="nav.jsp" var="nav"></c:import>
	${nav }

	<!-- 1월 31일 수정(전체) -->
	<table class="table table-hover" border="0" valign=middle
		style="margin: auto; text-align: center;">
		<!-- <tr>
				<td>식당 이름</td>
				<td>평점</td>
				<td>판매구분</td>
				<td>즐겨찾기</td> 
				</tr> -->
		<tr>
			<%
				if (!res.isEmpty()) {
					if(RCATE == null){%>
						<th colspan="5" style="text-align: center; font-size: 20pt">'<%=search%>' 검색 결과</th>
					<%}else if (RCATE.equals("피자/양식")) {
			%>
			<th colspan="5" style="text-align: center; font-size: 20pt"><img
				class="photo4"
				style="height: 30px; width: 50px; margin-top: 0px; border-radius: 15px;"
				src="./adImg/pizza2.jpg"><%=RCATE%></th>
			<%
				} else if (RCATE.equals("치킨")) {
			%>
			<th colspan="5" style="text-align: center; font-size: 20pt"><img
				class="photo4"
				style="height: 30px; width: 50px; margin-top: 0px; border-radius: 15px;"
				src="./adImg/ck2.jpg"><%=RCATE%></th>
			<%
				} else if (RCATE.equals("중식")) {
			%>
			<th colspan="5" style="text-align: center; font-size: 20pt"><img
				class="photo4"
				style="height: 30px; width: 50px; margin-top: 0px; border-radius: 15px;"
				src="./adImg/zz2.jpg"><%=RCATE%></th>
			<%
				} else if (RCATE.equals("일식/돈까스")) {
			%>
			<th colspan="5" style="text-align: center; font-size: 20pt"><img
				class="photo4"
				style="height: 30px; width: 50px; margin-top: 0px; border-radius: 15px;"
				src="./adImg/japan2.jpg"><%=RCATE%></th>
			<%
				} else if (RCATE.equals("한식")) {
			%>
			<th colspan="5" style="text-align: center; font-size: 20pt"><img
				class="photo4"
				style="height: 30px; width: 50px; margin-top: 0px; border-radius: 15px;"
				src="./adImg/han.jpg"><%=RCATE%></th>
			<%
				} else if (RCATE.equals("족발/보쌈")) {
			%>
			<th colspan="5" style="text-align: center; font-size: 20pt"><img
				class="photo4"
				style="height: 30px; width: 50px; margin-top: 0px; border-radius: 15px;"
				src="./adImg/jok.jpg"><%=RCATE%></th>
			<%
				}
			}
			%>
		</tr>
		

		<c:choose>
			<c:when test="${!empty resList }">
			<tr>
		<td colspan="5" style="vertical-align: middle;">
		<form action="resList" method="get" name="alignForm">
		<div class="form-row">
			<div class="form-group col-md-4 col-md-offset-8" style="margin-bottom: 0;">
				<select class="form-control" onchange="javascript:alignForm.submit()" name="align">
				<option>정렬</option>
				<option <%if(align.equals("평점")){ %>selected<%} %>value="평점">평점 순</option>
      			<option <%if(align.equals("리뷰")){ %>selected<%} %>value="리뷰">리뷰 많은 순</option>
      			<option <%if(align.equals("주문")){ %>selected<%} %>value="주문">주문 많은 순</option>
		</select>	
			</div>
		<%if(RCATE != null){ %>	
		<input type="hidden" value="<%=RCATE %>" name="cate">
		<%} %>
		<%if(search != null){ %>
		<input type="hidden" value="<%=search %>" name="search">
		<%} %>
		</div>
		
		</form>
		</td>
		</tr>
				<c:forEach var="res" items="${resList}">
					<tr style="margin: auto;">
						<td><img src="./rImg/${res.RES_IMG}" class="photo3"
							style="width: 38px; height: 38px"></td>
						<td style="font-size: 18pt;"><a
							style="text-decoration: none; color: black;" 
							href="resDetail?RBNUM=${res.RBNUM }">&nbsp;${res.RNAME }</a></td>
						<td style="font-size: 18pt;"><img class="photo4"
							style="height: 30px; width:30px; margin-top: 0px; border-radius: 15px;"
							src="./adImg/star.jpg">${res.RGRADE }</td>
						<td style="font-size: 18pt;">${res.RCHOICE }가능</td>
						<td><button class="btn btn-warning"
								onclick="favoriteIn('${res.RNAME}', '${res.RBNUM }')">
								<c:set var="cnt" value="0" />
								<c:if test="${!empty favList }">
									<c:forEach var="fav" items="${favList}">
										<c:choose>
											<c:when test="${res.RBNUM eq fav.RBNUM }">즐겨찾기 취소</c:when>
											<c:otherwise>
												<c:set var="cnt" value="${cnt+1 }" />
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:if>
								<c:if test="${fn:length(favList) == cnt }">즐겨찾기</c:if>
							</button></td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise><h1 style="text-align: center;">등록 된 음식점이 없습니다.</h1>
		<h1 style="text-align: center;">
			<img style="width: 150px; height: 150px" src="./adImg/sad.jpg">
		</h1></c:otherwise>
		</c:choose>
	</table>
</body>
</body>
</html>