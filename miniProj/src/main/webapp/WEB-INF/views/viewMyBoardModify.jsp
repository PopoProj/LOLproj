<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
    <title>내 게시글 수정</title>
</head>
<body>

<form action="myBoardModify" method="POST">
    <input type="hidden" name="boardNum" value="${board.boardNum}">
    <input type="hidden" name="page" value="${pages.page}">
    <input type="hidden" name="sizePerPage" value="${pages.sizePerPage}">

    <label for="title">제목:</label>
    <input type="text" id="boardTitle" name="boardTitle" value="${board.boardTitle}" required><br>

    <label for="content">내용:</label>
    <textarea id="content" name="boardContent" rows="4" cols="50" required>${board.boardContent}</textarea><br>

    <input type="submit" value="수정">
</form>

<!-- 게시글 상세 페이지로 이동 -->
<a href="myBoardRead?boardNum=${board.boardNum}&page=${pages.page}&sizePerPage=${pages.sizePerPage}">취소</a>

</body>
</html>