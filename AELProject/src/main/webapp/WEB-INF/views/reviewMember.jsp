<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ifive.ael.vo.*"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String id = (String) session.getAttribute("ID");
	List<ReviewVO> reviewList = (List<ReviewVO>) request.getAttribute("reviewList");
	List<ResVO> resList = (List<ResVO>) request.getAttribute("resList");// 리뷰리스트
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 리뷰 모아보기</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="<c:url value="/js/egovframework/mbl/cmm/jquery-1.11.2.min.js" />"></script>

<style type="text/css">
body {
	font-size: 12pt;
}

#td1 {
	text-align: center;
	width: 80px;
}

#vrContent {
	height: 200px;
}

input {
	width: 300px;
	padding-right:
}

#in1 {
	width: 100px;
}

.starR {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 30px;
	height: 30px;
	display: inline-block;
	text-indent: -9999px;
}

.starR.on {
	background-position: 0 0;
}

.starR1 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat -52px 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
}

.starR2 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
}

.starR1.on {
	background-position: 0 0;
}

.starR2.on {
	background-position: -15px 0;
}

#td1 {
	text-align: right;
	width: 80px;
}

#vContent {
	height: 200px;
}

#modal-bg {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.3);
	display: none;
	z-index: 4;
}

.modal {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	border: 10px solid black;
	padding: 30px;
	background-color: white;
	z-index: 5;
	display: none;
}

#modal-bg::before, #modal-bg::after {
	content: "";
	position: absolute;
	top: 20px;
	right: 50px;
	width: 10px;
	height: 50px;
	background-color: black;
	transform: rotate(45deg);
	cursor: pointer;
}

#modal-bg::after {
	transform: rotate(-45deg);
}

.modal.active {
	display: block;
}

.hide {
	display: none;
}

.reveal {
	display: flex;
	align-items: center;
	justify-content: center;
	overflow: hidden;
}

.closeIcon {
	font-size: 25pt;
	text-align: right;
	cursor: pointer;
}

#modal {
	height: 100%;
	width: 100%;
	background-color: rgba(0, 0, 0, 0.1);
	position: fixed;
	top: 0;
	left: 0;
	z-index: 1000;
}

.pnt {
	cursor: pointer;
	color: black;
	text-decoration: none;
}

.content {
	height: 410px;
	width: 410px;
	background-color: white;
}

.d-f {
	display: flex;
}
</style>

<script>
	function modal() {
		console.log(1);
		$('.btn-show-modal').click(function() {
			console.log(2);
			var $clickedBtn = $(this);
			var id = $clickedBtn.attr('data-id');
			showModal(id);
		});

		// 모달 배경을 클릭하면 모달이 꺼진다.
		$('#modal-bg').click(function() {
			hideModal();
		});
	}

	// 윈도우에게 keydown 이벤트가 발생되면 아래 함수를 한번씩 호출 해주세요.
	$(window).keydown(function(e) {
		// e => 사건수첩
		// e.keyCode => 어떤키를 눌렀는지

		if (e.keyCode == 27) {
			hideModal();
		}
	});

	// 모달을 보여주는 함수
	// modalId => 모달의 id
	function showModal(modalId) {
		// 모달의 배경을 보여주다.
		$('#modal-bg').css('display', 'block');
		// .css('display', 'block'); 와 .show(); 는 같다.
		$('#' + modalId).addClass('active');
	}

	function hideModal() {
		// 모달의 배경을 숨겨준다.
		$('#modal-bg').css('display', 'none');
		$('.modal.active').removeClass('active');
	}
</script>
</head>
<body>
<c:import url="nav.jsp" var="nav"></c:import>
${nav }
	<div>
		<%
			for (int i = 0; i < reviewList.size(); i++) {
				for (int j = 0; j < resList.size(); j++) {
					if (reviewList.get(i).getRbNum().equals(resList.get(j).getRBNUM())) {
		%>
		<b style="font-size: 17pt;"><a class = "pnt" 
		href ="resDetail?RBNUM=<%=resList.get(j).getRBNUM()%>"><%=resList.get(j).getRNAME()%></a></b><br>
		<%
			for (int k = 1; k < 6; k++) {
							if (k <= reviewList.get(i).getvGrade()) {
		%>
		<span class="starR on"></span>
		<%
			} else {
		%>
		<span class="starR"></span>
		<%
			}
						}
		%><span style="font-size: 9pt"><%=reviewList.get(i).getvDate()%></span>
		<br>
		<div style="width: 300px; height: 200px; overflow: hidden;">

			<%
				if (reviewList.get(j).getvImgName() != null) {
			%>

			<img style="height: 100%; width: auto; margin-top: 0px;"
				class="btn-show-modal pnt" data-id="product-<%=j%>"
				onclick="modal()" src="./img/<%=reviewList.get(i).getvImgName()%>">
			<%
				}
			%>
			<div id="product-<%=j%>" class="modal" style="text-align: center;">
				<img style="height: 50%; width: auto; margin-top: 0px"
					src="./img/<%=reviewList.get(i).getvImgName()%>">
			</div>

			<!-- 	<a href="#close"
						style="position: absolute; right: 10px; text-decoration: none; color: white; font-size: 20pt;">X</a>
				 -->
			<div id="modal-bg"></div>
		</div>
		<div style="padding: 5px;">
				<%=reviewList.get(i).getvContent()%>
			</div><br><br>
		<%
			}
		%>
			<%
				}
				}
			%>
	</div>
	<%-- 	<div id="review" style="border: 1px solid black; display: none;">
		<h3>
			&nbsp;&nbsp;총
			<%=reviewList.size()%>개의 리뷰가 있오효
		</h3>
		<%
			if (!reviewList.isEmpty()) {
				for (int j = 0; j < reviewList.size(); j++) {
		%>
		<div style="padding: 7px; height: 100px;">
			<div style="width: 80%; display: inline-block;">
				<div class="starRev">
					<!-- 별 찍는 반복문 -->
					<%
						for (int i = 1; i < 6; i++) {
									if (i <= reviewList.get(j).getvGrade()) {
					%>
					<span class="starR on"></span>
					<%
						} else {
					%>
					<span class="starR"></span>
					<%
						}
								}
					%>
					<span style="font-size: 9pt"><%=reviewList.get(j).getvDate()%></span>

				</div>
				<div style="padding: 5px;">
					<%=reviewList.get(j).getvContent()%><br> <br>
				</div>

			</div>
			<!--썸네일 / 모달창 -->
			<div
				style="width: 120px; height: 75px; overflow: hidden; display: inline-block;">

				<%
					if (reviewList.get(j).getvImgName() != null) {
				%>

				<img style="height: 100%; width: auto; margin-top: 0px;"
					class="btn-show-modal pnt" data-id="product-<%=j%>"
					onclick="modal()" src="./img/<%=reviewList.get(j).getvImgName()%>">
				<%
					}
				%>

				<div id="product-<%=j%>" class="modal" style="text-align: center;">
					<img style="height: 50%; width: auto; margin-top: 0px"
						src="./img/<%=reviewList.get(j).getvImgName()%>">
				</div>

				<div id="modal-bg"></div>
			</div>
		</div>
		<%
			}
			} else {
		%>
		등록 된 리뷰가 없습니다.
		<%
			}
		%>
	</div> --%>
</body>
</html>