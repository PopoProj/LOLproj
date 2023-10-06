package leagueAPI;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown =true)
public class InstSummoner {
	
	Map<String, Object> RANKED_FLEX_SR;
	Map<String, Object> RANKED_SOLO_5x5;
	int assists	;
	//int baronKills	;
	//int bountyLevel	;	
	//int champExperience	;	
	int champLevel	;
	int championId	;
	String championName	;
	//int championTransform;
	//int consumablesPurchased;
//	int damageDealtToBuildings;
//	int damageDealtToObjectives	;
//	int damageDealtToTurrets;
//	int damageSelfMitigated;
	int deaths;
	int detectorWardsPlaced;
//	int doubleKills;
//	int dragonKills;
//	boolean firstBloodAssist;
	boolean firstBloodKill;
//	boolean firstTowerAssist;
//	boolean firstTowerKill;
	boolean gameEndedInEarlySurrender;
	boolean gameEndedInSurrender;
	int goldEarned;
	int goldSpent;
	String individualPosition;
//	int inhibitorKills;
//	int inhibitorTakedowns;
//	int inhibitorsLost;
	int item0;
	int item1;
	int item2;
	int item3;
	int item4;
	int item5;
	int item6;
//	int itemsPurchased;
//	int killingSprees;
	int kills;
	String lane;
//	int largestCriticalStrike;
//	int largestKillingSpree;
//	int largestMultiKill;
//	int longestTimeSpentLiving;
//	int magicDamageDealt;
//	int magicDamageDealtToChampions;
//	int magicDamageTaken;
//	int neutralMinionsKilled;
//	int nexusKills;
//	int nexusTakedowns;
//	int nexusLost;
//	int objectivesStolen;
//	int objectivesStolenAssists;
//	int participantId;	
	int pentaKills;
//	List<Perks> perks = new LinkedList<>();
//	int physicalDamageDealt;
//	int physicalDamageDealtToChampions;	
//	int physicalDamageTaken;
//	int profileIcon;
	String puuid;	
	int quadraKills;
//	String riotIdName;	
//	String riotIdTagline;	
//	String role;
//	int sightWardsBoughtInGame;	
//	int spell1Casts;	
//	int spell2Casts;	
//	int spell3Casts;	
//	int spell4Casts;	
//	int summoner1Casts;	
//	int summoner1Id;	
//	int summoner2Casts;
//	int summoner2Id;	
	String summonerId;	
	int summonerLevel;	
	String summonerName;	
	boolean teamEarlySurrendered;	
	String teamId;		
	String teamPosition;	
//	int timeCCingOthers;		
//	int timePlayed;		
//	int totalDamageDealt;		
//	int totalDamageDealtToChampions;		
//	int totalDamageShieldedOnTeammates;		
//	int totalDamageTaken;		
//	int totalHeal;		
//	int totalHealsOnTeammates;		
//	int totalMinionsKilled;		
//	int totalTimeCCDealt;		
//	int totalTimeSpentDead;		
//	int totalUnitsHealed;	
	int tripleKills;		
//	int trueDamageDealt;		
//	int trueDamageDealtToChampions;		
//	int trueDamageTaken;		
//	int turretKills;		
//	int turretTakedowns;		
//	int turretsLost;		
//	int unrealKills;		
//	int visionScore;	
//	int visionWardsBoughtInGame;	
//	int wardsKilled;		
//	int wardsPlaced;		
	boolean win;		
	String matchId;
	
	public InstSummoner() {
		super();
	}

	@Override
	public String toString() {
		return "instSummoner \n assists=" + assists + "\n champLevel=" + champLevel + "\n championId=" + championId
				+ "\n championName=" + championName + "\n deaths=" + deaths + "\n detectorWardsPlaced="
				+ detectorWardsPlaced + "\n firstBloodKill=" + firstBloodKill + "\n gameEndedInEarlySurrender="
				+ gameEndedInEarlySurrender + "\n gameEndedInSurrender=" + gameEndedInSurrender + "\n goldEarned="
				+ goldEarned + "\n goldSpent=" + goldSpent + "\n item0=" + item0 +  "\n item1=" + item1 + "\n item2=" + item2
				+ "\n item3=" + item3 + "\n item4=" + item4 + "\n item5=" + item5 + "\n item6=" + item6 + "\n kills=" + kills
				+ "\n lane=" + lane + "\n pentaKills=" + pentaKills + "\n puuid=" + puuid + "\n quadraKills=" + quadraKills
				+ "\n summonerId=" + summonerId + "\n summonerLevel=" + summonerLevel + "\n summonerName=" + summonerName
				+ "\n teamEarlySurrendered=" + teamEarlySurrendered + "\n teamId=" + teamId + "\n teamPosition="
				+ teamPosition  + "\n individualPosition= " + individualPosition + ", tripleKills=" + tripleKills + "\n win=" + win + "\n ranked" + RANKED_SOLO_5x5 + "\n flex" + RANKED_FLEX_SR;
	}


		
}
