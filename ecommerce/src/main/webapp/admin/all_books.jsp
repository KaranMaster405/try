<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.DAO.BookDAOImpl,com.entity.BookDtls,com.DB.DBConnect,java.util.List" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin all books</title>
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
<c:redirect url="../login2.jsp"/>
</c:if>

<body style="background-color:#f0f2f2">
<div class="header">
<%@include file="navbar.jsp" %>
</div>
<h4 class="text-center">Hello Aman</h4>

<c:if test="${not empty succMsg }">
		<p class="text-center text-success">${succMsg}</p>
		<c:remove var="succMsg" scope="session" />
</c:if>

<c:if test="${not empty faileMsg}">
		<p class="text-center text-danger">${faileMsg}</p>
		<c:remove var="faileMsg" scope="session" />
</c:if>


<table class="table table-striped">
<thead>
<tr>
<th scope="col">ID</th>
<th scope="col">Image</th>
<th scope="col">Book Name</th>
<th scope="col">Author</th>
<th scope="col">Price</th>
 <th scope="col">Quantity</th>
<th scope="col">Status</th>
<th scope="col">Action</th>



</tr>
</thead>

<tbody>
<%
BookDAOImpl dao=new BookDAOImpl(DBConnect.getconn());
List<BookDtls> list=dao.getAllBooks();
for(BookDtls b:list)
{
%>	
<tr>
<td><%=b.getBook_Id()%></td>
<td><img src="../book/<%=b.getPhoto()%>" style="width:90px;height:90px;"></td>
<td><%=b.getName()%></td>
<td><%=b.getAuthor() %></td>
<td><%=b.getPrice() %></td>
<td><%=b.getStock()%></td> 
<td><%=b.getStatus() %></td>
<td>
<a href="edit_books.jsp?id=<%=b.getBook_Id() %>" class="btn btn-sm btn-primary">Edit</a>
<a href="../delete?id=<%=b.getBook_Id() %>" class="btn btn-sm btn-danger">Delete</a></td>
</tr>
<%
}
%>

</tbody>

</table>

</body>
</html>