<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession sessionData = request.getSession();
    String razorpayOrderId = (String) sessionData.getAttribute("razorpay_order_id");
    int totalAmount = (int) sessionData.getAttribute("totalAmount");
%>
<html>
<head>
    <title>Razorpay Payment</title>
   
    <button id="rzp-button1">Pay</button>
     <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    
    <%
    System.out.println(request.getAttribute("razorpay_key"));
    System.out.println(request.getAttribute("razorpayOrderId"));
    %>
   	
    

<script>
  var options = {
      "key": "<%= request.getAttribute("razorpay_key") %>", // Fetch from backend
      "amount": "<%= totalAmount * 100 %>", // Convert amount to paise
      "currency": "INR",
      "name": "Ebook",   //Your Business Name
      "description": "Test Transaction",
      "image": "https://example.com/your_logo",
      "order_id": "<%= razorpayOrderId %>", // Get dynamic Order ID from session
      "callback_url": "https://eneqd3r9zrjok.x.pipedream.net/",
      //"callback_url": "https://yourdomain.com/payment_success.jsp",
      "prefill": {
          "name": "Test User",
          "email": "test@example.com",
          "contact": "9000000000"
      },
      "theme": { "color": "#3399cc" }
  };

  var rzp1 = new Razorpay(options);
  document.getElementById('rzp-button1').onclick = function(e) {
      rzp1.open();
      e.preventDefault();
  }
</script>

</head>
<body>
    <h2>Complete Payment</h2>
    <!-- <button onclick="makePayment()">Pay Now</button>-->
</body>
</html>
