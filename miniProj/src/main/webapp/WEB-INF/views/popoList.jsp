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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
  }
        /* 게시글 목록 테이블 스타일 */
        .table {
            width: 100%;
            border-collapse: collapse;
        }

        .th1, .th2, .th3, .th4, .th5, .th6, .th7, .th8, .th9, .th10, .th11 {
            font-weight: bold;
        }

        .th1, .th2, .th3, .th4, .th5, .th6, .th7, .th8, .th9, .th10, .th11, td {
            border: 1px solid #ccc;
            padding: 10px;
        }

        .th1, .th2, .th3, .th4, .th5, .th6, .th7, .th8, .th9, .th10, .th11 {
            text-align: center;
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

        /* 회원 차단/차단해제 버튼 스타일 */
        form[action="popoBan"] {
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
</div>

<div class = "homeBtn">
		  <a href= "/admin">
		      <img class="adminHome" src="../../images/popoadmin.png" width = "384px" height = "216px"/>
		  </a>
 		</div>
<table class="table table-hover">
	<tr>
		<th class="th1" id="popoNum" align="center" width="80" scope="cols">회원 번호</th>

		<th class="th2" id="popoId" align="center" width="320" scope="cols">회원 아이디</th>

		<th class="th3" id="popoName" align="center" width="180" scope="cols">회원 이름</th>
		
		<th class="th4" id="popoTel" align="right" width="180" scope="cols">회원 전화번호</th>
		
		<th class="th5" id="popoEmail" align="right" width="180" scope="cols">회원 이메일</th>
		
		<th class="th6" id="popoNickname" align="center" width="180" scope="cols">회원 닉네임</th>
		
		<th class="th7" id="popoMain" align="center" width="180" scope="cols">회원 주라인</th>
		
		<th class="th8" id="popoSub" align="center" width="180" scope="cols">회원 부라인</th>
		
		<th class="th9" id="popoDate" align="left" width="180" scope="cols">회원 가입일</th>
		
		<th class="th10" id="popoQuit" align="center" width="180" scope="cols">회원 차단여부</th>
		
		<th class="th11" id="popoBan" align="center" width="180" scope="cols">회원 탈퇴여부</th>
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
						<td align="center" scope="row">
							<c:choose>
								<c:when test="${popo.popoMain == 1}">탑</c:when>
								<c:when test="${popo.popoMain == 2}">정글</c:when>
								<c:when test="${popo.popoMain == 3}">미드</c:when>
								<c:when test="${popo.popoMain == 4}">바텀</c:when>
								<c:otherwise>서포터</c:otherwise>
							</c:choose>
						</td>
						<td align="center" scope="row">
							<c:choose>
								<c:when test="${popo.popoSub == 1}">탑</c:when>
								<c:when test="${popo.popoSub == 2}">정글</c:when>
								<c:when test="${popo.popoSub == 3}">미드</c:when>
								<c:when test="${popo.popoSub == 4}">바텀</c:when>
								<c:otherwise>서포터</c:otherwise>
							</c:choose>
						</td>
						<td align="center" scope="row">
							<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${popo.popoDate}" /></td>
						<td align="center" scope="row">	
    						
    							<form action="popoBan" method="post">
    							<input type="hidden" name="popoNum" value="${popo.popoNum}">
    							<input type="hidden" name="popoBan" value="${popo.popoBan}">
    							<input type="hidden" name="page" value="${pages.page}">
    							<input type="hidden" name="sizePerPage" value="${pages.sizePerPage}">
    							<c:choose>
    							<c:when test="${popo.popoBan == 0 }">
  	  								<input type="submit" value="차단하기">
  	  							</c:when>
  	  							<c:otherwise>
  	  								<input type="submit" value="차단해제하기">
  	  							</c:otherwise>
  	  							</c:choose>
  	  							</form>	
    						
						</td>
						<td align="center" scope="row">
							<c:choose>
								<c:when test="${popo.popoQuit == 0}">
									일반회원
								</c:when>
								<c:otherwise>
									탈퇴회원
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>

<!-- 페이징 네비게이션 -->

<div class="pag" align="center">
    <c:if test="${pagination.prev}">
        <a href="/admin/popoList${pagination.makeQuery(pre)}">&laquo;</a>
    </c:if>

    <c:forEach begin="${pagination.startPage }"
        end="${pagination.endPage }" var="idx">

        <a href="/admin/popoList${pagination.makeQuery(idx)}">${idx}</a>
    </c:forEach>

    <c:if test="${pagination.next && pagination.endPage > 0}">
        <a href="/admin/popoList${pagination.makeQuery(next)}">&raquo;</a>
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