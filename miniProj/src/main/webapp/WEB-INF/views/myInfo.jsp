<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>

<style>

* {box-sizing: border-box}

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
	  overflow: auto;
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
	
/* Full-width input fields */
  input[type=text], input[type=password], input[type=tel], input[type=email], select {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for all buttons */
button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

button:hover {
  opacity:1;
}

/* Extra styles for the cancel button */
.cancelbtn {
  padding: 14px 20px;
  background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
  float: left;
  width: 50%;
}

/* Add padding to container elements */
.container {
  padding: 16px;
}

/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
  .cancelbtn, .signupbtn {
    width: 100%;
  }
}

</style>

<meta charset="UTF-8">
<title>내 정보 보기</title>
<script type = "text/javascript">
	function checkInput(form){
		var valid = true; 
		var check = /^[0-9]+$/
		
		if (!form.name.value){
			valid = false;
		}
		if (!form.email.value){
			valid = false;
		}
		if (!form.tel.value){
			valid = false;
		}
		else if (!check.test(form.phone.value)){
			valid = false;
			alert("숫자만 입력해주세요!!");
		}
		if (valid == false){
			alert("필수 필드를 채워주세요!!");
		}
		return valid; // onsubmit() --> checkInput(form1) ; return true는 form.submit과 동일 
	}
	
	 function openCheckWindow(form) {
	 	new_window = window.open("checkDuplicate?id="+form.id.value, "아이디 중복 확인",
		 						"toolbar=no,width=250,height=400,directories=no,status=no,scrollbars=yes,resize=no")
	}
 
</script>
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
	    	  <a class = "active" href="logout"> 로그아웃</a>
	    	
    	</div>

    </header>
    <main>
		<form name="myInfo" action="myInfoEditForm">
		  <div class="container">
		    <h1>내 정보</h1>
		    <p>등록된 내 정보입니다</p>
		    <hr>
				<label for="id"><b>ID : ${myInfo.popoId }</b></label>
				<br><br>
				<label for="name"><b>이름 : ${myInfo.popoName }</b></label>
				<br><br>
				<label for="tel"><b>전화번호 : ${myInfo.popoTel }</b></label>
				<br><br>
				<label for="email"><b>이메일 : ${myInfo.popoEmail }</b></label>
				<br><br>
				<label for="nickName"><b>닉네임 : ${myInfo.popoNickname }</b></label>
				<br><br>
				<label for="main"><b>롤 주포지션</b></label>
				<c:choose>
					<c:when test="${myInfo.popoMain == 1}">탑</c:when>
					<c:when test="${myInfo.popoMain == 2}">정글</c:when>
					<c:when test="${myInfo.popoMain == 3}">미드</c:when>
					<c:when test="${myInfo.popoMain == 4}">바텀</c:when>
					<c:otherwise>서포터</c:otherwise>
				</c:choose>
				<br><br>
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
	</main>
</html>