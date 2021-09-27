<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓챠!::관람 지역</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<style type="text/css">
	ul{
		padding-left:0;
		list-style:none;
	}
</style>
</head>
<body>
	<head>
		<%@ include file="header.jsp" %>
	</head>
	<div class="container">
		<div class="row">
			<div class="col-md-3">
			</div>
			<div class="col-md-6">
					<span class="d-block p-2 bg-danger text-white text-center">
						지역 선택
					</span>	
			</div>
			<div class="col-md-3">
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
			</div>
			<div class="col-md-6">
				<div class="my-5">
				</div>
				<div class="list-group">
					<ul>
						<c:forEach var="aa" items="${list }">
							<li>
							 	<span class="text-center">
 									 <a href="listTheater.do?area_name=${aa.area_name }" class="list-group-item list-group-item-action list-group-item-danger">
	 								 	${aa.area_name }
	 								 </a>
							 	</span>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="col-md-3">
			</div>
		</div>
	</div>	
</body>
</html>