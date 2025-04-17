<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.DAO.BookDAOImpl,com.entity.BookDtls,com.DB.DBConnect,java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Old Book</title>
<%@include file="all_compound/allcss.jsp" %>
</head>

<body>
<div class="line">
<hr>

</div>
<%@include file="all_compound/navbar.jsp" %>
<h4>Old Books</h4>
<div class="row item-inline">

<%
BookDAOImpl dao3=new BookDAOImpl(DBConnect.getconn());
List<BookDtls>list3 =dao3.getOld();
for(BookDtls b:list3)
{%>
<a href="view_Books.jsp?bid=<%=b.getBook_Id()%>" style="text-decoration:none;color:black;">
<div class="card ml-sm-4 ">
<div class="card-body text-center">
<img src="book/<%=b.getPhoto() %>" alt="book1" style="width:20vh;height:30vh" class="img-thumblin">
<p><%=b.getName() %></p>
<p><%=b.getAuthor() %></p>
<div class="row">
<a href="login2.jsp " class="btn btn-danger  mr-sm-2 ">Add To Card</a>
<a href="signup.html " class="btn btn-success btn-sm"><%=b.getPrice() %><i class="fa-solid fa-indian-rupee-sign"></i></i></a>
</div>
</div>
</div>
	</a>
	<%
}
%>

</div>

</body>
</html>