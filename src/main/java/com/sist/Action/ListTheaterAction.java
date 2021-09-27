package com.sist.Action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.TheaterDao;

public class ListTheaterAction implements TheaterActions {

	TheaterDao dao;
	@Override
	public String serviceRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		String area_name = request.getParameter("area_name");
		dao = TheaterDao.getInstance();
		
		HttpSession session = request.getSession(true);
		session.setAttribute("area_name", area_name);

		session.setAttribute("getinfo", dao.getTheater(area_name));
		return "theater_list.jsp";
	}

}
