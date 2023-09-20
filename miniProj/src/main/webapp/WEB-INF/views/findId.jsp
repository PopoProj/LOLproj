<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = (String) request.getAttribute("id");
	if (id.equals(null)){
		out.print("아이디를 찾을 수 없습니다. 이름 혹은 이메일을 다시 확인해주세요.");
	}else{
		out.print("찾은 아이디는 [ " + id + " ] 입니다.");
	}
%>

<br>
<a href = login> 비밀번호 찾기</a>
<br>
<a href = login>로그인하러가기</a>

</body>
</html>