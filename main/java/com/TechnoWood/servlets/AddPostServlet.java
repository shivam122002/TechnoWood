package com.TechnoWood.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.TechnoWood.dav.PostDao;
import com.TechnoWood.entities.Post;
import com.TechnoWood.entities.User;
import com.TechnoWood.helper.ConnectionProvider;
import com.TechnoWood.helper.Helper;

@MultipartConfig
@WebServlet("/AddPostServlet")
public class AddPostServlet extends HttpServlet 
{
  public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException 
  {
	  PrintWriter out=response.getWriter();
	  
	// Fetching data from Add Post Form from the 
	  
	  
	  
	 int cid=Integer.parseInt(request.getParameter("cid"));
	 String post_title=request.getParameter("post_title");
	 String post_content=request.getParameter("post_content");
	 String post_code=request.getParameter("post_code");
	 Part part=request.getPart("post_pic");
	 
	 // Getting current user id
	 HttpSession s= request.getSession();
	 User user=(User)s.getAttribute("currentUser");
	 user.getId();
	 
	 
	 Post p=new Post(post_title,post_content,post_code,part.getSubmittedFileName(),null, cid,user.getId());
	 PostDao dao=new PostDao(ConnectionProvider.getConnection());
	 
	 if(dao.savePost(p)) {
		
		 String path=request.getRealPath("/") + "blog_pics"+ File.separator + part.getSubmittedFileName();
		 Helper.saveFile(part.getInputStream(), path);
		 out.println("Done");
	 }
	 else {
		 out.println("Error");
	 }
  }  
}
