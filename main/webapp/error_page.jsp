<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sorry ! Something Went Wrong</title>
</head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="css/myStyle.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
    .banner-background{
       clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 85%, 76% 93%, 27% 90%, 0 99%, 0 0);
    }
</style>
<body>
  <div class="container text-center">
      <img src="img/computer.png" class="img-fluid">
      <h4 class="display-3">Sorry ! Something Went Wrong...</h4>
      <%=exception %>
      <br>
      <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">Home</a>
  </div>
</body>
</html>