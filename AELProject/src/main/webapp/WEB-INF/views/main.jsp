<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ifive.ael.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>다.먹.자!</title>
<meta charset="UTF-8">

</head>

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

	<!-- Masthead -->
	<header class="masthead text-white text-center">
		<div class="overlay" style="height:537px;"></div>
		<div class="container" style="margin-top: 50px;">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 mx-auto">
					<h1 class="mb-5" style="font-size: 35pt;">다 . 먹 . 자!</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-md-10 col-md-offset-1" >
					<form>
						<div class="form-row" >
						<div class=" col-md-1" >
						<a class="color" href="myLocation"><img class="photo3" src = "./proimg/chimban.jpg" style = "width: 100%; height: 100%;"></a>
						</div>
							<div class="col-md-8 mb-0 mb-md-0">
						
							
								<input type="text" class="form-control input-lg"
									placeholder="${sessionScope.JUSO}" readonly="readonly">
								
							</div>
							<div class="col-12 col-md-3">
								<input class="btn btn-block btn-lg btn-primary"   type="button"
									onclick="location='myLocation'" value="내 위치">
								<!-- <button type="button" onclick="location.href='myLocation'" class="btn btn-block btn-lg btn-primary">주소 검색</button>
              	 -->
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</header>

	<!-- Icons Grid -->
	<section class="features-icons bg-light text-center">
	
		<div class="container">
			<div class="row">
				<div class="col-lg-4" onclick="javascript:location='http://192.168.0.27/ael/resList?cate=치킨'" style="cursor: pointer;">
					<div class="features-icons-item mx-auto mb-0 mb-lg-3">
						</div>
						<h3 style = "text-align: left;"S>&nbsp;&nbsp;치킨</h3>
						<p class="lead mb-0"><img class="photo4"
							style="height: 200px; width: 330px; margin-top: 0px; border-radius: 15px;"
							src="./adImg/main.jpg"></p>
					</div>
				<div class="col-lg-4" onclick="javascript:location='http://192.168.0.27/ael/resList?cate=피자/양식'" style="cursor: pointer;">
					<div class="features-icons-item mx-auto mb-0 mb-lg-3">
						</div>
						<h3 style = "text-align: left;">&nbsp;&nbsp;피자/양식</h3>
						<p class="lead mb-0"><img class="photo4"
							style="height: 200px; width: 330px; margin-top: 0px; border-radius: 15px;"
							src="./adImg/pizza.jpg"></p>
					</div>
				<div class="col-lg-4" onclick="javascript:location='http://192.168.0.27/ael/resList?cate=중식'" style="cursor: pointer;">
					<div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
						</div>
						<h3 style = "text-align: left;">&nbsp;&nbsp;중식</h3>
						<p class="lead mb-0"><img class="photo4"
							style="height: 200px; width: 330px; margin-top: 0px; border-radius: 15px;"
							src="./adImg/zzazang.jpg"></p>
				</div>
				
				</div>
		</div>
		
		<div class="container">
			<div class="row">
				<div class="col-lg-4" onclick="javascript:location='http://192.168.0.27/ael/resList?cate=일식/돈까스'" style="cursor: pointer;">
					<div class="features-icons-item mx-auto mb-0 mb-lg-3">
						</div>
						<h3 style = "text-align: left;">일식/돈까스</h3>
						<p class="lead mb-0"><img class="photo4"
							style="height: 200px; width: 330px; margin-top: 0px; border-radius: 15px;"
							src="./adImg/dlftlr.jpg"></p>
					</div>
				<div class="col-lg-4" onclick="javascript:location='http://192.168.0.27/ael/resList?cate=한식'" style="cursor: pointer;">
					<div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
						</div>
						<h3 style = "text-align: left;">한식</h3>
						<p class="lead mb-0"><img class="photo4"
							style="height: 200px; width: 330px; margin-top: 0px; border-radius: 15px;"
							src="./adImg/han.png"></p>
				</div>
				<div class="col-lg-4" onclick="javascript:location='http://192.168.0.27/ael/resList?cate=족발/보쌈'" style="cursor: pointer;">
					<div class="features-icons-item mx-auto mb-0 mb-lg-3">
						</div>
						<h3 style = "text-align: left;">족발/보쌈</h3>
						<p class="lead mb-0"><img class="photo4"
							style="height: 200px; width: 330px; margin-top: 0px; border-radius: 15px;"
							src="./adImg/jok.jpeg"></p>
					</div>
				</div>
		</div>
	</section>
	
	
<section class="testimonials text-center bg-light">
    <div class="container">
      <div class="row">
        <div class="col-md-6 col-md-offset-3" align="center">
            <form role="search" action="resList" method="get">
        		<div class="form-group input-group input-group-lg">
          			<input type="text" name="search" id="search" class="form-control" style="height: 50px;" placeholder="음식점 검색">
          			<div class="input-group-addon" style="padding: 0px;">
          				<button type="submit" class="btn btn-success" style="width: 100%; height: 48px; font-size: 100%;">Search</button>	
          			</div>
        		</div>
        		
      		</form>
        </div>
      </div>
    </div>
  </section>
	<!-- Footer -->
	<footer class="footer bg-light">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 h-100 text-center text-lg-left my-auto">
					<ul class="list-inline mb-2">
						<li class="list-inline-item"><a href="#">About</a></li>
						<li class="list-inline-item">&sdot;</li>
						<li class="list-inline-item"><a href="#">Contact</a></li>
						<li class="list-inline-item">&sdot;</li>
						<li class="list-inline-item"><a href="#">Terms of Use</a></li>
						<li class="list-inline-item">&sdot;</li>
						<li class="list-inline-item"><a href="#">Privacy Policy</a></li>
					</ul>
					<p class="text-muted small mb-4 mb-lg-0">&copy; Your Website
						2019. All Rights Reserved.</p>
				</div>
				<div class="col-lg-6 h-100 text-center text-lg-right my-auto">
					<ul class="list-inline mb-0">
						<li class="list-inline-item mr-3"><a href="#"> <i
								class="fab fa-facebook fa-2x fa-fw"></i>
						</a></li>
						<li class="list-inline-item mr-3"><a href="#"> <i
								class="fab fa-twitter-square fa-2x fa-fw"></i>
						</a></li>
						<li class="list-inline-item"><a href="#"> <i
								class="fab fa-instagram fa-2x fa-fw"></i>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>

	<!-- Bootstrap core JavaScript -->

</body>

</html>
