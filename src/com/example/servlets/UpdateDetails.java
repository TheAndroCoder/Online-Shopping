package com.example.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.utils.DBUtils;


@WebServlet("/updateDetails")
public class UpdateDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UpdateDetails() {
        super();
    }

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
		PrintWriter pw=resp.getWriter();
		resp.setContentType("text/html");
		System.out.println("Email changing trying");
		String type=req.getParameter("type");
		System.out.println(type);
		if(type.equals("personal")) {
			String first_name=req.getParameter("first");
			String last_name=req.getParameter("last");
			String gender=req.getParameter("gender");
			DBUtils utils=DBUtils.getInstance();
			utils.updateNameAndGender(req.getSession().getAttribute("Email").toString(), first_name, last_name, gender);
			pw.println("done");
		}else if(type.equals("email")) {
			String email=req.getParameter("email");
			DBUtils utils=DBUtils.getInstance();
			
			int n=utils.updateEmail(req.getSession().getAttribute("Email").toString(), email);
			
			if(n==0) {
				pw.print("exists");
			}else {
				req.getSession().setAttribute("Email", email);
			}
		}else if(type.equals("phone")) {
			String phone=req.getParameter("phone");
			DBUtils utils=DBUtils.getInstance();
			int n=utils.updatePhone(phone, req.getSession().getAttribute("Email").toString());
		}
		
	}

}
