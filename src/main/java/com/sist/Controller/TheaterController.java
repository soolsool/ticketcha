package com.sist.Controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.Action.TheaterActions;

/**
 * Servlet implementation class TheaterController
 */
@WebServlet("*.do")
public class TheaterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    HashMap<String, TheaterActions> map;   
    public TheaterController() {
        super();
    }
    
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		map = new HashMap<String, TheaterActions>();
		try {
			String path = config.getServletContext().getRealPath("WEB-INF");
			FileReader reader = new FileReader(path+"/"+"Theaterproperties.properties");
			Properties prop = new Properties();
			prop.load(reader);
			Iterator keylist = prop.keySet().iterator();
			while(keylist.hasNext()) {
				String key= (String)keylist.next();
				String classname = prop.getProperty(key);
				TheaterActions act = (TheaterActions)Class.forName(classname).newInstance();
				map.put(key, act);
			}
		}catch (Exception e) {
			System.out.printf("예외발생: %s%n", e.getMessage());
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		serviceRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		serviceRequest(request, response);
	}
	
	private void serviceRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String cmd = uri.substring(uri.lastIndexOf("/")+1);
		System.out.println(cmd);
		String viewPage = "";
		TheaterActions action = map.get(cmd);
		System.out.println("[" + action + "]");
		viewPage = action.serviceRequest(request,response);
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
