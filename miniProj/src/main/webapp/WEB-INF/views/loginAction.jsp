<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.my.miniProj.model.PopoUserDTO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	boolean isLogin = (null == (PopoUserDTO) request.getAttribute("result"))? false:true;
%>



<script>
	function proceed(){
		
		if (<%= !isLogin %>){
			alert("아이디 혹은 비밀번호를 다시 확인해주세요.");
			history.back();
		}
		else{
			location.href = "/";
		}	
	}
	proceed();
</script>

</body>
</html>