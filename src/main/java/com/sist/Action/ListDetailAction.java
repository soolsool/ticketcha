package com.sist.Action;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.TheaterDao;

public class ListDetailAction implements TheaterActions {

	TheaterDao dao;
	@Override
	public String serviceRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession(true);
		String movie_idx= request.getParameter("idx_movie");
		String theater_name= request.getParameter("theater_name");
		dao = TheaterDao.getInstance();
		session.setAttribute("theater_name", theater_name);
		session.setAttribute("detailget", dao.findDetail(movie_idx));

		return "timetable.jsp";
		
		
	}

}