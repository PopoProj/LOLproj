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
    <title>내가 쓴 게시글 목록</title>
    <style>
    
    @font-face {
    font-family: 'SUITE-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
    font-weight: 400;
    font-style: normal;
}

* {
font-family: 'SUITE-Regular';
  box-sizing: border-box;
   font-size: 20px;
  }
  </style>
</head>
<body>
</div>
<h2>
	<a href="/search" /> POPO 홈</a>
</h2>
<table class="table table-hover">
	<tr>
		<th class="th1" id="myList" align="center" width="80" scope="cols">게시글 번호</th>

		<th class="th2" id="myList" align="center" width="320" scope="cols">게시글 제목</th>

		<th class="th3" id="myList" align="left" width="180" scope="cols">게시글 발행 날짜</th>
		
		<th class="th4" id="myList" align="center" width="180" scope="cols">게시글 조회수</th>
	</tr>

	<tbody>
		<c:choose>
			<c:when test="${empty myList}">
				<tr>
					<td colspan="3">데이터 없음</td>
				</tr>
			</c:when>

			<c:otherwise>
				<c:forEach items="${myList}" var="board">

					<tr>
						<td align="center" scope="row">${board.boardNum}</td>
						
						<!-- 게시글 상세보기 할 때 페이징 요청 정보를 매개변수로 전달 -->
						<td align="center" scope="row">
							<a href="/myBoardRead${pagination.makeQuery(pagination.pages.page)}&boardNum=${board.boardNum}">${board.boardTitle}</a>
						</td>
						<td align="center" scope="row">
							<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${board.boardDate}" /></td>
						<td align="center" scope="row">${board.boardViews }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>

<!-- 페이징 네비게이션 -->

<div class="pag" align="center">
    <c:if test="${pagination.prev}">
        <a href="/toMyBoard${pagination.makeQuery(pre)}">&laquo;</a>
    </c:if>

    <c:forEach begin="${pagination.startPage }"
        end="${pagination.endPage }" var="idx">

        <a href="/toMyBoard${pagination.makeQuery(idx)}">${idx}</a>
    </c:forEach>

    <c:if test="${pagination.next && pagination.endPage > 0}">
        <a href="/toMyBoard${pagination.makeQuery(next)}">&raquo;</a>
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