package com.user.servlet;
import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.http.HttpSession;
import com.entity.*;
import com.entity.Cart;
import java.util.*;
import com.DB.DBConnect;
import com.DAO.*;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;

@WebServlet("/remove_book")
@MultipartConfig
public class RemoveBookCart extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	int bid=Integer.parseInt(req.getParameter("bid"));
	int uid=Integer.parseInt(req.getParameter("uid"));
	int cid=Integer.parseInt(req.getParameter("cid"));
		CartDAOImpl dao=new CartDAOImpl(DBConnect.getconn());
		boolean f=dao.deleteBook(bid,uid,cid);
		HttpSession session=req.getSession();
		
		if(f)
		{
			session.setAttribute("succMsg","Book Removed from cart");
			resp.sendRedirect("checkout.jsp");
		}
		else
		{
			session.setAttribute("succMsg","Something went wromg");
			resp.sendRedirect("checkout.jsp");
		}
	}

}
