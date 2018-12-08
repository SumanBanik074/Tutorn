<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Tutorn</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
		<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  		<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
		<link rel="stylesheet" href="CSS/particles-style.css">
		<link rel="stylesheet" href="CSS/style.css">
	</head>
	<body>
		<div id="particles-js" style="background-image: url('image/education-background-29.jpg');">
			
			<div id="login">
				<form action="" method="post">
					<div class="form-group">
      					<input type="email" class="form-control" id="email" placeholder="Enter email id." name="email">
    				</div>
    				<div class="form-group">
      					<input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
    				</div>
    				<%
						String login_msg=(String)request.getAttribute("error");  
						if(login_msg!=null)
						out.println("<font color=red size=2px>"+login_msg+"</font>");
					%>
					<br>
    				<a href=""><i>Forget password ?</i></a><br><br>
    				<button type="submit" class="btn btn-success btn-md" formaction="UserLogin" style="margin-left: 60px;">
    				Sign in</button>
    				<button type="submit" class="btn btn-success btn-md" formaction="signUpActivity.jsp" style="margin-right: 60px;">
    				Sign up</button>
    				<% if(session.getAttribute("flash_msg") != "" && session.getAttribute("flash_msg") != null) { %>
   						<div class="alert alert-warning text-center"><h4><strong>Alert!</strong> <%=session.getAttribute("flash_msg")%></h4></div>
  					<% session.removeAttribute("flash_msg"); } %>
				</form>
			</div>
		</div>
		
		<script src="JS/particles.js"></script>
		<script src="JS/app.js"></script>
	</body>
</html>