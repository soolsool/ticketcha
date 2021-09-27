package com.sist.Action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.Reserved_SeatsDao;
import com.sist.dao.TheaterDao;

public class InsertMinfoAction implements TheaterActions {
	
	@Override
	public String serviceRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(true);
		TheaterDao thdao = TheaterDao.getInstance();
		
		String showing_date= thdao.showing_date().substring(0,10);
		String movie_title = (String) session.getAttribute("movie_title");
		String theater_name = (String) session.getAttribute("theater_name");
		String theater_no = request.getParameter("theater_no");
		int round = Integer.parseInt(request.getParameter("round"));
		String start_time = request.getParameter("start_time");
		int running_time = Integer.parseInt((String)session.getAttribute("running_time"));
		
		int hour=running_time/60;
		int minutes=running_time%60;
		
		int hour2=Integer.parseInt(start_time.substring(0,2))+hour;
		int minutes2=Integer.parseInt(start_time.substring(3))+minutes;
		if(minutes2>59) {
			minutes2=minutes2-60;
			hour2=hour2+1;
		}
		String end_time = String.valueOf(hour2)+":"+String.valueOf(minutes2);
		
		int seats_num=0;
		int theater_dt = Integer.parseInt(theater_no.substring(0,1));
		
		String theater_code= thdao.Theater_code(theater_name);
		
		Reserved_SeatsDao rsdao = Reserved_SeatsDao.getInstance();
		ArrayList<String> seat_list = rsdao.Reserved_Seats_info(showing_date,round,movie_title);
		switch(theater_dt) {
		case 1,3,5: seats_num=170; break;
		case 2,4: seats_num=180; break;
		case 6,7,8: seats_num=200; break;
		default: seats_num=190; break;
		}
		
		
		session.setAttribute("theater_code",theater_code);
		session.setAttribute("theater_no",theater_no);
		session.setAttribute("seat_list", seat_list);//선택된상영관의이미예매된좌석목록
		session.setAttribute("seats_num", seats_num);//총좌석수
		
		session.setAttribute("showing_date",showing_date);
		session.setAttribute("start_time",start_time);
		session.setAttribute("end_time",end_time);
		session.setAttribute("round",round);
		
		
		return "customer.jsp";
	}

}
