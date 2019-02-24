<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.ifive.ael.vo.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" %>
<html lang="ko">
<head>
	<title>로그인</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- 스타일 -->
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }

      .form-signin {
        max-width: 400px;
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
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }

    </style>
  </head>

  <body>
<c:import url="nav.jsp" var="nav"></c:import>
${nav }

    <div class="container" style="margin-top: 50px;">

      <form class="form-signin" name="loginform" action="memberLogin" method="POST">
       <h2 class="form-signin-heading">로그인</h2>
       <br>
      <div class="col-auto">
      <input type="text" class="form-control" placeholder="아이디" name="ID" id="ID" >
      </div>
      <div class="col-auto">
      <input type="password" class="form-control" placeholder="비밀번호" name="PW" id="PW">
      </div>        
      <div class="row">
      	<div class="col-md-6">
        <button class="btn btn-info btn-lg" style="width: 100%;" type="submit">로그인</button>
        </div>
        <div class="col-md-6">
        <input type="button"  class="btn btn-default btn-lg" style="width: 100%;" value="회원가입" onclick="location.href='memberJoinForm'">
        </div>
        </div>
      </form>

    </div>
  </body>
</html>
