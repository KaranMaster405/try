package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.DB.DBConnect;

@WebServlet("/update_nob")
public class UpdateNOBServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bid = Integer.parseInt(request.getParameter("bid"));
        int newNOB = Integer.parseInt(request.getParameter("newNOB"));

        try {
            Connection conn = DBConnect.getconn();
            String sql = "UPDATE cart1 SET NOB=?, total_price=price * ? WHERE bid=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, newNOB);
            ps.setInt(2, newNOB);
            ps.setInt(3, bid);

            int i = ps.executeUpdate();
            if (i == 1) {
                response.getWriter().print("success");
            } else {
                response.getWriter().print("failure");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("error");
        }
    }
}
