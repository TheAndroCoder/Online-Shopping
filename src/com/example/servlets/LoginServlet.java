package com.example.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.example.utils.DBUtils;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String email=request.getParameter("email");
		String password = request.getParameter("password");
		String type=request.getParameter("type");
		DBUtils dbutils=DBUtils.getInstance();
		if(type.equals("login")) {
		if(dbutils.isRegisteredUser(email, password)) {
			HttpSession session =request.getSession();
			String first_name = dbutils.getUserName(email);
			int id = dbutils.getUserId(email);
			session.setAttribute("UserName",first_name);
			session.setAttribute("Email", email);
			session.setAttribute("id", id);
			System.out.println("name is "+first_name);
			response.sendRedirect("index.jsp");
			
			
		}else {
			out.println("<meta http-equiv='refresh' content='0;URL=index.jsp'>");
			out.println("<script>alert('Incorrect email/phone or password')</script>");
		}
		}else if(type.equals("signup")) {
			System.out.println("Trying to signup");
			if(dbutils.emailExists(email)) {
				out.println("<meta http-equiv='refresh' content='0;URL=index.jsp'>");
				out.println("<script>alert('Email Already Exists !!')</script>");
			}else {
				HttpSession session =request.getSession();
				session.setAttribute("UserName", email.substring(0, 10)+"...");
				session.setAttribute("Email", email);
				dbutils.registerUser(email, password);
				int id = DBUtils.getInstance().getUserId(email);
				session.setAttribute("id", id);
				response.sendRedirect("profile.jsp");
			}
		}
	}

}
