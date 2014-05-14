package mvc.exam1;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DepartServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String param = req.getParameter("depart");
		
		ArrayList advice = new DepartAdvice().getAdvice(param);
		
		req.setAttribute("advice", advice);
		RequestDispatcher view = 
				req.getRequestDispatcher("/WEB-INF/views/result.jsp");
		view.forward(req, resp);		
	}
}
