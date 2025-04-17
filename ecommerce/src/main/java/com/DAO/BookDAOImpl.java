
package com.DAO;
import java.sql.Connection;



import java.util.*;
import java.sql.*;

import com.entity.BookDtls;
import com.entity.Cart;

public class BookDAOImpl implements BookDAO{

	private Connection conn;
	
	
	public BookDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}


	@Override
	public boolean addBooks(BookDtls b) {
		// TODO Auto-generated method stub
		boolean f=false;
		try
		{
			String sql="insert into book_detail(name,author,price,bookType,status,photo,email,stock,TOB) values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, b.getName());
			ps.setString(2,b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookType());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhoto());
			ps.setString(7, b.getEmail());
			ps.setInt(8, b.getStock());
			ps.setString(9, b.getTOB());
			
			
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}


	@Override
	public List<BookDtls> getAllBooks() {
		List<BookDtls> list =new ArrayList<BookDtls>();
		BookDtls b=null;
		try
		{
			String sql="select * from book_detail";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				b=new BookDtls();
				b.setBook_Id(rs.getInt(1));
				b.setName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookType(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				b.setStock(rs.getInt(9));
				b.setTOB(rs.getString(10));
				list.add(b);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public BookDtls getBookById(int id,int stock) {
		
		BookDtls b=null;
		try
		{
		String sql="select * from book_detail where book_Id=? && stock=? ";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1, id);
		ps.setInt(2, stock);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
{
			b=new BookDtls();
			b.setBook_Id(rs.getInt(1));
			b.setName(rs.getString(2));
			b.setAuthor(rs.getString(3));
			b.setPrice(rs.getString(4));
			b.setBookType(rs.getString(5));
			b.setStatus(rs.getString(6));
			b.setPhoto(rs.getString(7));
			b.setEmail(rs.getString(8)); 
			b.setStock(rs.getInt(9));
			b.setTOB(rs.getString(10));
}
		
		
		
		
		
//		while(rs.next())
//		{
//			b=new BookDtls();
//			b.setBook_Id(rs.getInt(1));
//			b.setName(rs.getString(2));
//			b.setAuthor(rs.getString(3));
//			b.setPrice(rs.getString(4));
//			b.setBookType(rs.getString(5));
//			b.setStatus(rs.getString(6));
//			b.setPhoto(rs.getString(7));
//			b.setEmail(rs.getString(8));  
//			
//		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return b;
	}

	
	
	@Override
	public BookDtls getBookById(int id) {                      //////////////////it is dublicate for /cart
		
		BookDtls b=null;
		try
		{
		String sql="select * from book_detail where book_Id=? ";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
{
			b=new BookDtls();
			b.setBook_Id(rs.getInt(1));
			b.setName(rs.getString(2));
			b.setAuthor(rs.getString(3));
			b.setPrice(rs.getString(4));
			b.setBookType(rs.getString(5));
			b.setStatus(rs.getString(6));
			b.setPhoto(rs.getString(7));
			b.setEmail(rs.getString(8)); 
			b.setStock(rs.getInt(9));
			b.setTOB(rs.getString(10));
}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return b;
	}
	
	
	
	

	@Override
	public boolean updateEditBooks(BookDtls b) {
		boolean f=false;
		try
		{
			String sql="update book_detail set name=?,author=?,price=?,status=?,stock=? where book_Id=?"; ///here remove stock if error
			PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1, b.getName());
		ps.setString(2, b.getAuthor());
		ps.setString(3,b.getPrice());
		ps.setString(4, b.getStatus());
		ps.setInt(5, b.getBook_Id());
		ps.setInt(6, b.getStock());           ///here remove stock if error
		ps.setString(7, b.getTOB());
			
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
		}
		catch(Exception e)
		{
			
		}
		return f;
	}


	@Override
	public boolean deleteBooks(int id) {
		boolean f=false;
		try
		{
			String sql="delete from book_detail where book_Id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}


	@Override
	public List<BookDtls> getNewBook() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b =null;
		try
		{
			String sql="select * from book_detail where bookType=? and status=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=6)
			{
				b=new BookDtls();
				b.setBook_Id(rs.getInt(1));
				b.setName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookType(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				b.setStock(rs.getInt(9));
				b.setTOB(rs.getString(10));
			list.add(b);
			i++;
			
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public List<BookDtls> getRecentBook() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b =null;
		try
		{
			String sql="select * from book_detail where status=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1, "Active ");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next())
			{
				b=new BookDtls();
				b.setBook_Id(rs.getInt(1));
				b.setName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookType(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				b.setStock(rs.getInt(9));
				b.setTOB(rs.getString(10));
			list.add(b);
			i++;
			
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public List<BookDtls> getOldBook() {
		
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b =null;
		try
		{
			String sql="select * from book_detail where bookType=? and status=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next())
			{
				b=new BookDtls();
				b.setBook_Id(rs.getInt(1));
				b.setName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookType(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				b.setStock(rs.getInt(9));
				b.setTOB(rs.getString(10));
			list.add(b);
			i++;
			
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return list;
	}


	@Override
	public List<BookDtls> getRecent() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b =null;
		try
		{
			String sql="select * from book_detail where bookType=? and status=? order by book_Id DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next())
			{
				b=new BookDtls();
				b.setBook_Id(rs.getInt(1));
				b.setName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookType(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				b.setStock(rs.getInt(9));
				b.setTOB(rs.getString(10));
			list.add(b);
			i++;
			
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	
		return list;
	}


	@Override
	public List<BookDtls> getNew() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b =null;
		try
		{
			String sql="select * from book_detail where status=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1, "Active");
			ResultSet rs=ps.executeQuery();
			int i=0;
			while(rs.next())
			{
				b=new BookDtls();
				b.setBook_Id(rs.getInt(1));
				b.setName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookType(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				b.setStock(rs.getInt(9));
				b.setTOB(rs.getString(10));
			list.add(b);
			i++;
			
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	
		return list;
	}

	@Override
	public List<BookDtls> getOld() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b =null;
		try
		{
			String sql="select * from book_detail where bookType=? and status=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			int i=0;
			while(rs.next())
			{
				b=new BookDtls();
				b.setBook_Id(rs.getInt(1));
				b.setName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookType(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				b.setStock(rs.getInt(9));
				b.setTOB(rs.getString(10));
			list.add(b);
			i++;
			
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	
		return list;
	}


	@Override
	public List<BookDtls> getBookByOld(String email, String cate) {
		
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		try
		{
			String sql="select * from book_detail where bookType=? and email=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, cate);
			ps.setString(2, email);
			ResultSet rs=ps.executeQuery();
			int i=0;
			while(rs.next())
			{
				b=new BookDtls();
				b.setBook_Id(rs.getInt(1));
				b.setName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookType(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				b.setStock(rs.getInt(9));
				b.setTOB(rs.getString(10));
				list.add(b);
				i++;
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public boolean oldBookDelete(String email, String cat, int id) {
		
		boolean f=false;
		try
		{
			String sql="delete from book_detail where bookType=? and email=? and book_Id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, cat);
			ps.setString(2, email); 
			ps.setInt(3, id);
			
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}


	@Override
	public List<BookDtls> getBookBySearch(String ch) {
	
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		try
		{
			String sql="select * from book_detail where name like ? or author like ? or bookType like? and status=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");
			ResultSet rs=ps.executeQuery();
			int i=0;
			while(rs.next())
			{
				b=new BookDtls();
				b.setBook_Id(rs.getInt(1));
				b.setName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookType(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				b.setStock(rs.getInt(9));
				b.setTOB(rs.getString(10));
				list.add(b);
				i++;
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
}


	@Override
	public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
		List<Cart> book =new ArrayList<>();
		try
		{
			 if (cartList.size() > 0) {
			{
				for(Cart item:cartList)
				{
					String sql="select * from book_detail where book_id=?";
					PreparedStatement ps=conn.prepareStatement(sql);
					ps.setInt(1, item.getBid());
					ResultSet rs=ps.executeQuery();
					while(rs.next())
					{
						Cart row=new Cart();
						row.setBid(rs.getInt("bid"));
						row.setBookName(rs.getString("bookName"));
					}
					
				}
			}
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return book;
	}

	@Override
	public List<BookDtls> getComic()
	{
	List<BookDtls> list=new ArrayList<BookDtls>();
	BookDtls b =null;
	try
	{
		String sql="select * from book_detail where TOB=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1,"comic");
	
		ResultSet rs=ps.executeQuery();
		int i=1;
	while(rs.next())     //while(rs.next() && i<=6)
		{
			b=new BookDtls();
			b.setBook_Id(rs.getInt(1));
			b.setName(rs.getString(2));
			b.setAuthor(rs.getString(3));
			b.setPrice(rs.getString(4));
			b.setBookType(rs.getString(5));
			b.setStatus(rs.getString(6));
			b.setPhoto(rs.getString(7));
			b.setEmail(rs.getString(8));
		list.add(b);
		i++;
		
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
	return list;
}

	@Override
	public List<BookDtls> getHorror() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b =null;
		try
		{
			String sql="select * from book_detail where TOB=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"horror");
		
			ResultSet rs=ps.executeQuery();
			int i=1;
		while(rs.next())     //while(rs.next() && i<=6)
			{
				b=new BookDtls();
				b.setBook_Id(rs.getInt(1));
				b.setName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookType(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
			list.add(b);
			i++;
			
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return list;
	

		}


	@Override
	public List<BookDtls> getProgramming() {
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b =null;
		try
		{
			String sql="select * from book_detail where TOB=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"programming");
		
			ResultSet rs=ps.executeQuery();
			int i=1;
		while(rs.next())     //while(rs.next() && i<=6)
			{
				b=new BookDtls();
				b.setBook_Id(rs.getInt(1));
				b.setName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookType(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
			list.add(b);
			i++;
			
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return list;
	

	
	
	}
}
