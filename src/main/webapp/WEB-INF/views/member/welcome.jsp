<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>welcome</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style>
*{
box-sizing: border-box;
}
body{
width:800px;
margin:auto;
}
form > * {
text-align: center;
}
</style>
</head>
<body>
<div class="row mb-3">
<h2>${loginSession.id}님 안녕하세요.</h2>
</div>
<div class="row">
	<div class="col-3">
		<button class="btn btn-dark col-12" type="button" id="btn_logout">로그아웃</button>
	</div>
	<div class="col-3">
		<button class="btn btn-success col-12" type="button" id="btn_modify">정보수정</button>
	</div>
	<div class="col-3">
		<button class="btn btn-primary col-12" type="button" id="btn_board">게시판</button>
	</div>
	<div class="col-3">
		<button class="btn btn-danger col-12" type="button" id="btn_signout">회원탈퇴</button>
	</div>
</div>
<script>
$(function(){	
	//로그아웃 버튼을 클릭했을때
	$('#btn_logout').on('click',function(){
		location.href="${pageContext.request.contextPath}/member/logout";
	})
	
	//정보수정 버튼을 클릭했을때
	$('#btn_modify').on('click',function(){
		location.href="${pageContext.request.contextPath}/member/toModify";
	})
	
	//게시판 버튼을 클릭했을때
	$('#btn_board').on('click',function(){
		location.href="${pageContext.request.contextPath}/board/toBoard";
	})
});
</script>
</body>
</html>
