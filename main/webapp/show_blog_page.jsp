<%@page import="com.TechnoWood.entities.User" %>    
<%@ page errorPage="error_page.jsp" %>
<%@ page import="com.TechnoWood.entities.Message"  %>
<%@ page import="com.TechnoWood.dav.PostDao" %>
<%@ page import="com.TechnoWood.dav.UserDao" %>
<%@ page import="com.TechnoWood.dav.LikeDao" %>
<%@ page import="java.util.*" %>
<%@ page import="com.TechnoWood.helper.ConnectionProvider" %>
<%@ page import ="com.TechnoWood.entities.Category" %>
<%@ page import="com.TechnoWood.entities.Post"  %>
<%@ page import= "java.sql.Timestamp.*" %>
<%@ page import="java.text.*" %>



<%
 
    User user=(User)session.getAttribute("currentUser");
    if(user==null){
    	response.sendRedirect("login.jsp");
    }
 %>
 
<%

  int post_id=Integer.parseInt(request.getParameter("post_id"));
  PostDao postdao =new PostDao(ConnectionProvider.getConnection());
  Post p=postdao.getPostById(post_id);

%>
  

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=p.getPTitle() %></title>
</head>
 <!-- Css  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="css/myStyle.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
    .banner-background{
       clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 85%, 76% 93%, 27% 90%, 0 99%, 0 0);
    }
    .post-title
    {
       font-weight:100;
       font-size:30px;
    }
    .post-content
    {
      font-weight:100;
      font-size:25px;
    }
    .post-date
    {
       font-style:italic;
       font-weight:bold;
       font-size:8px;
    }
    .post-user-info
    {
       font-size:20px;
       font-weight:200;
       
       
    }
    .row-user
    {
      border:1px solid #e2e2e2;
      padding-top:15px;
    }
    
    body
    {
     
      background-color:prmary-;
      background-attachement:fix;
    }
</style>

<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v16.0" nonce="lFSD669N"></script>
<body >

<!-- Nav Bar -->

<nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span>TechnoWood</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="profile.jsp"><span class="fa fa-home"></span> Home<span class="sr-only">(current)</span></a>
      </li>
     
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <span class="fa fa-navicon"></span> Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming Language</a>
          <a class="dropdown-item" href="#">Projects Implementations </a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Structure</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#"><span class="fa fa-address-book-o"></span> Contact</a>
      </li>
    </ul>
    <ul class="navbar-nav mr-right">
    <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#profile-model"><span class="	fa fa-user-circle"></span> <%= user.getName() %></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="LogoutServlet" method="GET"><span class="	fa fa-sign-out"></span> Log out</a>
      </li>
    </ul>
  </div>
</nav>

<!-- End Nav Bar -->

<!-- Main content of the body -->

 <div class="container">
    <div class="row my-2">
      <div class="col-md-8 offset-md-2">
          <div class="card">
             <div class="card-header primary-background text-white">
                <h4 class="post-title"><%=p.getPTitle() %></h4>
               
             </div>
             <div class="body">
               <div class="image" style="border:2px solid blue;">
               <img src="blog_pics/<%=p.getPpic() %>" class="card-img-top my-2" >
               </div>
            
                             <div class="row my-3 row-user-info">
                                <div class="col-md-10">
                                    <% UserDao ud = new UserDao(ConnectionProvider.getConnection());%>

                                    <p class="post-user-info"><i><span class="fa fa-user"></span></i> <a href="#!"><%=ud.getUserNameByUserId(p.getUserId()).getName() %></a> has posted : </p>
                                </div>

                                <div class="col-md-0">
                                    <p class="post-date"><%=p.getDate().toLocaleString()%></p>
                                </div>
                            </div>
                   
                    <p class="post-content"><%=p.getPContent() %></p>         
                 <div>
                   <div class="post-code">
                     <pre><%=p.getPCode()%></pre>
                   </div>
                 </div>
             <div class="card-footer  primary-background ">
	                
	             <%
	                LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
	             %>
	             <a href="#!" onclick="doLike(<%=p.getPid()%>,<%=user.getId() %>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"> <%=ld.countLikeOnPost(p.getPid()) %></span></a>&nbsp &nbsp
	              <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span> 200</span></a>  
	        </div>
	        
	        <div class="card-footer">
	              
	                <div class="fb-comments" data-href="http://localhost:9090/com.TechnoWood/show_blog_page.jsp?post_id=<%=p.getPid() %>" data-width="" data-numposts="5"></div>
	            
	             </div>
	        
          </div>
      </div>
    </div>
   
  </div>

<!-- end of main content of body  -->



<!-- Start of Profile Model -->


<!-- Modal -->
<div class="modal fade" id="profile-model" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header primary-background text-white">
        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container text-center">
           <img src="pics/<%=user.getProfile() %>" class="img-fluid" style="border-radius:100% ;max-width:100px">
           <h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName() %></h5>
           
           
           <!-- Other details -->
            <div id="profile-details">
               <table class="table">
              <tbody>
                 <tr>
                  <th scope="row">Status:</th>
                  <td><%=user.getAbout() %></td>
                 </tr>
                  <tr>
                   <th scope="row">User_ID:</th>
                   <td><%=user.getId() %></td>
                  </tr>
                  <tr>
                   <th scope="row">Email</th>
                   <td><%=user.getEmail() %></td>
                 </tr>
                 <tr>
                  <th scope="row">Gender:</th>
                  <td><%=user.getGender() %></td>
                 </tr>
                 
             </tbody>
         </table> 
       </div>
       
   <!-- Profile Edit -->
        <div id="profile-edit" style="display:none">
            <h4 class="mt-2">Update Your Information</h4>
            <form action="EditServlet" method="POST" enctype="multipart/form-data">
               <table class="table">
                <tr>
                    <td>User_ID:</td>
                    <td><%=user.getId() %></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="email" name="user_email" class="form-control" value="<%=user.getEmail()%>"></td>
                </tr>
                 <tr>
                    <td>Name:</td>
                    <td><input type="text" name="user_name" class="form-control" value="<%=user.getName()%>"></td>
                </tr>
                 <tr>
                    <td>Password:</td>
                    <td><input type="password" name="user_password" class="form-control" value="<%=user.getPassword()%>"></td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td><%=user.getGender() %></td>
                </tr>
                <tr>
                    <td>About:</td>
                    <td><textArea rows="3"class="form-control" name="user_about"><%=user.getAbout() %></textArea></td>
                </tr>
                <tr>
                    <td>New Pic:</td>
                    <td><input type="file" name="profile_pic" class="form-control"></td>
                </tr>
                
               </table>
               <div class="container"><button type="submit" class="btn btn-outline-primary">Save</button></div>
            </form>
        </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button  id="edit-profile-button"type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>





<!-- End Of Profile Mode -->

<!-- javascripts -->


<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert@2.1.2/dist/sweetalert.min.js"></script>
<script src="js/myScript.js"></script>

<!-- js For Edit Profiles  -->
<script>
     $(document).ready(function(){
    	 let editStatus=false;
    	 $('#edit-profile-button').click(function(){
    		 
    		 if(editStatus==false)
    		 {

        		 $("#profile-details").hide();
        		 $("#profile-edit").show();
        		 editStatus=true;
        	     $(this).text("Back");
        	     
    		 }
    		 else
    		 {
    			 $("#profile-details").show();
        		 $("#profile-edit").hide();
        		 editStatus=false;
        		 $(this).text("Edit")
    		 }
    		 
    		 })
    	 
     })
     
</script>
</body>
</html>