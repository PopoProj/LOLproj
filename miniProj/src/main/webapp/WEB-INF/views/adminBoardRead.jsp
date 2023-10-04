<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>관리자 게시글 상세보기</title>
    <style>
        /* 테이블 스타일 */
        .table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        td {
            border: 1px solid #ccc;
            padding: 10px;
        }
        
        /* 버튼 스타일 */
        form[action="adminBoardModifyForm"] {
            margin-top: 10px;
        }
        
        form[action="adminBoardRemove"] {
            margin-top: 10px;
        }
        
        form[action="adminBoardList"] {
            margin-top: 10px;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background: #8FAADC;
            color: white;
            font-size: 16px;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background: #487de0;
        }
    </style>
</head>
<body>
<div class = "homeBtn">
		  <a href= "/admin">
		      <img class="adminHome" src="../../images/popoadmin.png" width = "384px" height = "216px"/>
		  </a>
 		</div>
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
	
<form action="adminBoardModifyForm" method="get">
    <input type="hidden" name="boardNum" value="${board.boardNum}">
    <input type="hidden" name="page" value="${pages.page}">
    <input type="hidden" name="sizePerPage" value="${pages.sizePerPage}">
    <input type="submit" value="수정하기">
</form>

<!-- 삭제하기 버튼 -->
<!-- 해당 페이지의 유일한 게시글을 삭제할 경우 해당 페이지보다 1 작은 페이지로 넘어가게 구현해야 함 -->
<form action="adminBoardRemove" method="post">
	<input type="hidden" name="boardNum" value="${board.boardNum}">
	<input type="hidden" name="page" value="${pages.page}">
    <input type="submit" value="삭제하기">
</form>

<!-- 목록으로 돌아가기 버튼 -->
<form action="adminBoardList" method="get">
<input type="hidden" name="page" value="${pages.page}">
    <input type="hidden" name="sizePerPage" value="${pages.sizePerPage}">
    <input type="submit" value="목록으로 돌아가기">
</form>

</body>
</html>