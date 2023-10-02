<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="css/myStyle.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
    .banner-background{
     clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 60%, 80% 100%, 30% 100%, 0 85%, 0 0);
    }
</style>
</head>
<body>

<!-- Nav bar -->
<%@include file="navbar.jsp" %>
<!-- Registration page -->

<main class="primary-background p-5 banner-background">
       <div class="row">
         <div class="col-md-6 offset-md-3">
             <div class="card">
                <div class="card-header primary-background text-white text-center">
                  <span class="fa fa-user-plus fa-3x"></span>
                  <p>Register Yourself</p></div>
                   <br>
                <div class="card-body">
                <form id="reg-form" action="RegisterServlet" method="POST">
                   <div class="form-group">
                     <label for="userName"><span class=" "></span>User Name</label>
                     <input type="text" name="user_name" class="form-control" id="userName"  placeholder="Enter user name">
                  </div>
                    <div class="form-group">
                     <label for="email">Email address</label>
                     <input type="email" class="form-control" name="user_email" id="eamil" aria-describedby="emailHelp" placeholder="Enter email">
                     <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                  </div>
                  <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" name="user_password"class="form-control" id="password" placeholder="Password">
                 </div>
                 <div class="form-group">
                    <label for="gender">Gender</label><br>
                    <input type="radio" id="gender" name="user_gender"  value="Male"> Male &nbsp 
                    <input type="radio" id="gender" name="user_gender" value="Female"> Female
                 </div>
                 <div class="form-group">
                  <textarea name="about"  class="form-control" id=""  rows="5" placeholder="Enter something about yourself"></textarea>
                 </div>
                 <div class="form-check">
                   <input name="check" type="checkbox" class="form-check-input" id="Check" >
                   <label class="form-check-label" for="Check">terms & condition</label>
                </div>
                <br>
                <div class="container text-center" id="loader" style="display:none">
                    <span class="fa fa-spinner fa-spin fa-4x"></span>
                    <h4>Please Wait..</h4>
                </div>
                <button  type="submit" id="smbit-btn" class="btn btn-primary">Submit</button>
               </form>
             </div>
         </div>
       </div>
     </div>
  </main>


<!-- javascripts -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script href="js/myScript.js"></script>
 <script>
            $(document).ready(function () {
                console.log("loaded........")
                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);
                    $("#submit-btn").hide();
                    $("#loader").show();
                    //send register servlet:
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)
                            $("#submit-btn").show();
                            $("#loader").hide();
                            if (data.trim() === 'Done..')
                            {
                                swal("Registered successfully..We are going to redirect to login page")
                                        .then((value) => {
                                            window.location = "login.jsp"
                                        });
                            } else
                            {
                                swal(data);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#submit-btn").show();
                            $("#loader").hide();
                            swal("something went wrong..try again");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
</body>
</html>