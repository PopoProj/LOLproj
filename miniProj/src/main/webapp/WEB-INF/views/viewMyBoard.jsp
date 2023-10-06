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

        /* 페이징 네비게이션 스타일 */
        .pag {
            margin-top: 20px;
            font-size: 20px;
        }

        .pag a {
            margin: 0 5px;
            text-decoration: none;
            color: #2D7D4E;
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
            background: #2D7D4E;
            color: white;
            font-size: 16px;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background: #44BE79;
        }
        
        <!-- header css -->
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

header {
    margin: auto; /* header의 양쪽 여백(margin)을 동등하게 맞춤 -> 수평가운데정렬 */
    width: 100%;
    height: 230px;
    display: flex;
    align-items: center; /* 하위 요소들 수직 가운데정렬 */
    position: relative;
  }
  .links { /* 링크들을 상단 우측에 위치시킵니다. */
    position: absolute;
    top: 0;
    right: 0;
  }
  .link_text {
    font-size: 30px;
    margin-left: 20px;
  }

  main {
    background: #FFFFFF;
    width: 80%;
    min-height: 700px;
    margin: 0 auto;

  }
   footer {
    background: darkgray;
    height: 100px;
  }
    
	  .homeBtn {
	  width: 50%;
	  background-color: #ffffff;
	  overflow: visible;
	}


	/* Style the navigation menu */
	.topnav {
	  width: 50%;
	  background-color: #555;
	  overflow: auto;
	}
	
	/* Navigation links */
	.topnav a {
	  float: left;
	  padding: 12px;
	  color: white;
	  text-decoration: none;
	  font-size: 17px;
	  width: 33%; /* 3 equal-width links. If you have two links, use 50%, and 33.33% for three links, etc.. */
	  text-align: center; /* If you want the text to be centered */
	}
	
	/* Add a background color on mouse-over */
	.topnav a.active:hover {
	  background-color: #04AA6D;
	}
	
	
	/* Add responsiveness - on screens less than 500px, make the navigation links appear on top of each other, instead of next to each other */
	@media screen and (max-width: 500px) {
	  .topnav a {
	    float: none;
	    display: block;
	    width: 100%;
	    text-align: left; /* If you want the text to be left-aligned on small screens */
	  }
	}
    </style>
</head>
<body>
<header>   
	    <div class = "homeBtn">
		  <a href= "/">
		      <img class="popoHome" src="../../images/popo.png" width = "384px" height = "216px"/>
		  </a>
		</div>	
 		
    	<div class="topnav">
	    	  <a class = "active" href="toMyPage"> 마이페이지</a>
	    	  <a class = "active" href="boardList"> 게시판 </a>    	
    	</div>

    </header>
    
    <main>
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
</main>
<script>
    var result = "${msg}";
    if (result === "SUCCESS") {
        alert("처리 완료");
    }
</script>
</body>
</html>