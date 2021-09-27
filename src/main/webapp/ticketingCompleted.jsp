<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓챠!::예매 완료</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
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
				<div class="jumbotron">
					<h1 class="display-4">예매완료</h1>
					 <p class="lead">
					 	${msg}
					 </p>
				</div>
				<div class="card-deck mb text-center">
					<div class="card mb box-shadow">
						<div class="card-header">
							<h4 class="my-0 font-weight-normal">${t.theater_code}-${t.ticketing_date}-${t.ticketing_no}</h4>
						</div>
						<div class="card-body">
							<h1 class="card-title pricing-card-title">${t.movie_title}</h1>
							<ul class="list-unstyled mt-3 mb-4">
								<li>${t.start_time}~${t.end_time}(${t.running_time}분)</li>
								<li>${t.theater_no}관 ${t.round}회</li>
								<li>${price}원</li>
								<c:if  test="${pay_method=='신용/체크카드'}">
									<li>${pay_method}
										<c:forEach var="n"  items="${cardno}">
											${n}
										</c:forEach>
									</li>
								</c:if>
								<c:if test="${pay_method=='휴대폰결제'}">
									<li>${pay_method}</li>
								</c:if>
								<c:if test="${pay_method=='간편결제'}">
									<li>${pay_method}</li>
								</c:if>
							</ul>
						<button type="button" class="btn btn-lg btn-block btn-outline-danger" onclick="location.href='backtoMain.do'">메인 화면</button>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3">
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3">
		</div>	
		<div class="col-md-6">
			<a href="BacktoMain.do"></a>
		</div>	
		<div class="col-md-3">
		</div>	
	</div>
</body>
</html>