package com.hello;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

public class Update extends HttpServlet{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String price = request.getParameter("price");
		String quantity = request.getParameter("quant");
		String name = request.getParameter("name");
		String amount = request.getParameter("amount");
		int totalPrice = Integer.parseInt(price) * Integer.parseInt(amount);
		int remainingStock = Integer.parseInt(quantity) - Integer.parseInt(amount);
				
		Connector conn = new Connector();
		Connection connection = conn.getConnection();
		String sql = "INSERT INTO cart(id,name,unitPrice,quantity,total,InittialCount) Values(?,?,?,?,?,?)";
		String sqlup = "UPDATE products SET quantity=? WHERE id=?";
//		
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setInt(1,Integer.parseInt(id));
			st.setString(2,name);
			st.setInt(3,Integer.parseInt(price));
			st.setInt(4,Integer.parseInt(amount));
			st.setInt(5,totalPrice);
			st.setInt(6,Integer.parseInt(quantity));
			st.execute();
			

			PreparedStatement st2 = connection.prepareStatement(sqlup);
			st2.setInt(1,remainingStock);
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

     request.getRequestDispatcher("/products.jsp").forward(request, response);


		
	}
}
