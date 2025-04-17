package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import com.entity.Cart;

import java.util.List;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            int bid = Integer.parseInt(req.getParameter("bid"));
            int uid = Integer.parseInt(req.getParameter("uid"));
            int stock = Integer.parseInt(req.getParameter("stock"));

            BookDAOImpl dao = new BookDAOImpl(DBConnect.getconn());
            BookDtls b = dao.getBookById(bid);

            Cart c = new Cart();
            c.setBid(bid);
            c.setUid(uid);
            c.setStock(stock);
            c.setBookName(b.getName());
            c.setAuthor(b.getAuthor());
            c.setPrice(Double.parseDouble(b.getPrice()));
            c.setTotalPrice(Double.parseDouble(b.getPrice()));

            CartDAOImpl cartDAO = new CartDAOImpl(DBConnect.getconn());
            boolean added = cartDAO.addCart(c);

            HttpSession session = req.getSession();

            if (added) {
                // ✅ Fetch updated cart and set in session
                List<Cart> cartList = cartDAO.getBookByUser(uid);
                session.setAttribute("cart", cartList);

                session.setAttribute("addCart", "Book Added to Cart");
                resp.sendRedirect("all_new.jsp");
            } else {
                session.setAttribute("failed", "Book not added to Cart");
                resp.sendRedirect("all_new.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
