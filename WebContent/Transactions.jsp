<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>   
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="st.css">
</head>
<body>
	<p>Transactions</p>
	<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/Cashiers"
         user = "root"  password = "1996"/>
         <sql:query var="rs" dataSource = "${snapshot}">
         	SELECT * FROM transactions        
         </sql:query>
         
         <table>
  			<tr>
    			<th>Product</th>
    			<th>quantity Sold</th>
    			<th>Total Price(Rs)</th>
  			</tr>
  			<c:forEach items="${rs.rows}" var="pro">
  				<tr>
         			<td><c:out value="${pro.name}"></c:out></td>
         			<td><c:out value="${pro.quantity}"></c:out></td>
         			<td><c:out value="${pro.total}"></c:out></td>
         		</tr>
        	</c:forEach>
 		</table>

</body>
</html>