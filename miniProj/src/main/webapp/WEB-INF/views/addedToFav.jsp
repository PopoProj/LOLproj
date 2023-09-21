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
		if(confirm("유저가 즐겨찾기 목록에 추가되었습니다. 즐겨찾기 목록으로 가시겠습니까?")){
			location.href = "toFavourites";
		}else{
			history.back();	
		}
	</script>

</body>
</html>