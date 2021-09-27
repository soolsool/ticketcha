<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 티켓챠! ::</title>
<style type="text/css">
	img{
		width:15em;
		margin:auto;
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
</head>
<body>
	<header>
	</header>
	<main>
		<div class="container">
  			<div class="position-absolute top-50 start-50 translate-middle">
  				<div class="d-block">
					<img src="./images/logo.png">
  				</div>
				<div class="d-grid gap-2 my-1">
					<button type="button" class="btn btn-danger" onclick="location.href='insertMovie.do'">영화 선택</button>
					<button type="button" class="btn btn-danger" onclick="location.href='ticketingCheck.do'">예매내역 조회</button>
				</div>
  			</div>
		</div>
	</main>
	<footer>
	</footer>
</body>
</html>