<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "leagueAPI.SearchEngine" import = "leagueAPI.InstSummoner" import = "leagueAPI.Summoner" import = "java.util.ArrayList" import = "java.util.Map" import = "java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <style>
      div.row {
        width: 100%;
        display: flex;
        border: 1px solid #003458;
      }
      div.left {
        width: 50%;
        float: left;
        box-sizing: border-box;
        background: #819FF7;
      }
      div.right {
        width: 50%;
        float: right;
        box-sizing: border-box;
        background: #F78181;
      }
    </style>
<title>Insert title here</title>
</head>
<body>
<%
	Map<String, Map<String, InstSummoner>> participants = (Map<String, Map<String, InstSummoner>>) request.getAttribute("participants");
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
%>
	
    <div class="row">
      <div class="left">
	   <% 
	       	for (int i = 0; i < 5; i++){
				InstSummoner player = playersListed.get(i);
     	%>
     		<div OnClick="location.href ='/searchResult?sumName=<%=player.getSummonerName().replaceAll(" ", "")%>'" style="cursor:pointer;" >
     	<% 	
				out.println("소환사 이름: " + player.getSummonerName() + " <br>");
				out.println("챔피언: " + player.getChampionName() + " <br>");
				out.println("챔피언 레벨: " + player.getChampLevel() + " <br>");
				out.println("KDA: " + player.getKills() + "/" + player.getDeaths() + "/" + player.getAssists() + " <br>");
				out.println("=================================================" + " <br>");
		%>
			</div>
		<%
	       	}
	    %>
      </div>
      <div class="right">
      
		<% 
			for (int i = 5; i < 10; i++){
				InstSummoner player = playersListed.get(i);
		%>
			<div OnClick="location.href ='/searchResult?sumName=<%=player.getSummonerName().replaceAll(" ", "")%>'" style="cursor:pointer;" >
		<% 	
				out.println("소환사 이름: " + player.getSummonerName() + " <br>");
				out.println("챔피언: " + player.getChampionName() + " <br>");
				out.println("챔피언 레벨: " + player.getChampLevel() + " <br>");
				out.println("KDA: " + player.getKills() + "/" + player.getDeaths() + "/" + player.getAssists() + " <br>");
				out.println("=================================================" + " <br>");
		%>
			</div>
		<%
		   	}
		%>
      </div>
    </div>


</body>
</html>