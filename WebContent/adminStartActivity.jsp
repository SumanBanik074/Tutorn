<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html >

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Section</title>
  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

  <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'>
<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

      <link rel="stylesheet" href="CSS/styleAdmin.css">

  
</head>

<body>

  
<!-- Form Mixin-->
<!-- Input Mixin-->
<!-- Button Mixin-->
<!-- Pen Title-->
<div class="pen-title">
  <h1>Login for Moderator</h1>
</div>
<!-- Form Module-->
<div class="module form-module">
  <div class="toggle"><i class="fa fa-times fa-pencil"></i>
    <div class="tooltip">Click Me</div>
  </div>
  <div class="form">
    <h2>Login to your account</h2>
    <% if(session.getAttribute("flash_msg") != "" && session.getAttribute("flash_msg") != null) { %>
   		<div class="alert alert-warning text-center"><h4 style="color: red;"><strong>*Alert!</strong> <%=session.getAttribute("flash_msg")%></h4></div>
  	<% session.removeAttribute("flash_msg"); } %>
    <form id="form1" action="admin_login" method="post">
      <input type="email" placeholder="Email_id" name="email_id">
      <input type="password" placeholder="Password" name="password">
      <button>Login</button>
    </form>
  </div>
  <div class="form">
    <h2>Create an account</h2>
    <form id="form2" action="insert_admin" method="post">
    	<input type="email" placeholder="Email Address" name="email_id" required="required">
      	<input type="text" placeholder="Enter your name" name="name" required="required">
      	<input type="password" placeholder="Password" name="password" required="required">
      	<input type="password" placeholder="Rewrite password" name="repassword" required="required">
      	<button>Register</button>
    </form>
  </div>
  <div class="cta"><a href="http://andytran.me">Forgot your password?</a></div>
</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://codepen.io/andytran/pen/vLmRVp.js'></script>

  

    <script  src="JS/index.js"></script>




</body>

</html>
