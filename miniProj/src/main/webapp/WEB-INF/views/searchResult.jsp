<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "leagueAPI.SearchEngine" import = "leagueAPI.InstSummoner" import = "leagueAPI.Summoner" import = "java.util.LinkedList" import = "java.util.HashMap" import = "java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Summoner searched = (Summoner) request.getAttribute("searched");
List<InstSummoner> recentMatchData = (List<InstSummoner>) request.getAttribute("matchData");
%>
현재 한국 유저 정보만 검색 가능합니다.
<div>
==================================================================
	                    검색한 유저 정보
==================================================================
</div>
<div>
	유저 닉네임: <%=searched.getName() %>
</div>
<div>
	유저 레벨: <%=searched.getSummonerLevel()%>
</div>
<div>
	유저 솔로랭크 티어: <%=searched.getRANKED_SOLO_5x5().get("tier")%> <%= searched.getRANKED_SOLO_5x5().get("rank") %> <%= searched.getRANKED_SOLO_5x5().get("leaguePoints") %>
</div>
<div>
	유저 자유랭크 티어: <%=searched.getRANKED_FLEX_SR().get("tier")%> <%= searched.getRANKED_FLEX_SR().get("rank") %> <%= searched.getRANKED_FLEX_SR().get("leaguePoints") %>
</div>
<div>
================================================================== <br>
	                      최근 전적<br>
==================================================================<br>
</div>
<% 
	for (InstSummoner temp : recentMatchData){
%>
<div OnClick="location.href ='/matchDetails?matchId=<%=temp.getMatchId()%>'" style="cursor:pointer;" >
<% 	
		if (temp.isWin()){
			out.println("승리<br>");
		}else{
			out.println("패배 <br>");
		}
		out.println("챔피언: " + temp.getChampionName() + " <br>");
		out.println("챔피언 레벨: " + temp.getChampLevel() + " <br>");
		out.println("KDA: " + temp.getKills() + "/" + temp.getDeaths() + "/" + temp.getAssists() + " <br>");
		out.println("match Id: " + temp.getMatchId() + " <br>");
		out.println("=================================================" + " <br>");
%>
</div>
<%
	}
%>


</body>
</html>