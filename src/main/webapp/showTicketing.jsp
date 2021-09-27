<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓챠!::예매 내역 조회</title>
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
			<h3 class="my-2">예매/취소 내역</h3>
			<hr>
			
			<h4 class="my-3">예매 내역</h4>
			<c:forEach var="t" items="${ticket}">
				<c:if test="${t.refund==0}">
					<c:if test="${t.ticketing_no}">
						<span class="badge bg-danger">예매 내역이 없습니다.</span>
					</c:if>
					<form action="cancelTicketing.do?ticketing_no=${t.ticketing_no}" method="post">
						<div class="card border-secondary mb-3" style="max-width: 100%;">
						  <div class="card-header">
							  예매번호 ${t.theater_code}-${t.ticketing_date}-${t.ticketing_no}
						  </div>
							<input type="hidden" name="theater_code" value="${t.theater_code}">
							<input type="hidden" name="ticketing_date" value="${t.ticketing_date}">
							<input type="hidden" name="ticketing_no" value="${t.ticketing_no}">
						 <div class="card-body">
						    <h4 class="card-title">
						 	 	<strong>
								    ${t.movie_title}
								</strong>
						    </h4>
						    <p class="card-text">
						    	상영일 ${t.showing_date.substring(0,10)} ${t.start_time}~${t.end_time}<br>
								${t.theater_no}관 ${t.round}회차 (${t.qty}명)
							</p>
							<div class="d-grid gap-2 d-md-flex justify-content-md-end">
								<input type="submit" value="예매 취소" class="btn btn-secondary">
							</div>
						 </div>
						</div>
					</form>
				</c:if>
			</c:forEach>
			<hr>
			<h4 class="my-3">취소 내역</h4>
			<c:forEach var="t" items="${ticket}">
				<c:if test="${t.refund==0}">
					<span class="badge bg-danger">취소 내역이 없습니다.</span>
				</c:if>
				<c:if test="${t.refund==1}">
					<div class="card border-secondary mb-3" style="max-width: 100%;">
						<div class="card-header">
							예매번호 ${t.theater_code}-${t.ticketing_date}-${t.ticketing_no}
						</div>
						<div class="card-body">
						    <h4 class="card-title">
							<strong>
						    	${t.movie_title}
							</strong>
						    </h4>
						    <p class="card-text">
						    	상영일 ${t.showing_date} ${t.start_time}~${t.end_time}<br>
								${t.theater_no}관 ${t.round}회차 (${t.qty}명)
							</p>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<div class="col-md-3">
		</div>
	</div>
</body>
</html>