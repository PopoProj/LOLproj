package leagueAPI;


import java.util.HashMap;
import java.util.List;



public class LeagueData {

	public static void main(String[] args) {
		System.out.println("현재 한국 유저 정보만 검색 가능합니다.");
		String sumName = "hideonbush"; //띄어쓰기시 오류나니 split으로 다시 붙이는 작업 필요
		SearchEngine engine = SearchEngine.getInstance();
		Summoner searched = engine.searchSummoner(sumName);
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
		
		for (String matchId : searched.getRecentMatches()) {
			InstSummoner playerData = engine.searchPlayerMatchResult(matchId, searched.getPuuid());
//			System.out.println("======================== 유저 최근 전적====================");
//			System.out.println(playerData);
//			System.out.println("======================== 같이 플레이한 유저들 정보======================");
//			System.out.println(engine.searchMatchesData(matchId).get("participants");
			
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
		searched.setLaneMap(laneMap);
		searched.setChampMap(champMap);
		System.out.println("검색한 유저 정보");
		System.out.println(searched.toString());
	}
}