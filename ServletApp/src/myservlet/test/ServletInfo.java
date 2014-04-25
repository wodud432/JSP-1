package myservlet.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletInfo extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		PrintWriter out = resp.getWriter();
		out.println("<html><body>");
		out.println("method : " + req.getMethod() + "<br/>");
		out.println("Request URI : " + req.getRequestURI() + "<br/>");
		out.println("Protocol : " + req.getProtocol() + "<br/>");
		out.println("Path Info : " + req.getPathInfo() + "<br/>");
		out.println("Remote Addr : " + req.getRemoteAddr() + "<br/>");
		out.println("Context Path : " + req.getContextPath() + "<br/>");
		out.println("Servlet Context : " + req.getServletContext() + "<br/>");
		out.println("Servlet Path : " + req.getServletPath() + "<br/>");
		out.println("<hr/>");
		
		Enumeration en = req.getHeaderNames();
		while(en.hasMoreElements()){
			//out.println("<li>" + en.nextElement() + "</li>");
			String name = (String)en.nextElement();
			String value = req.getHeader(name);
			out.println("<li>" + name + ":" + value + "</li>");
		}
		out.close();
	}
}

