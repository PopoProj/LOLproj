<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>

body {font-family: Arial, Helvetica, sans-serif;}
form {border: 3px solid #f1f1f1;}

input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
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
	  
	  main{
	      width: 60%;
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
 
button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
}

img.teemo {
  width: 50%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

</style>
<title>login</title>
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

	<form action="loginAction" method="post">
	  <div class="imgcontainer">
	    <img src="../../images/Teemo_18.jpg" alt="teemo" class="teemo">
	  </div>
	
	  <div class="container">
	    <label for="id"><b>ID</b></label>
	    <input type="text" placeholder="Enter ID" name="id" required>
	
	    <label for="pw"><b>Password</b></label>
	    <input type="password" placeholder="Enter Password" name="pw" required>
	        
	    <button type="submit">로그인</button>
	  </div>
	
	  <div class="container" style="background-color:#f1f1f1">
	    
		 <span class="id"><a href="inputForId">아이디 찾기</a></span>
		 &nbsp; &nbsp;
		<a href = "inputForRegister"> 회원가입하기</a>
	  </div>
	  
	</form>
</main>



</body>
</html>