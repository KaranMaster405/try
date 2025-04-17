<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.DAO.BookDAOImpl,com.entity.BookDtls,com.DB.DBConnect,java.util.List,com.entity.*,java.sql.PreparedStatement,java.sql.*" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Book</title>
<link rel="stylesheet" href="style.css">
<%@ include file="all_compound/allcss.jsp" %>

<style>
.t {
    text-align: center;
    margin-left: auto;
}
.quantity-selector {
    display: flex;
    align-items: center;
    justify-content: center;
    margin-top: 10px;
}
.quantity-selector button {
    background-color: #28a745;
    color: white;
    border: none;
    padding: 10px;
    cursor: pointer;
    font-size: 16px;
    border-radius: 5px;
}
.quantity-selector button:disabled {
    background-color: #ccc;
    cursor: not-allowed;
}
.quantity-selector input {
    width: 50px;
    text-align: center;
    border: 1px solid #ddd;
    margin: 0 5px;
    border-radius: 5px;
    padding: 5px;
}
</style>

</head>
<body>
<%@ include file="all_compound/navbar.jsp" %>

<%
User us = (User) session.getAttribute("userobj");

int bid = 0;
int stock = 0;
BookDtls b = null;

try {
    bid = Integer.parseInt(request.getParameter("bid"));
    stock = Integer.parseInt(request.getParameter("stock"));
    BookDAOImpl dao = new BookDAOImpl(DBConnect.getconn());
    b = dao.getBookById(bid, stock);
} catch (Exception e) {
    out.println("<h3 style='color:red;'>Invalid book ID or stock.</h3>");
    return;
}
%>

<div class="container p-3">
    <div class="row">
        <div class="col-md-6 text-center p-5 border">
            <img src="book/<%=b.getPhoto()%>" alt="book1" style="width:150px;height:230px" class="img-thumbnail"><br>
            <h4>Book Name: <span><%=b.getName()%></span></h4>
            <h4>Author Name: <span><%=b.getAuthor()%></span></h4>
            <h4>Categories: <span><%=b.getBookType()%></span></h4>
        </div>

        <div class="col-md-6 text-center border">
            <h3><%=b.getName()%></h3>

            <% if ("Old".equals(b.getBookType())) { %>
                <h5>Contact to Seller</h5>
                <h5>Email: <%=b.getEmail()%></h5>
            <% } %>

            <div class="list">
                <h5 style="color:green">Special Price:</h5>
                <div class="text-flex">
                    <p><i class="fa-solid fa-indian-rupee-sign"></i>
                        <%= Math.floor(0.95 * Integer.parseInt(b.getPrice())) %>
                    </p>
                    <h8><s><i class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></s></h8>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4 text-center p-2">
                    <i class="fa-solid fa-sack-dollar"></i>
                    <p>Cash on delivery</p>
                </div>
                <div class="col-md-4 text-center p-2">
                    <i class="fa-solid fa-right-left"></i>
                    <p>Return</p>
                </div>
                <div class="col-md-4 text-center p-2">
                    <i class="fa-solid fa-motorcycle"></i>
                    <p>Free Shipping</p>
                </div>
            </div>

            <div class="mt-3">
                <% if ("Old".equals(b.getBookType())) { %>
                    <a href="index.jsp" class="btn btn-outline-primary">Continue Shopping</a>
                    <a href="#" class="btn btn-danger"><%=b.getPrice()%> <i class="fa-solid fa-indian-rupee-sign"></i></a>
                <% } else { %>
                    <% if (us == null) { %>
                        <a href="login.jsp" class="btn btn-outline-success">Add To Cart</a>
                    <% } else if (b.getStock() > 0) { %>
                        <a href="cart?bid=<%=b.getBook_Id()%>&uid=<%=us.getId()%>&stock=<%=b.getStock()%>" 
                           class="btn btn-outline-success">Add To Cart</a>
                    <% } else { %>
                        <button class="btn btn-outline-secondary" disabled>Out of Stock</button>
                    <% } %>

                    <a href="signup.html" class="btn btn-outline-danger"><%=b.getPrice()%>
                        <i class="fa-solid fa-indian-rupee-sign"></i>
                    </a>
                <% } %>
            </div>
        </div>
    </div>
</div>

<% if (us != null) { %>
<div class="fluid-container m-5">
    <h4>Write a Review</h4>
    <form action="addReview" method="post">
    <input type="hidden" name="uid" value="<%=us.getId()%>">
    <input type="hidden" name="bid" value="<%=b.getBook_Id()%>">
    <input type="hidden" name="username" value="<%=us.getName()%>">
	<input type="hidden" name="stock" value="<%=b.getStock()%>">
        <div class="form-group">
        <label for="rating">Rating (1 to 5):</label>
        <input type="number" name="rating" class="form-control" min="1" max="5" required>
    </div>
    <div class="form-group">
        <label for="review">Your Review:</label>
        <textarea name="review" class="form-control" rows="3" required></textarea>
    </div>
    <button type="submit" class="btn btn-primary mt-2">Submit Review</button>
</form>

    <%
        Connection con = DBConnect.getconn();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM reviews WHERE book_id = ? ORDER BY created_at DESC");
        ps.setInt(1, b.getBook_Id());
        ResultSet rs = ps.executeQuery();
    %>
    
    <h4 class="mt-5">User Reviews:</h4>
    <%
        boolean hasReviews = false;
        while (rs.next()) {
            hasReviews = true;
    %>
        <div class="border p-3 mt-2">
            <strong><%= rs.getString("username") %></strong> -
            <span>Rating: <%= rs.getInt("rating") %>/5</span><br>
            <p><%= rs.getString("review") %></p>
            <small><%= rs.getTimestamp("created_at") %></small>
        </div>
    <%
        }
        if (!hasReviews) {
    %>
        <p>No reviews yet for this book.</p>
    <%
        }
        rs.close();
        ps.close();
        con.close();
    %>
</div>
<% } else { %>
    <div class="text-center mt-4">
        <p><a href="login.jsp">Login</a> to write a review.</p>
    </div>
<% } %>

<div class="container-fluid mt-5">
    <%@ include file="all_compound/footer.jsp" %>
</div>

</body>
</html>