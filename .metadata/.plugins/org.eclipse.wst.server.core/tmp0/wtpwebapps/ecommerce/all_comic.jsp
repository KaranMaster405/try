 <%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.DAO.BookDAOImpl,com.entity.BookDtls,com.DB.DBConnect,java.util.List" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       <%@page isELIgnored="false" %>
       
       
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Comic Book</title>
<%@include file="all_compound/allcss.jsp" %>
<style>
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}


</style>
</head>

<body>
<%
User us=(User)session.getAttribute("userobj"); 

%>
<c:if test="${not empty addCart }">

<div id="toast"> ${addCart}</div>

<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>

<c:remove var="addCart" scope="session"/>

</c:if>



<div class="line">
<hr>

</div>
<%@include file="all_compound/navbar.jsp" %>
<div class="container-fluid">
<h4>Comic Books</h4>
<div class="row item-inline">

<%
BookDAOImpl dao1=new BookDAOImpl(DBConnect.getconn());
List<BookDtls>list1=dao1.getComic();

for(BookDtls b:list1)
{%>
<a href="view_Books.jsp?bid=<%=b.getBook_Id()%>" style="text-decoration:none;color:black;">
<div class="card ml-sm-4 ">
<div class="card-body text-center">
<img src="book/<%=b.getPhoto() %>" alt="book1" style="width:20vh;height:30vh" class="img-thumblin">
<p><b><%=b.getName()%></b></p>
<p>Author:<%=b.getAuthor() %></p>
<p>Price:<%=b.getPrice() %><i class="fa-solid fa-indian-rupee-sign"></i></p>
<div class="row-center">
<%
if(us==null)
{%>
	<a href="login2.jsp " class="btn btn-outline-success">Add To Card</a>
<%
}
else
{%>
	<a href="cart?bid=<%=b.getBook_Id()%>&uid=<%=us.getId()%>" class="btn btn-outline-success">Add To Card</a>
<%}

%>
<!--  <a href="signup.html " class="btn btn-success btn-sm"><%=b.getPrice() %><i class="fa-solid fa-indian-rupee-sign"></i></a>
--></div>
</div>
</div>
	</a>
	<%
}
%>

</div>
</div>

<div class="container-fluid">
 <div class="footer" style="boarder-radius:10px"></div>
 <%@include file="all_compound/footer.jsp" %>
 </div>


</body>
</body>
</html>