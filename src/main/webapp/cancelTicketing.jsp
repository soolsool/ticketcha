<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취소 완료</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
</head>
<body>
	<head>
		<%@ include file="header.jsp" %>
	</head>
	<div class="row">
		<div class="col-md-3">
		</div>
		<div class="col-md-6">
			<div class="alert alert-danger" >
				<span class="d-block p-2 bg-danger text-white text-center">
					예매 취소
				</span>	
			  <p>예매를 취소하셨습니다.</p>
			  <p>다음 기회에 뵙겠습니다.</p>
			</div>
		</div>
		<div class="col-md-3">
		</div>
	</div>
	<main role="main">
		<div class="container">
			<div class="text-center  my-3">
				
				<p>${msg}</p>
				<button type="button" class="btn btn-danger" onclick="location.href='backtoMain.do'">
					티켓 예매
				</button>
			</div>
		</div>
	</main>

</body>
</html>