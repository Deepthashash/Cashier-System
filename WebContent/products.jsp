<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="st.css">
</head>
<body>
	<p>Products</p>
	<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/Cashiers"
         user = "root"  password = "1996"/>
         <sql:query var="rs" dataSource = "${snapshot}">
         	SELECT * FROM products        
         </sql:query>
         
         <table>
  			<tr>
    			<th>Product</th>
    			<th>Price(Rs)</th>
    			<th>Stock Available</th>
    			<th>Quantity</th>
    			<th>Add</th>
  			</tr>
  			<c:forEach items="${rs.rows}" var="pro">
  				<tr>
  				<form action="update" method="post">
         			<td><c:out value="${pro.name}"></c:out></td>
         			<td><c:out value="${pro.price}"></c:out></td>
         			<td><c:out value="${pro.quantity}"></c:out></td>
         			<td><input type="text" name="amount"></td>
         			<input type="hidden" name="id" value="${pro.id}">
         			<input type="hidden" name="quant" value="${pro.quantity}">
         			<input type="hidden" name="price" value="${pro.price}">
         			<input type="hidden" name="name" value="${pro.name}">
         			<td><input type="submit" name="submit" value="Add"></td>
         		</form>
         		</tr>
        	</c:forEach>
 		</table>
</body>
</html>