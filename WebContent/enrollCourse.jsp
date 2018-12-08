<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% 
    if(session.getAttribute("email_id") == "" || session.getAttribute("email_id") == null) {
		session.setAttribute("flash_msg", "Please login to view content!");
		response.sendRedirect("startActivity.jsp");
	} 
	%>
<!DOCTYPE html>
<html>
<head>
	<title>TUTORN</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<style type="text/css">
		.stylish-input-group .input-group-addon{
    		background: white !important; 
		}
		.stylish-input-group .form-control{
			border-right:0; 
			box-shadow:0 0 0; 
			border-color:#ccc;
		}
		.stylish-input-group button{
    		border:0;
    		background:transparent;
		}
	
	</style>
</head>
<body>

<!-- Navbar (sit on top) -->
<div class="w3-top">
  <div class="w3-bar w3-white w3-wide w3-padding w3-card">
    <a href="/onlineCourse/mainActivity.jsp" class="w3-bar-item w3-button"><span class="w3-padding w3-black w3-opacity-min">
    TUTORN</span></a>
    <div class="col-sm-4 col-sm-offset-1">
    	<div id="imaginary_container"> 
        	<div class="input-group stylish-input-group">
            	<input type="text" class="form-control"  placeholder="Search" >
               	<span class="input-group-addon">
                	<button type="submit">
                    	<span class="glyphicon glyphicon-search"></span>
                    </button>  
                </span>
            </div>
         </div>
    </div>
    <!-- Float links to the right. Hide them on small screens -->
    <div class="w3-right w3-hide-small">
      <a href="mainActivity.jsp#Courses" class="w3-bar-item w3-button">Courses</a>
      <a href="quizCenter.jsp" class="w3-bar-item w3-button">Quiz</a>
      <a href="/onlineCourse/userProfileActivity.jsp" class="w3-bar-item w3-button"><%=session.getAttribute("first_name")%>&nbsp;<%=session.getAttribute("last_name")%></a>
      <a href="logoutUser.jsp" class="w3-bar-item w3-button"><span class="glyphicon glyphicon-off"></span>Logout</a>
      
    </div>
  </div>
</div><br><br><br><br><br><br>
<%@page import="getdatabase.*,java.sql.*,java.util.*"%>
				<%
					try {
						Connection cn = DataConn.getData();
						String course_id = request.getParameter("course_id");
						String sql = "select * from course where course_id=?";
						String sql1 = "select * from chapter where course_id=?";
						PreparedStatement ps = cn.prepareStatement(sql);
						PreparedStatement ps1 = cn.prepareStatement(sql1);
						ps.setString(1, course_id);
						ps1.setString(1, course_id);
						ResultSet rs = ps.executeQuery();
						ResultSet rs1 = ps1.executeQuery();
						int count = 0;
						if(rs.next()) {
							while(rs1.next()){
								count++;
							}
				%>

<!-- page content -->
	<div id="coursedetails" class="container">
		<div class="row">
			<div class="col-md-5 col-sm-5">
				<img src="image/programmer.jpg" style="height: 270px;width: 450px;">
			</div>
			<div class="col-md-7 col-sm-7">
				<h1><%=rs.getString(2) %></h1>
				<p style="color: gray;"><span>Access:&nbsp;</span><strong>Online Streaming</strong>
				<p style="color: gray; font-size: medium;">A Complete <%=rs.getString(2) %> course for beginner. Master in <%=rs.getString(2) %> basics from scratch with Examination and very easy to understand.<br><br>
				<%
							if(count == 0){
				%>
				<div> 
					<a class="btn btn-success btn-lg" id="enroll" onclick="showMsg();">Enroll Here</a>
				</div>
				<p><span id="display" style="color: gray;font: italic;"></span>
				<script type="text/javascript">
					function showMsg(){
						document.getElementById("display").innerHTML = "*This course is currently disable";
					}
				</script>
				<%
							}else{
				%>
				<div> 
					<a href="/onlineCourse/enroll.jsp?course_id=<%=rs.getString(1) %>" class="btn btn-success btn-lg" id="enroll">Enroll Here</a>
				</div>
				<%
							}
				%>
			</div>
		</div>	
		<br><br><br>
		<ul class="nav nav-tabs">
			<li class="active">
        		<a href="#1" data-toggle="tab"><h4>Objective</h4></a>
			</li>
			<li><a href="#2" data-toggle="tab"><h4>Audience</h4></a></li>
			<li><a href="#3" data-toggle="tab"><h4>Prerequisite</h4></a></li>
			<li><a href="#4" data-toggle="tab"><h4>Outcome</h4></a></li>
		</ul><br><br>
		<div class="tab-content container">
		
				<div class="tab-pane fade in active" id="1">
					<h1>Objective</h1><br><br>
          			<p><h3 style="color: gray;"><%=rs.getString(3) %></h3>
				</div>
				<div class="tab-pane fade" id="2">
					<h1>Audience</h1><br><br>
          			<p><h3 style="color: gray;"><%=rs.getString(4) %></h3>
				</div>
				<div class="tab-pane fade" id="3">
					<h1>Prerequisite</h1><br><br>
          			<p><h3 style="color: gray;"><%=rs.getString(5) %></h3>
				</div>
				<div class="tab-pane fade" id="4">
					<h1>Outcome</h1><br><br>
          			<p><h3 style="color: gray;"><%=rs.getString(6) %></h3>
				</div>
				<%} %>
				<%}catch(Exception e){
					System.out.println(e);
				}
				%>
		</div>
	</div>	
 <br><br><br><br>
<!-- Footer -->
<footer class="w3-center w3-green w3-padding-16">
  <p>2018 <a href="/onlineCourse/mainActivity.jsp" class="w3-bar-item w3-button"><span class="w3-padding w3-black w3-opacity-min">
    Online</span> <span class="w3-hide-small" style="color: white;">Course</span></a></p>
</footer>
</body>
</html>
