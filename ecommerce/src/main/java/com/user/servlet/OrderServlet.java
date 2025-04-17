package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.*;
import com.DAO.*;
import com.DB.DBConnect;

import org.json.JSONObject;
import com.razorpay.Order;
import com.razorpay.RazorpayClient;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

    private static final String RAZORPAY_KEY = "rzp_test_qxZvtntxEwY4SZ";
    private static final String RAZORPAY_SECRET = "UjOswsVuuCXksLJl5vZXebue";

    public void PrepareEmail(Book_Order o) {
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

        String subj = "<h1>Order Placed Successfully</h1>";
        String body = "<p>Thank you for placing an order with us. Have a great day!</p>";

        Session emailSession = Session.getInstance(props, auth);
        EmailUtil.sendEmail(emailSession, o.getEmail(), subj, body);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession();

            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("username");
            String email = req.getParameter("email");
            String phno = req.getParameter("phno");
            String address = req.getParameter("address");
            String landmark = req.getParameter("landmark");
            String city = req.getParameter("city");
            String state = req.getParameter("state");
            String pincode = req.getParameter("pincode");
            String paymentType = req.getParameter("paymentType");

            String fullAdd = address + "," + landmark + "," + city + "," + state + "," + pincode;

            CartDAOImpl dao = new CartDAOImpl(DBConnect.getconn());
            List<Cart> blist = dao.getBookByUser(id);

            if (blist.isEmpty()) {
                session.setAttribute("failedMsg", "Please add books to your cart.");
                resp.sendRedirect("checkout.jsp");
                return;
            }

            BookOrderImpl dao2 = new BookOrderImpl(DBConnect.getconn());
            ArrayList<Book_Order> orderList = new ArrayList<>();
            Random r = new Random();
            int totalAmount = 0;

            for (Cart c : blist) {
                int NOB = Integer.parseInt(req.getParameter("NOB_" + c.getCid()));

                Book_Order o = new Book_Order();
                o.setOrderId("BOOK-ORD-00" + r.nextInt(1000));
                o.setUsername(name);
                o.setEmail(email);
                o.setPhno(phno);
                o.setFulladd(fullAdd);
                o.setBookName(c.getBookName());
                o.setAuthor(c.getAuthor());
                o.setPrice(String.valueOf(c.getPrice() * NOB));
                o.setPaymentType(paymentType);
                o.setNOB(NOB);

                totalAmount += c.getPrice() * NOB;
                orderList.add(o);
            }

            if ("noselect".equals(paymentType)) {
                session.setAttribute("failedMsg", "Please choose a payment method.");
                resp.sendRedirect("checkout.jsp");
                return;
            }

            if ("gpay".equals(paymentType)) {
                // Generate Razorpay order
                RazorpayClient razorpay = new RazorpayClient(RAZORPAY_KEY, RAZORPAY_SECRET);
                JSONObject orderRequest = new JSONObject();
                orderRequest.put("amount", totalAmount * 100); // Amount in paise
                orderRequest.put("currency", "INR");
                orderRequest.put("receipt", "BOOK-ORD-00" + r.nextInt(1000));

                Order order = razorpay.Orders.create(orderRequest);

                session.setAttribute("razorpay_order_id", order.get("id"));
                session.setAttribute("totalAmount", totalAmount);
                session.setAttribute("orderList", orderList);
                
                // ✅ Correcting the request attributes before forwarding
                req.setAttribute("razorpayOrderId", order.get("id")); // Corrected
                req.setAttribute("razorpay_key", RAZORPAY_KEY); // Corrected
                
                RequestDispatcher rs = req.getRequestDispatcher("razorpay_payment.jsp");
                rs.forward(req, resp);
            

            } else {
                boolean f = dao2.saveOrder(orderList);
                if (f) {
                    PrepareEmail(orderList.get(0));
                    resp.sendRedirect("order_success.jsp");
                } else {
                    session.setAttribute("failedMsg", "Please try again.");
                    resp.sendRedirect("checkout.jsp");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
