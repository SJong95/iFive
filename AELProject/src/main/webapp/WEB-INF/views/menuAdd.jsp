<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
    <%@page import="com.ifive.ael.vo.*"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 등록하기</title>
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
<script type="text/javascript">
function fileName() {
	var imgFileName = $('#MFile').prop('files')[0].name;					
	if(new RegExp('jpg').test($('#MFile').val()) == true
			|| new RegExp('jpeg').test($('#MFile').val()) == true
			|| new RegExp('gif').test($('#MFile').val()) == true
			|| new RegExp('png').test($('#MFile').val()) == true){
		$('#imgName').val(imgFileName);
		//$('#imgName').val($('#MImg')[0].files[0].name);
	}else{
		alert("이미지 파일만 등록가능합니다.");
		$('#MFile').val('');
		$('#imgName').val('');
	}
}
</script>
</head>
<body>
<c:import url="nav.jsp" var="nav"></c:import>
${nav }
<div style="position: absolute; left: 16.5%; width: 66.5%; height: 100%; margin-top: 50px;">
		<section id="menuAddformArea">
			<form name="menuAdd" action="menuAdd" method="POST" class="form-signin" enctype="multipart/form-data">
				<h2 class="form-signin-heading">메뉴 등록</h2>
				<div class="form-group">
    				<label for="RBNUM">사업자 번호</label>
   					<input class="form-control" type="text" name="RBNUM" id="RBNUM" value="${RBNUM}"readonly/>
				</div>
				<div class="form-group ">
    				<label for="MNAME">메뉴 이름</label>
   					<input class="form-control" type="text" name="MNAME" id="MNAME" required="required" placeholder="메뉴 이름"/>
				</div>
				<div class="form-group"> 
    				<label for="MPRICE">가격</label>
   					<input class="form-control" type="number" id="MPRICE" name="MPRICE" required="required" placeholder="가격">
				</div>
				
				<div class="form-group">
				<label for="MFile">파일 첨부</label>
					<div class="form-group form_file input-group">
  					<input class="form-control" type="text" title="첨부된 파일명" readonly placeholder="파일 첨부" id="imgName">
  					<div class="file_load input-group-addon" style="padding: 0px;">
        				<input type="file" name="MFile" id="MFile" style="display: none;" onchange="fileName()">
        				<button class="btn" onclick="javascript:$('#MFile').click()" style="padding: 5px 12px;" type="button">파일 선택</button>
    				</div>
					</div>
				</div>
				<div class="form-group">
					<label for="MTMI">메뉴 설명</label>
					<input class="form-control" type="text" name="MTMI" id="MTMI" required="required" placeholder="메뉴 설명"/>
				</div>
				<div class="row">
				<div class="btn-group col-md-8 col-md-offset-3"> 
					<button class="btn btn-lg btn-info" >메뉴 등록</button>
					<button class="btn btn-lg btn-default"  type="button" onclick="javascript:history.back()">뒤로가기</button>
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