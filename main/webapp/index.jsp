<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

 <!-- Css  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="css/myStyle.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
    .banner-background{
       clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 85%, 76% 93%, 27% 90%, 0 99%, 0 0);
    }
</style>
</head>
<body>

<!-- Nava bar -->
<%@include file="navbar.jsp" %>

<!-- Banner -->
 <div class="container-fluid  p-0 m-0 banner-background">
     <div class="jumbotron primary-background text-white">
       <div class="container">
        <h3 class="display-3">Welcome,to Tech Blogs</h3>
        <p>Welcome of Tech Blogs ,World Of Technology
          A programming language is a system of notation for writing computer programs.[1] Most programming languages are text-based formal languages, but they may also be graphical. They are a kind of computer language.
          The description of a programming language is usually split into the two components of syntax (form) and semantics (meaning), which are usually defined by a formal language. Some languages are defined by a specification document (for example, the C programming language is specified by an ISO Standard) while other languages (such as Perl) have a dominant implementation that is treated as a reference. Some languages have both, with the basic language defined by a 
           standard and extensions taken from the dominant implementation being common.
        </p>
        <button class="btn-outline-light btn-lg"><a href="register.jsp"  class="btn-outline-light btn-lg" style="text-decoration:none"> <span class="fa fa-user-plus"></span> Sign Up</a></button>
        <button class="btn-outline-light btn-lg"><a href="login.jsp"  class="btn-outline-light btn-lg" style="text-decoration:none"> <span class="fa fa-user fa-spin"></span> Login</a></button>
      </div>
    </div>
   
 </div>
 
<!-- Cards -->
 <div class="container">
    <div class="row">
      <div class="col-md-4">
          <div class="card">
          <div class="card-body">
           <h5 class="card-title">Java Programming</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          <a href="#" class="btn primary-background text-white">Read More..</a>
       </div>
     </div>
   </div>
     <div class="col-md-4">
          <div class="card">
          <div class="card-body">
           <h5 class="card-title">Java Programming</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          <a href="#" class="btn primary-background text-white">Read More..</a>
       </div>
     </div>
   </div>
     <div class="col-md-4">
          <div class="card">
          <div class="card-body">
           <h5 class="card-title">Java Programming</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          <a href="#" class="btn primary-background text-white">Read More..</a>
       </div>
     </div>
   </div>
  </div>
  <br><br>
 <!-- Second Row -->
 <div class="row">
      <div class="col-md-4">
          <div class="card">
          <div class="card-body">
           <h5 class="card-title">Java Programming</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          <a href="#" class="btn primary-background text-white">Read More..</a>
       </div>
     </div>
   </div>
     <div class="col-md-4">
          <div class="card">
          <div class="card-body">
           <h5 class="card-title">Java Programming</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          <a href="#" class="btn primary-background text-white">Read More..</a>
       </div>
     </div>
   </div>
     <div class="col-md-4">
          <div class="card">
          <div class="card-body">
           <h5 class="card-title">Java Programming</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          <a href="#" class="btn primary-background text-white">Read More..</a>
       </div>
     </div>
   </div>
  </div>
  
</div>
<!-- javascripts -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script href="js/myScript.js"></script>
</body>
</html>