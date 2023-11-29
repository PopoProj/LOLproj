![popo](https://github.com/PopoProj/LOLproj/assets/97634089/72b39bab-c506-4b15-8117-28f431f85f7a)


# 🏆 POPO 🎮
리그오브레전드라는 게임의 유저 이름을 검색해 그 유저의 최근 전적을 확인하는 사이트입니다.

리그오브레전드의 제작사인 Riot Games의 API를 활용했습니다.

## 🛠️ 작업환경
Java 8, STS 4, SpringBoot 2.7, Oracle DB, Mybatis, Maven

## ❓ 개발 목적
게일을 하다 같은 팀으로 만난 유저나 궁금한 유저의 전적, 승률, 티어등을 확인하기위함

## 📅 개발 기간
2023.09 - 2023.10

## ✨ 주요 기능

#### 유저화면

1. 유저 검색
-  검색하고자 하는 유저의 인게임 닉네임으로 검색 가능, 유저가 존재할 시 결과페이지로 이동하고 그렇지 않을시 에러페이지로 이동

    1-a. 최다 검색된 유저
    - 사용자의 로그인 여부와 상관없이 결과페이지로 이동 할 때 Parameter로 념겨진 닉네임을 DB에 저장, 검색 횟수에 따라 count 증가
    - 이 데이터는 꼭 검색페이지에서 검색된 결과만을 집계하는것이 아닌 즐겨찾기, 최근 기록, 게임결과 등에서 하이퍼링크로 이동한 경우도 포함

    1-b. 추천수 많은 게시글
    - DB에서 게시글 추천수로 내림차 정렬 후 상위 5개 표시
  
2. 검색 결과
- 입력한 닉네임으로 Riot API URL을 통해 계정의 정보를 JSON으로 받아온 후 Summoner와 InstSummoner 클래스의 오브젝트로 생성 후 필요한 정보 화면에 출력
- 프로필 아이콘 아래 즐겨찾기에 추가 버튼 이용해 추가 가능, 정보를 이용한 승률 및 픽률 그래프 표시
- 최근 10판의 전적과 각 판당 유저의 정보 KDA, 레벨등 표시 및 3번으로 가는 하이퍼링크 등록

3. 게임 결과
- 2번에서 이동, 각 경기에 대한 상세 정보 (플레이 한 유저, 레벨, 플레이한 챔피언등) 표시
- 각 유저 클릭시 선택된 유저에 대한 검색결과 페이지(2번)로 이동   

4. 로그인
- 사용자가 ID와 비밀번호를 입력했을 때 DB가 보유중인 데이터에서 SELECT, 만약 성공시 로그인 성공메시지와 Session 생성

5. 회원가입
- 아이디, 이메일 중복체크
- 회원가입을 위한 정보를 받고 DB에서 중복체크 후 존재하지 않는 계정 정보이면 새로운 유저로 DB에 정보 등록

6. 마이페이지
- 즐겨찾기, 최근검색기록, 내가쓴글로 이동 가능

7. 즐겨찾기
- 최대 5명까지 등록 가능한 사용자의 즐겨찾기 목록
- DB의 favourites 테이블에 저장

8. 최근 검색
- 최근 10건의 유저 검색기록 저장
- DB의 records 테이블에 저장

9. 내가 쓴글
- board 테이블에서 작성자가 현재 세션 사용자인 글들 보이기

10. 게시판
- 
   
## 🖥️ 시연 화면 스크린샷 🖼️





