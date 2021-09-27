<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓챠::예매 고객 정보 입력</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<link rel="stylesheet" href="css/customer.css">
<style type="text/css">
	ul{
		padding-left:0;
		list-style:none;
	}

}
</style>
</head>
<body>
<header>
	<%@ include file="header.jsp" %>
</header>
<div class="container">
	<div class="row">
		<div class="col-md-3">
		</div>
		<div class="col-md-6">
			<span class="d-block p-2 bg-danger text-white text-center">
				개인정보 입력
			</span>	
			<div class="info-text">모든 항목은 필수 입력사항입니다.</div>
			
			<form action="customer.do" method="post">
				<div class="mb-3">
				  <label for="name" class="form-label">이름</label>
				  <input type="text" class="form-control" id="name" name="name" required="required">
				</div>
				
				<div class="mb-3">
				  <label for="birthdate" class="form-label">법정생년월일(8자리)</label>
				  <input type="text" class="form-control" id="birthdate" name="birthdate" required="required">
				</div>
				
				<div class="mb-3">
				  <label for="phone-info" class="form-label">휴대폰 번호</label>
					<div class="input-group mb" >
						<select class="form-select" title="휴대폰번호 앞자리" id="phone-info" name="phone_number1">
							<option value="010" selected>010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
						-
						<input type="text" class="form-control" name="phone_number2" required="required">
						-
						<input type="text" class="form-control" name="phone_number3" required="required"><br>
					</div>
				</div>
			
				<div class="mb-3">
				  <label for="ticketing_password" class="form-label">비밀번호(4자리)</label>
				  <input type="password" class="form-control" id="ticketing_password" name="ticketing_password" required="required">
				</div>
				
				<div class="seat-btn-wrapper">
					<button type="submit" class="seat-btn">좌석 예매하기</button>
				</div>
			</form>
			</div>
		<div class="col-md-3">
		</div>
	</div>
</div>
</body>

</html>