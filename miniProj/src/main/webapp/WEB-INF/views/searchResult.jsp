<%@page import="com.my.miniProj.model.RecordDTO"%>
<%@page import="com.my.miniProj.model.FavouritesDTO"%>
<%@page import="com.my.miniProj.model.PopoUserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="leagueAPI.SearchEngine" import="leagueAPI.InstSummoner"
	import="leagueAPI.Summoner" import="java.util.Map" import="java.util.Date"
	import="java.util.HashMap" import="java.util.List" import = "java.text.SimpleDateFormat"%>

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
	  
	  main{
	      width: 80%;
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
 
      div.left {	
        width: 50%;
        display:flex;
		 flex-direction:column;
        box-sizing: border-box;
      }

      div.leftTop {
        width: 100%;
        display:flex;
        flex-direction:row;
        box-sizing: border-box;
      }
        div.leftBottom {
        width: 100%;
        display:flex;
        flex-direction:column;
        box-sizing: border-box;
      }
      
      div.right {
        width: 50%;
        display:flex;
        flex-direction:column;
        box-sizing: border-box;
      }
      
      div.infoLeft {
        width: 30%;
        float: left;
        box-sizing: border-box;
      }
      div.infoRight {
        width: 70%;
      	float: right;
        flex-direction:column;
        box-sizing: border-box;
      }
      div.rankLeft {
        width: 50%;
        float: left;
        box-sizing: border-box;
      }
      div.rankRight {
        width: 50%;
      	float: right;
        flex-direction:column;
        box-sizing: border-box;
      }
      
      div.row {
        width: 100%;
        display:flex;
        flex-direction:row;
        justify-content: space-between;
        margin-top: 5px;
        box-sizing: border-box;
        flex-wrap: nowrap;
        align-items: center;
        /*text-align: center;*/
      }
      
      div.item{
      width:12%;
      	text-align: center;
      	align-content: center;
      }
    </style>

<title>Search Result</title>

</head>
<body>

	<%
	Summoner searched = (Summoner) request.getAttribute("searched");
	List<Map<String, Object>> recentMatchData = (List<Map<String, Object>>) request.getAttribute("matchData");

	int topRate = searched.getLaneMap().get("TOP").get("winrate");
	int jgRate = searched.getLaneMap().get("JUNGLE").get("winrate");
	int midRate = searched.getLaneMap().get("MIDDLE").get("winrate");
	int botRate = searched.getLaneMap().get("BOTTOM").get("winrate");
	int supRate = searched.getLaneMap().get("UTILITY").get("winrate");

	double topPick = (double)(searched.getLaneMap().get("TOP").get("win") + searched.getLaneMap().get("TOP").get("defeat"))/10;
	double jgPick = (double)(searched.getLaneMap().get("JUNGLE").get("win") + searched.getLaneMap().get("JUNGLE").get("defeat"))/10;
	double midPick = (double)(searched.getLaneMap().get("MIDDLE").get("win") + searched.getLaneMap().get("MIDDLE").get("defeat"))/10;
	double botPick = (double)(searched.getLaneMap().get("BOTTOM").get("win") + searched.getLaneMap().get("BOTTOM").get("defeat"))/10;
	double supPick = (double)(searched.getLaneMap().get("UTILITY").get("win") + searched.getLaneMap().get("UTILITY").get("defeat"))/10;
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
  	<div class="left" style="float: left;">
		
  			<div class = "leftTop">
				<div class = "infoLeft" style = "height:300px" >
					<img src="../../images/profileicon/<%=searched.getProfileIconId()%>.png" alt="profileIcon" width = '150' height = '150' />

					<div>
						<Strong><%=searched.getName()%></Strong> 레벨:
						<%=searched.getSummonerLevel()%>
						<div
							OnClick="location.href = '/addFav?sumName=<%=searched.getName()%>'"
							style="cursor: pointer;">[즐겨찾기에 추가하기]</div>
					</div>
				</div>
				<div class="infoRight" style="height: 300px">
					<div class="rankLeft">
						솔로랭크 <br> 
						
						<%if (searched.getRANKED_SOLO_5x5().get("tier") == null){
							out.print("정보없음");
						}else{%>						
							<img
								src="../../images/regalia/<%=searched.getRANKED_SOLO_5x5().get("tier")%>.png"
								alt="tier" width='150' height='150' /><br>
							<%=searched.getRANKED_SOLO_5x5().get("tier")%> 
							<%=searched.getRANKED_SOLO_5x5().get("rank")%> 
							<%=searched.getRANKED_SOLO_5x5().get("leaguePoints")%>점
						<%} %>
					</div>

					<div class="rankRight">
						자유랭크<br>
						<%if (searched.getRANKED_FLEX_SR().get("tier") == null){
							out.print("정보없음");
						}else{%>	
						<img
							src="../../images/regalia/<%=searched.getRANKED_FLEX_SR().get("tier")%>.png"
							alt="tier" width='150' height='150' /><br>
						<%=searched.getRANKED_FLEX_SR().get("tier")%> 
						<%=searched.getRANKED_FLEX_SR().get("rank")%> 
						<%=searched.getRANKED_FLEX_SR().get("leaguePoints")%>점
						<%} %>
					</div>

		        </div>
		    
	   </div>
	
		<div class = "leftBottom">
			
			<div> 최근 10판 라인별 픽률 </div>
			<div id = "lanePickRate"></div>
			<div> 최근 10판 라인별 승률 </div>			
			<div id="laneWinRate"></div>	
		</div>	
	</div>
	
	 <div class="right" style="float: right;">
		
			<% 
			for (Map<String, Object> metaData : recentMatchData){
				InstSummoner temp = (InstSummoner) metaData.get("summonerData");
				long gameCreation = (long) metaData.get("gameCreation");
				long gameDuration = (long) metaData.get("gameDuration");
				long queueId = (long) metaData.get("queueId");	
				String colour;
				
				Date date = new Date(gameCreation);
				
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd"); 
	        	String dateStr = simpleDateFormat.format(date); 

				
				int min = Integer.parseInt(String.valueOf(gameDuration)) / 60;
				int sec = Integer.parseInt(String.valueOf(gameDuration)) % 60;
				String gameType;
				if (queueId == 430){
					gameType = "일반";
				}
				else if (queueId == 420){
					gameType = "솔로랭크";
				}
				else if (queueId == 440){
					gameType = "자유랭크";
				}
				else if (queueId == 450){
					gameType = "칼바람";
				}else{
					gameType = "기타";}
				
				
				if (temp.isWin()){
					colour = "#9DBAFB"; 
				}else{
					colour = "#FBA29D";
				}				
			%>
			
			<div OnClick="location.href ='/matchDetails?matchId=<%=temp.getMatchId()%>'" style="cursor:pointer;" >
				<div class = "row" style='background-color: <%=colour%>'>
					<div class = "item" style = " display: flex; flex-direction: row; align-items: flex-end">
						<img src="../../images/champion/<%=temp.getChampionName()%>.png" alt="champImg" width = '87' height = '87' />
						Lv.<%= temp.getChampLevel()%> 
					</div>
					
					<div class = "item">
						<%=temp.getKills()%>
						/
						<%=temp.getDeaths()%>
						/
						<%=temp.getAssists()%>
					</div>
					
					<div class = "item">
						<%=gameType %>
					</div>
					
					<div class = "item">
						<%=String.format("%02d", min) %> : <%=String.format("%02d", sec) %>
					</div>
					
					<div class = "item" style = "text-align: right">
						<%=dateStr %>
					</div>
			

					<div class="itemImages" style='background-color: <%=colour%>'>
	
						<img src="../../images/item/<%=temp.getItem0()%>.png"
							onerror="this.onerror=null; this.src='../../images/item/7050.png';"
							alt="item1" width='40' height='40' /> 
							<img
							src="../../images/item/<%=temp.getItem1()%>.png"
							onerror="this.onerror=null; this.src='../../images/item/7050.png';"
							width='40' height='40' /> 
							<img
							src="../../images/item/<%=temp.getItem2()%>.png"
							onerror="this.onerror=null; this.src='../../images/item/7050.png';"
							width='40' height='40' /> <br> 
							<img
							src="../../images/item/<%=temp.getItem3()%>.png"
							onerror="this.onerror=null; this.src='../../images/item/7050.png';"
							width='40' height='40' /> 
							<img
							src="../../images/item/<%=temp.getItem4()%>.png"
							onerror="this.onerror=null; this.src='../../images/item/7050.png';"
							width='40' height='40' /> 
							<img
							src="../../images/item/<%=temp.getItem5()%>.png"
							onerror="this.onerror=null; this.src='../../images/item/7050.png';"
							width='40' height='40' />
					</div>
				</div>
        
			</div>
			<%
			}
			%>

	</div>
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	    <script type="text/javascript">
	    

	    // Load Charts and the corechart package.
	      google.charts.load('current', {'packages':['corechart']});

	      // Draw the pie chart for Sarah's pizza when Charts is loaded.
	      google.charts.setOnLoadCallback(drawChart1);

	      // Draw the pie chart for the Anthony's pizza when Charts is loaded.
	      google.charts.setOnLoadCallback(drawChart2);

	      // Callback that creates and populates a data table,
	      // instantiates the pie chart, passes in the data and
	      // draws it.
	      function drawChart1() {

	        // Create the data table.
	        var data = new google.visualization.DataTable();
	        data.addColumn('string', 'Topping');
	        data.addColumn('number', '픽률');
	        data.addRows([
	          ['탑', <%= topPick%>],
	          ['정글', <%= jgPick%>],
	          ['미드', <%= midPick%>],
	          ['봇', <%= botPick%>],
	          ['서폿', <%= supPick%>]
	        ]);

	        // Set chart options	
	        var options = {'width':400,
	                       'height':300,
	                       'colors': ['#D1CB67', '#6AD167', '#D16767', '#67B4D1', '#AF67D1']               
	        };

	        // Instantiate and draw our chart, passing in some options.
	        var chart = new google.visualization.PieChart(document.getElementById('lanePickRate'));
	        chart.draw(data, options);
	      }
	      function drawChart2() {

	    	  var data = google.visualization.arrayToDataTable([
	    	        ['Lane', '승률', { role: 'style' } ],
	    	        ['탑', <%= topRate%>, "color: #D1CB67"],
	    	        ['정글', <%= jgRate%>, "color: #6AD167"],
			        ['미드', <%= midRate%>, "color: #D16767"],
			        ['봇', <%= botRate%>, "color: #67B4D1"],
			        ['서폿', <%= supRate%>, "color: #AF67D1"]
		       	]);
		        // Set chart options	
		        var options = {'width':400,
		                       'height':300};

		        // Instantiate and draw our chart, passing in some options.
		        var chart = new google.visualization.ColumnChart(document.getElementById('laneWinRate'));
		        chart.draw(data, options);
		      }
	     
	    </script>

</main>

<footer>
</footer>




</body>
</html>