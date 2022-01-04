<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정</title>
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
<form action="${pageContext.request.contextPath }/member/modify" method="post" id="modifyForm">
		<h1 class="mt-5">정보 수정</h1>
		<div class="row mb-3" style="text-align: left;">
			<div class="col">
				<label>아이디</label> <input type="text" name="id" id="id" value="${loginSession.id }" class="form-control" disabled>
			</div>
		</div>
		<div class="row mb-3" style="text-align: left;">
			<div class="col">
				<label>비밀번호</label> <input type="password" name="password" value="${loginSession.password }" class="form-control">
			</div>
		</div>
		<div class="row mb-3" style="text-align: left;">
			<div class="col">
				<label>닉네임</label> <input type="text" name="nickname" value="${loginSession.nickname }" class="form-control">
			</div>
		</div>
		<div class="row mb-3">
			<div class="col">
					<button type="button" id="btn_back" class="btn btn-secondary">취소</button>
		<button type="button" id="btn_modify" class="btn btn-primary">수정</button>
			</div>
		</div>
	</form>
<script>
$(function(){
	$('#btn_back').on('click',function(){
		location.href="${pageContext.request.contextPath}/";
	});
	
	$('#btn_modify').on('click',function(){
		$('#id').attr("disabled",false);
		$('#modifyForm').submit();
	})
})
</script>
</body>
</html>
