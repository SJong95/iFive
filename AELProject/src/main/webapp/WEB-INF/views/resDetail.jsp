<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ifive.ael.vo.*"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String id = (String) session.getAttribute("ID");
	ResVO resVO = (ResVO) request.getAttribute("resInfo");
	String rbNum = resVO.getRBNUM();
	List<ReviewReVO> reviewReList = (List<ReviewReVO>) request.getAttribute("reviewReList"); // 리뷰답변리스트
	List<ReviewVO> reviewList = (List<ReviewVO>) request.getAttribute("reviewList"); // 리뷰리스트
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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

.star {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 15px;
	height: 15px;
	display: inline-block;
	text-indent: -9999px;
}

.star.on {
	background-position: 0 0;
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
	display: inline-block;
	text-indent: -9999px;
}

.starR2 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	display: inline-block;
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
	background-color: rgba(0, 5, 0, 0.3);
	display: none;
	z-index: 4;
	left: 0;
}

.modal {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(0%, 0%);
	border-radius: 15px;
	border: 3px solid black;
	padding: 30px;
	background-color: rgba(0, 5, 0, 0.3);
	z-index: 2;
	display: none;
}

#modal-bg::before, #modal-bg::after {
	content: "";
	position: absolute;
	top: 20px;
	right: 50px;
	width: 10px;
	height: 50px;
	background-color: white;
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
	font-size: 20pt;
	text-align: right;
	cursor: pointer;
}

#modal {
	height: 100%;
	width: 100%;
	background-color: rgba(0, 5, 0, 0.3);
	position: fixed;
	top: 0;
	left: 0;
	z-index: 3000;
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

<script type="text/javascript">
function chaReview() {
	if($('#menu').css('display')=='block'){
		$('#menu').css('display','none');
		$('#review').css('display','block');
	}
}
function chaMenu() {
	if($('#review').css('display')=='block'){
		$('#menu').css('display','block');
		$('#review').css('display','none');
	}
}
function basketIn(BMENU, BPRICE) {
	   $.ajax({
	      type:"post",
	      url:"basketIn",
	      cache : false,
	      data:{"RBNUM":'${resInfo.RBNUM}',"ID":'${sessionScope.ID }',"BRNAME":'${resInfo.RNAME}',"BPRICE":BPRICE,"BMENU":BMENU},
	      dataType:"json", // json, text, xml 등 사용 가능
	      success : function(data) { // db에서 확인 후
	         if(data.BAMOUNT == 1){
	            alert("장바구니 담기");
	            
	         }else if(data.BAMOUNT >= 2){
	            alert("수량  추가");
	         }
	      },
	      error : function() { // db와 통신 실패 시 
	         alert("중복확인 ajax 실패.");
	      }
	   });
	}
