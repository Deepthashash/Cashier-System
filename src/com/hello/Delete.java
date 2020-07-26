
package com.hello;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

public class Delete extends HttpServlet{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String cid = request.getParameter("cid");
		String count = request.getParameter("count");
				
		Connector conn = new Connector();
		Connection connection = conn.getConnection();
		String sql = "DELETE FROM cart WHERE cid=?";
		String sqlup = "UPDATE products SET quantity=? WHERE id=?";
//		
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setInt(1,Integer.parseInt(cid));
			st.execute();
			

			PreparedStatement st2 = connection.prepareStatement(sqlup);
			st2.setInt(1,Integer.parseInt(count));
			st2.setInt(2,Integer.parseInt(id));
			st2.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		if(type.equals("products")) {
//		    request.setAttribute("typecheck",1);
//		}else if(type.equals("cart")) {
//		    request.setAttribute("typecheck",2);			
//		}

     request.getRequestDispatcher("/cart.jsp").forward(request, response);


		
	}
}
