<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.DAO.BookDAOImpl,com.entity.BookDtls,com.DB.DBConnect,java.util.List,com.entity.*,com.user.servlet.*"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>

.form-container {
	background-color:white;
	margin: 20px;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 450px;
	text-align:center;
}



.form-group {
	margin-bottom: 15px;
}

label {
	display: block;
	margin-bottom: 5px;
}

input[type="text"], input[type="password"] {
	width: 90%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	box-sizing: border-box;
	
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
   button {
                background-color: #007bff;
                color: white;
                border: none;
                padding: 10px;
                border-radius: 4px;
                cursor: pointer;
                width: 10vw;
            }
</style>
<%@include file="all_compound/allcss.jsp" %>


<body style="background-color:#f0f2f2">

<div class="header">
<%@include file="all_compound/navbar.jsp" %>
</div>
	<div class="form-container offset-md-4">
		<h2 class="text-center">Login</h2>
         <c:if test="${not empty succMsg }">
		<p class="text-center text-success">${succMsg}</p>
		<c:remove var="succMsg" scope="session" />
</c:if> 

       <c:if test="${not empty failedMsg }">
       <h5 class="text-center text-danger">${failedMsg}</h5>
       <c:remove var="failedMsg" scope="session"/>
       </c:if>
       
       <c:if test="${not empty succMsg }">
       <h5 class="text-center text-success">${succMsg}</h5>
       <c:remove var="succMsg" scope="session"/>
       </c:if>

		

		<form id="signUpForm" method="post" action="login">
				<div class="form-group">
			
			
				<input type="hidden" name="direction" value="sign" /> 
				<label for="signupUsername">Username</label> 
				<input type="text"id="signupUsername" name="username" required>
			</div>

			<div class="form-group">
				<label for="signupadd">Passsword</label>
				 <input type="Password"id="signupPassword" name="password" required>
			</div>
			
						
			  <button type="submit">Login</button>
                    <p>Create New Account<a href="signup.html" id="showLogin">signup</a></p>
		</form>
	</div>

</body>
</html>