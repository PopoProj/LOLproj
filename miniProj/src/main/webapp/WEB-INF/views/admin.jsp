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