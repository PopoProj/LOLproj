<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<html>
<head>
    <title>관리자 홈</title>
    <style>
        body {
            padding: 0;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: black;
        }

        .video-container {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: -1;
        }

        video {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .button-container {
            text-align: center;

            padding: 20px;
            border-radius: 10px;
        }

        a {
            color: white;
            text-decoration: none;
            font-size: 24px;
            margin: 10px;
        }
    </style>
</head>
<body>

<div class = "homeBtn">
		  <a href= "/admin">
		      <img class="adminHome" src="../../images/popoadmin.png" width = "384px" height = "216px"/>
		  </a>
 		</div>
<h2>
	<a href="/admin/adminBoardList" /> 게시판 관리
</h2>
<h2>
	<a href="/admin/popoList" /> 회원 관리
</h2>

<h2>
	<a href="/admin/adminLogout" /> 로그아웃
</h2>

    <div class="video-container">
        <video autoplay loop>
            <source src="videos/adminhome.mp4" type="video/mp4">
        </video>
    </div>

    <div class="button-container">
        <a href="/admin/adminBoardList">게시판 관리</a>
        <a href="/admin/popoList">회원 관리</a>
    </div>
</body>
</html>

