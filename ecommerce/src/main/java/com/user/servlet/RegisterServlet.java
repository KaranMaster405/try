package com.user.servlet;
import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet  extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req , HttpServletResponse resp) throws ServletException, IOException {
	
		try
		{
		String name=req.getParameter("username");
		String email=req.getParameter("email");
		String phoneno=req.getParameter("number");
		String password=req.getParameter("password");
		String mail=req.getParameter("confirmPassword");
		String check=req.getParameter("checkbox");
		
		System.out.println(name+" "+email+" "+phoneno+" "+password+" "+mail);
		System.out.println(name+" "+email+" "+phoneno+" "+password+" "+mail);
		User us=new User();
		us.setName(name);
		us.setEmail(email);
		us.setPhno(phoneno);
		us.setPassword(password);
	
		UserDAOImpl dao =new UserDAOImpl(DBConnect.getconn());
		boolean f=dao.userRegister(us);
		
		if(f)
		{
			System.out.println("User Register Successfully");
			 resp.sendRedirect("index.jsp");
		}
		else
		{
			System.out.print("Something Went wrong");
		}

		}
	
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
	
	

}

