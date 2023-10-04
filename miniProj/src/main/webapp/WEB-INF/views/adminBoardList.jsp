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
    <title>관리자 게시글 목록</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        /* 게시글 목록 테이블 스타일 */
        .table {
            width: 100%;
            border-collapse: collapse;
        }

        .th1, .th2, .th3, .th4 {
            font-weight: bold;
        }

        .th1, .th2, .th3, .th4, td {
            border: 1px solid #ccc;
            padding: 10px;
        }

        .th1, .th2, .th3, .th4 {
            text-align: center;
        }

        /* 게시글 제목 링크 스타일 */
        a {
            color: #8FAADC;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        /* 페이징 네비게이션 스타일 */
        .pag {
            margin-top: 20px;
            font-size: 20px;
        }

        .pag a {
            margin: 0 5px;
            text-decoration: none;
            color: #8FAADC;
        }

        .pag a:hover {
            text-decoration: underline;
        }

        /* 게시글 등록하기 버튼 스타일 */
        form[action="boardRegisterForm"] {
            margin-top: 20px;
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
<table class="table table-hover">
	<tr>
		<th class="th1" id="boardlist" align="center" width="80" scope="cols">게시글 번호</th>

		<th class="th2" id="boardTitle" align="center" width="320" scope="cols">게시글 제목</th>

		<th class="th3" id="boardDate" align="left" width="180" scope="cols">게시글 발행 날짜</th>
		
		<th class="th4" id="boardViews" align="center" width="180" scope="cols">게시글 조회수</th>
	</tr>

	<tbody>
		<c:choose>
			<c:when test="${empty boardList}">
				<tr>
					<td colspan="3">데이터 없음</td>
				</tr>
			</c:when>

			<c:otherwise>
				<c:forEach items="${boardList}" var="board">

					<tr>
						<td align="center" scope="row">${board.boardNum}</td>
						
						<!-- 게시글 상세보기 할 때 페이징 요청 정보를 매개변수로 전달 -->
						<td align="center" scope="row">
							<a href="/admin/adminBoardRead${pagination.makeQuery(pagination.pages.page)}&boardNum=${board.boardNum}">${board.boardTitle}</a>
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
        <a href="/admin/adminBoardList${pagination.makeQuery(pre)}">&laquo;</a>
    </c:if>

    <c:forEach begin="${pagination.startPage }"
        end="${pagination.endPage }" var="idx">

        <a href="/admin/adminBoardList${pagination.makeQuery(idx)}">${idx}</a>
    </c:forEach>

    <c:if test="${pagination.next && pagination.endPage > 0}">
        <a href="/admin/adminBoardList${pagination.makeQuery(next)}">&raquo;</a>
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