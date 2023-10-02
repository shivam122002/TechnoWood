package com.TechnoWood.dav;
import com.TechnoWood.entities.*;
import java.sql.*;
import java.text.DateFormat;

public class UserDao {
    
	 private Connection con;
	 
	 public UserDao(Connection con){
		 this.con=con;
	 }
	 
	 // Method to insert data into database;
	 
	 public boolean  saveUser(User user) {
		 
		 boolean f=false;
		 try 
		 {
			 // Query for data insertion
			 
			
			 String query="INSERT INTO user(name,email,password,gender,about) VALUES (?,?,?,?,?)";
			 
			 PreparedStatement pstmt=this.con.prepareStatement(query);
			 
			 // inserting into database 
			 pstmt.setString(1, user.getName());
			 pstmt.setString(2, user.getEmail());
			 pstmt.setString(3, user.getPassword());
			 pstmt.setString(4, user.getGender());
			 pstmt.setString(5, user.getAbout());
			
			 pstmt.executeUpdate();
			 f=true;
			 
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		 return f;
	 }
	 
	 // get user by user eamil and user password
	 
	 public User getUserByEmailAndPassword(String email,String password) {
		 User user=null;
	    
		 try 
		 {
			String query="SELECT *FROM user WHERE email=? AND password=?" ;
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			
			ResultSet set=pstmt.executeQuery();
			
			if(set.next()) 
			{
				user=new User();
				
				// took data from databasae &set Them into setting to the setter
				 
				user.setName(set.getString("name"));
				user.setId(set.getInt("id"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setAbout(set.getString("about"));
				user.setProfile(set.getString("profile"));
			}
			
		 }
		 catch(Exception e)
		 {
			e.printStackTrace();
		 }
		 
	    return user;
	 }
	 
	 // function for updating data into database
	 
	 public boolean updateUser(User user) 
	 {
		 
		 boolean flag=false;
		 try 
		  {
			  String query="UPDATE user SET name=?, email=?, password=?,gender=?,about=?,profile=? WHERE id=?";
			  PreparedStatement pstmt=con.prepareStatement(query);
			  pstmt.setString(1,user.getName());
			  pstmt.setString(2,user.getEmail());
			  pstmt.setString(3,user.getPassword());
			  pstmt.setString(4,user.getGender());
			  pstmt.setString(5,user.getAbout());
			  pstmt.setString(6,user.getProfile());
			  pstmt.setInt(7, user.getId());
			  
			  pstmt.executeUpdate();
			 
			  flag=true;
			  
			  
		  }
		  catch(Exception e) 
		  {
			  e.printStackTrace();
		  }
		 
		 return flag;
	 }
	 
	 
	 // Get user name by using post id ID
	 
	 public User getUserNameByUserId(int user_id) throws SQLException 
	 {
		 User user=null;
		 String query="SELECT*FROM user WHERE id=?";
		 PreparedStatement ps=this.con.prepareStatement(query);
		 ps.setInt(1, user_id);
		 ResultSet rs=ps.executeQuery();
		 if(rs.next()) 
			{
				user=new User();
				
				// took data from databasae &set Them into setting to the setter
				 
				user.setName(rs.getString("name"));
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setAbout(rs.getString("about"));
				user.setProfile(rs.getString("profile"));
			}
		 return user;
	 }
	 
}
