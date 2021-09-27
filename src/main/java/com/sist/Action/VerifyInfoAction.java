package com.sist.Action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.Vo.TicketVo;
import com.sist.dao.TicketDao;

public class VerifyInfoAction implements TheaterActions {
	@Override
	public String serviceRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		TicketDao dao = TicketDao.getInstance();
		request.setCharacterEncoding("UTF-8");
		
		//insertinfo에 데이터를 요청
		String birthdate = request.getParameter("birthdate");
		String phone = request.getParameter("phone");
		String pswd = request.getParameter("pswd");
		ArrayList<TicketVo> list = new ArrayList<TicketVo>();
		
		if(dao.findTicketInfo(birthdate, phone, pswd)) {
			list = dao.getTicketInfo(birthdate, phone, pswd);
		}else {
			response.sendRedirect("emptyInfo.jsp");
		}		
		request.setAttribute("ticket",list);
		return "showTicketing.jsp";
	}

}
