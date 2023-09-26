<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>내 게시글 상세보기</title>
</head>
<body>

	<table>
		<tr>
			<td>게시글 제목</td>
			<td>${board.boardTitle }</td>
		</tr>

		<tr>
			<td>게시글 내용</td>
			<td>${board.boardContent }</td>
		</tr>
		
		<tr>
			<td>게시글 등록일</td>
			<td>${board.boardDate }</td>
		</tr>
		
		<tr>
			<td>게시글 글쓴이</td>
			<td>${board.boardWriter }</td>
		</tr>
		
		<tr>
			<td>게시글 추천수</td>
			<td>${board.boardLike }</td>
		</tr>
		
		<tr>
			<td>게시글 조회수</td>
			<td>${board.boardViews }</td>
		</tr>
	</table>

	<!-- 수정하기 버튼 -->
<form action="myBoardModifyForm" method="get">
    <input type="hidden" name="boardNum" value="${board.boardNum}">
    <input type="hidden" name="page" value="${pages.page}">
    <input type="hidden" name="sizePerPage" value="${pages.sizePerPage}">
    <input type="submit" value="수정하기">
</form>

<!-- 삭제하기 버튼 -->
<!-- 해당 페이지의 유일한 게시글을 삭제할 경우 해당 페이지보다 1 작은 페이지로 넘어가게 구현해야 함 -->
<form action="myBoardRemove" method="post">
	<input type="hidden" name="boardNum" value="${board.boardNum}">
	<input type="hidden" name="page" value="${pages.page}">
    <input type="submit" value="삭제하기">
</form>

<!-- 내가 쓴 게시글 목록으로 돌아가기로 돌아가기 버튼 -->
<form action="boardMyList" method="get">
<input type="hidden" name="page" value="${pages.page}">
    <input type="hidden" name="sizePerPage" value="${pages.sizePerPage}">
    <input type="submit" value="내가 쓴 게시글 목록으로 돌아가기">
</form>

</body>
</html>