<%@page import="com.my.miniProj.model.PopoUserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
    width: 100%;
    display: flex;
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
	.container{
		display: flex;
	flex-direction: row;
	align-items: center;
  	justify-content: center;
  }
  
  .item{
  	padding: 20px;
  	font-size: 20px;
  }
  
  .left{
  width:30%;
  padding-top: 50px;
  	 padding-left: 300px;
  }
  
  .middle{
   	width:40%;
     display: flex;
	flex-direction: column;
	align-items: center;
  	justify-content: center;
  	margin-bottom: 0px;
  	}
  	
  	.right{
  	 width:30%;
  	 padding-top: 200px;
  	 padding-left: 60px;
  	}
  	

</style>
<title> 마이페이지  </title>
</head>
<body>
<script type="text/javascript">

window.addEventListener("pageshow", (event) => {
	  if (event.persisted) {
	    location.reload();
	  } 
	});
</script>

		<%
			PopoUserDTO user = (PopoUserDTO) session.getAttribute("userSessionID");
			String nickName = user.getPopoNickname();
		%>
	
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
    <div class = "left">
    	<img alt="poro" src="../../images/happyPoro.png">
    </div>
    
    <div class = "middle">
		<h2><%= nickName %>님, 환영합니다 </h2><br>
			
	    <div class = "container">	
			<div class = "item">		
				<a href = "/toFavourites"> 즐겨찾기 </a>
			</div>
			
		<div class = "item">		
				<a href = "/toRecord"> 검색기록 </a>
			</div>
			
		<div class = "item">		
				<a href = "/boardMyList"> 내가 쓴 글</a>
			</div>
			
		<div class = "item">		
				<a href = "/toMyInfo"> 내 정보 수정</a>
			</div>
			
		<div class = "item">		
				<a href = "/confirmQuit">회원탈퇴</a>
			</div>
		</div>
	</div>
	
	<div class = "right">
		<img alt="cat" src="../../images/happyCat.png">
	</div>
	</main>
</body>
</html>