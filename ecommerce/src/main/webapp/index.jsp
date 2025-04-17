<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1" import="com.DAO.BookDAOImpl,
com.entity.BookDtls,
com.DB.DBConnect,
java.util.List,
com.user.servlet.*,
com.entity.User" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <%@page isELIgnored="false" %>
<html>

<head>
<title>
ebook 
</title>
<link rel="stylesheet" href="style.css">
<style>
.{
	height:50vh;
	width:100%;
}

.scroll-container {
    display: flex;
    align-items: center;
    position: relative;
overflow-x: auto; /* Enables horizontal scrolling */
    -ms-overflow-style: none; /* Hides scrollbar in Internet Explorer and Edge */
    scrollbar-width: none;
    
    }
.scroll-container::-webkit-scrollbar {
    display: none; 
}
.ho {
    display: flex;
    overflow-x: auto;
    scroll-behavior: smooth; /* Enables smooth scrolling */
    width: 100%; /* Adjust based on your layout */
   overflow-x: auto; /* Enables horizontal scrolling */
    -ms-overflow-style: none; /* Hides scrollbar in Internet Explorer and Edge */
    scrollbar-width: none;
}

.scroll-button {
    background-color: #f1f1f1;
    border: none;
    padding: 10px;
    cursor: pointer;
    position: absolute;
    z-index: 1;
}

.scroll-button.left {
    left: 0;
}

.scroll-button.right {
    right: 0;
}


.card-body img
{
border-radius:9px;
}
.lang
{
 display: flex;
    flex-wrap: nowrap; /* Prevents wrapping to keep items in a single line */
    gap: 20px;
    overflow-x: auto; /* Enables horizontal scrolling */
    -ms-overflow-style: none; /* Hides scrollbar in Internet Explorer and Edge */
    scrollbar-width: none;
}
a
{
text-decoration:none;
text-color:black;
}
</style>
</head>
<body style="background-color:#f0f1f2;">
<section class="container-fluid">
<div class="top">
<hr>
</div>
</section>

<%
User us=(User)session.getAttribute("userobj"); 

%>

<%@include file="all_compound/allcss.jsp" %>
<%@include file="all_compound/navbar.jsp" %>


<div id="carouselExampleIndicators" class="carousel slide container-fluid" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100 h-50" src="book/All.png" alt="First slide">
      <div class="carousel-caption d-none d-md-block">
    <h3 class="text-center">Hello,${userobj.name}</h3>
    <p>kaise o app</p>
  </div>
    </div>
    <div class="carousel-item">
      <img class="d-block w-100 h-50" src="book/all2.jpg" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100 h-50" src="book/all3.png" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<hr>


<hr>

<div class="scroll-container">
  <button class="scroll-button left" onclick="scrollright1()">&#8249;</button>
  <div class="ho" id="scrollable-container">
<%

BookDAOImpl dao2=new BookDAOImpl(DBConnect.getconn());
List<BookDtls>list=dao2.getNewBook();
for(BookDtls b:list)
{%>
<a href="view_Books.jsp?bid=<%=b.getBook_Id()%>&stock=<%=b.getStock()%>" style="text-decoration:none;color:black;">
<div class="row-md-3 mt-2">
<div class="card ml-2">
<div class="card-body text-center">
<img src="book/<%=b.getPhoto() %>" alt="book1" style="width:20vh;height:30vh" class="img-thumblin">
<p><b><%=b.getName() %></b></p>
<p>Author:<%=b.getAuthor() %></p>
<p>Price:<%=b.getPrice() %><i class="fa-solid fa-indian-rupee-sign"></i></p>
<!--  <p>Categories:<%=b.getBookType()%></p>-->
<div class="row-center">
<%
if (us == null) {
%>
    <a href="login.jsp" class="btn btn-outline-success">Add To Cart</a>
<%
} else {
    if (b.getStock() > 0) {
%>
        <a href="cart?bid=<%=b.getBook_Id()%>&uid=<%=us.getId()%>&stock=<%=b.getStock()%>" 
           class="btn btn-outline-success">Add To Cart</a>
<%
    } else {
%>
        <button class="btn btn-outline-secondary" disabled>Out of Stock</button>
<%
    }
}
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
   <button class="scroll-button right" onclick="scrollRight1()">&#8250;</button>
</div>



<div class="text-center mt-1">
<a href="all_recent.jsp" class="btn btn-outline-danger btn-sm text-white">View all</a>
</div>


<hr>
<!-- --------------------------------------------------------------------------------------------------------------- -->

<div class="scroll-container">
  <button class="scroll-button left" onclick="scrollright2()">&#8249;</button>
  <div class="ho" id="scrollable-container2">
<%

BookDAOImpl dao3=new BookDAOImpl(DBConnect.getconn());
List<BookDtls>list2=dao2.getOld();
for(BookDtls b:list2)
{%>
<a href="view_Books.jsp?bid=<%=b.getBook_Id()%>&&stock=<%=b.getStock()%>" style="text-decoration:none;color:black;">
<div class="row-md-3 mt-2">
<div class="card ml-2">
<div class="card-body text-center">
<img src="book/<%=b.getPhoto() %>" alt="book1" style="width:20vh;height:30vh" class="img-thumblin">
<p><b><%=b.getName() %></b></p>
<p>Author:<%=b.getAuthor() %></p>
<p>Price:<%=b.getPrice() %><i class="fa-solid fa-indian-rupee-sign"></i></p>
  <p>Categories:<%=b.getStock() %></p>
<div class="row-center">
<%
if (us == null) {
%>
    <a href="login.jsp" class="btn btn-outline-success">Add To Cart</a>
<%
} else {
    if (b.getStock() > 0) {
%>
        <a href="cart?bid=<%=b.getBook_Id()%>&uid=<%=us.getId()%>&stock=<%=b.getStock()%>" 
           class="btn btn-outline-success">Add To Cart</a>
<%
    } else {
%>
        <button class="btn btn-outline-secondary" disabled>Out of Stock</button>
<%
    }
}
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
   <button class="scroll-button right" onclick="scrollRight2()">&#8250;</button>
</div>

<div class="text-center mt-1">
<a href="all_recent.jsp" class="btn btn-outline-danger btn-sm text-white">View all</a>
</div>

<div class="container-fluid pt-4">
 <div class="footer" style="boarder-radius:10px"></div>
 <%@include file="all_compound/footer.jsp" %>
 </div>

 <script>
        function scrollContainer(distance) {
            const container = document.querySelector('.book-container');
            container.scrollBy({
                left: distance,
                behavior: 'smooth'
            });
        }

        function changeQuantity(button, change) {
            const input = button.parentElement.querySelector('input');
            let currentValue = parseInt(input.value);
            currentValue += change;
            if (currentValue < 1) currentValue = 1;
            input.value = currentValue;
        }
        
        function scrollright1() {
        	
            const container = document.getElementById('scrollable-container');
            container.scrollLeft -= 100; // Adjust the value as needed
        }

        function scrollRight1() {
            const container = document.getElementById('scrollable-container');
            container.scrollLeft += 100; // Adjust the value as needed
        }
        
  function scrollright2() {
        	
            const container = document.getElementById('scrollable-container2');
            container.scrollLeft -= 100; // Adjust the value as needed
        }

        function scrollRight2() {
            const container = document.getElementById('scrollable-container2');
            container.scrollLeft += 100; // Adjust the value as needed
        }
        
    </script>
 
</body>
</html>
