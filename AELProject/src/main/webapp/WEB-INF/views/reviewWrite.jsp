<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   String id = (String) session.getAttribute("ID");
%>
    <%@page import="com.ifive.ael.vo.*"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰작성</title>
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

body {
font-family: "맑은고딕";
}
#td1 {
   text-align: right;
   width: 80px;
}

#vContent {
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
   cursor: pointer;
}

.starR.on {
   background-position: 0 0;
}
</style>

<script type="text/javascript"
   src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"
   src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
function fileName() {
	var imgFileName = $('#vImg').prop('files')[0].name;					
	if(new RegExp('jpg').test($('#vImg').val()) == true
			|| new RegExp('jpeg').test($('#vImg').val()) == true
			|| new RegExp('gif').test($('#vImg').val()) == true
			|| new RegExp('png').test($('#vImg').val()) == true){
		$('#imgName').val(imgFileName);
		//$('#imgName').val($('#MImg')[0].files[0].name);
	}else{
		alert("이미지 파일만 등록가능합니다.");
		$('#vImg').val('');
		$('#imgName').val('');
	}
}
</script>
</head>
<body>
<c:import url="nav.jsp" var="nav"></c:import>
${nav }
<div style="position: absolute; left: 16.5%; width: 66.5%; height: 100%; margin-top: 50px;">
		<section id="reviewformArea">
			<form method="post" action="reviewWrite" name="reviewWrite"
      id="reviewWrite" class="form-signin" enctype="multipart/form-data">
				<h2 class="form-signin-heading">리뷰작성하기</h2>
				<div class="form-group">
    				<label for="starR">별점</label> 
    				<div class="starRev">
                  <span class="starR on">1</span> <span class="starR">2</span> <span
                     class="starR">3</span> <span class="starR">4</span> <span
                     class="starR">5</span>
                      <script>
                  		$('.starRev span').click(
                        function() {
                           $(this).parent().children('span')
                                 .removeClass('on');
                           $(this).addClass('on').prevAll('span')
                                 .addClass('on');
                           $('#vGrade').val($(this).html());
                           console.log($(this).html());
                           return false;
                        });
               </script>
               <input type="hidden" name="id" value=<%=id%>>
            <input type="hidden" name="rbNum" value="${rbnum }">
            <input type="hidden" name="oNum" value="${oNum }">
            <input type="hidden" name="vGrade" id="vGrade" value="1">
            <input type="hidden" name="vReportID" id="vReportID" value="">   
               </div>
				</div>
				<div class="form-group">
					<label for="vContent">글내용</label>
					<textarea class="form-control"  rows="10" style="resize: none;" name="vContent" id="vContent" placeholder="글 내용"></textarea>
					
				</div>
				<div class="form-group">
				<label for="vImg">이미지</label>
					<div class="form-group form_file input-group">
  					<input class="form-control" type="text" title="첨부된 파일명" readonly placeholder="이미지" id="imgName">
  					<div class="file_load input-group-addon" style="padding: 0px;">
        				<input type="file" name="vImg" id="vImg" style="display: none;" onchange="fileName()">
        				<button class="btn" onclick="javascript:$('#vImg').click()" style="padding: 5px 12px;" type="button">파일 선택</button>
    				</div>
					</div>
				</div>
				<div class="row">
				<div class="btn-group col-md-8 col-md-offset-3"> 
					<button class="btn btn-lg btn-info" >작성하기</button>
					<button class="btn btn-lg btn-default" onclick='javascript:history.back();'>목록으로</button>
				</div>
					</div>	
			</form>
		</section>
	</div>

</body>
</html>