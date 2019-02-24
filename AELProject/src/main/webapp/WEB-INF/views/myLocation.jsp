<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.ifive.ael.vo.*"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 위치</title>
<style>
html, body {width:100%;height:100%;margin:0;padding:0;} 
.map_wrap {position:relative;overflow:hidden;width:100%;height:350px;}
.radius_border{border:1px solid #919191;border-radius:5px;}     
.custom_typecontrol {position:absolute;top:10px;right:10px;overflow:hidden;width:130px;height:30px;margin:0;padding:0;z-index:1;font-size:12px;font-family:'Malgun Gothic', '맑은 고딕', sans-serif; box-sizing:content-box;}
.custom_typecontrol span {display:block;width:65px;height:30px;float:left;text-align:center;line-height:30px;cursor:pointer;}
.custom_typecontrol .daumbtn {background:#fff;background:linear-gradient(#fff,  #e6e6e6); }       
.custom_typecontrol .daumbtn:hover {background:#f5f5f5;background:linear-gradient(#f5f5f5,#e3e3e3);}
.custom_typecontrol .daumbtn:active {background:#e6e6e6;background:linear-gradient(#e6e6e6, #fff);}    
.custom_typecontrol .selected_btn {color:#fff;background:#425470;background:linear-gradient(#425470, #5b6d8a);}
.custom_typecontrol .selected_btn:hover {color:#fff;}   
.custom_zoomcontrol {position:absolute;top:50px;right:10px;width:36px;height:80px;overflow:hidden;z-index:1;background-color:#f5f5f5;} 
.custom_zoomcontrol span {display:block;width:36px;height:40px;text-align:center;cursor:pointer;}     
.custom_zoomcontrol span img {width:15px;height:15px;padding:12px 0;border:none;  box-sizing:unset;-webkit-box-sizing:unset;}             
.custom_zoomcontrol span:first-child{border-bottom:1px solid #bfbfbf;}         
.customoverlay {position:relative;bottom:60px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;} 
.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:48%;bottom:-12px;width:22px;height:12px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}

.pull-left > div{
margin-bottom: 3px;
}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0ad6212778155a1a026ced1c85299bb1&libraries=services"></script> 
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
function jusoList() {
	$.ajax({
		type:"post",
		url:"gidoList",
		data:{},
		dataType:"json", // json, text, xml 등 사용 가능
		success : function(data) { // db에서 확인 후
			//console.log(JSON.stringify(data));
			return data;
		},
		error : function() { // db와 통신 실패 시
			alert("중복확인 ajax 실패.");
		}
	});
}
function resDetailGo(ind) {
	location='resDetail?RBNUM='+$('#rbnum'+ind).html();
}
function distanceXY(dX, dY){ // 위도, 경도로 거리 계산하는 메소드
	var minuteX = (dX - Math.floor(dX))*60;
	var minuteY = (dY - Math.floor(dY))*60; 
	var secondX = (minuteX - Math.floor(minuteX))*60;
	var secondY = (minuteY - Math.floor(minuteY))*60;
	return {degreeX:Math.floor(dX), minuteX:Math.floor(minuteX), secondX:Math.floor(secondX), 
		degreeY:Math.floor(dY), minuteY:Math.floor(minuteY), secondY:Math.floor(secondY)};
}
function distanceResult(myL, resL){ // 위도, 경도로 거리 계산하는 메소드
	var degreeX = Math.abs(myL.degreeX - resL.degreeX);
	var degreeY = Math.abs(myL.degreeY - resL.degreeY);
	var minuteX = Math.abs(myL.minuteX - resL.minuteX);
	var minuteY = Math.abs(myL.minuteY - resL.minuteY);
	var secondX = Math.abs(myL.secondX - resL.secondX);
	var secondY = Math.abs(myL.secondY - resL.secondY);
	var distanceX = degreeX*88.804 + minuteX*1.480 + secondX*0.024668;
	var distanceY = degreeY*111.195 + minuteY*1.853 + secondY*0.030887;
	var result = Math.sqrt((distanceX*distanceX)+(distanceY*distanceY));
	// 피타고라스 정리에 의해 계산
	return Number(result.toFixed(2));
} 
function nowLocation() {
	map.panTo(myLocation);
}
//지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
function setMapType(maptype) { 
    var roadmapControl = document.getElementById('btnRoadmap');
    var skyviewControl = document.getElementById('btnSkyview'); 
    if (maptype === 'roadmap') {
        map.setMapTypeId(daum.maps.MapTypeId.ROADMAP);    
        roadmapControl.className = 'selected_btn';
        skyviewControl.className = 'daumbtn';
    } else {
        map.setMapTypeId(daum.maps.MapTypeId.HYBRID);    
        skyviewControl.className = 'selected_btn';
        roadmapControl.className = 'daumbtn';
    }
}

// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomIn() {
    map.setLevel(map.getLevel() - 1);
}

// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomOut() {
    map.setLevel(map.getLevel() + 1);
}
</script>
</head>
<body>
<c:import url="nav.jsp" var="nav"></c:import>
${nav }
	<!-- Masthead -->
		<div class="map_wrap" style="width: 100%; height: 537px;" align="center">
<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"><button onclick="nowLocation()" class="btn btn-info" style="position: absolute; right: 5px; bottom: 5px; z-index: 99;">내 위치로</button></div> 
 <div class="custom_typecontrol radius_border">
        <span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
        <span id="btnSkyview" class="daumbtn" onclick="setMapType('skyview')">스카이뷰</span>
    </div>
    <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
    <div class="custom_zoomcontrol radius_border"> 
        <span onclick="zoomIn()"><img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대"></span>  
        <span onclick="zoomOut()"><img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span>
    </div>
</div>
<div class="container-fluid" style="margin-top: 50px;" id="disRes">
</div>
<script type="text/javascript">
var geocoder = new daum.maps.services.Geocoder(); // 주소-좌표 변환 객체를 생성합니다
var myLocation, myPath, path = new Array();
var resAddr = [];
var cnt = 0;
var disObj={};
var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new daum.maps.LatLng(0,0), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};
var map = new daum.maps.Map(container, options);
function disPush() { // 거리계산한 정보를 배열에 저장
	for(var i=0;i<resAddr.length;i++){
		resAddr[i].DIS = disObj[resAddr[i].RADDR];
	}	
}
geocoder.addressSearch('${myJuso.JTOTALADDR}', function(result, status){
	// 주소 기준으로 위도와 경도로 변환해 준다.
	if(status === daum.maps.services.Status.OK){ // 위도, 경도로 변환 성공
		myLocation = new daum.maps.LatLng(result[0].y, result[0].x);
		// Daum에서 제공하는 메소드로 좌표 설정 
		map.setCenter(myLocation);
		// 지도에 중앙을 내 주소 좌표로 설정
		myPath = distanceXY(result[0].x, result[0].y);
		// 
		var marker = new daum.maps.Marker({
		    // 지도 중심좌표에 마커를 생성합니다 
		    map: map,
		    title: '내위치',
		    position: map.getCenter(),
		    image: new daum.maps.MarkerImage(
		    		"http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png",
		    		new daum.maps.Size(30,45)) // 마커 이미지 설정
		});  
		$.ajax({ // 음식점 주소 정보 가져오는 ajax
			type:"post",
			url:"resList",
			async:false,
			data:{},
			dataType:"json", // json으로 값을 받음
			success : function(data) { // db에서 확인 후
				for(var i=0;i<data.length;i++){
					resAddr.push(data[i]);
					// 전역변수인 resAddr배열에 값 저장
				}
			},
			error : function() { // db와 통신 실패 시 
				alert("중복확인 ajax 실패.");
			}
		});
		resAddr.forEach(function(addr, index) { // 가져온 음식점 정보 수만큼 반복
			geocoder.addressSearch(addr.RADDR, function(result, status){
				// 음식점 주소를 위도,경도로 변환
				disObj[addr.RADDR] = distanceResult(myPath, distanceXY(result[0].x,result[0].y));
				// 
				if(status === daum.maps.services.Status.OK){
					var coords = new daum.maps.LatLng(result[0].y, result[0].x);
					var marker = new daum.maps.Marker({
						map:map,  
						title: addr.RNAME,
						image: new daum.maps.MarkerImage(
								"https://store.naver.com/sogum/assets/pc/images/pin_restaurant_45x44.png",
								new daum.maps.Size(45,45)),
						position: coords
					});
					var index = result[0].address_name.indexOf(" ",result[0].address_name.indexOf(" ")+1)+1; 
					var raddr = result[0].address_name.substring(index)+" ("+result[0].road_address.region_3depth_name;
					var building = result[0].road_address.building_name;
					daum.maps.event.addListener(marker, 'click', function(){
						location.href='resDe?JTOTALADDR='+addr.RADDR;
					});
					var content = '<div class="customoverlay">' +
				    '  <a href="" target="_blank">' +
				    '    <span class="title">'+addr.RNAME+'</span>' +
				    '  </a>' +
				    '</div>';
					var infowindow = new daum.maps.InfoWindow({
				        content: '<div style="border-radius: 4px;" class="daumInfo"><span>'+addr.RNAME+'</span></div>' // 인포윈도우에 표시할 내용
				    });
					var customOverlay  = new daum.maps.CustomOverlay({
						position: coords, 
						content: content,
						yAnchor: 1
					});
					daum.maps.event.addListener(marker, 'mouseover', function() {
						  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
						    customOverlay.setMap(map);
						  	marker.setZIndex(999);
					});
					daum.maps.event.addListener(marker, 'mouseout', function() {
						  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
						    customOverlay.setMap(null);
						    marker.setZIndex(0);
					});
					cnt++;
				}
			});
		});
			setTimeout(function() {
				// 자바스크립트의 실행 방식때문에 setTimeout 메소드 사용 
				disPush();
				resAddr.sort(function(a, b) {
					return a.DIS - b.DIS;
				}); // 거리 정보로 배열 오름차순 정렬
				var inde = 0; // 인덱스 정보 저장을 위한 변수
				resAddr.forEach(function(addr, index) {
					if(index == 0 || index % 3 == 0){
						document.getElementById("disRes").innerHTML+=
							'<div class="row" id="disRes'+index+'"></div>';
						// 3개당 1줄 정렬로 위한 row 추가
						inde = index;
						document.getElementById("disRes"+index).innerHTML+=
							'<div class="col-md-4" onclick="resDetailGo('+index+')"><div class="pull-left"><img src="./rImg/'+addr.RES_IMG+'" style="width: 80px; height: 80px; border-radius: 10px;" ></div><div class="pull-left middle"style="padding-left: 10px;"><div style="font-size: 120%;font-weight: bold;">'+addr.RNAME+'</div><div style="color:#ffa800; font-size: 90%; display: inline-block;">★  '+addr.RGRADE+'</div>&nbsp;<div style="font-size: 90%;display: inline-block;"> | '+addr.DIS+'km</div><div >'+addr.RCHOICE+'</div><div id="rbnum'+index+'" style="display:none;">'+addr.RBNUM+'</div></div></div>';
							//음식점 정보를 하나씩 추가하는 부분
					}else{
						document.getElementById("disRes"+inde).innerHTML+=
							'<div class="col-md-4" onclick="resDetailGo('+index+')"><div class="pull-left"><img src="./rImg/'+addr.RES_IMG+'" style="width: 80px; height: 80px; border-radius: 10px;" ></div><div class="pull-left middle"style="padding-left: 10px;"><div style="font-size: 120%;font-weight: bold;">'+addr.RNAME+'</div><div style="color:#ffa800; font-size: 90%; display: inline-block;">★  '+addr.RGRADE+'</div>&nbsp;<div style="font-size: 90%;display: inline-block;"> | '+addr.DIS+'km</div><div >'+addr.RCHOICE+'</div><div id="rbnum'+index+'" style="display:none;">'+addr.RBNUM+'</div></div></div>';
							// row추가가 필요없을 때 음식점 정보를 추가하는 부분
					}
				})
			}, resAddr.length*100) //Timeout 시간 설정
		
	}
});
</script>
</body>
</html>