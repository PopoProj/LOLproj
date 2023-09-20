<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Page</title>

	<script type="text/javascript">
	    function checkBlank(formObj) {
	    	//formObj = document.form['my	Form'];
	    	sumStr = formObj.elements["sumName"].value;
	        if (sumStr) {
		        var newStr = sumStr.replaceAll(' ', '');
	        	formObj.elements["sumName"].value = newStr;
	            document.getElementById('myForm').submit();
	   
	        }
			alert("값을 입력해주세요.");
			window.location.href = '/search';
	    }
	</script>

</head>

<body>
	<form action="searchResult" name="myForm" onsubmit="checkBlank(myForm)">
		<input type="text" name="sumName" placeholder="소환사 이름을 입력하세요!"/>
		<input type="submit" value="검색"/>  
	</form>


</body>
</html>
