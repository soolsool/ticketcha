# 티켓차!(ticketcha)
[쌍용강북교육센터 - Java를 활용한 멀티 플랫폼 융합 SW개발자 양성과정] MVC 패턴을 이용한 미니 팀 프로젝트<br>
<br>

**영화정보 조회 및 예매 서비스**
 - Jsoup으로 웹 크롤링을 이용하여 영화 정보 실시간 조회<br>
 - JS를 이용한 좌석도 선택 및 해제 기능 구현<br>
 - DB와 연동하여 예매정보 조회 및 취소 기능 구현
<br>

**메인페이지 -> 영화선택 **
<img src="https://user-images.githubusercontent.com/87021484/135799515-e38f7663-8390-4ba6-ae34-748db6c724d4.gif" height="250">

<br>

**고객정보입력 -> 결제 **
<img src="https://user-images.githubusercontent.com/87021484/135800356-1bd0c1be-5bf5-4bc4-a6f5-a9f54d91db10.gif" height="250">

<br>

**예매정보 확인 및 취소**
<img src="https://user-images.githubusercontent.com/87021484/135800363-a040083f-3f70-4c1a-8aeb-3108ba152c78.gif" height="250">

<br>

**예매취소 확인**
<img src="https://user-images.githubusercontent.com/87021484/135800365-c5105f3d-6517-4f40-a3ba-d861cd850008.gif" height="250">
<br>
<br>

`아쉬운 점이나 개선이 필요한 점`
 - 웹 크롤링으로 영화정보 - 극장정보 - 상영정보까지 모두 크롤링하는 것으로 생각하고 정보를 가져온 뒤 예매 내역만 DB에 입력하려했으나 영화정보밖에 가져오지 못하면서 급하게 DB를 수정해야했다. 조금 번거롭더라도 크롤링으로 정보만 가져올 것이 아니라 영화-상영-극장의 ERD를 구체적으로 세워 DB에서 조회하고, 예매시 DB에 insert해야했다.
 - 예매확인할 때, 고객 정보를 잘못 입력한 경우에 대한 처리를 해주지 않았다. 기한 내 완성하는 것에만 몰두해서 꼼꼼하게 살피지 못했다.
