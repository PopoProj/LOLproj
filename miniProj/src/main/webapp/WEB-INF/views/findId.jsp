<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@font-face {
    font-family: 'SUITE-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
    font-weight: 400;
    font-style: normal;
}

* {
font-family: 'SUITE-Regular';
  box-sizing: border-box;
  }
</style>
</head>
<body>
<%
	String id = (String) request.getAttribute("id");
	if (id == null){
		out.print("아이디를 찾을 수 없습니다. 이름 혹은 이메일을 다시 확인해주세요.");
	}else{
		out.print("찾은 아이디는 [ " + id + " ] 입니다.");
	}
%>

<br>
<a href = "/"> 메인페이지로</a>


</body>
</html>