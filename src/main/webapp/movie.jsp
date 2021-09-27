
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓챠!::영화 선택</title>
<style type="text/css">
#movielist{
	padding-right:0em;
}

.movie_info{	
	
	display:inline-block;
	width: 250px;
	height: 300px;
	border: solid 1px white;	
	
	border-radius: 10px;
	padding: 10px;
	box-sizing: border-box;
	
	margin-left:1.3em;
}

p{
color : white;
}

.col12{
	display:grid;
	overflow: hidden;
	grid-row-gap:15px;
	grid-column-gap: 50px;
}
</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<script type="text/javascript">

$(function(){
	$.getJSON("cgv.jsp", function(data){
		$.each(data, function(index, mm){
			let title_text = mm['title_text'];
			let movie_idx = mm['movie_idx'];
			let img_src = mm['img_src'];
			let runningtime= mm['running_time'];
			let img = $("<img/>");
						
			$(img).attr({
				src: img_src,
				idx : movie_idx,
				title : title_text,
				running_time : runningtime,
				width:200,
				height:280
					
			});
			let output=$("<div></div>").addClass("movie_info");
			
			/*let title = "<input type='hidden' name='movie_title' value='"+title_text+"'>";
			let idx = "<input type='hidden' name='idx_movie' value='"+movie_idx+"'>";
			let running_time = "<input type='hidden' name='running_time' value='"+runningtime+"'>";
			let imgsrc = "<input type='hidden' name='img_src' value='"+img_src+"'>";*/
			
			$(output).append(img);
			/*$(output).append($("<p></p>").html(title_text));
			$(output).append(running_time);
			$(output).append(imgsrc);
			$(output).append(title);
			$(output).append(idx);*/
			$("#movie_list").append(output);
			
		
			
		});
		
		$("img").on("click", function(){
			let title = "<input type='hidden' name='movie_title' value='"+$(this).attr("title")+"'>";
			let idx = "<input type='hidden' name='idx_movie' value='"+$(this).attr("idx")+"'>";
			let running_time = "<input type='hidden' name='running_time' value='"+$(this).attr("running_time")+"'>";
			let imgsrc = "<input type='hidden' name='img_src' value='"+$(this).attr("src")+"'>";
			
			
			$("#movie_list").append(running_time);
			$("#movie_list").append(imgsrc);
			$("#movie_list").append(title);
			$("#movie_list").append(idx);
			selectmovie.submit();
		});
	});
});
</script>


</head>
<body class="movie">
	<main>
		<div class="container">
			
			<div class="col-md-12">
				<span class="d-block p-2 bg-danger text-white text-center">
					영화 선택
				</span>	
			</div>
				
			<form action="insertMOKAction.do" method="post" id="movie_list" name="selectmovie">
	
			</form>

		</div>
	</main>
</body>
</html>