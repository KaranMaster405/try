<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import="com.DAO.BookDAOImpl,com.entity.BookDtls,com.DB.DBConnect,java.util.List,com.user.servlet.*,com.entity.User"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Old Books</title>
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
 .card-body a
{
text-decoration:none;
text-color:black;
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

<c:if test="${ not empty userobj}">
<div class="alert alert-success">
${succMsg}
</div>

<c:remove var="succMsg" scope="session" />
</c:if>

<div class="container">

<h3 class="text-center">Hello,${userobj.name}</h3>

<table class="table mt-3 text-center">
  <thead class="thead-dark ">
  
    <tr>
      
   <th scope="col">Book</th>
      <th scope="col">Author</th>
       <th scope="col">Price</th>
       <th scope="col">Category</th>
         <th scope="col">Quantity</th>
        <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  
  <%
  User u=(User)session.getAttribute("userobj");
  String email=u.getEmail();
  BookDAOImpl dao=new BookDAOImpl(DBConnect.getconn());
  List<BookDtls> list=dao.getBookByOld(email,"Old");
  for(BookDtls b:list)
  {%>
  
   <tr>
    
      <td><%=b.getName()%></td>
      <td><%=b.getAuthor() %></td>
      <td><%=b.getPrice() %></td>
       <td><%=b.getBookType() %></td>
        <td><%=b.getStock()%></td>
       <td><a href="delete_old_book?em=<%=email%>&&id=<%=b.getBook_Id() %>" type="button"class="btn btn-light">Delete</a></td>
          </tr>
  
  <%} 
  
  %>
  
   
    
   
  </tbody>
</table>
</div>


</body>
</html>