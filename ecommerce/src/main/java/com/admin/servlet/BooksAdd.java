package com.admin.servlet;
import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.*;
import javax.servlet.http.Part;
import com.entity.*;
import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import java.io.*;

@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet  {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doPost(req, resp);
		try
		{
			String name=req.getParameter("bname");
			String author=req.getParameter("author");
			String TOB=req.getParameter("TOB");
			String price=req.getParameter("number");
			String categories=req.getParameter("categories");
			String status=req.getParameter("status");
			int stock=Integer.parseInt(req.getParameter("stock"));
			Part part=req.getPart("bing");
			String fileName=part.getSubmittedFileName();
			
			
			BookDtls b= new BookDtls(name,author,price,categories,status,fileName,"admin",stock,TOB); 
			//System.out.println(b);
			
			BookDAOImpl dao=new BookDAOImpl(DBConnect.getconn());
			
			boolean f=dao.addBooks(b);
			HttpSession session=req.getSession();
			if(f)
			{
				
				String path=getServletContext().getRealPath("")+"book";
				//System.out.println(path);
				
				File file = new File(path);
				
				part.write(path+File.separator + fileName);
				
				session.setAttribute("succMsg","Book Add Sucessfully");
				resp.sendRedirect("admin/add_book.jsp");
			}
			else
			{
				session.setAttribute("faileMsg","Something wrong on server ");
				resp.sendRedirect("admin/add_book.jsp");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	

}
