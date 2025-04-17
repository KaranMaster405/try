package com.DAO;
import java.sql.*;


import java.sql.PreparedStatement;

import com.DAO.UserDAOImpl;

import com.entity.*;

public class UserDAOImpl implements UserDAO {
private Connection conn;
public UserDAOImpl(Connection conn)
{
	super();
	this.conn=conn;
}
@Override
public boolean userRegister(User us) {
	boolean f=false;
	try
	{
		String sql="insert into user(name,email,phoneno,password)values(?,?,?,?)";
		PreparedStatement ps =conn.prepareStatement(sql);
		ps.setString(1,us.getName());
		ps.setString(2,us.getEmail());
		ps.setString(3,us.getPhno());
		ps.setString(4,us.getPassword());
		
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

public User login(String username, String password) {
	User us=null;
	try
	{
		String sql="select * from user where name=? and password=?";
		PreparedStatement ps =conn.prepareStatement(sql);
		ps.setString(1,username);      //note here 14:07
		ps.setString(2,password);
		
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			us=new User();
			us.setId(rs.getInt(1));
			us.setName(rs.getString(2));
			us.setEmail(rs.getString(3));
			us.setPhno(rs.getString(4));
			us.setPassword(rs.getString(5));
			
			
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return us;
}
@Override
public boolean checkPassword(int id,String ps) {
	
	boolean f=false;
	try
	{
		String sql="select * from user where id=? and password=?";
		PreparedStatement pst =conn.prepareStatement(sql);
		pst.setInt(1,id);
		pst.setString(2, ps);
		ResultSet rs=pst.executeQuery();
		while(rs.next())
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
public boolean updateProfile(User us) {
	
	boolean f=false;
	try
	{
		String sql="update user set name=?, email=?, phoneno=? where id=?";
		PreparedStatement ps =conn.prepareStatement(sql);
		ps.setString(1,us.getName());
		ps.setString(2,us.getEmail());
		ps.setString(3,us.getPhno());
		ps.setInt(4,us.getId());
		
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
public boolean checkUser(String em) {
	
	boolean f=false;
	try
	{
		String sql="select * from user where email=?";
		PreparedStatement ps =conn.prepareStatement(sql);
		
		ps.setString(1,em);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			f=false;
		}
		
	
		}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
	return f;
}



}
