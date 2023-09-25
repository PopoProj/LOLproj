<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "leagueAPI.SearchEngine" import = "leagueAPI.InstSummoner" import = "leagueAPI.Summoner" import = "java.util.ArrayList" import = "java.util.Map" import = "java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <style>
    
     header {
    margin: auto; /* header의 양쪽 여백(margin)을 동등하게 맞춤 -> 수평가운데정렬 */
    width: 100%;
    height: 200px;
    display: flex;
    align-items: center; /* 하위 요소들 수직 가운데정렬 */
    position: relative;
  }
    
      div.left {
        width: 45%;	
       float:left;
        display: flex;
  		flex-direction: column;
       background: #819FF7;
      }
      div.middle{
      	width: 10%;
      	float:left;
      }
      
      div.right {
        width: 45%;
      	float:right;
      	 display: flex;
 		 flex-direction: column;
        background: #F78181;
      }
      
      div.item1{
      	float: left;
      	width: 500px;
      	height: 100px;
      	
      	}

	  div.item2{
      	display: inline-block;
      	width: 200px;
      	height: 100px;	
      	margin-left: 10px;
      	
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
	  width: 30%; /* Four equal-width links. If you have two links, use 50%, and 33.33% for three links, etc.. */
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
<title>Insert title here</title>
</head>
<body>





<%
	Map<String, Map<String, InstSummoner>> participants = (Map<String, Map<String, InstSummoner>>) request.getAttribute("participants");
	String matchId = (String) request.getAttribute("matchId");
	List<InstSummoner> playersListed = new ArrayList<>();
	playersListed.add(participants.get("win").get("TOP"));
	playersListed.add(participants.get("win").get("JUNGLE"));
	playersListed.add(participants.get("win").get("MIDDLE"));
	playersListed.add(participants.get("win").get("BOTTOM"));
	playersListed.add(participants.get("win").get("UTILITY"));
	playersListed.add(participants.get("defeat").get("TOP"));
	playersListed.add(participants.get("defeat").get("JUNGLE"));
	playersListed.add(participants.get("defeat").get("MIDDLE"));
	playersListed.add(participants.get("defeat").get("BOTTOM"));
	playersListed.add(participants.get("defeat").get("UTILITY"));

	session = request.getSession(false);
	String aStr;
	if (session.getAttribute("userSessionID") != null) {
		aStr = "<a href = 'logout'> 로그아웃 </a>";
	}
	//boolean isSignedIn = (boolean) request.getAttribute("isSignedIn");
	else{
		aStr = "<a href = 'toLogin'> 로그인 </a>";
	}
%>
 <header>
		  <div class = "homeBtn">
		  <a href= "/">
		      <img class="popoHome" src="../../images/popo.png" width = "256px" height = "144px"/>
		  </a>
 		</div>
 		
    	<div class="topnav">
	    	  <a class = "active" href = "toMyPage"> 마이페이지</a>
	    	  <a class = "active" href = "toBoard"> 게시판 </a>
	    	  <% if (session.getAttribute("userSessionID") != null) {%>
				<a class = "active" href = 'logout'> 로그아웃 </a>
			<%} %>
	
    	</div>
</header>
<main>
	
      <div class="left">
     	 <div class = "container">
		   <% 
		       	for (int i = 0; i < 5; i++){
					InstSummoner player = playersListed.get(i);
	     	%>
	     		<div OnClick="location.href ='/searchResult?sumName=<%=player.getSummonerName().replaceAll(" ", "")%>'" style="cursor:pointer;" >
					<div class = "item1">
						<img src="../../images/champion/<%=player.getChampionName()%>.png" alt="champImg" width = '95' height = '95' />
						Lv. <%= player.getChampLevel()%> 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
						<%=player.getSummonerName()%>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<%=player.getKills()%> / <%=player.getDeaths()%> / <%=player.getAssists()%> 
					</div>
					<div class = "item2">
						<img src="../../images/item/<%=player.getItem0()%>.png" onerror="this.onerror=null; this.src='../../images/item/7050.png';" alt="item1" width = '40' height = '40' />
						<img src="../../images/item/<%=player.getItem1()%>.png" onerror="this.onerror=null; this.src='../../images/item/7050.png';" width = '40' height = '40' />
						<img src="../../images/item/<%=player.getItem2()%>.png" onerror="this.onerror=null; this.src='../../images/item/7050.png';" width = '40' height = '40' />
						<br>
						<img src="../../images/item/<%=player.getItem3()%>.png" onerror="this.onerror=null; this.src='../../images/item/7050.png';" width = '40' height = '40' />
						<img src="../../images/item/<%=player.getItem4()%>.png" onerror="this.onerror=null; this.src='../../images/item/7050.png';" width = '40' height = '40' />
						<img src="../../images/item/<%=player.getItem5()%>.png" onerror="this.onerror=null; this.src='../../images/item/7050.png';" width = '40' height = '40' />
					</div>
				</div>
	      <%
	      		} 
	      %>
     	 </div>
      </div>
      
      
      <div class = "middle" style = "text-align: center;">
      	<img src="../../images/lanes/TOP.png" alt="champImg" width = '100' height = '100' />
      	<img src="../../images/lanes/JUNGLE.png" alt="champImg"  width = '100' height = '100' />
      	<img src="../../images/lanes/MIDDLE.png" alt="champImg"  width = '100' height = '100' />
      	<img src="../../images/lanes/BOTTOM.png" alt="champImg"  width = '100' height = '100' />
      	<img src="../../images/lanes/UTILITY.png" alt="champImg" width = '100' height = '100' />	
      	
      </div>
      
      <div class="right">
      	<div class = "container">
		<% 
			for (int i = 5; i < 10; i++){
				InstSummoner player = playersListed.get(i);
		%>
	     		<div OnClick="location.href ='/searchResult?sumName=<%=player.getSummonerName().replaceAll(" ", "")%>'" style="cursor:pointer;" >
					<div class = "item1">
						<img src="../../images/champion/<%=player.getChampionName()%>.png" alt="champImg" width = '95' height = '95' />
						Lv. <%= player.getChampLevel()%> 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
						<%=player.getSummonerName()%>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<%=player.getKills()%> / <%=player.getDeaths()%> / <%=player.getAssists()%> 
					</div>
					<div class = "item2">
						<img src="../../images/item/<%=player.getItem0()%>.png" onerror="this.onerror=null; this.src='../../images/item/7050.png';" alt="item1" width = '40' height = '40' />
						<img src="../../images/item/<%=player.getItem1()%>.png" onerror="this.onerror=null; this.src='../../images/item/7050.png';" width = '40' height = '40' />
						<img src="../../images/item/<%=player.getItem2()%>.png" onerror="this.onerror=null; this.src='../../images/item/7050.png';" width = '40' height = '40' />
						<br>
						<img src="../../images/item/<%=player.getItem3()%>.png" onerror="this.onerror=null; this.src='../../images/item/7050.png';" width = '40' height = '40' />
						<img src="../../images/item/<%=player.getItem4()%>.png" onerror="this.onerror=null; this.src='../../images/item/7050.png';" width = '40' height = '40' />
						<img src="../../images/item/<%=player.getItem5()%>.png" onerror="this.onerror=null; this.src='../../images/item/7050.png';" width = '40' height = '40' />
					</div>
				</div>
	      <%
	      		} 
	      %>
     	 </div>
      </div>
</main>

</body>
</html>