<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1" import="com.DAO.BookDAOImpl,com.entity.BookDtls,com.DB.DBConnect,java.util.List,com.DAO.*,com.DAO.CartDAO,com.entity.Cart,com.entity.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<style>
.{
	height:50vh;
	width:100%;
}
.card-body img
{
border-radius:9px;
}
a
{
text-decoration:none;
text-color:black;
}
a
{
text-decoration:none;
color:balck;

}
a:hover
{
text-decoration:none;
}
</style>
</head>
<body style="background-color:#f0f1f2;">
<section class="first">
<div class="top">
<ul>
<li>
<h6>Find store</h6></li>
<li><h6>|</h6></li>
<li><h6>91+8879482453</h6></li>
</ul>
</div>
</section>
<%@include file="all_compound/allcss.jsp" %>
<%@include file="all_compound/navbar.jsp" %>

<c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>

<h3 class="text-center thread-primary mt-3">Your Order</h3>
<table class="table text-center mt-3">
  <thead class="thead-dark">
  
    <tr>
      <th scope="col">Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Book</th>
      <th scope="col">Author</th>
       <th scope="col">Quantity</th>
       <th scope="col">Price</th>
        <th scope="col">Payment Type</th>
    </tr>
  </thead>
  <tbody>
  
  <%
  User u=(User)session.getAttribute("userobj");
  BookOrderImpl dao=new BookOrderImpl(DBConnect.getconn());
  List<Book_Order> blist=dao.getBook(u.getEmail());
  for(Book_Order b:blist)
  {%>
	   <tr>
      <th scope="row"><%=b.getOrderId()%></th>
      <td><%=b.getUsername()%></td>
      <td><%=b.getBookName()%></td>
      <td><%=b.getAuthor() %></td>
      <td><%=b.getNOB() %></td>
       <td><%=b.getPrice() %></td>
        <td><%=b.getPaymentType()%></td>
         
    </tr>
  <%}
  
  %>
  
   
    
   
  </tbody>
</table>

</body>
</html>