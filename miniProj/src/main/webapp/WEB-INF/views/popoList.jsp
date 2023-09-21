<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var="next" value="${pagination.endPage +1}"/>
<c:set var="pre" value="${pagination.startPage - 1}"/>

<html>
<head>
    <title>회원 관리 목록</title>
</head>
<body>
</div>

<h2>
	<a href="/admin" /> admin 홈</a>
</h2>
<table class="table table-hover">
	<tr>
		<th class="th1" id="popolist" align="center" width="80" scope="cols">회원 번호</th>

		<th class="th2" id="boardTitle" align="center" width="320" scope="cols">회원 아이디</th>

		<th class="th3" id="boardDate" align="center" width="180" scope="cols">회원 이름</th>
		
		<th class="th4" id="boardViews" align="right" width="180" scope="cols">회원 전화번호</th>
		
		<th class="th5" id="boardViews" align="right" width="180" scope="cols">회원 이메일</th>
		
		<th class="th6" id="boardViews" align="center" width="180" scope="cols">회원 닉네임</th>
		
		<th class="th7" id="boardViews" align="center" width="180" scope="cols">회원 주라인</th>
		
		<th class="th8" id="boardViews" align="center" width="180" scope="cols">회원 부라인</th>
		
		<th class="th9" id="boardViews" align="left" width="180" scope="cols">회원 가입일</th>
		
		<th class="th10" id="boardViews" align="center" width="180" scope="cols">회원 탈퇴여부</th>
		
		<th class="th11" id="boardViews" align="center" width="180" scope="cols">회원 차단여부</th>
	</tr>

	<tbody>
		<c:choose>
			<c:when test="${empty popoList}">
				<tr>
					<td colspan="3">데이터 없음</td>
				</tr>
			</c:when>

			<c:otherwise>
				<c:forEach items="${popoList}" var="popo">

					<tr>
						<td align="center" scope="row">${popo.popoNum}</td>
						<td align="center" scope="row">${popo.popoId}</td>
						<td align="center" scope="row">${popo.popoName}</td>
						<td align="center" scope="row">${popo.popoTel}</td>
						<td align="center" scope="row">${popo.popoEmail}</td>
						<td align="center" scope="row">${popo.popoNickname}</td>
						<td align="center" scope="row">${popo.popoMain}</td>
						<td align="center" scope="row">${popo.popoSub}</td>
						<td align="center" scope="row">
							<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${popo.popoDate}" /></td>
						<td align="center" scope="row">${popo.popoQuit }</td>
						<td align="center" scope="row">${popo.popoBan }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>

<!-- 페이징 네비게이션 -->

<div class="pag" align="center">
    <c:if test="${pagination.prev}">
        <a href="/listUsers${pagination.makeQuery(pre)}">&laquo;</a>
    </c:if>

    <c:forEach begin="${pagination.startPage }"
        end="${pagination.endPage }" var="idx">

        <a href="/listUsers${pagination.makeQuery(idx)}">${idx}</a>
    </c:forEach>

    <c:if test="${pagination.next && pagination.endPage > 0}">
        <a href="/listUsers${pagination.makeQuery(next)}">&raquo;</a>
    </c:if>
</div>

<script>
    var result = "${msg}";
    if (result === "SUCCESS") {
        alert("처리 완료");
    }
</script>
</body>
</html>