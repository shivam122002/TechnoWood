package com.TechnoWood.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TechnoWood.dav.UserDao;
import com.TechnoWood.entities.User;
import com.TechnoWood.helper.ConnectionProvider;

@MultipartConfig
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet 
{
 public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException 
 {
	  PrintWriter out=response.getWriter();
	 
	  String check=request.getParameter("check");
	  if(check==null)
	  {
		  out.println("Please make sure you check Terms & condition");
	  }
	  else
	  {
		  String name=request.getParameter("user_name");
		  String email=request.getParameter("user_email");
		  String password=request.getParameter("user_password");
		  String gender =request.getParameter("user_gender");
		  String about=request.getParameter("about");
		  
		  //Create object of User and pass the value of the constructor of that class
		  
		  User user=new User(name,email,password,gender,about);
		  
		  
		  // create UserDao object to send all the data into database
		  
		  UserDao dao=new UserDao(ConnectionProvider.getConnection());
		  
		  // saveUser is a method ,to store data in database
		  if(dao.saveUser(user)) 
		  {
			  out.println("Done..");
		  }
		  else
		  {
			  out.println("Something went wrong,Please try again");
		  }
	  }
	 
 } 
}
