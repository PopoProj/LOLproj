package leagueAPI;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lombok.Data;


@Data
public class Summoner {
	private String accountId;
	private String profileIconId;
	private String revisionDate;
	private String name;
	private String id;
	private String puuid;
	private String summonerLevel;
	private List<String> recentMatches = new ArrayList<>();
	private Map<String, Object> RANKED_FLEX_SR = new HashMap<>();
	private Map<String, Object> RANKED_SOLO_5x5 = new HashMap<>();
	private HashMap<String, HashMap<String, Integer>> laneMap = new HashMap<>();
	private HashMap<String, HashMap<String, Integer>> champMap = new HashMap<>();
	@Override
	public String toString() {
		return "Summoner Type \n accountId: " + accountId +  " \n profileIconId: " + profileIconId + "\n revisionDate: "
				+ revisionDate + "\n name: " + name + "\n id: " + id + "\n puuid: " + puuid + "\n summonerLevel: "
				+ summonerLevel + "\n recentMatches: " + recentMatches + "\n RANKED_FLEX_SR: " + RANKED_FLEX_SR
				+ "\n RANKED_SOLO_5x5: " + RANKED_SOLO_5x5 + "\n laneMap: "
				+ laneMap + "\n champMap: " + champMap + "\n";
	}
	


}
