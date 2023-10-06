<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
    <title>내 게시글 수정</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
	body {
            font-family: Arial, sans-serif;
            margin: 0 auto;
            max-width: 800px;
            padding: 20px;
        }

        h2 a {
            text-decoration: none;
            color: #2D7D4E;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        td {
            background-color: #fff;
        }

        input[type="submit"], input[type="button"] {
            padding: 10px 20px;
            background: #2D7D4E;
            color: white;
            font-size: 16px;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover, input[type="button"]:hover{
            background: #44BE79;
        }

        
    </style>
</head>
<body>
<div class = "homeBtn">
		  <a href= "/">
		      <img class="popoHome" src="../../images/popo.png" width = "384px" height = "216px"/>
		  </a>
		</div>
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
<a href="myBoardRead?boardNum=${board.boardNum}&page=${pages.page}&sizePerPage=${pages.sizePerPage}"><input type="button" value="취소"></a>

</body>
</html>