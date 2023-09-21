<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" import = "com.my.miniProj.model.RecordDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewRecord</title>
</head>
<body>
검색한 유저목록
	<%
		List<RecordDTO> recList = (List<RecordDTO>) request.getAttribute("recordList");
		for (RecordDTO userRec : recList){
			String summonerName = userRec.getSumName();
	
	%>

		<div OnClick = "location.href = '/searchResult?sumName=<%=summonerName %>'" style = "cursor:pointer;">
        	<%=summonerName %> 
        </div>
        <br>
		
	
	
	<% 
		}
	%>
	
	<a href = "/toMyPage"> 마이페이지로 돌아가기</a>
</body>
</html>