<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       <%@page isELIgnored="false" %>
     
    <html>
    <head>
  
    <style>
    *{
    top-padding:100px;
    top-margin:100px;
    }
    .heart
    {
    text-align:right;
    color:black;
    }
    .search-input  {
    font-family: "Font Awesome 6 Free";
    
}
  

    </style>
    </head>
   

<div class="container-fluid">

<div class="row">
<div class="col-md-4">

<div class="header"><h3>Shree Ganesh</h3></div>
</div>
<div class="row-md-5">
<form class="form-inline my-4 my-lg-0">
      <input class="form-control search-input" placeholder="&#xf002" aria-label="Search">

    </form>
</div>

<!-- <div class="corner">
<div class="row mx-5">
 <a href="../checkout.jsp"><i class="fa-regular fa-heart fa-2x ml-5 m-1"></i>
</a>
   
 <c:if test="${not empty userobj}"> 
 <div class="col-md-my-2">
<a href="login.jsp " class="btn btn-light ">${userobj.name}</a>
<a href="../logout" class="btn btn-light">LogOut</a>
</div>
</c:if>

<c:if test="${empty userobj}">
<div class="col-md-my-2">
<a href="login.jsp " class="btn btn-light">Login</a>
<a href=" signup.html" class="btn btn-light">SignUp</a>
</div>
</c:if>
</div>
</div>-->
</div>
</div>

<nav class="navbar navbar-expand-lg navbar-light bg-light">

  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="../index.jsp"> UserHome <span class="sr-only">(current)</span></a>
      </li>
       <li class="nav-item active">
        <a class="nav-link" href="home.jsp">Home</a>
      </li>
        <!--<li class="nav-item active">
        <a class="nav-link disabled" href="all_new.jsp">New Books</a>
      </li>
      
      <li class="nav-item active">
        <a class="nav-link disabled" href="all_old.jsp">Old Books</a>
      </li>
      
      <li class="nav-item dropdown active">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Sorts
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Comic</a>
          <a class="dropdown-item" href="#">Programming</a>
          <a class="dropdown-item" href="#">Science friction</a>
         
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
     -->
    </ul>
     <div class="row-md-3">
<form class="form-inline my-2 my-lg-2">
          <c:if test="${not empty userobj}">  <!-- User Present -->
   <div class="col-md-my-2">
<a href="" class="btn btn-outline-secondary">${userobj.name}<i class="fa-regular fa-circle-user"></i></a>
<!--<a href="setting.jsp" class="btn btn-outline-secondary">${userobj.name}</a>
  <a href="../logout" class="btn btn-outline-secondary">LogOut</a>-->
</div>
</c:if>

<c:if test="${empty userobj}">
 <div class="col-md-my-2">
<a href="" class="btn btn-outline-secondary">Login</a>
<!--  <a href="logout" class="btn btn-light">LogOut</a>-->
</div>
</c:if>
 </form>
</div>
</div>
   
  
</nav>
 </html>