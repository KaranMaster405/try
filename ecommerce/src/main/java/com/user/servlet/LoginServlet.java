package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

import javax.servlet.http.HttpServletResponse;
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
	
		try {
            UserDAOImpl dao = new UserDAOImpl(DBConnect.getconn());
            HttpSession session = req.getSession();

            String username = req.getParameter("username");
            String password = req.getParameter("password");
            System.out.println(password+""+username);

            // Check for hardcoded username and password
           if ("kara".equals(username) && "12345678".equals(password))
           {
        	   User us=new User();
        	   us.setName("karan@gmail.com");
        	   session.setAttribute("userobj",us);
        			   
                resp.sendRedirect("admin/home.jsp");
          } 
        	   else 
        	   {
//                // Validate against the database
        		   
              User us = dao.login(username, password);
               if (us != null) 
                {
                    session.setAttribute("userobj", us);
                 resp.sendRedirect("index.jsp");
                } 
                 else 
                 {
                    session.setAttribute("failedMsg", "Email and Password are invalid");
                    resp.sendRedirect("login.jsp");
                }
               resp.sendRedirect("home.jsp");
           }
		}
         
           catch (Exception e)
		{
            e.printStackTrace();
            // Optionally, you can redirect to an error page or show an error message
           
        }
	}
}
		
