<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
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


  .form-container {
  
  text-align:center;
                background: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 300px;
            }
             h2 {
                margin-top: 0;
            }
            
            .form-group {
                margin-bottom: 15px;
            }
            
            label {
                display: block;
                margin-bottom: 5px;
            }
            
            input[type="text"], input[type="password"], input[type="Email"],input[type="number"] {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                box-sizing: border-box;
            }
            
            .form-container button {
                background-color: #007bff;
                color: white;
                border: none;
                padding: 10px;
                border-radius: 4px;
                cursor: pointer;
                width: 100%;
            }
            
            button:hover {
                background-color: #0056b3;
            }
            
            p {
                margin: 10px 0 0;
            }
            
            a {
                color: #007bff;
                text-decoration: none;
            }
            
            a:hover {
                text-decoration: underline;
            }
       .sell
       {
       font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
               padding-margin: 0;
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

<div class="sell">
            <div class="form-container">
        <h2>Edit Profile</h2>
        
       

       <c:if test="${not empty failedMsg}">
       <h5 class="text-center text-danger">${failedMsg}</h5>
       <c:remove var="failedMsg" scope="session"/>
       </c:if>
       
       <c:if test="${not empty succMsg}">
       <h5 class="text-center text-success">${succMsg}</h5>
       <c:remove var="succMsg" scope="session"/>
       </c:if>
               <form action="update_profile" method="post">
			
	<input type="text" value="${userobj.id}" name="id">
		
			<div class="form-group">
				 <label for="signupUsername">Name</label> 
				 <input type="text" id="signupUsername" name="bname" value="${userobj.name}" required>
			</div>

			<div class="form-group">
				<label for="signupadd">Email</label> <input type="Email"
					id="signupadd" name="email" value="${userobj.email}" required>
			</div>

			<div class="form-group">
				<label for="signupphno">Phone number</label> <input type="number"
					id="signupphno" name="number" value="${userobj.password}" required>
			</div>
			
			<div class="form-group">
				<label for="signupphno">Password</label> <input type="text"
					id="signupphn" name="password">
			</div>

			<button type="submit" style="border-radius:7px;width:12vh">Add</button>
			
		</form>
     </div>
            </div>
            
</body>
</html>