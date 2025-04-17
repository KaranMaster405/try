package com.admin.servlet;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.entity.BookDtls;
import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
@WebServlet("/editbooks")
public class EditBooksServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
			int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("bname");
			String author=req.getParameter("author");
			String price=req.getParameter("number");
			
			String status=req.getParameter("status");
				
			BookDtls b=new BookDtls();
			b.setBook_Id(id);
			b.setName(name);
			b.setAuthor(author);
			b.setPrice(price);
			b.setStatus(status);
			
			BookDAOImpl dao=new BookDAOImpl(DBConnect .getconn());
			boolean f= dao.updateEditBooks(b);
			
			HttpSession session=req.getSession();
			
			if(f)
			{
				session.setAttribute("succMsg","Book Update Successfully....");
				resp.sendRedirect("admin/all_books.jsp");
			}
			else
			{
				session.setAttribute("failedMsg","Something went wrong...");
				resp.sendRedirect("admin/all_books.jsp");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
