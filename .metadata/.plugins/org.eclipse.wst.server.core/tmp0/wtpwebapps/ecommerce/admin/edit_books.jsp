<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.DAO.BookDAOImpl,com.entity.BookDtls,com.DB.DBConnect,java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- <%@include file="allcss.jsp" %> -->
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

</style>
<%@include file="allcss.jsp" %>

<body style="background-color:#f0f2f2">
<div class="header">
<%@include file="navbar.jsp" %>
</div>
	<div class="form-container offset-md-4">
		<h2>Edit book</h2>
		
		<%
 int id=Integer.parseInt(request.getParameter("id"));
BookDAOImpl dao=new BookDAOImpl(DBConnect.getconn());
BookDtls b=dao.getBookById(id);

%>
		<form id="signUpForm" method="post" action="../editbooks">
			<input type="hidden" name="id" value="<%=b.getBook_Id() %>" >
			
			<div class="form-group">
				<input type="hidden" name="direction" value="sign" /> <label
					for="signupUsername">Book Name</label> <input type="text"
					id="signupUsername" name="bname" value="<%=b.getName() %>" required>
			</div>

			<div class="form-group">
				<label for="signupadd">Author Name</label> <input type="text"
					id="signupadd" name="author" value=" <%=b.getAuthor() %>" required>
			</div>

			<div class="form-group">
				<label for="signupphno">Price of book</label> <input type="text"
					id="signupphno" name="number" type="text" value="<%=b.getPrice() %>" required>
			</div>

		

<div class="form-group">
				<label for="inputState">Books Status</label> <select
					id="inputState" name="status"
					style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; box-sizing: border-box;">
					<%
					if("Active".equals(b.getStatus()))
					{
					%>
					<option value="Active">Active</option>
						<option value="Inactive">Inactive</option>
					<% 
					}
					else
					{%>
					<option value="Inactive">Inactive</option>
					<option value="Active">Active</option>
						<% 
					}
					%>
					
					
					
				</select>
			</div>

	

			
			<button type="submit" style="border-radius:7px;width:12vh">Update</button>
			
		</form>
	</div>

</body>
</html>