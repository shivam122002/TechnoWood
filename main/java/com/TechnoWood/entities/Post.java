package com.TechnoWood.entities;

import java.sql.*;

public class Post 
{
	private int pId;
	private String pTitle;
	private String pContent;
	private String pCode;
	private String pPic;
	private Timestamp pDate;
	private int catId;
	private int userId;
	
	
	public Post()
	{
		
	}
	
	public Post(int pId,String pTitle,String pContent,String pCode,String pPic, Timestamp pDate,int  catId,int userId) 
	{
		this.pId=pId;
		this.pTitle=pTitle;
		this.pContent=pContent;
		this.pCode=pCode;
		this.pPic=pPic;
		this.pDate=pDate;
		this.catId=catId;
		this.userId=userId;
		
	}
	
	public Post(String pTitle,String pContent,String pCode,String pPic, Timestamp pDate,int  catId,int userId) 
	{
		this.pTitle=pTitle;
		this.pContent=pContent;
		this.pCode=pCode;
		this.pPic=pPic;
		this.pDate=pDate;
		this.catId=catId;
		this.userId=userId;
		
	}
	
	// Setters and Getters
	
	public void setPid(int pId) 
	{
	   this.pId=pId;	
	}
	public void setPTitle(String pTitle) 
	{
	   this.pTitle=pTitle;	
	}
	public void setPContent(String pContent) 
	{
	   this.pContent= pContent;	
	}
	public void setPCode(String pCode) 
	{
	   this.pCode=pCode;	
	}
	
	public void setPpic(String pPic) 
	{
	   this.pPic=pPic;	
	}
	public void setDate(Timestamp pDate) 
	{
	   this.pDate=pDate;	
	}
	public void setCatId(int catId) 
	{
	   this.catId=catId;	
	}
	public void setUserId(int userId) 
	{
	   this.userId=userId;	
	}
	
	
	//Getters
	public int getPid() 
	{
	   return pId;	
	}
	public String getPTitle() 
	{
	   return pTitle;	
	}
	public String getPContent() 
	{
	   return pContent;	
	}
	public String getPCode() 
	{
	   return pCode;	
	}
	
	public String  getPpic() 
	{
	   return pPic;	
	}
	public Timestamp getDate() 
	{
	  return pDate;	
	}
	public int getCatId() 
	{
	   return catId	;
	}
	public int getUserId() 
	{
	   return userId	;
	}
	
	
	
	
}
