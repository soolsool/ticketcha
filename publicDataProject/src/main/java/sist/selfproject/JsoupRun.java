package sist.selfproject;
import java.io.IOException;
import java.util.HashSet;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class JsoupRun {
	static HashSet<String> tit = new HashSet<String>();
	static HashSet<String> writer = new HashSet<String>();
	
	public static void main(String[] args) throws IOException {
		Document doc = Jsoup.connect("https://www.hanbit.co.kr/store/books/new_book_list.html").timeout(6000).get();
		
		Elements ele = doc.select("div.view_box");
		for(Element e : ele) {
			String img = e.select("img.thumb").attr("src");
			String book_tit = e.select("p.book_tit").text();
			String book_writer = e.select("p.book_writer").text();
			tit.add(book_tit);
			writer.add(book_writer);
		}
	}
}
