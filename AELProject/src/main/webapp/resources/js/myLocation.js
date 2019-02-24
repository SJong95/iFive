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
function disPush() {
	for(var i=0;i<resAddr.length;i++){
		resAddr[i].DIS = disObj[resAddr[i].RADDR];
	}	
}
geocoder.addressSearch('${myJuso.JTOTALADDR}', function(result, status){
	if(status === daum.maps.services.Status.OK){
		myLocation = new daum.maps.LatLng(result[0].y, result[0].x);
		map.setCenter(myLocation);
		console.log(myLocation);
		myPath = distanceXY(result[0].x, result[0].y);
		 //지도 생성 및 객체 리턴
		var marker = new daum.maps.Marker({
		    // 지도 중심좌표에 마커를 생성합니다 
		    map: map,
		    title: '내위치',
		    position: map.getCenter(),
		    image: new daum.maps.MarkerImage("http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png", new daum.maps.Size(30,45))
		});  
		$.ajax({
			type:"post",
			url:"resList",
			async:false,
			data:{},
			dataType:"json", // json, text, xml 등 사용 가능
			success : function(data) { // db에서 확인 후
				//console.log(JSON.stringify(data));
				for(var i=0;i<data.length;i++){
					resAddr.push(data[i]);
				}
			},
			error : function() { // db와 통신 실패 시 
				alert("중복확인 ajax 실패.");
			}
		});
		resAddr.forEach(function(addr, index) { 
			geocoder.addressSearch(addr.RADDR, function(result, status){
				disObj[addr.RADDR] = distanceResult(myPath, distanceXY(result[0].x,result[0].y));
				if(status === daum.maps.services.Status.OK){
					var coords = new daum.maps.LatLng(result[0].y, result[0].x);
					var marker = new daum.maps.Marker({
						map:map,  
						//title: result[0].address_name,
						title: addr.RNAME,
						image: new daum.maps.MarkerImage("https://store.naver.com/sogum/assets/pc/images/pin_restaurant_45x44.png", new daum.maps.Size(45,45)),
						position: coords
					});
					//disPush(distanceResult(myPath, distanceXY(result[0].x,result[0].y)),cnt);
					/* disObj[addr] = result[0].x;
					cnt++;
					if(cnt === resAddr.length){
						disPush();
					} */
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
				disPush();
				resAddr.sort(function(a, b) {
					return a.DIS - b.DIS;
				}); 
				resAddr.forEach(function(addr) {
					document.getElementById("disRes").innerHTML+='<tr><td><a style="text-decoration: none; color: black" href="resDetail?RBNUM='+addr.RBNUM+'">'+addr.RNAME+'</a></td><td>'+addr.RGRADE+'</td><td>'+addr.RCHOICE+'</td><td>'+addr.DIS+'</td></tr>';
				})
			}, resAddr.length*100)
		
	}
	console.log(disObj);  
	console.log(resAddr); 
});

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
function distanceXY(dX, dY){
	var minuteX = (dX - Math.floor(dX))*60;
	var minuteY = (dY - Math.floor(dY))*60; 
	var secondX = (minuteX - Math.floor(minuteX))*60;
	var secondY = (minuteY - Math.floor(minuteY))*60;
	return {degreeX:Math.floor(dX), minuteX:Math.floor(minuteX), secondX:Math.floor(secondX), 
		degreeY:Math.floor(dY), minuteY:Math.floor(minuteY), secondY:Math.floor(secondY)};
}
function distanceResult(myL, resL){
	var degreeX = Math.abs(myL.degreeX - resL.degreeX);
	var degreeY = Math.abs(myL.degreeY - resL.degreeY);
	var minuteX = Math.abs(myL.minuteX - resL.minuteX);
	var minuteY = Math.abs(myL.minuteY - resL.minuteY);
	var secondX = Math.abs(myL.secondX - resL.secondX);
	var secondY = Math.abs(myL.secondY - resL.secondY);
	var distanceX = degreeX*88.804 + minuteX*1.480 + secondX*0.024668;
	var distanceY = degreeY*111.195 + minuteY*1.853 + secondY*0.030887;
	var result = Math.sqrt((distanceX*distanceX)+(distanceY*distanceY));
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
        skyviewControl.className = 'btn';
    } else {
        map.setMapTypeId(daum.maps.MapTypeId.HYBRID);    
        skyviewControl.className = 'selected_btn';
        roadmapControl.className = 'btn';
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