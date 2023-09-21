package com.my.miniProj.controller;



import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.my.miniProj.model.PopoUserDTO;
import com.my.miniProj.model.RecordDTO;
import com.my.miniProj.service.RecordService;

import leagueAPI.InstSummoner;
import leagueAPI.SearchEngine;
import leagueAPI.Summoner;


@Controller
public class PopoSiteController {

    
    @GetMapping("/search")
    public String search() {  	 
		return "search";  	
    }
    
    @GetMapping("/searchResult")
    public String searchResult(HttpServletRequest request) {
    	HttpSession session = request.getSession(false);
		PopoUserDTO loginMember = (PopoUserDTO) session.getAttribute("userSessionID");
		int popoNum = loginMember.getPopoNum();
    	String name = request.getParameter("sumName");
    	String summonerName = name.replace(" ", "");
    	
    	RecordDTO newRecord = new RecordDTO();
    	newRecord.setPopoNum(popoNum);
    	newRecord.setSumName(summonerName);	
    	
    	SearchEngine engine = SearchEngine.getInstance();
    	Summoner searched = engine.searchSummoner(summonerName);
    	List<String> matchIDs = engine.searchMatches(searched.getPuuid());
    	searched.setRecentMatches(matchIDs);
    	engine.setTier(searched);
    	
    	HashMap<String, HashMap<String, Integer>> laneMap = new HashMap<String, HashMap<String, Integer>>();
    	HashMap<String, HashMap<String, Integer>> champMap = new HashMap<String, HashMap<String, Integer>>();
    	
    	laneMap.put("TOP", null);
    	laneMap.put("JUNGLE", null);
    	laneMap.put("MIDDLE", null);
    	laneMap.put("BOTTOM", null);
    	laneMap.put("UTILITY", null);
    	
    	for (String lane : laneMap.keySet()) {
    		HashMap<String, Integer> temp = new HashMap<>();
    		temp.put("win", 0);
    		temp.put("defeat", 0);
    		laneMap.put(lane, temp);
    	}
     	List<InstSummoner> recentMatchData = new LinkedList<>();
    	for (String matchId : searched.getRecentMatches()) {
    		InstSummoner playerData = engine.searchPlayerMatchResult(matchId, searched.getPuuid());
    		recentMatchData.add(playerData);   		
    		Boolean win = playerData.isWin();
    		String pos = playerData.getTeamPosition();
    		String champion = playerData.getChampionName();
    		
    		HashMap<String, Integer> temp2 = new HashMap<>();
    		temp2.put("win", 0);
    		temp2.put("defeat", 0);
    		HashMap<String, Integer> perChamp = champMap.getOrDefault(champion, temp2);
    		if (!playerData.getIndividualPosition().equals("Invalid")){
    			HashMap<String, Integer> perLane = laneMap.get(pos);
    			if (win) {
    				perChamp.put("win", perChamp.get("win") + 1);
    				perLane.put("win", perLane.get("win") + 1);			
    			}else {
    				perChamp.put("defeat", perChamp.get("defeat") + 1);
    				perLane.put("defeat", perLane.get("defeat") + 1);	
    			}
    			laneMap.put(pos, perLane);
    			champMap.put(champion, perChamp);
    		}
    	}	
    	for (String lane : laneMap.keySet()) {
    		HashMap<String, Integer> perLane2 = laneMap.get(lane);
    		int winrate = 0;
    		if (perLane2.get("defeat") == 0){
    			if (perLane2.get("win") != 0) {
    				winrate = 100;
    			}
    		}
    		else{
    			winrate = perLane2.get("win") * 100 / (perLane2.get("win") + perLane2.get("defeat"));
    		}
    		perLane2.put("winrate", winrate);
    		laneMap.put(lane, perLane2);
    	}
    	
    	searched.setLaneMap(laneMap);
    	searched.setChampMap(champMap);
    	
    	request.setAttribute("searched", searched);
    	request.setAttribute("matchData", recentMatchData);
    	request.setAttribute("popoNum", popoNum);

    	int count = recordService.countRec(popoNum);
		int dupCount = recordService.checkDupRec(newRecord);
		
		if (dupCount == 0) {
			if (count >= 10) {
				recordService.deleteOldRec();
			}
			recordService.addRec(newRecord);
		}
		return "searchResult";
    }
    
	
	@Autowired
	private RecordService recordService;
    
    @GetMapping("/matchDetails")
    public String matchDetails(HttpServletRequest request) {
    	String id = request.getParameter("matchId");
    	SearchEngine engine = SearchEngine.getInstance();
    	Map<String, Object> matchData = engine.searchMatchesData(id);
    	List<InstSummoner> participants = (List<InstSummoner>) matchData.get("participants");
    	long duration = (long) matchData.get("gameDuration");
    	
    	// map = {win: {top: },{mid:}...., defeat: {top: },....}
    	Map<String, Map<String, InstSummoner>> newMap = new HashMap<String, Map<String, InstSummoner>>(); 
    	Map<String, InstSummoner> winMap = new HashMap<>();   	
    	Map<String, InstSummoner> defeatMap = new HashMap<>();
    	
    	for (InstSummoner player : participants) {
    		if (player.isWin()) {
    			if (player.getTeamPosition().equals("TOP")) {
    				winMap.put("TOP", player);
    			}
    			else if (player.getTeamPosition().equals("JUNGLE")) {
    				winMap.put("JUNGLE", player);
    			}
    			else if (player.getTeamPosition().equals("MIDDLE")) {
    				winMap.put("MIDDLE", player);
    			}
    			else if (player.getTeamPosition().equals("BOTTOM")) {
    				winMap.put("BOTTOM", player);
    			}
    			else if (player.getTeamPosition().equals("UTILITY")) {
    				winMap.put("UTILITY", player);
    			}
    		}
    		else {
    			if (player.getTeamPosition().equals("TOP")) {
    				defeatMap.put("TOP", player);
    			}
    			else if (player.getTeamPosition().equals("JUNGLE")) {
    				defeatMap.put("JUNGLE", player);
    			}
    			else if (player.getTeamPosition().equals("MIDDLE")) {
    				defeatMap.put("MIDDLE", player);
    			}
    			else if (player.getTeamPosition().equals("BOTTOM")) {
    				defeatMap.put("BOTTOM", player);
    			}
    			else if (player.getTeamPosition().equals("UTILITY")) {
    				defeatMap.put("UTILITY", player);
    			}
    		}   		
    	}
    	
    	newMap.put("win", winMap);
    	newMap.put("defeat", defeatMap);
    	
    	request.setAttribute("participants", newMap);
    	return "matchDetails";
    }

}
