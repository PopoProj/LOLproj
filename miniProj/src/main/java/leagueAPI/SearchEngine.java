package leagueAPI;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.json.simple.parser.JSONParser;
import org.json.simple.JSONObject;
import org.json.simple.JSONArray;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

public class SearchEngine {
	private static SearchEngine instance;
	private static String apiKey = "RGAPI-853ed25d-5d13-4a64-9530-f59a4573560b";
	
	private SearchEngine(String apiKey) {}
	
	public static SearchEngine getInstance(){
        if (instance == null){
        	synchronized(SearchEngine.class){
        		instance = new SearchEngine(apiKey);}
        	}      
        return instance;
    }

	public Summoner searchSummoner(String summonerName) {
		String apiURL = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/" + summonerName + "?api_key=" + apiKey;	
		String result = "";
		JSONParser jsonParser = new JSONParser();
		ObjectMapper objectMapper = new ObjectMapper();
		try{
			URL url = new URL(apiURL);
			BufferedReader bf;
			bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			result = bf.readLine();
			JSONObject summonerJsonObject = (JSONObject)(jsonParser.parse(result));
			String jsonStr = summonerJsonObject.toString();
	        Summoner summoner= objectMapper.readValue(jsonStr, Summoner.class);
	        return summoner;
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	


	public List<String> searchMatches(String puuid) {
		String apiURL = "https://asia.api.riotgames.com/lol/match/v5/matches/by-puuid/" + puuid + "/ids?start=0&count=10&api_key=" + apiKey;
		String result = "";
		JSONParser jsonParser = new JSONParser();
		ObjectMapper objectMapper = new ObjectMapper();
		
		try{
			URL url = new URL(apiURL);
			BufferedReader bf;
			bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			result = bf.readLine();
			JSONArray summonerJsonObject = (JSONArray)jsonParser.parse(result);
			String jsonStr = summonerJsonObject.toString();
	        List<String> matchList 
	            = objectMapper.readValue(jsonStr, new TypeReference<List<String>>() {});
	        return matchList;
	        
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	

	
	public Map<String, Object> searchMatchesData(String matchID) {
		String apiURL = "https://asia.api.riotgames.com/lol/match/v5/matches/" + matchID +"?api_key=" + apiKey;
		String result = "";
		JSONParser jsonParser = new JSONParser();
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			URL url = new URL(apiURL);
			BufferedReader bf;
			bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			result = bf.readLine();
			JSONObject summonerJsonObject = (JSONObject)jsonParser.parse(result);
			JSONObject tempdict = (JSONObject) summonerJsonObject.get("info");
			JSONArray participantsDicts = (JSONArray) tempdict.get("participants");
			String participants = participantsDicts.toString();

	        List<InstSummoner> instSummonersList 
	            = objectMapper.readValue(participants, new TypeReference<List<InstSummoner>>() {});

	    	data.put("matchId", matchID);
			data.put("gameDuration", tempdict.get("gameDuration"));
			data.put("gameMode", tempdict.get("gameMode"));
			data.put("gameType", tempdict.get("gameType"));
			data.put("participants", instSummonersList);
	        return data;
	        
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	

	
	public InstSummoner searchPlayerMatchResult(String matchID, String puuid) {
		String apiURL = "https://asia.api.riotgames.com/lol/match/v5/matches/" + matchID +"?api_key=" + apiKey;
		String result = "";
		JSONParser jsonParser = new JSONParser();
		ObjectMapper objectMapper = new ObjectMapper();
		
		try{
			URL url = new URL(apiURL);
			BufferedReader bf;
			bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			result = bf.readLine();
			JSONObject summonerJsonObject = (JSONObject)jsonParser.parse(result);
			JSONObject tempdict = (JSONObject) summonerJsonObject.get("info");
			JSONArray participantsDicts = (JSONArray) tempdict.get("participants");
			for (int i = 0; i < participantsDicts.size(); i++) {
			    JSONObject tempJson = (JSONObject) participantsDicts.get(i);
			    if (tempJson.get("puuid").equals(puuid)) {
			    	InstSummoner selSummoner = objectMapper.readValue(tempJson.toString(), InstSummoner.class);
			    	selSummoner.setMatchId(matchID);
			    	return selSummoner;
			    }
			}
       
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	public void setTier(Summoner selSummoner) {
		String apiURL = "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/" + selSummoner.getId() + "?api_key=" + apiKey;
		String result = "";
		JSONParser jsonParser = new JSONParser();
		
		try{
			URL url = new URL(apiURL);
			BufferedReader bf;
			bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			result = bf.readLine();
			JSONArray tierInfo = (JSONArray)(jsonParser.parse(result));
			for (int i = 0; i < tierInfo.size(); i++) {
				JSONObject tempJson = (JSONObject) tierInfo.get(i);
				String qType = (String) (tempJson).get("queueType");
				Map<String, Object>tempdict = new HashMap<>();
				tempdict.put("tier", (String) tempJson.get("tier"));
				tempdict.put("rank", (String) tempJson.get("rank"));
				tempdict.put("leaguePoints", (long) tempJson.get("leaguePoints"));
				tempdict.put("wins", (long) tempJson.get("wins"));
				tempdict.put("losses", (long) tempJson.get("losses"));
				
				if (qType.equals("RANKED_FLEX_SR")){
					selSummoner.setRANKED_FLEX_SR(tempdict);
				}
				else if (qType.equals("RANKED_SOLO_5x5")){
					selSummoner.setRANKED_SOLO_5x5(tempdict);
				}
			}    
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	

	}

}
