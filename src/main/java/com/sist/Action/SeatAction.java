package com.sist.Action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SeatAction implements TheaterActions {

	@Override
	public String serviceRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(true);
		
		int qty =Integer.parseInt(request.getParameter("qty"));
		String selectedSeat=request.getParameter("selectedSeat");
		int total_price=Integer.parseInt(request.getParameter("total_price"));
		int qty_a=Integer.parseInt(request.getParameter("qty_a"));
		int qty_y=Integer.parseInt(request.getParameter("qty_y"));
		int qty_s=Integer.parseInt(request.getParameter("qty_s"));
		session.setAttribute("qty_a", qty_a);
		session.setAttribute("qty_y", qty_y);
		session.setAttribute("qty_s", qty_s);
		session.setAttribute("qty",qty);
		session.setAttribute("selectedSeat",selectedSeat);
		session.setAttribute("total_price",total_price);
		return "pay.jsp";
	}

}
