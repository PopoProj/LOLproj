<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>게시글 등록</title>
</head>
<body>
<form action="boardRegister" method="post">
    <label for="boardTitle">제목:</label>
    <input type="text" id="boardTitle" name="boardTitle" required><br>

    <label for="boardContent">내용:</label>
    <textarea id="boardContent" name="boardContent" rows="4" cols="50" required></textarea><br>

    <input type="submit" value="작성">
</form>

<!-- 목록으로 돌아가기 버튼 -->
<form action="boardList" method="get">
    <input type="submit" value="목록으로 돌아가기">
</form>

</body>
</html>