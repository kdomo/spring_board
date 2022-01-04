<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style>
* {
	box-sizing: border-box;
}

body {
	width: 400px;
	margin: auto;
}

form>* {
	text-align: center;
}
.alert{
padding: 8px;
}
</style>
</head>
<body>
	<form action="${pageContext.request.contextPath }/member/login" method="post">
		<h1 class="mt-5">로그인</h1>
		<div class="row mb-3" style="text-align: left;">
			<div class="col">
				<label>아이디</label> <input type="text" name="id" id="id" class="form-control">
			</div>
		</div>
		<div class="row mb-3" style="text-align: left;">
			<div class="col">
				<label>비밀번호</label> <input type="password" name="password" id="password"
					class="form-control">
			</div>
		</div>
		<div class="row mb-3" style="text-align: left;">
			<div class="col">
				<input type="checkbox" class="form-check-input"> <label>아이디
					기억하기</label>
			</div>
		</div>
		<div class="row mb-3">
			<div class="col">
				<button type="button" id="btn_login" class="btn btn-primary">로그인</button>
				<button type="button" id="btn_join" class="btn btn-primary">회원가입</button>
			</div>
		</div>
		<div class="alert" style="display: none;">
		</div>
	</form>

	<script>
		$(function() {
			let rs = "${rs}";
			console.log(rs);

			if (rs == "true") {
				$('.alert').addClass("alert-primary");
				$('.alert').html("회원가입에 성공하였습니다.");
				$('.alert').css("display","block");
				setTimeout(() => {
					$('.alert').empty();
					$('.alert').css("display","none");
					$('.alert').removeClass("alert-primary");
				}, 3000);
			}
			$('#btn_join')
					.on(
							'click',
							function() {
								location.href = "${pageContext.request.contextPath}/member/toSignup";
							});
			
			$('#btn_login').on('click',function(){
				let id = $('#id').val();
				let password = $('#password').val();
				$.ajax({
					url:"${pageContext.request.contextPath}/member/login",
					data:{id:id,password:password},
					type:"post"
				}).done(function(rs){
					console.log(rs);
					if(rs=="loginFail"){
						$('.alert').addClass("alert-danger");
						$('.alert').html("로그인에 실패하였습니다.");
						$('.alert').css("display","block");
						setTimeout(() => {
							$('.alert').empty();
							$('.alert').css("display","none");
							$('.alert').removeClass("alert-danger");
						}, 3000);
					}else if(rs=="loginSuccess"){
						location.href="${pageContext.request.contextPath}/member/toWelCome";
					}
				}).fail(function(e){
					console.log(e);
				});
			})
		})
	</script>
</body>
</html>
