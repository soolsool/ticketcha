package com.sist.Action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.TheaterDao;

public class InsertMOKAction implements TheaterActions {

	TheaterDao dao;
	
	@Override
	public String serviceRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
			 {
		
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		
		String movie_title = request.getParameter("movie_title");
		int movie_idx = Integer.parseInt(request.getParameter("idx_movie"));
		String running_time = request.getParameter("running_time");
		String img_src = request.getParameter("img_src");
		dao = TheaterDao.getInstance();
		HttpSession session = request.getSession(true);
		session.setAttribute("list", dao.areainfo());
		session.setAttribute("movie_title", movie_title);
		session.setAttribute("running_time", running_time);
		session.setAttribute("movie_idx", movie_idx);
		session.setAttribute("img_src", img_src);
		
		return "theater.jsp";
	}

}
