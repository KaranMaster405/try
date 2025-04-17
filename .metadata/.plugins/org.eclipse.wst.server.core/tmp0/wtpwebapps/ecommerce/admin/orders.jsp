<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.DAO.BookDAOImpl,com.entity.BookDtls,com.DB.DBConnect,java.util.List,com.DAO.*,com.DAO.CartDAO,com.entity.Cart,com.entity.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order</title>
<%@include file="allcss.jsp" %> 
<style>
table thead
{
color:white;
background-color:black;
}
</style>
</head>
<body>
<%@include file="allcss.jsp" %>
<c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
<h4 class="text-center">Hello Aman</h4>
<table class="table table-striped">
<thead>
<tr>
<th scope="col">Order ID</th>
<th scope="col"> Name</th>
<th scope="col">Email</th>
<th scope="col">Address</th>
<th scope="col">Phone no.</th>
<th scope="col">Book name</th>
<th scope="col">Author</th>
<th scope="col">price</th>
<th scope="col">Payment Type</th>



</tr>
</thead>
<tbody>

<%
BookOrderImpl dao=new BookOrderImpl(DBConnect.getconn());
List<Book_Order> blist=dao.getAllOrder();
for(Book_Order b:blist)
{%>
	<tr>
<th scope="row"><%=b.getOrderId()%></th>
<td><%=b.getUsername() %></td>
<td><%=b.getEmail() %></td>
<td><%=b.getFulladd() %></td>
<td><%=b.getPhno() %></td>
<td><%=b.getBookName() %></td>
<td><%=b.getAuthor() %></td>
<td><%=b.getPrice() %></td>
<td><%=b.getPaymentType()%></td>

</tr>
<%}
%>


</tbody>

</table>


</body>
</html>