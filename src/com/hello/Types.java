package com.hello;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Types extends HttpServlet{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		if(type.equals("products")) {
		    request.setAttribute("typecheck",1);
		}else if(type.equals("cart")) {
		    request.setAttribute("typecheck",2);			
		}else if(type.equals("trans")) {
		    request.setAttribute("typecheck",3);			
		}

     request.getRequestDispatcher("/index.jsp").forward(request, response);


		
	}
}
