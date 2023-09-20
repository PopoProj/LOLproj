<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
 

</script>
</head>
<body>

<form name="registerForm" action="registerUser" onsubmit="checkInput(registerForm)">

	<div>
		회원가입
	</div>
	
	<div>
		ID <br>
		<input type="text" name="id" />
		<input type="button" value = "중복확인" onclick="openCheckWindow(this.form)" >
	</div>
	
	<div>	
		비밀번호 <br>
		<input type="text" name="pw">
	</div>
	
	<div>
		이름 <br>
		<input type = "text" name="name">
	</div>
	
	<div>
		전화번호 <br>
		<input type = "tel" name = "tel">
	</div>
	
	<div>
		이메일 <br>
		<input type="email" name="email">
	</div>
	
	<div>
		 롤 닉네임 <br>
		 <input type = "text" name = "nickName">
	</div>
				
	<div>	
		주포지션<br>
		<select name = "main">
		<option value = "1"> 탑 
		<option value = "2"> 정글 
		<option value = "3"> 미드
		<option value = "4"> 원딜
		<option value = "5"> 서폿
		</select>
	</div>
	
	<div>	
		서브포지션<br>
		<select name = "sub">
		<option value = "1"> 탑 
		<option value = "2"> 정글 
		<option value = "3"> 미드
		<option value = "4"> 원딜
		<option value = "5"> 서폿
		</select>
	</div>
	
	<div>
		<input type = "submit" value = "가입하기">
	</div>
	
</form>

</body>
</html>