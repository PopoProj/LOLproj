<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" import = "com.my.miniProj.model.FavouritesDTO" %>
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
	
		
	  div.container{
  	 font-size: 22px;
	  display: flex;
	  flex-direction: row;
	   flex-wrap: wrap;
	  width: 100%;
	  text-align: center;
	  height: 20%;
	  margin-right: 80px;
	   margin-left: 80px;
	  }
	  
	 div.indiv{
	  display: flex;
	  flex-direction: row;
	   flex-wrap: wrap;
	   width: 17%;
	   text-align: center;
	  height: 30px;
	  border: 2px solid black;
	   border-radius: 2px; 
	   margin:3px;
	  }
	  
	  
	  
	  div.item{
	    width: 80%;
	   text-align: center;
	  }
	  
	   div.delBtn{
	    width: 20%;
	   text-align: center;
	  }
  
	
</style>
<title>viewFavourites</title>
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
	<div style="font-size:40px; margin-top: 40px; text-align: center;"> 즐겨찾기</div>
	<div class = "container" style="margin-top: 40px;">
	<%
		List<FavouritesDTO> favList = (List<FavouritesDTO>) request.getAttribute("favouritesList");
		for (FavouritesDTO favUser : favList){
			String summonerName = favUser.getSumName();
	
	%>
	<div class = "indiv">

		<div class = "item" OnClick = "location.href = '/searchResult?sumName=<%=summonerName %>'" style = "cursor:pointer;">
	        	<%=summonerName %> 
	    </div>
	    <br>
		
       <div class = "delBtn" OnClick = "location.href = '/deleteFav?sumName=<%=summonerName %>'" style = "cursor:pointer;">
        	X
       </div>
       <br>
     </div>	
	<% 
		}
	%>
	
	<div style="font-size:20px; margin-top: 100px; text-align: right;"><a href = "/toMyPage"> 마이페이지로 돌아가기</a></div><br><br>
	</main>
</body>
</html>