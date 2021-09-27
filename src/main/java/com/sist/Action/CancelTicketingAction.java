package com.sist.Action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.TicketDao;

public class CancelTicketingAction implements TheaterActions{
	@Override
	public String serviceRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int re = -1;
		String theater_code = request.getParameter("theater_code");
		String ticketing_date = request.getParameter("ticketing_date");
		String ticketing_no = request.getParameter("ticketing_no");
		TicketDao dao = TicketDao.getInstance();
		re = dao.cancelSeats(theater_code, ticketing_date, ticketing_no); 
		if(re>0) {
			re = -1;
			re = dao.cancelPay(theater_code, ticketing_date, ticketing_no);
			if(re==1) {
				re = -1;
				re = dao.cancelTicketing(theater_code, ticketing_date, ticketing_no);		
			}
		}
		String msg = re==1?"예매내역을 취소했습니다.":"예매내역 취소에 실패했습니다.";
		request.setAttribute("msg", msg);
		return "cancelTicketing.jsp";
	}

}
