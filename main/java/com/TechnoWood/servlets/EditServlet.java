package com.TechnoWood.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.TechnoWood.dav.UserDao;
import com.TechnoWood.entities.Message;
import com.TechnoWood.entities.User;
import com.TechnoWood.helper.ConnectionProvider;
import com.TechnoWood.helper.Helper;

@MultipartConfig
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet 
{
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException 
  {
	  PrintWriter out=response.getWriter();
	  
	  // Fetching data from the Update profile page
	  String name=request.getParameter("user_name");
	  String email=request.getParameter("user_email");
	  String password=request.getParameter("user_password");
	  String about=request.getParameter("user_about");
	  Part part=request.getPart("profile_pic");
	  String ImageName=part.getSubmittedFileName();
	  
	  
	  //Get the user from the session
	  HttpSession s=request.getSession();
	  User user=(User)s.getAttribute("currentUser");
	  
	  //Setting updated values of the user
	  
	  user.setEmail(email);
	  user.setName(name);
	  user.setAbout(about);
	  user.setPassword(password);
	  String oldFile=user.getProfile();
	  user.setProfile(ImageName);
	  
	  // Updating data into data base
	  
	 UserDao userDao=new UserDao(ConnectionProvider.getConnection());
	 boolean update=userDao.updateUser(user);
	 
	 if(update==true) {
		
		 
		 // path of current profile picture to delete that
		 @SuppressWarnings("deprecation")
		 String path=request.getRealPath("/") + "pics"+ File.separator + user.getProfile();
		 
		 //To Delete old file 
		 String oldFilePath=request.getRealPath("/") + "pics"+ File.separator + oldFile; 
		     
		    if(!oldFile.equals("default.png")) 
		    {
		        Helper.deleteFile(oldFilePath);
		     }
			 if(Helper.saveFile(part.getInputStream(),path)) 
			 {
				 Message msg=new Message("Profile Details Updated Successfully","success","alert-success");
				  s.setAttribute("msg", msg);
			 }
			 else {
				 Message msg=new Message("Somthing went wrong.. ","error","alert-danger");
				 s.setAttribute("msg", msg);
			 }
			 
	 }
	 else 
	 {
		 Message msg=new Message("Somthing went wrong.. ","error","alert-danger");
		 s.setAttribute("msg", msg);
	 }
	 
	 
	 
	 response.sendRedirect("profile.jsp");
  }
	 
}
