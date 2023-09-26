<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>

* {box-sizing: border-box}

/* Full-width input fields */
  input[type=text], input[type=password], input[type=tel], input[type=email], select {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
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

/* Extra styles for the cancel button */
.cancelbtn {
  padding: 14px 20px;
  background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
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
<title>직원 정보 등록</title>
<script type = "text/javascript">
	function checkInput(form){
		var valid = true; 
		var check = /^[0-9]+$/
		
		if (!form.name.value){
			valid = false;
		}
		if (!form.email.value){
			valid = false;
		}
		if (!form.tel.value){
			valid = false;
		}
		else if (!check.test(form.phone.value)){
			valid = false;
			alert("숫자만 입력해주세요!!");
		}
		if (valid == false){
			alert("필수 필드를 채워주세요!!");
		}
		return valid; // onsubmit() --> checkInput(form1) ; return true는 form.submit과 동일 
	}
	
	 function openCheckWindow(form) {
	 	new_window = window.open("checkDuplicate?id="+form.id.value, "아이디 중복 확인",
		 						"toolbar=no,width=250,height=400,directories=no,status=no,scrollbars=yes,resize=no")
	}
	 
	 function openEmailCheckWindow(form) {
		 	new_window = window.open("checkDuplicateEmail?email="+form.email.value, "이메일 사용 확인",
			 						"toolbar=no,width=250,height=400,directories=no,status=no,scrollbars=yes,resize=no")
		}
 

</script>
</head>






<body>

<form name="registerForm" action="registerUser" onsubmit="checkInput(registerForm)" style="border:1px solid #ccc">
  <div class="container">
    <h1>회원가입</h1>
    <p>회원가입을 위해 정보를 입력해주세요.</p>
    <hr>

		<label for="id"><b>ID</b></label>
		<input type="text" name="id" />
		<input type="button" value = "아이디 중복확인" onclick="openCheckWindow(this.form)" >
		<br><br>

		<label for="pw"><b>비밀번호</b></label>
		<input type="text" name="pw">

		<label for="name"><b>이름</b></label>
		<input type = "text" name="name">

		<label for="tel"><b>전화번호</b></label>
		<input type = "tel" name = "tel">
		<br>

		<label for="email"><b>이메일</b></label>
		<input type="email" name="email" onclick="openEmailCheckWindow(this.form)" >
		<br>
		<br>

		 <label for="nickName"><b>닉네임</b></label>
		 <input type = "text" name = "nickName">

		<label for="main"><b>롤 주포지션</b></label>
		<select name = "main">
		<option value = "1"> 탑 
		<option value = "2"> 정글 
		<option value = "3"> 미드
		<option value = "4"> 원딜
		<option value = "5"> 서폿
		</select>

		<label for="sub"><b>롤 부포지션</b></label>
		<select name = "sub">
		<option value = "1"> 탑 
		<option value = "2"> 정글 
		<option value = "3"> 미드
		<option value = "4"> 원딜
		<option value = "5"> 서폿
		</select>

	
	   <div class="clearfix">
      <button type="button" class="cancelbtn" onclick = "location.href = 'login' ">취소</button>
      <button type="submit" class="signupbtn">회원가입</button>
    </div>
</form>

</body>
</html>