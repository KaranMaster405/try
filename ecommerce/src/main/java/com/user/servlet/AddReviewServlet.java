package com.user.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.DB.DBConnect;

@WebServlet("/addReview")
public class AddReviewServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uidStr = request.getParameter("uid");
        String bidStr = request.getParameter("bid");
        String username = request.getParameter("username");
        String review = request.getParameter("review");
        String ratingStr = request.getParameter("rating");
        String stock = request.getParameter("stock");

        int uid = 0;
        int bid = 0;
        int rating = 0;

        try {
            uid = Integer.parseInt(uidStr);
            bid = Integer.parseInt(bidStr);
            rating = Integer.parseInt(ratingStr);

            if (rating < 1 || rating > 5) {
                throw new IllegalArgumentException("Rating must be between 1 and 5.");
            }

            if (username == null || username.trim().isEmpty() || review == null || review.trim().isEmpty()) {
                throw new IllegalArgumentException("Username and review content must not be empty.");
            }

            try (Connection conn = DBConnect.getconn();
                 PreparedStatement ps = conn.prepareStatement(
                     "INSERT INTO reviews (user_id, book_id, username, review, rating) VALUES (?, ?, ?, ?, ?)")) {

                ps.setInt(1, uid);
                ps.setInt(2, bid);
                ps.setString(3, username);
                ps.setString(4, review);
                ps.setInt(5, rating);
                ps.executeUpdate();
            }

        } catch (NumberFormatException e) {
            getServletContext().log("Invalid numeric input in AddReviewServlet", e);
        } catch (IllegalArgumentException e) {
            getServletContext().log("Validation failed in AddReviewServlet", e);
        } catch (Exception e) {
            getServletContext().log("Database error in AddReviewServlet", e);
        }

        response.sendRedirect("view_Books.jsp?bid=" + bid + "&stock=" + stock);
    }
}
