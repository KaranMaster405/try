<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.DAO.BookDAOImpl,com.entity.BookDtls,com.DB.DBConnect,java.util.List,com.DAO.*,com.DAO.CartDAO,com.entity.*" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       <%@page isELIgnored="false" %>
      
       
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_compound/allcss.jsp" %>
<style>
.{
	height:50vh;
	width:100%;
	
}
 
.container-fluid
{

justify-content: center;
align-items: center;

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

<%@include file="all_compound/navbar.jsp" %>
<c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>

<c:if test="${not empty succMsg}">
<div class="alert alert-success" role="alert">
  ${succMsg}
</div>
<c:remove var="succMsg" scope="session"/>

</c:if>

<c:if test="${not empty failedMsg}">
<div class="alert alert-danger text-center" role="alert">
 ${failedMsg}
</div>
<c:remove var="failedMsg" scope="session"/>

</c:if>

<div class="center">
<div class="container-fluid ">
<div class="col p-2">

<div class="col-md-9">   <!--   col md change karne par background white apni full spav=ce -->
<div class="card">
<div class="card-body">



<div class="col">

<div class="card bg-white">
<h3 class="text-center text-danger">Your Selected items</h3>
<div class="card-body">
<table class="table">
  <thead>
    <tr>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
       <th scope="col">Quantity</th>
      <th scope="col">Price</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  
  <%
  User u=(User)session.getAttribute("userobj");
  
  BookOrderImpl b=new BookOrderImpl(DBConnect.getconn());
  CartDAOImpl dao=new CartDAOImpl(DBConnect.getconn());
  List<Cart> cart= dao.getBookByUser(u.getId());
  Double totalPrice=0.00;
  for(Cart c :cart)
 
  {
   totalPrice=c.getTotalPrice();%>
   <tr>
      <th scope="row"><%=c.getBookName()%></th>
      
      <td><%=c.getAuthor()%></td>
      <td>
     
						<form action="ordernow" method="post" class="form-inline">
						<input type="hidden" name="id" value="<%=c.getBid()%>" class="form-input">
							<div class="form-group d-flex justify-content-between">
								<a class="btn bnt-sm btn-incre" href="quantity-in-cdec?action=inc&id=<%=c.getBid()%>"><i class="fas fa-plus-square"></i></a> 
								<input type="text" name="quantity" class="form-control"  value="<%=c.getNOB()%>" readonly> 
								<a class="btn btn-sm btn-decre" href="quantity-in-cdec?action=dec&id=<%=c.getBid()%>"><i class="fas fa-minus-square"></i></a>
							</div>
							<button type="submit" class="btn btn-primary btn-sm">Buy</button>
						</form>
					</td><td><%=c.getPrice()%></td>
      <td>
<a href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUid()%>&&cid=<%=c.getCid()%>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i></a>
</td>
    </tr>
  <%}
  
  %>

<tr>
<td>Total Price</td>
<td></td>
<td></td>
<td><%=totalPrice %></td>
</tr>



      </tbody>
</table>
</div>

</div>
</div>
</div></div></div></div></div></div>

</body>
</html>