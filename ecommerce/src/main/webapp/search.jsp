<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.DAO.BookDAOImpl,com.entity.BookDtls,com.DB.DBConnect,java.util.List,com.user.servlet.*,com.entity.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Searching</title>
<style>
*
{
top-padding:15px;
}
</style>
<%@include file="all_compound/allcss.jsp" %>

</head>

<body>
<div class="line">
<hr>

</div>
<%@include file="all_compound/navbar.jsp" %>
<%
User us=(User)session.getAttribute("userobj"); 

%>
<div class="container-fluid">
<h4>Recent Books</h4>
<div class="row item-inline">

<%
String ch=request.getParameter("ch");
BookDAOImpl dao2=new BookDAOImpl(DBConnect.getconn());
List<BookDtls>list2=dao2.getBookBySearch(ch);
for(BookDtls b:list2)
{%>
<a href="view_Books.jsp?bid=<%=b.getBook_Id()%>" style="text-decoration:none;color:black;">
<div class="row-md-3">
<div class="card ml-sm-4 ">
<div class="card-body text-center">
<img src="book/<%=b.getPhoto() %>" alt="book1" style="width:150px;height:230px" class="img-thumblin">
<p><%=b.getName() %></p>
<p><%=b.getAuthor() %></p>
<p>Categories:<%=b.getBookType()%></p>
<div class="row-center">
<%
if(us==null)
{%>
	<a href="login.jsp " class="btn btn-outline-success">Add To Card</a>
<%
}
else
{%>
	<a href="cart?bid=<%=b.getBook_Id()%>&uid=<%=us.getId()%>&stock<%=b.getStock() %>" class="btn btn-outline-success">Add To Card</a>
<%}

%>


<!--  <a href="signup.html " class="btn btn-success btn-sm"><%=b.getPrice()%><i class="fa-solid fa-indian-rupee-sign"></i></a>-->
</div>
</div>
</div>
</div>
	</a>
	<%
}
%>

</div>
</div>

</body>
</html>