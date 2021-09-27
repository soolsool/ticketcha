<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓챠!::결제</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
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
						<input type="hidden" name="name" value="${name}">
						<input type="hidden" name="birthdate" value="${birthdate}">
						<input type="hidden" name="phone_number" value="${phone_number}">
						<input type="hidden" name="apply_num">
 						
				</div>
				<!-- 티켓 예매 레이어 시작 -->
			<!-- 메인 레이어 끝나는 곳 -->	
			</div>
			<div class="col-md-3">
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
			</div>
			<div class="col-md-6 d-grid gap-2">
				<input type="button" class="btn btn-danger" value="결제" id="payModule">
			</div>
			<div class="col-md-3">
			</div>
		</div>
	</div>	
	</form>
</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
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

		
		var IMP = window.IMP;
		var price = document.getElementsByName('price')[0].value;
		var name = document.getElementsByName('name')[0].value;
		var phone_number = document.getElementsByName('phone_number')[0].value;
		var theater_code = document.getElementsByName('theater_code')[0].value;
		var movie_title = document.getElementsByName('movie_title')[0].value;
		var showing_date = document.getElementsByName('showing_date')[0].value;
		var start_time = document.getElementsByName('start_time')[0].value;
		var end_time = document.getElementsByName('end_time')[0].value;
		var running_time = document.getElementsByName('running_time')[0].value;
		var theater_no = document.getElementsByName('theater_no')[0].value;
		var round = document.getElementsByName('round')[0].value;
		var qty_a = document.getElementsByName('qty_a')[0].value; 
		var qty_y = document.getElementsByName('qty_y')[0].value;
		var qty_s = document.getElementsByName('qty_s')[0].value;
		var seats = document.getElementsByName('seats_num')[0].value; 
		var birthdate = document.getElementsByName('birthdate')[0].value;
		var phone_number = document.getElementsByName('phone_number')[0].value;
		
		
		$('#payModule').click(function(){
			IMP.init("imp75441369");
			IMP.request_pay({ // param
		          pg: "kcp",
		          pay_method: "card",
		          merchant_uid: 'merchant_' + new Date().getTime(),
		          name: "티켓챠!영화예매",
		          amount: price,
		          buyer_email: "suuura29@naver.com",
		          buyer_name: name,
		          buyer_tel: phone_number,
		          buyer_addr: "서울특별시 마포구 서교동",
		          buyer_postcode: "04001"
			}, function (rsp) { // callback
              if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
				jQuery.ajax({
                    url: "PayComplete.do", // 예: https://www.myservice.com/payments/complete
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    data: {
                        imp_uid: rsp.imp_uid,
                        merchant_uid: rsp.merchant_uid,
                        apply_num: rsp.apply_num,
    					name : name,
    					phone_number : phone_number,
    					theater_code : theater_code,
    					movie_title : movie_title,
    					showing_date : showing_date,
    					start_time : start_time,
    					end_time : end_time,
    					running_time : running_time,
    					theater_no : pritheater_noce,
    					round : round,
    					qty_a : qty_a,
    					qty_y : qty_y,
    					qty_s : qty_s,
    					seats : seats,
    					birthdate : birthdate,
    					phone_number : phone_number
                    }
                }).done(function (data) {
                  // 가맹점 서버 결제 API 성공시 로직
					location.href='PayComplete.do';
                })
              	
              } else {
                alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
              }
		});
	});
	
	})
</script>
</html>