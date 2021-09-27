<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<style type="text/css">
@font-face {
    font-family: 'BMJUA';
    src: url('./source/BMJUA_TTF.TTF') format('woff');
    font-weight: normal;
    font-style: normal;
}
h1{
	font-family: 'BMJUA';
}
</style>
<script type="text/javascript">
	function cancelTicketing(){
		location.href="backtoMain.do";
	}
</script>
</head>
<body>
	<div class="row">
		<div class="col-md-3">
		</div>
		<div class="col-md-6">
			<div class="d-inline" onclick="cancelTicketing()">
				<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="#da281c" class="bi bi-house-door-fill" viewBox="0 0 16 16">
				  	<path d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5z"/>
				</svg>
				<h1 class="h5 text-danger">메인</h1>
			</div>
			<h1 class="h3 text-center text-danger">티켓챠!</h1>
		</div>
		<div class="col-md-3">
		</div>
	</div>
</body>
</html>