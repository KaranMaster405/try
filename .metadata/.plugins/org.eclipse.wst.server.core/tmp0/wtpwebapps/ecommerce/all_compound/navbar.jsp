<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       <%@page isELIgnored="false" %>
     
    <html>
    <head>

    <style>
   
    *  {
    font-family: "Comic Sans MS";
    }
   
    </style>
    </head>
   
<body>


<div class="container-fluid">

<div class="row">
<div class="row-md-4">

 <div class="header"><h3><img src="book/ganesha_7443644.png" style="width:40px;height:45px">Shree Ganesh</h3></div>
</div>
<div class="input-group ml-5 m-2 text-center">
  <form action="search.jsp" method="post" style="width:80vw;">
  <input type="text" class="form-control " placeholder="Seach here..." name="ch" aria-label="Username" aria-describedby="basic-addon1">
</form>
<div class="input-group-prepend ml-2">
    <span class="input-group-text" id="basic-addon1">
        <a href="checkout.jsp">
            <i class="fa-solid fa-cart-shopping" style="color:black"></i>
            <c:if test="${not empty sessionScope.cart}">
                <span class="badge badge-danger">${sessionScope.cart.size()}</span>
            </c:if>
        </a>
    </span>
</div>
</div>


<div class="corner">
<div class="row mx-5">
<!-- <a href="checkout.jsp"><i class="fa-regular fa-black fa-heart ml-5 m-1 fa-2x" style="color:black"></i></a>
 -->
   
 <c:if test="${not empty userobj}">   <!-- User Present -->
 <div class="col-md-my-2">
<!-- <a href="login.jsp " class="btn btn-light">${userobj.name}</a> 
<a href="logout" class="btn btn-light">LogOut</a>-->
</div>
</c:if>

<c:if test="${empty userobj}">
<div class="col-md-my-2">
<!--<a href="login.jsp " class="btn btn-outline-secondary">Login</a>
   <a href=" signup.html"><i class="fa-regular fa-user fa-2x"></i></a> -->                                

</div>
</c:if>
</div>
</div>
</div>
</div>

<nav class="navbar navbar-expand-lg navbar-light bg-light">

  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
    
   
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="all_comic.jsp">Comic</a>
      </li>
       <li class="nav-item active">
        <a class="nav-link disabled" href="all_horror.jsp">Horror</a>
      </li>
      
      <li class="nav-item active">
        <a class="nav-link disabled" href="all_prog.jsp">Programming</a>
      </li>
      
      <li class="nav-item dropdown active">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Sorts
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="all_recent.jsp">Recent</a>
          <a class="dropdown-item" href="all_new.jsp">New</a>
          <a class="dropdown-item" href="all_old">Old</a>
         
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
     
    </ul>
     <div class="row-md-3">
<form class="form-inline my-2 my-lg-2">
          <c:if test="${not empty userobj}">  <!-- User Present -->
   <div class="col-md-my-2">
<a href="setting.jsp" class="btn btn-outline-secondary">${userobj.name}<i class="fa-regular fa-circle-user"></i></a>
<!--<a href="setting.jsp" class="btn btn-outline-secondary">${userobj.name}</a>
  <a href="logout" class="btn btn-light">LogOut</a>-->
</div>
</c:if>

<c:if test="${empty userobj}">
 <div class="col-md-my-2">
<a href="setting.jsp " class="btn btn-outline-secondary">Login</a>
<!--  <a href="logout" class="btn btn-light">LogOut</a>-->
</div>
</c:if>
 </form>
</div>
</div>
   
  
</nav>