$(document).ready(function() {
	$('.btn-show-modal').click(function() {
		console.log(2);
	    var $clickedBtn = $(this);
	    // 해당 속성의 값을 읽어온다.
	    var id = $clickedBtn.attr('data-id');
	    showModal(id);
	});

	// 모달 배경을 클릭하면 모달이 꺼진다.
	$('#modal-bg').click(function() {
	    hideModal();
	});

	// 윈도우에게 keydown 이벤트가 발생되면 아래 함수를 한번씩 호출 해주세요.
	$(window).keydown(function(e) {
	    // e => 사건수첩
	    // e.keyCode => 어떤키를 눌렀는지
	    
	    if ( e.keyCode == 27 ) {
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
});


var openModal = function(j) {
	  $('.Modal'+j).removeClass('hide').addClass('reveal');
	  $('#lastName').focus();
	}
	var closeModal = function(j) {
	  $('.Modal'+j).addClass('hide').removeClass('reveal')
	}
</script>
</head>
<body>
	<c:import url="nav.jsp" var="nav"></c:import>
	${nav }
	<br>
	<div style="text-align: center; border-bottom: 1px solid gray;">
		<img src="./rImg/${resInfo.RES_IMG}" class="photo3"
			style="width: 150px; height: 150px">
		<div>
			<div>
				<%
					if (resVO.getRGRADE() >= 0 && resVO.getRGRADE() < 0.3) {
				%>
				<span class="starR"></span><span class="starR"></span> <span
					class="starR"></span><span class="starR"></span> <span
					class="starR"></span>
				<%
					} else if (resVO.getRGRADE() >= 0.3 && resVO.getRGRADE() < 0.9) {
				%>
				<span class="starR1 on"></span><span class="starR2"></span> <span
					class="starR1"></span><span class="starR2"></span> <span
					class="starR1"></span><span class="starR2"></span> <span
					class="starR1"></span><span class="starR2"></span> <span
					class="starR1"></span><span class="starR2"></span>
				<%
					} else if (resVO.getRGRADE() >= 0.9 && resVO.getRGRADE() < 1.3) {
				%>
				<span class="starR on"></span><span class="starR"></span><span
					class="starR"></span><span class="starR"></span><span class="starR"></span>
				<%
					} else if (resVO.getRGRADE() >= 1.3 && resVO.getRGRADE() < 1.9) {
				%>
				<span class="starR1 on"></span><span class="starR2 on"></span><span
					class="starR1 on"></span><span class="starR2"></span><span
					class="starR1"></span><span class="starR2"></span><span
					class="starR1"></span><span class="starR2"></span><span
					class="starR1"></span><span class="starR2"></span>
				<%
					} else if (resVO.getRGRADE() >= 1.9 && resVO.getRGRADE() < 2.3) {
				%>
				<span class="starR on"></span><span class="starR on"></span><span
					class="starR"></span><span class="starR"></span><span class="starR"></span>
				<%
					} else if (resVO.getRGRADE() >= 2.3 && resVO.getRGRADE() < 2.9) {
				%>
				<span class="starR1 on"></span><span class="starR2 on"></span><span
					class="starR1 on"></span><span class="starR2 on"></span><span
					class="starR1 on"></span><span class="starR2"></span><span
					class="starR1"></span><span class="starR2"></span><span
					class="starR1"></span><span class="starR2"></span>
				<%
					} else if (resVO.getRGRADE() >= 2.9 && resVO.getRGRADE() < 3.3) {
				%>
				<span class="starR on"></span><span class="starR on"></span><span
					class="starR on"></span><span class="starR"></span><span
					class="starR"></span>
				<%
					} else if (resVO.getRGRADE() >= 3.3 && resVO.getRGRADE() < 3.9) {
				%>
				<span class="starR1 on"></span><span class="starR2 on"></span><span
					class="starR1 on"></span><span class="starR2 on"></span><span
					class="starR1 on"></span><span class="starR2 on"></span><span
					class="starR1 on"></span><span class="starR2"></span><span
					class="starR1"></span><span class="starR2"></span>
				<%
					} else if (resVO.getRGRADE() >= 3.9 && resVO.getRGRADE() < 4.3) {
				%>
				<span class="starR on"></span><span class="starR on"></span><span
					class="starR on"></span><span class="starR on"></span><span
					class="starR"></span>
				<%
					} else if (resVO.getRGRADE() >= 4.3 && resVO.getRGRADE() < 4.9) {
				%>
				<span class="starR1 on"></span><span class="starR2 on"></span><span
					class="starR1 on"></span><span class="starR2 on"></span><span
					class="starR1 on"></span><span class="starR2 on"></span><span
					class="starR1 on"></span><span class="starR2 on"></span><span
					class="starR1 on"></span><span class="starR2"></span>
				<%
					} else {
				%>
				<span class="starR on"></span><span class="starR on"></span><span
					class="starR on"></span><span class="starR on"></span><span
					class="starR on"></span>
				<%
					}
				%>
				<span style="font-size: 24pt"><b>${resInfo.RGRADE }점</b></span>
			</div>
		</div>
		<h1>${resInfo.RNAME }</h1>
		<div>
			<button class="btn btn-warning"
				style="width: 110px; background-color: #286090; border-color: #286090;"
				onclick="chaMenu()">메뉴</button>
			<button class="btn btn-warning"
				style="width: 110px; background-color: #286090; border-color: #286090;"
				onclick="chaReview()">리뷰</button>
		</div>
		<br> <br>
	</div>
	<div id="menu" style="display: block; witdth: 80%">
		<br> <br>
		<table class="table table-hover" style="width: 70%; margin: auto;">
			<c:choose>
				<c:when test="${!empty menuList }">
					<c:forEach var="menu" items="${menuList}" varStatus="st">
						<tr>
							<td><c:choose>
									<c:when test="${menu.MIMG ne null || menu.MIMG eq ''}">
										<img style="width: 80px; height: 80px" alt="${menu.MNAME}"
											src="./mImg/${menu.MIMG}">
									</c:when>
								</c:choose></td>
							<td align="left"><span
								style="font-weight: bold; font-size: 25pt">${menu.MNAME}</span>
								<span style="font-size: 11pt">&nbsp;${menu.MPRICE }원</span><br>
								<span>&nbsp;${menu.MTMI }</span></td>
							<td style="text-align: right;"><button
									class="btn btn-warning"
									style="width: 100px; height: 80px; background-color: #286090; border-color: #286090;"
									onclick="basketIn('${menu.MNAME}', ${menu.MPRICE})">담기</button></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<h1 style="text-align: center;">등록 된 메뉴가 없습니다.</h1>
					<h1 style="text-align: center;">
						<img style="width: 150px; height: 150px" src="./adImg/sad.jpg">
					</h1>
				</c:otherwise>
			</c:choose>

		</table>
	</div>
	<div class="form-group" id="review" style="display: none;">
		<br>
		<%
			if (!reviewList.isEmpty()) {
		%>
		<div style="text-align: center; border-bottom: 1px solid gray">
			<button class="btn btn-warning"
				style="width: 330px; background-color: #286090; border-color: #286090;"
				onclick="javascript:location.href='reviewPhoto?rbNum=${resInfo.RBNUM}'">사진리뷰만</button>
			<h3>
				&nbsp;&nbsp;총
				<%=reviewList.size()%>개의 리뷰가 있습니다!&nbsp;
			</h3>
			<br>
		</div>
		<%
			for (int j = 0; j < reviewList.size(); j++) {
		%>
		<div
			style="width: 100%; height: 150px; text-align: center; padding-left: 250px; padding-right: 250px;">
			<div style="width: 55%; display: inline-block; text-align: left;">
				<div class="starRev">
					<!-- 별 찍는 반복문 -->
					<b style="font-size: 17pt;"><a class="pnt"
						href="reviewMember?id=<%=reviewList.get(j).getId()%>&rbNum=<%=rbNum%>"><%=reviewList.get(j).getId()%></a></b>
					<%
						for (int i = 1; i < 6; i++) {
									if (i <= reviewList.get(j).getvGrade()) {
					%>
					<span class="star on"></span>
					<%
						} else {
					%>
					<span class="star"></span>
					<%
						}
								}
					%>
					<span style="font-size: 9pt"><%=reviewList.get(j).getvDate()%></span>
					<span style="font-size: 9pt;"><a class="pnt"
						style="text-decoration: none;"
						href="reviewReport?vNum=<%=reviewList.get(j).getvNum()%>&id=<%=id%>&rbNum=<%=rbNum%>"><img
							style="width: 18px; height: 20px" src="./adImg/report.JPG"></a></span>
					<%
						if (id.equals(resVO.getID())) {
					%>
					<span style="font-size: 9pt; text-decoration: none;"><a
						class="pnt" onclick="openModal(<%=j%>)">답변</a></span>
					<%
						}
					%> 
				</div>
				<div style="padding: 5px; font-size: 11pt">
				<b><%=reviewList.get(j).getvContent()%></b><br>
				<!--사장님 답변 -->
				<%
					for (int k = 0; k < reviewReList.size(); k++) {
								if (reviewList.get(j).getvNum() == reviewReList.get(k).getvNum()) {
				%><div style = "margin-top : 10px; background-color: rgba(0, 5, 0, 0.2); border-radius: 15px; width: 80%">
					&nbsp;&nbsp;<b>(<%=reviewReList.get(k).getvId()%>)</b><br>
					&nbsp;&nbsp;<%=reviewReList.get(k).getVrContent()%></div>
				<%
					}
							}
				%>
				</div>
			</div>
			<!--썸네일 / 모달창 -->
			<div class="form-group"
				style="width: 150px; height: 100px; overflow: hidden; display: inline-block; margin-top: 30px; margin-bottom: -10px;">

				<%
					if (reviewList.get(j).getvImgName() != null) {
				%>
				<img
					style="height: 100%; width: auto; margin-top: 0px; border-radius: 15px;"
					class="btn-show-modal pnt" data-id="product-<%=j%>"
					src="./img/<%=reviewList.get(j).getvImgName()%>">
				<%
					}
				%>

				<div id="product-<%=j%>" class="modal" style="text-align: center;">
					<img
						style="height: 70%; width: auto; margin-top: 0px; border-radius: 15px;"
						src="./img/<%=reviewList.get(j).getvImgName()%>">
				</div>

				<a href="#close"
					style="position: absolute; right: 10px; text-decoration: none; color: white; font-size: 20pt;">X</a>

			</div>
			<div id="modal-bg"></div>
		</div>

		<div id="modal" class="Modal<%=j%> hide"
			style="border: 1px solid black; text-align: center;">
			<div class="content" class="form-group" style="border-radius: 15px;">
				<div class="closeIcon" onClick="closeModal(<%=j%>)">x&nbsp;&nbsp;</div>
				<h3>사장님 답글달기</h3>
				<br>
				<form method="post" action="reviewRe" name="reviewRe" id="reviewRe">
					<input type="text" name="vrContent" id="vrContent"> <input
						type="hidden" name="vNum" value=<%=reviewList.get(j).getvNum()%>>
					<input type="hidden" name="rbNum" value=<%=rbNum%>> <br>
					<br>
					<button class="btn"
						style="width: 200px; color: white; background-color: #286090; border-color: #286090;"
						type="submit">답글달기</button>
				</form>
			</div>
		</div>

		<%
			}
			} else {
		%>
		<h1 style="text-align: center;">등록 된 리뷰가 없습니다.</h1>
		<h1 style="text-align: center;">
			<img style="width: 150px; height: 150px" src="./adImg/sad.jpg">
		</h1>
		<%
			}
		%>
	</div>
</body>
</html>