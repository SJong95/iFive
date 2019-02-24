<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ifive.ael.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
						MemberVO memberVO = (MemberVO) request.getAttribute("viewMember1");
					%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>내 정보</title>
<meta charset="utf-8">
</head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<body>
<c:import url="nav.jsp" var="nav"></c:import>
${nav }
	
	<c:choose>
		<c:when test="${sessionScope.WHO eq '1' }">
			<div id="mybdContents">
				<!-- pixin -->
				<div class="pixin" style="margin: auto; text-align: center;">
					<p class="submap">
						 <span class="map" style="font-size:x-large; color:bluebalck;">내 정보</span>
					</p>
					<!-- mylist_w -->
					<div class="mylist_w">
						<!-- myprofile_w -->
						<div class="myprofile_w">
							<img
								style="height: 100px; width: 100px; margin: auto; text-align: center; object-fit: cover; border-radius: 50%;"
								src="./proimg/${sessionScope.MIMG}">
							<p class="msg" style="font-size: 25px;">
								<span ><strong>${sessionScope.ID } 님</strong> 반갑습니다.</span>
							</p>

							<table class="myTable">
								<colgroup>
									<col width="33.3%" />
									<col width="33.3%" />
									<col width="*" />
								</colgroup>


							</table>
						</div>
					</div>
				</div>
				</div>
				<div class="row">
				<div class="col-md-6 col-md-offset-3">
		<table class="table table-bordered container" >
					<c:choose>
						<c:when test="${!empty viewMember1}">
							<tr>
								<th scope="row">이름</th>
								<td>${viewMember1.NAME }</td>
							</tr>

							<tr>
								<th scope="row">전화번호</th>
								<td>${viewMember1.TEL }</td>
							</tr>

							<tr>
								<th scope="row">이메일</th>
								<td>${viewMember1.EMAIL }</td>
							</tr>

							<tr>
							<th scope="row">구분</th>
									<%
										if (memberVO.getWHO() == 0) {
									%> <td>개인회원</td> <%
										} else {
									%><td>사장님</td> 
									<%
										}
									%>
							
							</tr>
						</c:when>
						<c:otherwise>
	누구시죠?
	</c:otherwise>
					</c:choose>

				</table>
				</div>
				</div>
			<title>매장 관리</title>
			<div style="text-align: center;">
			<button class="btn btn-default" onclick="location='resinsertForm'">매장등록</button>
			
			<button class="btn btn-default" onclick="location='resManage'">나의매장보기/수정/메뉴관리</button>
			
			<button class="btn btn-default" onclick="location='pwchangeForm'">비밀번호변경</button>
			<!-- @@@@ 수정 필요 @@@@ -->
			
			<button class="btn btn-default" onclick="location='memberByeForm'">회원탈퇴</button>
			</div>
			<!-- @@@@ 수정 필요 @@@@ -->
		</c:when>
		<c:otherwise>
			<div id="mybdContents">
				<!-- pixin -->
				<div class="pixin" style="margin: auto; text-align: center;">
					<p class="submap">
						 <span class="map" style="font-size:x-large; color:bluebalck;">내 정보</span>
					</p>
					<!-- mylist_w -->
					<div class="mylist_w">
						<!-- myprofile_w -->
						<div class="myprofile_w">
							<img
								style="height: 100px; width: 100px; margin: auto; text-align: center; object-fit: cover; border-radius: 50%;"
								src="./proimg/${sessionScope.MIMG}">
							<p class="msg" style="font-size: 25px;">
								<strong>${sessionScope.ID } 님</strong> 반갑습니다.
							</p>

							<table class="myTable">
								<colgroup>
									<col width="33.3%" />
									<col width="33.3%" />
									<col width="*" />
								</colgroup>


							</table>
						</div>
					</div>
				</div>

				<!-- // myprofile_w -->
			</div>
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
				<table class="table table-bordered container" >
					
					<tr>
						<th scope="row">대표 주소</th>
						<td>${sessionScope.JUSO}</td>
					</tr>
					<c:choose>
						<c:when test="${!empty viewMember1}">
							<tr>
								<th scope="row">이름</th>
								<td>${viewMember1.NAME }</td>
							</tr>

							<tr>
								<th scope="row">전화번호</th>
								<td>${viewMember1.TEL }</td>
							</tr>

							<tr>
								<th scope="row">이메일</th>
								<td>${viewMember1.EMAIL }</td>
							</tr>

							<tr>
								<th scope="row">포인트</th>
								<td>${viewMember1.POINT }P</td>
							</tr>

							<tr>
							<th scope="row">구분</th>
									<%
										if (memberVO.getWHO() == 0) {
									%> <td>개인회원</td> <%
										} else {
									%><td>사장님</td> 
									<%
										}
									%>
							
							</tr>
						</c:when>
						<c:otherwise>
	누구시죠?
	</c:otherwise>
					</c:choose>

				</table>
				</div>
				</div>
				<br>
			<table style="margin: auto;">
			<tr>
			<td>
			<button class="btn btn-default" onclick="location='pwchangeForm'">비밀번호변경</button>
			<button class="btn btn-default" onclick="location='jusoForm'">주소등록</button>
			
			<button class="btn btn-default" onclick="location='jusoList'">내 주소</button>
			<button class="btn btn-default" onclick="location='memberByeForm'">회원탈퇴</button>
			
			<button class="btn btn-default" onclick="location='ordersList'">주문내역</button>
			<button class="btn btn-default" onclick="location='myFav'">즐겨찾기</button></td>
			</tr>
			
			
			
</table>

		</c:otherwise>
	</c:choose>



	<!-- Bootstrap core JavaScript -->
	<script src="./resources/vendor/jquery/jquery.min.js"></script>
	<script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>
