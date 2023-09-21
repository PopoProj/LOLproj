<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 마이페이지  </title>
</head>
<body>
	<div>
		<%
			String nickName = (String) request.getAttribute("userNickName");
		%>
		
		<%= nickName %>님, 환영합니다 <br>
		<a href = "/toFavourites"> 즐겨찾기 </a>
		<a href = "/toRecord"> 검색기록 </a>
		<a href = "/toMyBoard"> 내가 쓴 글</a>
		<a href = "/logout"> 로그아웃하기</a>
	</div>
</body>
</html>