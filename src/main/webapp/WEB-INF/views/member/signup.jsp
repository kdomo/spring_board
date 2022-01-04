<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup</title>
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
width:400px;
margin:auto;
}
form > * {
text-align: center;
}
</style>
</head>
<body>
	<form action="${pageContext.request.contextPath }/member/signup" method="post" id="signupForm">
		<h1 class="mt-5">회원가입</h1>
		<div class="row mb-3" style="text-align: left;">
			<div class="col-8">
				<label>아이디</label> <input type="text" name="id" id="id" class="form-control">
			</div>
			<div class="col-4">
					<button type="button" id="btn_check" class="btn btn-primary mt-4 col-12">중복확인</button>
			</div>
		</div>
		<div class="row mb-3" style="text-align: left;">
			<div class="col">
				<label>비밀번호</label> <input type="password" name="password"  class="form-control">
			</div>
		</div>
		<div class="row mb-3" style="text-align: left;">
			<div class="col">
				<label>닉네임</label> <input type="text" name="nickname"  class="form-control">
			</div>
		</div>
		<div class="row mb-3">
			<div class="col">
					<button type="button" id="btn_back" class="btn btn-secondary">취소</button>
		<button type="button" id="btn_signup" class="btn btn-primary">가입</button>
			</div>
		</div>
	</form>
	
<script>
$(function(){
	$('#btn_check').on('click',function(){
		let id = $('#id').val();
		
		$.ajax({
			url:"${pageContext.request.contextPath}/member/checkId",
			type:"post",
			data:{id:id}
		}).done(function(rs){
			if(rs=="available"){
				alert(id+"는 사용할 수 있는 아이디 입니다.");
			}else if(rs=="unavailable"){
				alert(id+"는 사용할 수 없는 아이디 입니다.");
			}
			console.log(rs);
		}).fail(function(e){
			console.log(e);
		});
	})
	$('#btn_back').on('click',function(){
		location.href="${pageContext.request.contextPath}/";
	})
	$('#btn_signup').on('click',function(){
		$('#signupForm').submit();
	})
})
</script>
</body>
</html>
