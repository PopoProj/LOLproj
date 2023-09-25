<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	* {box-sizing: border-box}
	
	/* Full-width input fields */
	  input[type=text], input[type=email] {
	  width: 100%;
	  padding: 15px;
	  margin: 5px 0 22px 0;
	  display: inline-block;
	  border: none;
	  background: #f1f1f1;
	}
	
	input[type=text]:focus, input[type=email]:focus {
	  background-color: #ddd;
	  outline: none;
	}
	
	hr {
	  border: 1px solid #f1f1f1;
	  margin-bottom: 25px;
	}
	
	/* Set a style for all buttons */
	button {
	  background-color: #04AA6D;
	  color: white;
	  padding: 14px 20px;
	  margin: 8px 0;
	  border: none;
	  cursor: pointer;
	  width: 100%;
	  opacity: 0.9;
	}
	
	button:hover {
	  opacity:1;
	}
	

	
	/* Float cancel and signup buttons and add an equal width */
	.proceedbtn {
	  float: left;
	  width: 50%;
	}
	
	/* Add padding to container elements */
	.container {
	  padding: 16px;
	}
	
	/* Clear floats */
	.clearfix::after {
	  content: "";
	  clear: both;
	  display: table;
	}
	
	/* Change styles for cancel button and signup button on extra small screens */
	@media screen and (max-width: 300px) {
	  .cancelbtn, .signupbtn {
	    width: 100%;
	  }
	}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action = "findId">
		<div>
			이름 <br>
			<input type = "text" name="name">
		</div>
		
		<div>
			이메일 <br>
			<input type="email" name="email">
		</div>
		
		<button type="submit" class="proceedbtn">아이디 찾기</button>
	</form>
</body>
</html>