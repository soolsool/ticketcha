<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓챠!::결제</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$(".methods").children().not("#pay-card").hide(); //결제 수단 중 카드 결제를 기본값으로 함
		
		$("input[name='pay_method']").click(function(){
			var input = "#pay-" + $("input[name='pay_method']:checked").val(); //선택한 radio의 값을 input에 대입
			console.log(input)
			$(".methods").children().not(input).hide(); //사용자가 선택한 클래스만 보여줌
			$(input).show();
		})
		
		$("input[name='pay_method']").on("change",function(){
			$(".methods").children().val();
		})
	})
</script>
</head>
<body>
	<header>
		<%@ include file="header.jsp" %>
	</header>
	<form action="PayComplete.do" method="post" id="pay">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
			</div>
			<div class="col-md-6">
				<div class="card mb" style="max-width: 100%;">
					<div class="row g-0">
						<div class="col-md-4">
							<img class="img-fluid rounded-start" src="${img_src }" height="80%">
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h4 class="card-title">${movie_title}</h4>
								<p class="card-text">
									<small class="text-muted"> ${showing_date}
										${start_time}~ ${end_time}(${running_time}분)<br>
										${theater_no}관 ${round}회차
									</small>
								</p>
								<p class="card-text">
									<small class="text-muted"> 
									<c:if test="${qty_a!=0}">
										성인 <strong>${qty_a}</strong>
											</c:if> 
										<c:if test="${qty_y!=0}">
											청소년 <strong>${qty_y}</strong>
										</c:if> 
										<c:if test="${qty_s!=0}">
											우대 <strong>${qty_s}</strong>
										</c:if>
									</small>
								</p>
								<p class="card-text" style="text-align: right;">
									<strong>${total_price}원</strong>
								</p>
							</div>
						</div>
					</div>
				</div> 
				<!-- 영화 상세내역 카드 레이어 끝 -->
				<div class="pay_info">
						<input type="hidden" name="theater_code" value="${theater_code}">
						<input type="hidden" name="movie_title" value="${movie_title}">
						<input type="hidden" name="showing_date" value="${showing_date}">
						<input type="hidden" name="start_time" value="${start_time}">
						<input type="hidden" name="end_time" value="${end_time}">
						<input type="hidden" name="running_time" value="${running_time}">
						<input type="hidden" name="theater_no" value="${theater_no}">
						<input type="hidden" name="round" value="${round}"> 
						<input type="hidden" name="qty_a" value="${qty_a}"> 
						<input type="hidden" name="qty_y" value="${qty_y}"> 
						<input type="hidden" name="qty_s" value="${qty_s}"> 
						<input type="hidden" name="seats" value="${seats_num}"> 
						<input type="hidden" name="price" value="${total_price}">
				</div>
				<!-- 티켓 예매 레이어 시작 -->
				<div class="select-method my-3">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="pay_method" id="method-card" value="card" checked="checked"> 
						<label class="form-check-label" for="method-card"> 신용/체크카드 </label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="pay_method" id="method-phone" value="phone"> 
						<label class="form-check-label" for="method-phone"> 휴대폰 결제 </label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="pay_method" id="method-easy" value="easy"> 
						<label class="form-check-label" for="method-phone"> 간편 결제 </label>
					</div>
				</div>
				<div class="methods">
					<div class="input-group mb my-3" id="pay-card">
						<div class="badge bg-danger text-wrap" style="width: 6rem;">
						  카드 결제
						</div>
						<div class="card" id="insert-cardinfo" style="border:none;">
							<div class="input-group mb my-3" >
								<select class="form-select" id="cards" style="width: 20%;">
									<option selected>카드선택</option>
									<option value="BCC">BC카드</option>
									<option value="HDC">현대카드</option>
									<option value="KEB">KEB하나카드(구,외환)</option>
									<option value="SSC">삼성카드</option>
									<option value="SHC">신한카드</option>
									<option value="KBC">KB국민카드</option>
									<option value="KKB">카카오뱅크카드</option>
									<option value="NHC">NH카드</option>
									<option value="SCC">스탠다드차타드은행카드</option>
									<option value="CTC">씨티카드</option>
									<option value="LAC">롯데/아멕스카드</option>
									<option value="KBK">K뱅크</option>
									<option value="WRC">우리카드</option>
									<option value="SGC">신세계카드</option>
									<option value="SKC">하나카드(구,하나SK)</option>
									<option value="GBC">광주은행카드</option>
									<option value="ICC">산은캐피탈</option>
									<option value="MAC">수협카드</option>
									<option value="KDB">KDB산업은행카드</option>
									<option value="JBB">전북은행카드</option>
									<option value="JJB">제주은행카드</option>
									<option value="MGC">MG체크카드</option>
									<option value="POC">우체국카드</option>
									<option value="HDS">KB증권카드(구,현대증권)</option>
									<option value="IBK">기업은행카드</option>
									<option value="SSG">SSG카드</option>
								</select> 
								<input type="text" class="form-control card" name="card" id="" maxlength="4">
								<input type="text" class="form-control card" name="card" maxlength="4">
								<input type="text" class="form-control card" name="card" maxlength="4">
								<input type="text" class="form-control card" name="card" maxlength="4">
							</div>
						</div>
					<!-- 카드 유효기간 입력 -->
						<div class="input-group" style="max-width:100%;">
							<label for="year" class="col-sm-2 col-form-label">
								<small>
									카드<br>유효기간
								</small>
							</label>
							<div class="form-floating mb-5" id="year">
								<input type="text" class="form-control" name="validYear" id="validYear" maxlength="2">
								<label for="validYear">연도 2025년 → 25</label>
							</div>
							
							<div class="form-floating mb-5">
								<input type="text" class=	"form-control" name="validMonth" id="validMonth" maxlength="2">
								<label for="validMonth">월 11월 → 11</label>
							</div>
						</div>
						<!-- 카드 주인 생년월일 입력 -->
						
						<div class="row my-3">
							<label for="card_birthDate" class="col-sm-5 col-form-label">생년월일</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="card_birthDate" id="card_birthDate" maxlength="6"	>
							</div>					
						</div>
						
						<div class="row my-3">
							<label for="card_birthDate" class="col-sm-5 col-form-label">카드 비밀번호</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="card_pswd" id="card_pswd" maxlength="2"	>
							</div>					
						</div>
						
					</div>
					
					<div class="pay-method" id="pay-phone">
						<div class="badge bg-danger text-wrap" style="width: 6rem;">
						  휴대폰 결제
						</div>
						<div class="my-3">
							<h5>결제금액 ${total_price}원</h5>
							<p>상품명 : 영화 티켓 예매</p>
						</div>
					</div>
					
					<div class="pay-method" id="pay-easy">
						<div class="badge bg-danger text-wrap my-3" style="width: 6rem;">
						  간편결제
						</div>
						<select class="form-select" aria-label="Default select example">
						  <option selected>간편결제</option>
						  <option value="naver">네이버페이</option>
						  <option value="kakao">카카오페이</option>
						  <option value="payco">페이코</option>
						</select>
					</div>
				
			</div>
			<!-- 메인 레이어 끝나는 곳 -->	
			</div>
			<div class="col-md-3">
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
			</div>
			<div class="col-md-6 d-grid gap-2">
				<input type="submit" class="btn btn-danger" value="결제">
			</div>
			<div class="col-md-3">
			</div>
		</div>
	</div>	
	</form>
</body>
</html>