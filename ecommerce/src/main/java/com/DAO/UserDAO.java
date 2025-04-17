package com.DAO;
import com.entity.*;
public interface UserDAO {
	
public boolean userRegister(User us);
public User login(String username , String password);

public boolean checkPassword( int id,String ps);

public boolean updateProfile(User us);

public boolean checkUser(String em);

}
