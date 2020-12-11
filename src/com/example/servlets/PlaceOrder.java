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
 * Servlet implementation class PlaceOrder
 */
@WebServlet("/order")
public class PlaceOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceOrder() {
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
		PrintWriter out = response.getWriter();
		String address = request.getParameter("addr");
		String uid = request.getParameter("uid");
		String pid_csv = request.getParameter("pids");
		String[] pids = pid_csv.split(",");
		Date order_date=new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("MMM dd, yyyy");
		Date delivery_date =new Date();
		delivery_date.setDate(order_date.getDate()+7);
		DBUtils utils=DBUtils.getInstance();
		for(String pid : pids) {
			utils.placeOrder(Integer.parseInt(pid), Integer.parseInt(uid), sdf.format(order_date), sdf.format(delivery_date),address);
		}
	}

}
