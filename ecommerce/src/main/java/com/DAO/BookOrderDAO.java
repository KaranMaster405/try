package com.DAO;
import java.util.*;

import com.entity.*;
public interface BookOrderDAO {

//	public int getOrderNo();
	public boolean saveOrder(List<Book_Order> blist);
	
	public List<Book_Order> getBook(String email);
	
	public List<Book_Order> getAllOrder();
	
}
