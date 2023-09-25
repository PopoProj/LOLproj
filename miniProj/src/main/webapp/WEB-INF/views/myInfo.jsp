<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 보기</title>
</head>
<body>

<form name="myInfo" action="myInfoEdit">
  <div class="container">
    <h1>내 정보</h1>
    <p>등록된 내 정보입니다</p>
    <hr>

		<label for="id"><b>ID : ${myInfo.popoId }</b></label>
		<br>
		<label for="name"><b>이름 : ${myInfo.popoName }</b></label>
		<br>
		<label for="tel"><b>전화번호 : ${myInfo.popoTel }</b></label>
		<br>
		<label for="email"><b>이메일 : ${myInfo.popoEmail }</b></label>
		<br>
		<label for="nickName"><b>닉네임 : ${myInfo.popoNickname }</b></label>
		<br>
		<label for="main"><b>롤 주포지션</b></label>
		<c:choose>
			<c:when test="${myInfo.popoMain == 1}">탑</c:when>
			<c:when test="${myInfo.popoMain == 2}">정글</c:when>
			<c:when test="${myInfo.popoMain == 3}">미드</c:when>
			<c:when test="${myInfo.popoMain == 4}">바텀</c:when>
			<c:otherwise>서포터</c:otherwise>
		</c:choose>
		<br>
		<label for="sub"><b>롤 부포지션</b></label>
		<c:choose>
			<c:when test="${myInfo.popoSub == 1}">탑</c:when>
			<c:when test="${myInfo.popoSub == 2}">정글</c:when>
			<c:when test="${myInfo.popoSub == 3}">미드</c:when>
			<c:when test="${myInfo.popoSub == 4}">바텀</c:when>
			<c:otherwise>서포터</c:otherwise>
		</c:choose>
	   <div class="clearfix">
      <button type="submit" class="signupbtn">회원 정보 수정</button>
    </div>
</form>
</html>