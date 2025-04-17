<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%
    String paymentAmount = request.getParameter("amount"); 
    if (paymentAmount == null || paymentAmount.trim().isEmpty()) {
        paymentAmount = "0";
    }
    
    String paymentDetails = "Pay: " + paymentAmount + " USD";
    String qrData = URLEncoder.encode(paymentDetails, "UTF-8");
    String qrCodeUrl = "https://chart.googleapis.com/chart?chs=200x200&cht=qr&chl=" + qrData + "&choe=UTF-8";
%>

<!DOCTYPE html>
<html>
<head>
    <title>Payment Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
        }
        .container {
            width: 300px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0px 0px 10px #aaa;
        }
        input, button {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
        }
        img {
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Make a Payment</h2>
    <form method="GET">
        <label for="amount">Enter Amount (USD):</label>
        <input type="number" id="amount" name="amount" required>
        <button type="submit">Generate QR Code</button>
    </form>

    <% if (!"0".equals(paymentAmount)) { %>
        <h3>Scan to Pay:</h3>
        <img src="<%= qrCodeUrl %>" alt="QR Code">
        <p><strong>Amount:</strong> <%= paymentAmount %> USD</p>
    <% } %>
</div>

</body>
</html>
