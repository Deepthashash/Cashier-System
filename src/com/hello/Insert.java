package com.hello;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

public class Insert extends HttpServlet{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				
		Connector conn = new Connector();
		Connection connection = conn.getConnection();
		String sql = "INSERT INTO Transactions(name,quantity,total) Select name,quantity,total FROM cart";
		String sqlup = "DELETE FROM cart;";
//		
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.execute();
			

			PreparedStatement st2 = connection.prepareStatement(sqlup);
			st2.execute();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		if(type.equals("products")) {
//		    request.setAttribute("typecheck",1);
//		}else if(type.equals("cart")) {
//		    request.setAttribute("typecheck",2);			
//		}

     request.getRequestDispatcher("/products.jsp").forward(request, response);


		
	}
}
