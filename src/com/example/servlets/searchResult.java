package com.example.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.beans.Product;
import com.example.utils.DBUtils;

/**
 * Servlet implementation class searchResult
 */
@WebServlet("/search")
public class searchResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchResult() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		DBUtils utils = DBUtils.getInstance();
		String str = request.getParameter("str");
		ArrayList<Product> list = utils.getSearchResult(str);
		for(int i=0;i<list.size();i++) {
			out.println("<div class=\"search-result-row\" onclick=\"searchFor("+list.get(i).getProductId()+",'"+list.get(i).getCategory()+"')\">");
			out.println("<img src="+list.get(i).getImageUrl()+" width=\"50px\" height=\"50px\">");
			out.println("<label style=\"position:absolute;margin-left:10px;margin-top:10px\">"+list.get(i).getName()+"...</label>");
			//out.println("<hr>");
			out.println("</div>");
		}
		
	}

}
