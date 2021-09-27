
<%@page import="com.sist.Vo.MovieVo"%>
<%@page import="com.google.gson.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<% 
	request.setCharacterEncoding("utf-8");
	Document doc = Jsoup.connect("http://www.cgv.co.kr/reserve/show-times/movies.aspx").get();	
	Elements list = doc.select("#movie_list").get(0).getElementsByTag("a");
	
	String showtimes = "http://www.cgv.co.kr/common/showtimes/iframeMovie.aspx?midx=";
	String detail_view ="http://www.cgv.co.kr/movies/detail-view/?midx=";

	
	ArrayList<MovieVo> movie_list = new ArrayList<MovieVo>();

	int cnt=0;
	for(Element e:list){
		cnt++;
		if(cnt<9){
		Element title = e.select("strong").get(0);
		String title_text = title.text();

		String movie_idx = e.attr("data-movieidx"); //영화 idx
		//각 영화의 상세페이지
		Document moviedetail = Jsoup.connect(detail_view+movie_idx).get(); 
		
		//상세페이지에서 현재 영화의 이미지가 들어있는 태그를 얻어온다.
		Element img = moviedetail.select("#select_main > div.sect-base-movie > div.box-image > a > span > img").get(0); 
		String txt = moviedetail.select("#select_main > div.sect-base-movie > div.box-contents > div.spec > dl > dd:nth-last-child(3)").get(0).text();
		String	running_time=txt.substring(txt.indexOf(",")+2,txt.indexOf("분"));
		//태그에서 src속성만 추출
		String img_src = img.attr("src");
		
		//title을 클릭할 경우 각 영화 스케줄 사이트로 이동
		
		MovieVo movieVo = new MovieVo(title_text, movie_idx, img_src,running_time);
		movie_list.add(movieVo);
		}
		//out.println("<img width='185' height='260' src="+img_src+">"+"<br><a href="+showtimes+movie_idx+">"+title_text+"</a><br>");
		}
	
	
	
	Gson gson = new Gson();
	String result = gson.toJson(movie_list);


%>
<%= result %>
