<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.hello.Connector"%>
<%@ page import="java.sql.*"%>   
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="https://unpkg.com/bootstrap@4.3.1/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
  <a class="navbar-brand" href="#">Home</a>
  <ul class="navbar-nav">
    <li class="nav-item">
    <form method="post" action="types">
      <input type="hidden" value="products" name="type">
      <button type="submit" class="btn btn-dark">Products</button>    	
    </form>
    </li>
    <li class="nav-item">
    <form method="post" action="types">
      <input type="hidden" value="cart" name="type">
      <button type="submit" class="btn btn-dark">Cart</button>    	
    </form>
    </li>
    <li class="nav-item">
    <form method="post" action="types">
      <input type="hidden" value="trans" name="type">
      <button type="submit" class="btn btn-dark">Transactions</button>    	
    </form>
    </li>
  </ul>
  
    <button type="button" class="btn btn-danger" style="position:absolute; left:93%;">SignOut</button>
</nav>
      <c:if test = "${typecheck == 1}">
 <iframe src="products.jsp" width="100%" height="91.5%" style="position:absolute; left: 0; right: 0; bottom: 0; top: 1; "></iframe> 

      </c:if>
      
      <c:choose>
         
         <c:when test = "${typecheck == 1}">
 <iframe src="products.jsp" width="100%" height="91.5%" style="position:absolute; left: 0; right: 0; bottom: 0; top: 1; "></iframe> 
         </c:when>
         
         <c:when test = "${typecheck == 2}">
 <iframe src="cart.jsp" width="100%" height="91.5%" style="position:absolute; left: 0; right: 0; bottom: 0; top: 1; "></iframe> 
         </c:when>
         
         <c:when test = "${typecheck == 3}">
 <iframe src="Transactions.jsp" width="100%" height="91.5%" style="position:absolute; left: 0; right: 0; bottom: 0; top: 1; "></iframe> 
         </c:when>
         
         <c:otherwise>
 <iframe src="products.jsp" width="100%" height="91.5%" style="position:absolute; left: 0; right: 0; bottom: 0; top: 1; "></iframe> 
         </c:otherwise>
      </c:choose>


</body>
</html>