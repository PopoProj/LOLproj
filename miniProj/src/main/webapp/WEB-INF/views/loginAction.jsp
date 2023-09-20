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
	int result = (int) request.getAttribute("result");
%>



<script>
	function proceed(){
		var result = <%= result %>
		if (result == 0){
			alert("아이디 혹은 비밀번호를 다시 확인해주세요.");
			history.back();
		}
		else{
			location.href = "/search";
		}	
	}
	proceed();
</script>

</body>
</html>