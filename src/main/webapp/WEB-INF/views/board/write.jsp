<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<style>
* {
	box-sizing: border-box;
}

body {
	width: 800px;
	margin: auto;
}

h1 {
	text-align: center;
}

table {
	text-align: center;
}

form>* {
	text-align: center;
}

#content {
	resize: none;
}
</style>
</head>
<body>
	<div class="row mt-5">
		<div class="col d-flex justify-content-end">
			<button type="button" class="btn btn-danger">로그아웃</button>
		</div>
	</div>
	<h1 class="mt-3">글쓰기</h1>


	<form action="${pageContext.request.contextPath }/board/write"
		method="post" id="signupForm">
		<div class="row mb-3" style="text-align: left;">
			<div class="col">
				<label>제목</label> <input type="text" name="title" id="title"
					class="form-control">
			</div>
		</div>
		<div class="row mb-3" style="text-align: left;">
			<div class="col">
				<label>파일첨부</label> <input type="file" name="file"
					class="form-control">
			</div>
		</div>
		<div class="row mb-3" style="text-align: left;">
			<div class="col">
				<label>내용</label>
				<textarea rows="6" cols="3" name="content" id="content"
					class="form-control"></textarea>
			</div>
		</div>
		<div class="row mt-3 d-flex justify-content-center">
			<div class="col">
				<button type="button" class="btn btn-secondary">취소</button>
			</div>
			<div class="col">
				<button type="button" class="btn btn-primary">등록</button>
			</div>
		</div>
	</form>



</body>
</html>