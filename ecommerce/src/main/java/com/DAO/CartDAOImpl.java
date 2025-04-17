package com.DAO;
import com.DB.DBConnect;

import com.entity.*;

import java.util.*;
import java.sql.*;
import java.sql.PreparedStatement;

public class CartDAOImpl implements CartDAO {

    private Connection conn;

    public CartDAOImpl(Connection conn) {
        this.conn = conn;
    }

    // Existing methods...

    // Method to count total items in the cart1 table
    public int countTotalItems() {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) FROM cart1";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1); // Get the count from the first column (COUNT(*))
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    @Override
    public boolean addCart(Cart c) {
        boolean f = false;
        try {
            String sql = "INSERT INTO cart1 (bid, uid, book_Name, author, price, total_price, NOB, stock) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, c.getBid());
            ps.setInt(2, c.getUid());
            ps.setString(3, c.getBookName());
            ps.setString(4, c.getAuthor());
            ps.setDouble(5, c.getPrice());
            ps.setDouble(6, c.getPrice() * c.getNOB()); // Correct total price
            ps.setInt(7, c.getNOB());
            ps.setInt(8, c.getStock());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public List<Cart> getBookByUser(int userId) {
        List<Cart> list = new ArrayList<>();
        try {
        	String sql = "SELECT * FROM cart1 WHERE uid=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cart c = new Cart();
                c.setCid(rs.getInt("cid"));
                c.setBid(rs.getInt("bid"));
                c.setUid(rs.getInt("uid"));
                c.setBookName(rs.getString("book_Name"));
                c.setAuthor(rs.getString("author"));
                c.setPrice(rs.getDouble("price"));
                c.setNOB(rs.getInt("NOB"));
                c.setStock(rs.getInt("stock"));

                double totalPrice = c.getPrice() * c.getNOB();
                c.setTotalPrice(totalPrice);

                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean deleteBook(int bid, int uid, int cid) {
        boolean f = false;
        try {
            String sql = "DELETE FROM cart1 WHERE bid=? AND uid=? AND cid=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, bid);
            ps.setInt(2, uid);
            ps.setInt(3, cid);

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean updateQuantity(int cid, int newQuantity) {
        boolean f = false;
        try {
            String sql = "UPDATE cart1 SET NOB = ?, total_price = price * ? WHERE cid = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, newQuantity);
            ps.setInt(2, newQuantity);
            ps.setInt(3, cid);

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    
    


}
