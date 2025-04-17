<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>admin home</title>
<%@include file="allcss.jsp" %>

<style type="text/css">

a{
text-decoration:none;

}
a:hover
{
  text-decoration:none;
   text-size: 10vh;
        
        }

</style>

</head>

<%@include file="navbar.jsp" %>
<c:if test="${empty userobj }">
<c:redirect url="../login.jsp"/>
</c:if>



<div class="container">
<div class="row">
<div class="col-md-3 my-4 ">

<a href="add_book.jsp">
<div class="card ">
<div class="card-body text-center">
<i class="fa-regular fa-square-plus fa-3x"></i><br>
<h4>Add New Book</h4>
</div>
</div>
</a>
</div>

<div class="col-md-3 my-4">
<a href="all_books.jsp">
<div class="card">
<div class="card-body text-center">
<i class="fas fa-book-open fa-3x"></i><br>
<h4>All New Book</h4>
</div>
</div>
</a>
</div>


<div class="col-md-3 my-4">
<a href="orders.jsp">
<div class="card">
<div class="card-body text-center">
<i class="fas fa-box-open fa-3x"></i><br>
<h4>Order</h4>
</div>
</div>
</a>
</div>


<div class="col-md-3 my-4">
<a data-toggle="modal" data-target="#exampleModalCenter" href="#">
<div class="card">
<div class="card-body text-center text-primary">
<i class="fas fa-sign-out-alt fa-3x"></i><br>
<h4>LogOut</h4>
</div>
</div>
</a>
</div>

</div>
</div>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
       
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="text-center">
        <h4>Do you want to logout</h4>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a href="../logout" type="button" class="btn btn-priamry">LogOut</a>
        </div>
      </div>
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>
</body>
</html>