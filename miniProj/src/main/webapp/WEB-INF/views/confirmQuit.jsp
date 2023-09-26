<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
	if (confirm("정말로 탈퇴하시겠습니까? 탈퇴후엔 같은 아이디로 로그인이 불가능합니다.")){
		location.href = "/quitUser";
	}else{
		history.back();
	}
	</script>
</body>
</html>