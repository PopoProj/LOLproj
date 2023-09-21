<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" import = "com.my.miniProj.model.FavouritesDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewFavourites</title>
</head>
<body>
내가 즐겨찾기한 유저 목록
	<%
		List<FavouritesDTO> favList = (List<FavouritesDTO>) request.getAttribute("favouritesList");
		for (FavouritesDTO favUser : favList){
			String summonerName = favUser.getSumName();
	
	%>

		<div OnClick = "location.href = '/searchResult?sumName=<%=summonerName %>'" style = "cursor:pointer;">
        	<%=summonerName %> 
        </div>
		
       <div OnClick = "location.href = '/deleteFav?sumName=<%=summonerName %>'" style = "cursor:pointer;">
        	삭제하기
        </div>
        <br>
		
	
	
	<% 
		}
	%>
	
	<a href = "/toMyPage"> 마이페이지로 돌아가기</a>
</body>
</html>