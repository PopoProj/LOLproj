# LOLproj
리그오브레전드라는 게임의 유저 이름을 검색해 그 유저의 최근 전적을 확인하는 사이트입니다.

리그오브레전드의 제작사인 Riot Games의 API를 활용했습니다.

## 작업환경
Java 8, STS 4, SpringBoot 2.7, Oracle DB, Mybatis, Maven

## 개발 목적
게일을 하다 같은 팀으로 만난 유저나 궁금한 유저의 전적, 승률, 티어등을 확인하기위함

## 개발 기간
2023.09 - 2023.10

## 주요 기능

#### 유저화면

1. 유저 검색
-  검색하고자 하는 유저의 인게임 닉네임으로 검색 가능, 유저가 존재할 시 결과페이지로 이동하고 그렇지 않을시 에러페이지로 이동

2. 최다 검색된 유저
- 사용자의 로그인 여부와 상관없이 결과페이지로 이동 할 때 Parameter로 념겨진 닉네임을 DB에 저장, 검색 횟수에 따라 count 증가
- 이 데이터는 꼭 검색페이지에서 검색된 결과만을 집계하는것이 아닌 즐겨찾기, 최근 기록, 게임결과 등에서 하이퍼링크로 이동한 경우도 포함

3. 추천수 많은 게시글
- DB에서 게시글 추천수로 내림차 정렬 후 상위 5개 표시

 3. 로그인
- 유저가 ID와 비밀번호를 입력했을 때 DB가 보유중인 데이터에서 SELECT, 만약 성공시 로그인 성공메시지와 Session 생성
<img width="10%" src="https://user-images.githubusercontent.com/16822641/109461495-913fc480-7aa5-11eb-9d0e-aff762669f98.gif"/>
<img width="10%" src="https://user-images.githubusercontent.com/97634089/275764613-77966dfb-20db-4d44-9a58-0bee33a553db.PNG"/>





