<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login Required</title>
</head>
<body>

<script type="text/javascript">
	if (confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")){
		location.href = "login";
	}else{
		history.back();
	}
</script>
</body>
</html>