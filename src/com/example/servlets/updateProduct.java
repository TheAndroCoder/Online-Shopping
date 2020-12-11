package com.example.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.beans.Product;
import com.example.utils.DBUtils;

/**
 * Servlet implementation class updateProduct
 */
@WebServlet("/updateProduct")
public class updateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateProduct() {
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
		DBUtils utils = DBUtils.getInstance();
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("pname");
		String desc = request.getParameter("desc");
		String price = request.getParameter("price");
		String discount = request.getParameter("disc");
		String ratingId = request.getParameter("ratingId");
		String reviewId = request.getParameter("reviewId");
		String features = request.getParameter("features");
		String imageUrl = request.getParameter("image");
		String category=request.getParameter("category");
		String brand=request.getParameter("brand");
		//DBUtils utils = DBUtils.getInstance();
		Product product = new Product(id,name,desc,price,discount,features,reviewId,ratingId,imageUrl,category,brand);
		utils.updateProduct(product);
		response.sendRedirect("adminproducts.jsp");
	}

}
