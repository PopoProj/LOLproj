<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
    <title>관리자 게시글 수정</title>
    <style>
        /* 테이블 스타일 */
        .table {
            width: 100%;
            border-collapse: collapse;
        }
        td {
            border: 1px solid #ccc;
            padding: 10px;
        }
        
        /* 버튼 스타일 */
        form[action="adminBoardModify"] {
            margin-top: 10px;
            margin-bottom: 10px;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background: #8FAADC;
            color: white;
            font-size: 16px;
            border: none;
            cursor: pointer;
            margin-top: 10px;
        }

        input[type="submit"]:hover {
            background: #487de0;
        }
        
         /* 링크 스타일 */
        a.button {
            display: inline-block;
            padding: 10px 20px;
            background: #8FAADC;
            color: white;
            text-decoration: none;
            font-size: 16px;
            border: none;
            cursor: pointer;
        }

        a.button:hover {
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
<form action="adminBoardModify" method="post">
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
<a href="adminBoardRead?boardNum=${board.boardNum}&page=${pages.page}&sizePerPage=${pages.sizePerPage}" class="button">취소</a>

</body>
</html>