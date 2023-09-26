<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checkDuplicate.jsp</title>
</head>
<body>
	<div style="text-align: center"></div>
	<h3>* 이메일 중복 확인 결과 *</h3>
<%
    //1) 사용가능한 아이디일 경우, 아이디 입력 폼에 넣기 위함
    String email = (String) request.getAttribute("email");
    int duplCount = (int) request.getAttribute("duplCount");
    out.println("입력 이메일 : <strong>" + email + "</strong>");
    if(duplCount ==0){
    	out.println("<p>사용 가능한 아이디입니다.</p>");
%>

	<script>
    	function apply(email){
            //2) 중복확인 id를 부모창에 적용
            //부모창 opener
            opener.document.regForm.email.value=id;
            window.close(); //창닫기
        }//apply () end
    </script>
 <%
 	}else{
    	out.println("<p style='color: red'>사용중인 이메일입니다.</p>");
    }//if end
 %>
 <hr>
 <a href="javascript:history.back()">[다시시도]</a>
 &nbsp; &nbsp;
 <a href="javascript:window.close()">[창닫기]</a>
 
 </body>
 </html>