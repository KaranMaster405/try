package com.DAO;
import com.entity.*;

import java.util.*;
public interface BookDAO {

	public boolean addBooks(BookDtls b);
	
	public List<BookDtls> getAllBooks();
	
	public BookDtls getBookById(int id,int stock);
	public BookDtls getBookById(int id);
	
	public boolean updateEditBooks(BookDtls b);
	
	public boolean deleteBooks(int id);
	
	public List<BookDtls> getNewBook();
	public List<BookDtls> getRecentBook();
	public List<BookDtls>getOldBook();
	
	public List<BookDtls> getRecent();
	public List<BookDtls> getNew();
	public List<BookDtls> getOld();
	
	public List<BookDtls> getBookByOld(String email,String cate);
	
	public boolean oldBookDelete(String email, String cat, int id);
	
	public List<BookDtls> getBookBySearch(String ch);
	public List<Cart> getCartProducts (ArrayList<Cart> cartList);
	
	public List<BookDtls> getComic();
	public List<BookDtls> getHorror();
	public List<BookDtls> getProgramming();
	
}
