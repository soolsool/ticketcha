package com.sist.Action;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CustomerAction implements TheaterActions {

	@Override
	public String serviceRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String birthdate=request.getParameter("birthdate");
		String phone_number1=request.getParameter("phone_number1");
		String phone_number2=request.getParameter("phone_number2");
		String phone_number3=request.getParameter("phone_number3");
		String phone_number=phone_number1+"-"+phone_number2+"-"+phone_number3;
		String ticketing_password=request.getParameter("ticketing_password");
		System.out.println(ticketing_password);
		
		HttpSession session = request.getSession(true);
		session.setAttribute("name", name);
		session.setAttribute("birthdate",birthdate);
		session.setAttribute("phone_number",phone_number);
		session.setAttribute("ticketing_password",ticketing_password);

		return "seat.jsp";
	}

}
