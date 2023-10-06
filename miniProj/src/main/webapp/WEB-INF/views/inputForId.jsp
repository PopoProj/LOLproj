<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	/* Full-width input fields */
	  input[type=text], input[type=email] {
	  width: 100%;
	  padding: 15px;
	  margin: 5px 0 22px 0;
	  display: inline-block;
	  border: none;
	  background: #f1f1f1;
	}
	
	input[type=text]:focus, input[type=email]:focus {
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
	

	
	.proceedbtn {
	 margin:auto;
	  width: 100%;
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
	
	  header {
    margin: auto; /* header의 양쪽 여백(margin)을 동등하게 맞춤 -> 수평가운데정렬 */
    width: 100%;
    height: 230px;
    display: flex;
    align-items: center; /* 하위 요소들 수직 가운데정렬 */
    position: relative;
	  }
	  
	  main{
	      width: 70%;
    	margin: 0 auto;
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
 

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <header>
 		  <div class = "homeBtn">
		  <a href= "/">
		   	 <img class="popoHome" src="../../images/popo.png" width = "384px" height = "216px"/>
		  </a>
 		</div>
 		
    	<div class="topnav">
	    	  <a class = "active" href = "toMyPage"> 마이페이지</a>
	    	  <a class = "active" href = "boardList"> 게시판 </a>
	    	    <% if (session.getAttribute("userSessionID") != null) {%>
				<a class = "active" href = 'logout'> 로그아웃 </a>
			<%} %>
	    	 
    	</div>
</header>
<main>
	<form action = "findId">
		<div>
			이름 <br>
			<input type = "text" name="name">
		</div>
		
		<div>
			이메일 <br>
			<input type="email" name="email">
		</div>
		
		<button type="submit" class="proceedbtn">아이디 찾기</button>
	</form>
</main>
</body>
</html>