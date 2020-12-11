package com.example.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.utils.DBUtils;

/**
 * Servlet implementation class InsertReview
 */
@WebServlet("/review")
public class InsertReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReview() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");
		PrintWriter out= response.getWriter();
		DBUtils utils = DBUtils.getInstance();
		String review = request.getParameter("rev");
		String pid=request.getParameter("pid");
		String uid = request.getParameter("uid");
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("MMM dd, yyyy");
		utils.insertReview( review, sdf.format(date), Integer.parseInt(pid), Integer.parseInt(uid));
	}

}
