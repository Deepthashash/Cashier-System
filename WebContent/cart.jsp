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
	<p>Bill</p>
	<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/Cashiers"
         user = "root"  password = "1996"/>
         <sql:query var="rs" dataSource = "${snapshot}">
         	SELECT * FROM cart        
         </sql:query>
         
        	<c:set var="total" value="${0}"/>
 		<c:forEach items="${rs.rows}" var="pro">
 			 <c:set var="total" value="${total + pro.total}" />
 		</c:forEach>
         <table>
  			<tr>
    			<th>Product</th>
    			<th>Price</th>
    			<th>Quantity</th>
    			<th>Price(Rs.)</th>
    			<th>Action</th>
  			</tr>
  			<c:forEach items="${rs.rows}" var="pro">
  				<tr>
  				<form action="delete" method="post">
         			<td><c:out value="${pro.name}"></c:out></td>
         			<td><c:out value="${pro.unitPrice}"></c:out></td>
         			<td><c:out value="${pro.quantity}"></c:out></td>
         			<td><c:out value="${pro.total}"></c:out></td>
         			<input type="hidden" name="id" value="${pro.id}">
         			<input type="hidden" name="cid" value="${pro.cid}">
         			<input type="hidden" name="count" value="${pro.InittialCount}">
         			<td><input type="submit" name="submit" value="Delete"></td>
         		</form>
         		</tr>         		
        	</c:forEach> 		
         		<tr>
         			<th colspan="4">Total </th>
         			<th><c:out value="${total}"></c:out> </th>
         		</tr>
         		<tr>
         			<form action="insert" method="post">
         				<th colspan="5"><input type="submit" value="Generate Bill"></th>
         			</form>
         		</tr>
 		</table>
 		
</body>
</html>