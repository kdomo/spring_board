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
				<input type="checkbox" class="form-check-input" id="rememberId">
				<label class="form-check-label">아이디 기억하기</label>
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
			
			//쿠키값 가져오기
			console.log(document.cookie);
			let regex = /rememberId=(.*)/;
			if(regex.test(document.cookie)){
				let rememberId = RegExp.$1;
				$('#id').val(rememberId);
				$('#rememberId').attr("checked",true);
			}
			
			 $("#rememberId").change(function(){
				 if(!$('#rememberId').is(":checked")){
					 deleteCookie();
				 }
			 })
			
			//쿠키 삭제
			//쿠키는 삭제가 불가능함 -> 만료일이 되어야만 쿠키가 삭제됌
			//만료일을 과거의 날짜로 덮어쓰기하여 삭제되게 함
			function deleteCookie(){
				let currentDate = new Date();
				currentDate.setDate(currentDate.getDate() - 30);
				let previousDate = currentDate;
				document.cookie = "rememberId=;Expires="+previousDate;
			}
			
			//쿠키 생성 아이디 기억하기 체크 후 로그인 하면 한달동안 저장
			//오늘 날짜,한달이 지난 시점
			//세션은 만료일을 지정해주지 않으면 세션과 똑같음 ->브라우저가 종료되면 삭제됌
			function createCookie(){
				let currentDate = new Date();
				currentDate.setDate(currentDate.getDate() + 30);
				let expiryDate = currentDate;
				
				//쿠키 생성
				let key = "rememberId";
				let value = $('#id').val();
				
				document.cookie = key+"="+value+";Expires="+expiryDate;
			}
			
			let rs = "${rs}";

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
						if($('#rememberId').is(":checked")){
							createCookie();
						}else{
							
						}
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
