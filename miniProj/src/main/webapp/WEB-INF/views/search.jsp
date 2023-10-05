<%@page import = "com.my.miniProj.model.SearchCountDTO" import = "java.util.List" import = "com.my.miniProj.model.Board" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
   
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


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


/* Style the search field */
form.searchForm input[type=text] {
  padding: 10px;
  font-size: 29px;
  border: 5px solid #44BE79;
  float: left;
  width: 80%;
  background: #f1f1f1;
}

/* Style the submit button */
form.searchForm button {
  float: left;
  width: 20%;
  padding: 20px;
  background: #2D7D4E;
  color: white;
  font-size: 20px;
  border: 1px solid #2D7D4E;
  border-left: none; /* Prevent double borders */
  cursor: pointer;
}

form.searchForm button:hover {
  background: #2D7D4E;
}

/* Clear floats */
form.searchForm::after {
  content: "";
  clear: both;
  display: table;
}


  a:hover {
    text-decoration: underline; /* 마우스 커서가 올라갔을 때 밑줄을 생성합니다*/
  }
  header {
    margin: auto; /* header의 양쪽 여백(margin)을 동등하게 맞춤 -> 수평가운데정렬 */
    width: 100%;
    height: 230px;
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
    font-size: 30px;
    margin-left: 20px;
  }

  main {
    background: #FFFFFF;
    width: 80%;
    min-height: 700px;
    margin: 0 auto;

  }
  
   div.searchBox{
	  width: 80%;
	  height: 30%;
	  margin: auto;
	}
	  div.bottom{
	display: flex;
	  flex-direction: row;
	  width: 100%;
	  height: 50%;
	    margin: auto;
	 padding: 100px;
	}
	
	
  div.summContainer{
  	 font-size: 22px;
	  display: flex;
	  flex-direction: column;
	  width: 50%;
	  text-align: center;
	  height: 500px;
	  border: 5px solid #44BE79;
	   border-radius: 25px;
	  margin-right: 80px;
	   margin-left: 80px;
	  }
  
   div.boardContainer{
   
    font-size: 22px;
	display: flex;
	  flex-direction: column;
	  text-align: center;
	  width: 50%;
	  height: 500px;
	 border: 5px solid #44BE79;
	  border-radius: 25px;
	 margin-right: 80px;
	  margin-left: 80px;
	  }
	  
	  div.item{
	
		}
  
  
  footer {
    background: darkgray;
    height: 100px;
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
	


</style>
<title>Search Page</title>

</head>
	
<body>

<script type="text/javascript">

window.addEventListener("pageshow", (event) => {
	  if (event.persisted) {
	    location.reload();
	  } 
	});
</script>

<%

	session = request.getSession(false);
	String aStr;
	if (session.getAttribute("userSessionID") != null) {
		aStr = "<a class = 'active' href = 'logout'> 로그아웃 </a>";
	}
	//boolean isSignedIn = (boolean) request.getAttribute("isSignedIn");
	else{
		aStr = "<a class = 'active' href = 'toLogin'> 로그인 </a>";
	}
	
	List<SearchCountDTO> ranking = (List<SearchCountDTO>) request.getAttribute("ranking");
	List<Board> articles = (List<Board>) request.getAttribute("articles");
	
%>
	

	
    <header>
    
	    <div class = "homeBtn">
		  <a href= "/">
		      <img class="popoHome" src="../../images/popo.png" width = "384px" height = "216px"/>
		  </a>
 		</div>	
 		
    	<div class="topnav">
	    	  <a class = "active" href="toMyPage"> 마이페이지</a>
	    	  <a class = "active" href="boardList"> 게시판 </a>
	    	  <%=aStr %>
	    	
    	</div>

    </header>
    <main>
   		<div class = "searchBox">
			<form class = "searchForm" action="searchResult" name="myForm" onsubmit="return checkBlank(myForm)">
				<input type="text" tabindex="1" name="sumName" id = "sumName" placeholder="소환사 이름을 입력하세요!"/>
				<button type="submit"><i class="fa fa-search"></i></button>
			</form>
		</div>
	
	
		<div class = bottom>	
			<div class = "summContainer"> 오늘 최다검색된 소환사<br>
				  <%
				  if (ranking == null){
					  out.print("<br>정보없음");
				  }else{
					  for (int i =0 ; i < ranking.size() ; i++){
					  String name = ranking.get(i).getSumName();
					  %>
					  <br>
					    <div class = "item">
					      <%= i+1 %>. <a href = "searchResult?sumName=<%= name%>"> <%= name%> </a>
					    </div>
					
					  <% } 
				  }%>
			</div>
			
		
			<div class = "boardContainer"> 최근 올라온 게시글<br>
				  <%
				  if (articles == null){
					  out.print("<br>정보없음");
				  }else{
					  for (int i =0 ; i < articles.size() ; i++){
					  String title = articles.get(i).getBoardTitle();
					  int boardNum = articles.get(i).getBoardNum();
					  %>
					  <br>
					    <div class = "item">
					      <%= i+1 %>. <a href = "/boardRead?boardNum=<%=boardNum%>"> <%=title %></a>
					    </div>
					    
					  <% } 
				  }%>
			</div>
		</div>
	  </main>	
  
    <footer>
   	 	<a href="/admin/adminLogin">관리자 로그인</a>
    </footer>
    
    <script type="text/javascript">
	    function checkBlank(formObj) {
	        if (document.getElementById('sumName').value) {
	            return true;
	   
	        }else{
				alert("값을 입력해주세요.");
				return false;
	        }
	    }    
	</script>
</body>
</html>
