<%@page import="com.my.miniProj.model.RecordDTO"%>
<%@page import="com.my.miniProj.model.FavouritesDTO"%>
<%@page import="com.my.miniProj.model.PopoUserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "leagueAPI.SearchEngine" import = "leagueAPI.InstSummoner" import = "leagueAPI.Summoner" import = "java.util.LinkedList" import = "java.util.HashMap" import = "java.util.List" %>
<!DOCTYPE html>
<html>
<head>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
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
      }
      div.right {
        width: 50%;
        float: right;
        box-sizing: border-box;
      }
	        header {
	    margin: auto; /* header의 양쪽 여백(margin)을 동등하게 맞춤 -> 수평가운데정렬 */
	    width: 1080px;
	    height: 215px;
	    display: flex;
	    align-items: center; /* 하위 요소들 수직 가운데정렬 */
	    position: relative;
	  }
	   .links { /* 링크들을 상단 우측에 위치시킵니다. */
	    position: absolute;
	    top: 0;
	    right: 0;
	  }
	  .link_text {
	    font-size: 10px;
	    margin-left: 5px;
	  }
    </style>
<title>Insert title here</title>
</head>
<body>


<%
	Summoner searched = (Summoner) request.getAttribute("searched");
	int popoNum = (int)request.getAttribute("popoNum");
	List<InstSummoner> recentMatchData = (List<InstSummoner>) request.getAttribute("matchData");
	
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
    	상단
    	<div class = "links">
	          <a href="/">검색페이지로</a>
	    	  <a href="toMyPage">마이페이지</a>
    	</div>
	
    </header>
    <main>
<div class="row">
  	<div class="left">
		현재 한국 유저 정보만 검색 가능합니다.
		<div>
			===검색한 유저 정보===
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
		 <div OnClick = "location.href = '/addFav?sumName=<%=searched.getName() %>'" style = "cursor:pointer;">
        	[즐겨찾기에 추가하기]
        </div>
		<div style="width: 500px; height: 300px;">
				<!--차트가 그려질 부분-->
				<canvas id="laneWinrate"></canvas>
				최근 10판 중 랭겜 라인별 승률
		</div>
		
		 <div style="width: 500px; height: 500px;" class="chart-div">
            <canvas id="lanePickRate"></canvas>
            최근 10판 중 랭겜 라인별 픽률      
        </div>
       
  

		
	</div>
	 <div class="right">
		<div>
			---최근 전적---
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
				out.println("==========================" + " <br>");
		%>
		</div>
		<%
			}
		%>
	</div>
</div>
</main>

<footer>
</footer>

<canvas id="myChart" width="400" height="400"></canvas>
<script>
	// 차트를 그럴 영역을 dom요소로 가져온다.
	var chartArea = document.getElementById('laneWinrate').getContext('2d');
	// 차트를 생성한다. 
	var myChart = new Chart(chartArea, {
	    // ①차트의 종류(String)
	    type: 'bar',
	    // ②차트의 데이터(Object)
	    data: {
	        // ③x축에 들어갈 이름들(Array)
	        labels: ['탑', '정글', '미드', '봇', '서폿'],
	        // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
	        datasets: [{
	            // ⑤dataset의 이름(String)
	            label: '최근 10판 랭겜 라인별 승률',
	            // ⑥dataset값(Array)
	            data: [<%= topRate%>, <%= jgRate%>, <%= midRate%>, <%= botRate%>, <%= supRate%>],
	            // ⑦dataset의 배경색(rgba값을 String으로 표현)
	            backgroundColor: ['rgba(255, 99, 132, 0.2)', 'rgba(255, 159, 64, 0.2)', 'rgba(255, 205, 86, 0.2)', 'rgba(75, 192, 192, 0.2)', 'rgba(54, 162, 235, 0.2)'],
	            // ⑧dataset의 선 색(rgba값을 String으로 표현)
	            borderColor: ['rgba(255, 99, 132, 1)', 'rgba(255, 159, 64, 1)', 'rgba(255, 205, 86, 1)', 'rgba(75, 192, 192, 1)', 'rgba(54, 162, 235, 1)'],
	            // ⑨dataset의 선 두께(Number)
	            borderWidth: 1
	        }]
	    },
	    // ⑩차트의 설정(Object)
	    options: {
	        // ⑪축에 관한 설정(Object)
	        scales: {
	            // ⑫y축에 대한 설정(Object)
	            y: {
	                // ⑬시작을 0부터 하게끔 설정(최소값이 0보다 크더라도)(boolean)
	                beginAtZero: true
	            }
	        }
	    }
	});
	
	
	window.onload = function () {
	    pieChartDraw();
	}

	let pieChartData = {
	    labels: ['탑', '정글', '미드', '봇', '서폿'],
	    datasets: [{
	    	label: '최근 10판 라인별 픽률',
	    	data: [<%= topPick%>, <%= jgPick%>, <%= midPick%>, <%= botPick%>, <%= supPick%>],
	        backgroundColor: ['rgb(255, 99, 132)', 'rgb(255, 159, 64)', 'rgb(255, 205, 86)', 'rgb(75, 192, 192)', 'rgb(54, 162, 235)', 'rgb(153, 102, 255)']
	    }] 
	};

	let pieChartDraw = function () {
	    let ctx = document.getElementById('lanePickRate').getContext('2d');
	    
	    window.pieChart = new Chart(ctx, {
	        type: 'pie',
	        data: pieChartData,
	        options: {
	            responsive: false
	        }
	    });
	};
</script>
</body>
</html>