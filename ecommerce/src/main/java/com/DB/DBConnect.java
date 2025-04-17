package com.DB;

import java.sql.*;
public class DBConnect {

	private static Connection conn;
	public static Connection getconn()
	{
		try {Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook_app","root","root");
			System.out.println("hello connecction established");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}								
		return conn;
	}
}

