package com.TechnoWood.dav;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.TechnoWood.entities.Category;
import com.TechnoWood.entities.Post;

public class PostDao 
{
  Connection con;
  
 public PostDao(Connection con)
  {
	  this.con=con;
  }
  
  public ArrayList<Category>getAllCategories()
  {
	  ArrayList<Category>list=new ArrayList<>();
	  
	  try 
	  {
		  String query="SELECT*FROM categories";
		  Statement st=con.createStatement();
		  ResultSet rs=st.executeQuery(query);
		  
		  while(rs.next()) 
		  {
			  int cid=rs.getInt("cid");
			  String name=rs.getString("name");
			  String descriptions=rs.getString("descriptions");
		  
		      Category c=new Category(cid,name,descriptions);
		      
		      list.add(c);
		      
		  }
		  
		  
	  }
	  catch(Exception e) 
	  {
		  e.printStackTrace();
	  }
	  return list;
  }
  
  
  // Method for save the post 
  
  public boolean savePost(Post p) 
  {
	  boolean flag=false;
	  try 
	  {
		  String query="INSERT INTO  post (ptitle,pcontent,pcode,ppic,catid,user_id) VALUES (?,?,?,?,?,?)";
		  PreparedStatement pstmt=con.prepareStatement(query);
		  pstmt.setString(1,p.getPTitle());
		  pstmt.setString(2, p.getPContent());
		  pstmt.setString(3, p.getPCode());
		  pstmt.setString(4, p.getPpic());
		  pstmt.setInt(5,p.getCatId());
		  pstmt.setInt(6, p.getUserId());
		  
		  pstmt.executeUpdate();
		  
		  flag=true;
		  
	  }
	  catch(Exception e) 
	  {
		  e.printStackTrace();
	  }
	  
	  return flag;
  }
  
   
   //Get All the Posts
  
  
  public ArrayList<Post>getAllPost()
  {
	  ArrayList<Post>List=new ArrayList<>();
	  
	  //Fetch all the Post
	  
	  try 
	  {
		  PreparedStatement p=con.prepareStatement("SELECT*FROM post order by pid desc");
		  ResultSet rs=p.executeQuery();
		  
		  while(rs.next()) 
		  {
			  int pid=rs.getInt("pid");
			  String pTitle=rs.getString("ptitle");
			  String pContent=rs.getString("pcontent");
			  String pCode=rs.getString("pcode");
			  String pPic=rs.getString("ppic");
			  Timestamp pDate=rs.getTimestamp("pdate");
			  int catId=rs.getInt("catId");
			  int userId=rs.getInt("user_id");
			  
			  Post post=new Post(pid,pTitle,pContent,pCode,pPic,pDate,catId,userId);
			  List.add(post);
		  }
	  }
	  catch(Exception e) 
	  {
		  e.printStackTrace();
	  }
	  
	  return List;
  }
  
  
  //get all post by category id
  
  public ArrayList<Post>getPostBycatId(int catId)
  {
	  ArrayList<Post>list=new ArrayList<>();
	 
	  //Fetching data
	  
	  try 
	  {
		  PreparedStatement p=con.prepareStatement("SELECT*FROM post WHERE catId=? ");
		  p.setInt(1, catId);
		  ResultSet rs=p.executeQuery();
		  
		  while(rs.next()) 
		  {
			  int pid=rs.getInt("pid");
			  String pTitle=rs.getString("ptitle");
			  String pContent=rs.getString("pcontent");
			  String pCode=rs.getString("pcode");
			  String pPic=rs.getString("ppic");
			  Timestamp pDate=rs.getTimestamp("pdate");
			  int userId=rs.getInt("user_id");
			  
			  Post post=new Post(pid,pTitle,pContent,pCode,pPic,pDate,catId,userId);
			  list.add(post);
		  }
	  }
	  catch(Exception e) 
	  {
		  e.printStackTrace();
	  }
	  
	  return list;
  }
  
  
  public Post getPostById(int pId) throws SQLException 
  {    
	  Post post=null;
      String query="SELECT*FROM post where pid=?";
      PreparedStatement p=this.con.prepareStatement(query);
      p.setInt(1, pId);
      ResultSet rs=p.executeQuery();
      
      if(rs.next()) 
      {
    	  int pid=rs.getInt("pid");
		  String pTitle=rs.getString("ptitle");
		  String pContent=rs.getString("pcontent");
		  String pCode=rs.getString("pcode");
		  String pPic=rs.getString("ppic");
		  Timestamp pDate=rs.getTimestamp("pdate");
		  int userId=rs.getInt("user_id");
		  int catId=rs.getInt("catId");
		  
		  post=new Post(pid,pTitle,pContent,pCode,pPic,pDate,catId, userId);
		 
    	  
      }
      
     return post;
	  
  }
}
