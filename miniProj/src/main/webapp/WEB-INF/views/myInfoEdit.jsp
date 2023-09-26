<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
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
<title>회원 정보 수정</title>
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
 
</script>
</head>

<body>

<form name="myInfoEditForm" action="myInfoEdit" method="post" onsubmit="checkInput(registerForm)" style="border:1px solid #ccc">
  <input type="hidden" name="popoId" value="${myInfo.popoId}">
  <div class="container">
    <h1>회원 정보 수정</h1>
    <p>회원 정보 수정을 위해 정보를 입력해주세요.</p>
    <hr>
		
		<label for="pw"><b>비밀번호</b></label>
		<input type="text" name="popoPw" value="${myInfo.popoPw}" required>

		<label for="name"><b>이름</b></label>
		<input type = "text" name="popoName" value="${myInfo.popoName}" required>

		<label for="tel"><b>전화번호</b></label>
		<input type = "tel" name = "popoTel" value="${myInfo.popoTel}" required>
		<br>

		<label for="email"><b>이메일</b></label>
		<input type="email" name="popoEmail" value="${myInfo.popoEmail}" required>
		<br>
		<br>

		 <label for="nickName"><b>닉네임</b></label>
		 <input type = "text" name = "popoNickname" value="${myInfo.popoNickname}" required>

		<label for="popoMain"><b>롤 주포지션</b></label>
		<c:choose>
			<c:when test="${myInfo.popoMain == 1}">탑</c:when>
			<c:when test="${myInfo.popoMain == 2}">정글</c:when>
			<c:when test="${myInfo.popoMain == 3}">미드</c:when>
			<c:when test="${myInfo.popoMain == 4}">바텀</c:when>
			<c:otherwise>서포터</c:otherwise>
		</c:choose>

		<br><br>
		<label for="popoSub"><b>롤 부포지션</b></label>
		<c:choose>
			<c:when test="${myInfo.popoSub == 1}">탑</c:when>
			<c:when test="${myInfo.popoSub == 2}">정글</c:when>
			<c:when test="${myInfo.popoSub == 3}">미드</c:when>
			<c:when test="${myInfo.popoSub == 4}">바텀</c:when>
			<c:otherwise>서포터</c:otherwise>
		</c:choose>

	   <div class="clearfix">
      <button type="button" class="cancelbtn" onclick = "location.href = 'toMyInfo' ">취소</button>
      <button type="submit" class="signupbtn">수정하기</button>
    </div>
</form>

</body>
</html>