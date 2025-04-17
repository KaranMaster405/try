<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.DAO.BookDAOImpl,com.entity.BookDtls,com.DB.DBConnect,java.util.List,com.user.servlet.*,com.entity.User" %>
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

<c:if test="${empty userobj}">
<c:redirect url="login.jsp"></c:redirect>
</c:if>

<div class="container-fluid">

<h3 class="text-center">Hello,${userobj.name}</h3>



<div class="row p-5">

<div class="col-md-6 mt-3">
<div class="card">
<div class="card-body text-center">

<a href="sell_book.jsp">
<i class="fa-solid fa-book fa-2x"></i>
<h3>Sell Old books</h3>
</div>
</a>
</div>
</div>

<div class="col-md-6 mt-3">
<a href="edit_oldbook.jsp">
<div class="card">
<div class="card-body text-center">
<i class="fa-regular fa-pen-to-square fa-2x"></i>
<h3>Edit Old Book</h3>
</div>
</div>
</a>
</div>

<div class="col-md-6 mt-3">
<a href="edit_profile.jsp">
<div class="card">
<div class="card-body text-center">
<i class="fa-regular fa-pen-to-square fa-2x"></i>
<h3>Edit profile</h3>
</div>
</div>
</a>
</div>

<div class="col-md-6 mt-3">
<a href="order.jsp">
<div class="card">
<div class="card-body text-center">
<div class=text-warning>
<i class="fa-solid fa-box-open fa-2x"></i>

<h3>My order</h3>
</div>
</div>
</div>
</a>
</div>

<div class="col-md-6 mt-3">
<a href="helpline.jsp">
<div class="card">
<div class="card-body text-center">
<div class="text-danger">
<i class="fa-solid fa-handshake-angle fa-2x"></i>

<h3>Help center</h3>
</div>
</div>
</div>
</a>
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
        <a href="logout" type="button" class="btn btn-priamry">LogOut</a>
        </div>
      </div>
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>


<div class="col-md-6 mt-3">
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
</body>
</html>