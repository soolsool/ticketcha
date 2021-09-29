package com.sist.Action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.Vo.CustomerVo;
import com.sist.Vo.TicketVo;
import com.sist.dao.TicketDao;

public class PayingCompleteAction implements TheaterActions {
	@Override
	public String serviceRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		TicketDao dao = TicketDao.getInstance();
		int a = Integer.parseInt(request.getParameter("qty_a"));
		int y = Integer.parseInt(request.getParameter("qty_y"));
		int s = Integer.parseInt(request.getParameter("qty_s"));
		String pay_method = request.getParameter("pay_method");
		int qty = a +  y + s;
		
		String theater_code = request.getParameter("theater_code");
		String ticketing_date = dao.getTicketingDate();
		String ticketing_no = dao.getNextNo();

		//dao�� insert�� TicketVo ����
		TicketVo t = new TicketVo();
		t.setTheater_code(theater_code);
		t.setTicketing_date(ticketing_date);
		t.setTicketing_no(ticketing_no);
		t.setMovie_title(request.getParameter("movie_title"));
		t.setShowing_date(request.getParameter("showing_date"));
		t.setStart_time(request.getParameter("start_time"));
		t.setEnd_time(request.getParameter("end_time"));
		t.setRunning_time(request.getParameter("running_time"));
		t.setTheater_no(request.getParameter("theater_no"));
		t.setRound(Integer.parseInt(request.getParameter("round")));
		t.setQty(qty);
		
		int re = -1;
		
		String code = "";
		re = dao.insertTicketing(t);
		System.out.println("�������̺��߰�:"+re);
		if(re==1) {//Ƽ�� insert�� �����ϸ� �¼� insert
			String[] seats = request.getParameter("seats").split(",");
			for(int i=0; i<seats.length ; i++) {
				re = -1;		
				if(a>0) {//�Ϲ� �ο�
					code = "A";
					a--;
				}
				else if(y>0) {//û�ҳ� �ο�
					code = "Y";
					y--;
				}
				else if(s>0) {//��� �ο�
					code = "S";
					s--;
				}				
				re = dao.insertSeats(t, seats[i], code);//�¼� ���̺� �Է�
				System.out.println("�¼����̺��߰�:"+re);
			}
		}
		switch (pay_method) {
		case "card": 
			pay_method = "�ſ�/üũī��";
			String card = request.getParameter("pay_card");
			String[] cardno = request.getParameterValues("cardno");
			String card_year = request.getParameter("validYear");
			String card_month = request.getParameter("validMonth");
			String care_pswd = request.getParameter("pswd");
			String card_birthDate = request.getParameter("card_birthDate");

			request.setAttribute("card", card);
			request.setAttribute("cardno", cardno);
			request.setAttribute("card_year", card_year);
			request.setAttribute("card_month", card_month);
			request.setAttribute("care_pswd", care_pswd);
			request.setAttribute("card_birthDate", card_birthDate);
			request.setAttribute("pay_method", "�ſ�/üũī��");
			break;
		case "phone": 
			pay_method = "�޴�������";
			request.setAttribute("pay_method", "�޴�������");			
			break;
		case "easy":
			pay_method = "�������";
			request.setAttribute("pay_method", "�������");			
			break;
		}
		int price = Integer.parseInt(request.getParameter("price"));
		request.setAttribute("price", price);
		
		//���� ���̺� �Է�
		re = dao.insertPaying(t, pay_method, price);
		System.out.println("�������̺��߰�:"+re);
		re = -1;
		
		HttpSession session = request.getSession(true);
		CustomerVo c = new CustomerVo();
		c.setName((String)(session.getAttribute("name")));
		c.setBirthdate((String)(session.getAttribute("birthdate")));
		c.setTicketing_pswd((String)(session.getAttribute("ticketing_password")));
		c.setPhone((String)(session.getAttribute("phone_number")));
		
		//�� ���̺� �Է�
		re = dao.insertCustomer(t, c);
		System.out.println("�����̺��߰�:" + re);

		
		String msg = re==1?"���� ���� �Է� ����":"���� ���� �Է� ����";
		request.setAttribute("t", t);
		request.setAttribute("msg", msg);
		return "ticketingCompleted.jsp";
	}

}
