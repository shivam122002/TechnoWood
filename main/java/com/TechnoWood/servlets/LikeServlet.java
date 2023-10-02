package com.TechnoWood.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TechnoWood.dav.LikeDao;
import com.TechnoWood.helper.ConnectionProvider;

@WebServlet("/LikeServlet")

public class LikeServlet extends HttpServlet
{
  public  void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException 
  {
	  PrintWriter out=response.getWriter();
	  String operation=request.getParameter("operation");
	  int user_id=Integer.parseInt(request.getParameter("uid"));
	  int post_id=Integer.parseInt(request.getParameter("pid"));
	  
//	  out.println("Data from Server");
//	  out.println(operation);
//	  out.println(user_id);
//	  out.println(post_id);
	  
	  if(operation.equals("like")) 
	  {
		  LikeDao likedao=new LikeDao(ConnectionProvider.getConnection());
		  
		  boolean f=likedao.insertLike(post_id, user_id);
		  
		  out.println(f);
		  
	  }
	  
  }
}
