<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<style>
*{
box-sizing: border-box;
}
body{
width:800px;
margin:auto;
}
h1{
text-align: center;
}
table{
text-align:center;
}
</style>
</head>
<body>
<div class="row mt-5">
	<div class="col d-flex justify-content-end">
		<button type="button" class="btn btn-danger">로그아웃</button>
	</div>
</div>
<h1 class="mt-3">게시판</h1>
<table class="table table-bordered">
  <thead>
    <tr>
      <th scope="col">글번호</th>
      <th scope="col">제목</th>
      <th scope="col">글쓴이</th>
      <th scope="col">날짜</th>
      <th scope="col">조회수</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td scope="row" colspan="5">내용이 없습니다.</td>
    </tr>
  </tbody>
</table>
<div class="row mt-5">
	<div class="col d-flex justify-content-end">
		<button type="button" class="btn btn-success" id="btn_toWrite">글쓰기</button>
	</div>
</div>
<script>
$(function(){
	$('#btn_toWrite').on('click',function(){
		location.href="${pageContext.request.contextPath}/board/toWrite";
	})
})
</script>
</body>
</html>