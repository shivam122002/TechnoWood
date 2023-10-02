package com.TechnoWood.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.TechnoWood.dav.UserDao;
import com.TechnoWood.entities.Message;
import com.TechnoWood.entities.Post;
import com.TechnoWood.entities.User;
import com.TechnoWood.helper.ConnectionProvider;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet
{
  public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException 
  {
	  PrintWriter out=response.getWriter();
	  
	  
	  // Fetching data from login page
	  String email=request.getParameter("user_email");
	  String password=request.getParameter("user_password");
	  
	  UserDao dao=new UserDao(ConnectionProvider.getConnection());
	  
	  User u=dao.getUserByEmailAndPassword(email, password);
	  
	  if(u==null) 
	  {
		  //login Error
          //out.println("Invalid Details! Try again.");
		  Message msg=new Message("Invalid ! Details,Try again","error","alert-danger");
		  HttpSession s=request.getSession();
		  s.setAttribute("msg", msg);
		  response.sendRedirect("login.jsp");
	  }
	   
	  else 
	  {
		  HttpSession s=request.getSession();
		  s.setAttribute("currentUser", u);
		  response.sendRedirect("profile.jsp");
	  }
	  
  } 
}
