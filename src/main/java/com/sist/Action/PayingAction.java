package com.sist.Action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.TicketDao;

public class PayingAction implements TheaterActions {
	@Override
	public String serviceRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		return "pay.jsp";
	}
}
