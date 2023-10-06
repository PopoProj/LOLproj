<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "leagueAPI.SearchEngine" import = "leagueAPI.InstSummoner" import = "leagueAPI.Summoner" import = "java.util.ArrayList" import = "java.util.Map" import = "java.util.List" %>
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
	   main{
	    width: 90%;
    	margin: 0 auto;
    	display: flex;
  		flex-direction: row;
  		height:60%;
	  }
	  
      div.left {
        width: 50%;	
        display: flex;
  		flex-direction: column;
       background: #9DBAFB;
      }
      
      div.middle{
      	width: 100px;
      	 display: flex;
  		flex-direction: column;
  		justify-content: center;
  		text-align: center;
      }
      
      div.right {
        width: 50%;	
      	 display: flex;
 		 flex-direction: column;
        background: #FBA29D;
      }
 	
     	div.row{
		   	display: flex;
			flex-direction: row;
			justify-content: space-between;
			align-items: center;
			text-align: center;
			border: solid 4px white;    
			height: 20%;	
			}
     	
    div.item{
    width: 17%;
   	 font-size:18px; 
      	text-align: center;
      	align-content: center;
      }
      
    </style>
<title>Insert title here</title>
</head>
<body>

<%


	session = request.getSession(false);
	String aStr;
	if (session.getAttribute("userSessionID") != null) {
		aStr = "<a href = 'logout'> 로그아웃 </a>";
	}

	else{
		aStr = "<a href = 'toLogin'> 로그인 </a>";
	}
	
	Map<String, Map<String, InstSummoner>> participants = (Map<String, Map<String, InstSummoner>>) request.getAttribute("participants");
	String matchId = (String) request.getAttribute("matchId");
	List<InstSummoner> playersListed = new ArrayList<>();
	boolean isARAM = (boolean) request.getAttribute("isARAM");
	if (isARAM){
		playersListed = (List<InstSummoner>) request.getAttribute("aramList");
	}
	else{
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
	}

%>
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
	
      <div class="left">
		   <% 
		       	for (int i = 0; i < 5; i++){
		     
					InstSummoner player = playersListed.get(i);
	     	%>
	     		<div class = "row" OnClick="location.href ='/searchResult?sumName=<%=player.getSummonerName()%>'" style="cursor:pointer;" >
					
					<div class = "itemImagesLeft">
						<img src="../../images/item/<%=player.getItem0()%>.png" onerror="this.onerror=null; this.src='../../images/item/7050.png';" alt="item1" width = '40' height = '40' />
						<img src="../../images/item/<%=player.getItem1()%>.png" onerror="this.onerror=null; this.src='../../images/item/7050.png';" width = '40' height = '40' />
						<img src="../../images/item/<%=player.getItem2()%>.png" onerror="this.onerror=null; this.src='../../images/item/7050.png';" width = '40' height = '40' />
						<br>
						<img src="../../images/item/<%=player.getItem3()%>.png" onerror="this.onerror=null; this.src='../../images/item/7050.png';" width = '40' height = '40' />
						<img src="../../images/item/<%=player.getItem4()%>.png" onerror="this.onerror=null; this.src='../../images/item/7050.png';" width = '40' height = '40' />
						<img src="../../images/item/<%=player.getItem5()%>.png" onerror="this.onerror=null; this.src='../../images/item/7050.png';" width = '40' height = '40' />
					</div>
					
					<div class = "item">
						<strong><%=player.getKills()%> / <%=player.getDeaths()%> / <%=player.getAssists()%> </strong>
					</div>
					
					<div class = "item" >
						<%=player.getSummonerName()%>
					</div>
					
					<div class = "item"  style = "font-size:15px;">
					<%if (player.getRANKED_SOLO_5x5() == null){
							out.print("Unranked");
						}else{%>						
							<img
								src="../../images/regalia/<%=player.getRANKED_SOLO_5x5().get("tier")%>.png"
								alt="tier" width='65' height='65' /><br>
							<%=player.getRANKED_SOLO_5x5().get("tier")%> 
							<%=player.getRANKED_SOLO_5x5().get("rank")%> 
						<%} %>
					</div>
					
					<div class = "item">
						Lv.<%= player.getChampLevel()%> 
					</div>
					<div>
						<img src="../../images/champion/<%=player.getChampionName()%>.png" alt="champImg" width = '95' height = '95'/>
					</div>
					
				</div>
	      <%
	      		} 
	      %>
      </div>
      
      
      <div class = "middle">
      	<img src="../../images/lanes/TOP.png" alt="champImg" width = '105' height = '105' />
      	<img src="../../images/lanes/JUNGLE.png" alt="champImg"  width = '105' height = '105' />
      	<img src="../../images/lanes/MIDDLE.png" alt="champImg"  width = '105' height = '105' />
      	<img src="../../images/lanes/BOTTOM.png" alt="champImg"  width = '105' height = '105' />
      	<img src="../../images/lanes/UTILITY.png" alt="champImg" width = '100' height = '105' />	
      	
      </div>
      
      <div class="right">
		<% 
			for (int 	i = 5; i < 10; i++){
				InstSummoner player = playersListed.get(i);
		%>
     		<div class = "row" OnClick="location.href ='/searchResult?sumName=<%=player.getSummonerName()%>'" style="cursor:pointer;" >
     			
				<div>
					<img src="../../images/champion/<%=player.getChampionName()%>.png" alt="champImg" width = '95' height = '95' />
				</div>	
				
				<div class = "item">
					Lv.<%= player.getChampLevel()%> 
				</div>
				
				<div class = "item" style = "font-size:15px;">
				<%if (player.getRANKED_SOLO_5x5() == null){
						out.print("Unranked");
					}else{%>						
						<img
							src="../../images/regalia/<%=player.getRANKED_SOLO_5x5().get("tier")%>.png"
							alt="tier" width='65' height='65' /><br>
						<%=player.getRANKED_SOLO_5x5().get("tier")%> 
						<%=player.getRANKED_SOLO_5x5().get("rank")%> 
					<%} %>
				
				</div>
				
				<div class = "item" >
					<%=player.getSummonerName()%>
				</div>
				
				<div class = "item" >
					<strong><%=player.getKills()%> / <%=player.getDeaths()%> / <%=player.getAssists()%> </strong>
				</div>
				
				<div class = "itemImagesRight">
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
</main>

</body>
</html>