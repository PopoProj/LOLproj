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

        input[type="submit"] {
            padding: 10px 20px;
            background: #2D7D4E;
            color: white;
            font-size: 16px;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
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