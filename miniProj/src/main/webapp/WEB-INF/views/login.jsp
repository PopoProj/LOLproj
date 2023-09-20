<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
<form action = "loginAction" name = "loginForm">
	<div>
		<input type = "text" name = "id" placeholder = "id">
	</div>
	<div>
		<input type = "text" name = "pw" placeholder = "password">
	</div>
	<div>
		<input type = "submit" value = "로그인">
	</div>
</form>


<div>
	<a href = "inputForId">아이디 찾기</a>
	 &nbsp; &nbsp;
	<a href = "inputForRegister"> 회원가입하기</a>
</div>


</body>
</html>