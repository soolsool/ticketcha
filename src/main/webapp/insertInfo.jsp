<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매내역 조회</title>
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
				<h2 class="my-4">예매 확인</h2>
				예매할 때 입력하신 개인정보를 입력해주세요.
				<hr>
				<div class="row">
					<div class="col-md-2">
					</div>
					<div class="col-md-8">
						<form action="verifyingInfo.do" method="post">
							<div class="form-floating mb-3">
							  <input type="text" name="birthdate" pattern="[0-9]{8}" required="required" class="form-control" id="floatingBirthdate" placeholder="19000101">
							  <label for="floatingBirthdate">생년월일</label>
							</div>
							
							<div class="form-floating mb-3">
							  <input type="tel" name="phone" pattern="[0,1]{3}-[1-9]{1}[0-9]{3}-[1-9]{1}[0-9]{3}" required="required" class="form-control" id="floatingPhone" placeholder="010-1234-1234">
							  <label for="floatingPhone">휴대폰 번호</label>
							</div>
							
							<div class="form-floating mb-3">
							  <input type="password" name="pswd" required="required" pattern="[0-9]{4}" class="form-control" id="floatingPassword" placeholder="숫자 4자리">
							  <label for="floatingPassword">비밀번호</label>
							</div>
								
							<div class="d-grid gap-2 col-6 mx-auto">
								<input type="submit" value="확인" role="button" class="btn btn-danger btn-sm">
							</div>
						</form>
					</div>
					<div class="col-md-2">
					</div>
				</div>
			</div>
			<div class="col-md-3">
			</div>
		</div>
</body>
</html>