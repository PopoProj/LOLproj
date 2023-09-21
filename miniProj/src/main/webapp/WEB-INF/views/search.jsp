<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   
<meta charset="UTF-8">

<style>
  * {
    box-sizing: border-box; /* 길이 계산을 편하게 하기위함. box-sizing에 관한 설명은 아래 링크를 참고해주세요 */
  }
  body {
    margin: 0; /* body의 기본마진을 없애줍니다(선택사항) */
    font-family: sans-serif;
  }
  a {
    text-decoration: none; /* 기본 밑줄을 제거합니다 */
    color: #888;
  }
  a:hover {
    text-decoration: underline; /* 마우스 커서가 올라갔을 때 밑줄을 생성합니다*/
  }
  header {
    margin: auto; /* header의 양쪽 여백(margin)을 동등하게 맞춤 -> 수평가운데정렬 */
    width: 1080px;
    height: 215px;
    display: flex;
    align-items: center; /* 하위 요소들 수직 가운데정렬 */
    position: relative;
  }
  fieldset {
    border: none; /* 기본 border 없애기(이 코드를 지우고 기본 border를 확인해보세요) */
  }
  .visually-hidden { /* legend 안보이게 설정. 이렇게하면 접근성을 준수하면서 디자인을 해치지 않습니다. */
    position: absolute !important;
    height: 1px;
    width: 1px;
    overflow: hidden;
    clip: rect(1px 1px 1px 1px);
    clip: rect(1px, 1px, 1px, 1px);
    white-space: nowrap;
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

  .search_box {
    width: 520px;
    height: 50px;
    border: 2px solid #03cf5d;
    display: flex;
    align-items: center;
  }
  .search_box input {
    flex: 9; /* search-box내부에서 9만큼의 크기를 차지(비율) */
    height: 46px;
    padding-left: 12px;
    padding-right: 12px;
    border: none;
    outline: none;
    font-size: 18px;
  }
  .searchBox button {
    flex: 1; /* search-box내부에서 1만큼의 크기를 차지(비율) */
    height: 46px;
    margin: 0;
    padding: 0;
    border: none;
    outline: none;
    background: #03cf5d;
    color: #ffffff;
  }
  /* nav */
  header > nav {
    width: 100%;
    height: 45px;
    position: absolute;
    bottom: 0;
  }
  main {
    background: #f2f4f7;
    min-height: 700px;
  }
  footer {
    background: darkgray;
    height: 310px;
  }

</style>
<title>Search Page</title>


</head>
	
<body>
    <header>
    	상단
    	<div class = "links">
	          <a href="/">메인으로 가는 버튼</a>
	    	  <a href="toMyPage">마이페이지</a>
    	</div>
	
    </header>
    <main>
    	메인
   		<div class = "searchBox">
			<form action="searchResult" name="myForm" onsubmit="return checkBlank(myForm)">
				<input type="text" name="sumName" id = "sumName" placeholder="소환사 이름을 입력하세요!"/>
				<input type="submit" value="검색"/>  
			</form>
		</div>

	<script type="text/javascript">
	    function checkBlank(formObj) {
	        if (document.getElementById('sumName').value) {
	            return true;
	   
	        }else{
				alert("값을 입력해주세요.");
				return false;
				//location.href = "search";
	        }
	    }
	    
	    
	    
	</script>
    </main>
    <footer>
   	 	하단
    </footer>
</body>
</html>
