<%@page import="com.TechnoWood.entities.User" %>    
<%@ page errorPage="error_page.jsp" %>
<%@ page import="com.TechnoWood.entities.Message"  %>
<%@ page import="com.TechnoWood.dav.PostDao" %>
<%@ page import="java.util.*" %>
<%@ page import="com.TechnoWood.helper.ConnectionProvider" %>
<%@page import ="com.TechnoWood.entities.Category" %>
 <%
 
    User user=(User)session.getAttribute("currentUser");
    if(user==null){
    	response.sendRedirect("login.jsp");
    }
 %>
 
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
</head>
 <!-- Css  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="css/myStyle.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
    .banner-background{
       clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 85%, 76% 93%, 27% 90%, 0 99%, 0 0);
    }
</style>


<body >

<!-- Nav Bar -->

<nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span>TechnoWood</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
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
      
      <li class="nav-item">
        <a class="nav-link" href="#"  data-toggle="modal" data-target="#doPostModel"><span class="fa fa-plus-square-o fa-1.5x"></span> Do Post</a>
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

                 <%
                      Message m=(Message)session.getAttribute("msg");
                     if(m!=null){
                    	 %>
                    	 <div class="alert alert-warning alert-dismissible fade show <%=m.getCssClass() %>" role="alert">
                             <strong><%=m.getContent() %></strong>
                             <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                             <span aria-hidden="true">&times;</span>
                             </button>
                          </div>
                  <%
                      session.removeAttribute("msg");
                     }
                  %>
                  
                  
                  
                  
                  
   <!-- Main body of the page -->
     <main>
         <div class="container">
             <div class="row mt-4">
                  <!-- First coloumn -->
                  <div class="col-md-4">
                     <!-- List of Categories -->
                     
                       <div class="list-group">
                         <a href="#" onclick="getPost(0,this)"  class=" c-link list-group-item list-group-item-action active" aria-current="true">All Posts </a>
                         
                         <%
                            PostDao d=new PostDao(ConnectionProvider.getConnection());
                            ArrayList<Category>List1=d.getAllCategories();
                            
                            for(Category cc:List1)
                            {
                            	 
                           %>
                            <a href="#" onclick="getPost(<%=cc.getCid()%>,this)"class="c-link list-group-item list-group-item-action"><%=cc.getCategoryName() %></a>
                          <% 
                            }
                          %>
                        
                        </div>
                     
                     
                     
                  </div>
                  
                  <!-- Second coloumn -->
                
                  <div class="col-md-8  " >
                  <!-- List of all Post -->
                  <div class="container text-center"  id="loader">
                     <i class="fa fa-spinner fa-spin fa-4x"></i>
                     <h3 class="mt-2">Loading...</h3>
                  </div>
                  
                      <div class="container-fluid" id="post-container">
                  
                  </div>
                  
                  </div>
                  
                
             </div>
         </div>
     </main>
    <!-- End of the Main Body -->
    

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






<!--Start of Do Post  Modal -->



<!-- Modal -->

<div class="modal fade" id="doPostModel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Post Something</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         <form action="AddPostServlet" method="POST" id="add-post-form">
         
            <div class="form-group">
                  <select class="form-control" name="cid">
                  <option selected disabled>---Select Category---</option>
                  <%
                     PostDao postd =new PostDao( ConnectionProvider.getConnection());
                     ArrayList<Category>list=postd.getAllCategories();
                     
                     for(Category c:list){
                   %>
                     
                     <option value="<%=c.getCid()%>"><%=c.getCategoryName() %></option>
                   <%
                       }
                     %>
                 </select>
            </div>
            <div class="form-group">
                <input  name="post_title" type="text" placeholder="Enter Post Title" class="form-control">
            </div>
            <div class="from-group">
                <textArea name="post_content" class="form-control" placeholder="Enter Your Content...." style="height:200px"></textArea>
            </div>
            <br>
            <div class="from-group">
                <textArea  name="post_code" class="form-control" placeholder="Enter Your Code/Program(if any)" style="height:200px"></textArea>
            </div>
            <br>
            <div class="form-group">
               <label>Select Your pic:</label>
               <br>
               <input type="file" class="from-control" name="post_pic">
            </div>
            
            <div class="container text-center">
               <button type="submit" class="btn btn-outline-primary">Post </button>
            </div>
         </form>
      </div>
      
    </div>
  </div>
</div>


<!-- End of Do Post Model -->



<!-- javascripts -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert@2.1.2/dist/sweetalert.min.js"></script>
<script href="js/myScript.js"></script>

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


   <!-- Now add JS For Post -->
   
   
   <script>
   $(document).ready(function (e) {
       //
       $("#add-post-form").on("submit", function (event) {
           //this code gets called when form is submitted....
           event.preventDefault();
           console.log("Clicked on Button POST")
           let form = new FormData(this);
           //now requesting to server
           $.ajax({
               url: "AddPostServlet",
               type: 'POST',
               data: form,
               success: function (data, textStatus, jqXHR) {
            	   
            	   console.log(data);
            	   if(data.trim()=='Done')
            	   {
            		   swal("Good job!", "Saved Successfully !", "success");
            	   }
            	   else
            	   {
            		   swal("Error!", "Something Went Wrong!", "Error");
            	   }
               },
               error: function (jqXHR, textStatus, errorThrown) {
                   //error..
            	   swal("Error!", "Something Went Wrong!", "Error");
               },
               processData: false,
               contentType: false
    		  })
    	  })
      })
   
   
   </script>
   
   
   <!-- Loading Post using Ajax -->
   <script>
     function getPost(catId,temp){
    	 
    	 $("#loader").show();
    	 $("#post-container").hide();
    	 
    	 $(".c-link").removeClass('active')
    	 $.ajax({
    		 url:"load_post.jsp",
    	     data:{cid:catId},
    	     success:function(data,textStatus,jqXHR)
    	     {
    	    	 console.log(data);
    	    	 $("#loader").hide();
    	    	 $("#post-container").show();
    	    	 $("#post-container").html(data)
    	    	 $(temp).addClass('active')
    	     }
    	 })
     }
     $(document).ready(function(e){
    	 let allPostRef=$('.c-link')[0]
    	 getPost(0,allPostRef)
     })
   
   </script>
</body>
</html>