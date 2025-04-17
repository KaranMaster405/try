package com.user.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.razorpay.RazorpayClient;
import com.razorpay.Payment;
import com.DAO.BookOrderImpl;
import com.DB.DBConnect;
import com.entity.Book_Order;
import com.user.servlet.*;

@WebServlet("/VerifyPaymentServlet")
public class VerifyPaymentServlet extends HttpServlet {
    private static final String RAZORPAY_KEY = "rzp_test_qxZvtntxEwY4SZ";
    private static final String RAZORPAY_SECRET = "UjOswsVuuCXksLJl5vZXebue";

    public void sendOrderConfirmationEmail(Session session, Book_Order order, int totalAmount) {
        String subject = "Payment Successful - Order Confirmation";
        StringBuilder body = new StringBuilder();

        body.append("<h1>Order Successfully Placed</h1>");
        body.append("<p>Dear ").append(order.getUsername()).append(",</p>");
        body.append("<p>Thank you for your purchase! Your payment was successfully processed.</p>");
        body.append("<p><strong>Order ID:</strong> ").append(order.getOrderId()).append("</p>");
        body.append("<p><strong>Book Name:</strong> ").append(order.getBookName()).append("</p>");
        body.append("<p><strong>Author:</strong> ").append(order.getAuthor()).append("</p>");
        body.append("<p><strong>Quantity:</strong> ").append(order.getNOB()).append("</p>");
        body.append("<p><strong>Total Amount Paid:</strong> ₹").append(totalAmount).append("</p>");
        body.append("<p><strong>Shipping Address:</strong> ").append(order.getFulladd()).append("</p>");
        body.append("<p>We appreciate your business!</p>");

        EmailUtil.sendEmail(session, order.getEmail(), subject, body.toString());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String paymentId = request.getParameter("payment_id");
        int totalAmount = (int) session.getAttribute("totalAmount");
        
        try {
            RazorpayClient razorpay = new RazorpayClient(RAZORPAY_KEY, RAZORPAY_SECRET);
            Payment payment = razorpay.Payments.fetch(paymentId);

            if ("captured".equals(payment.get("status"))) {
                List<Book_Order> orderList = (List<Book_Order>) session.getAttribute("orderList");
                BookOrderImpl dao2 = new BookOrderImpl(DBConnect.getconn());
                boolean isOrderSaved = dao2.saveOrder(orderList);

                if (isOrderSaved) {
                    final String fromEmail = "prajapatiajayan88@gmail.com";
                    final String password = "iitaivxsnmjpxrdt";
                    Properties props = new Properties();
                    props.put("mail.smtp.host", "smtp.gmail.com");
                    props.put("mail.smtp.port", "587");
                    props.put("mail.smtp.auth", "true");
                    props.put("mail.smtp.starttls.enable", "true");

                    Authenticator auth = new Authenticator() {
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(fromEmail, password);
                        }
                    };
                    
                    Session emailSession = Session.getInstance(props, auth);
                    sendOrderConfirmationEmail(emailSession, orderList.get(0), totalAmount);
                    session.setAttribute("succMsg", "Payment Successful! Your order has been placed.");
                    response.sendRedirect("order_success.jsp");
                } else {
                    session.setAttribute("failedMsg", "Order could not be placed. Please try again.");
                    response.sendRedirect("checkout.jsp");
                }
            } else {
                session.setAttribute("failedMsg", "Payment Failed. Try again.");
                response.sendRedirect("checkout.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("failedMsg", "Error verifying payment.");
            response.sendRedirect("checkout.jsp");
        }
    }
}
