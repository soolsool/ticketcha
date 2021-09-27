<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
	<%@ include file="header.jsp" %>
</header>
	<div class="row">
		<div class="col-md-3">
		</div>
		<div class="col-md-6">
				<span class="d-block p-2 bg-danger text-white text-center">
					오류 페이지
				</span>	
		</div>
		<div class="col-md-3">
		</div>
	</div>
	<main>
		<div class="container">
  			<div class="position-absolute top-50 start-50 translate-middle">
  				<div class="d-block">
					<img src="./images/logo.png">
  				</div>
				<div class="d-grid gap-2 my-1">
					입력하신 정보의 예매내역을 찾을 수 없습니다.
				</div>
				<button type="button" class="btn btn-danger" onclick="location.href='backtoMain.do'">
					티켓 예매
				</button>
  			</div>
		</div>
	</main>
</body>
</html>