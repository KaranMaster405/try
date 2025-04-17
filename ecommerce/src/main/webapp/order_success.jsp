<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
a
{
text-decoration:none;
text-color:black;
}
a
{
text-decoration:none;
color:balck;

}
a:hover
{
text-decoration:none;
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

<div class="container text-center mt-3">
<i class="fas fa-check-circle fa-5x text-success">
<h3>Thank you</h3>
<h5>Your Order Successfully will be delivered in your address</h5>
<a href="index.jsp" class="btn btn-danger mt-3">Home</a>
<a href="order.jsp" class="btn btn-danger mt-3">View Order</a>

</i>
</div>

</body>
</html>