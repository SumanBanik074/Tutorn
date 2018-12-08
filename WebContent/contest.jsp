<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	if (session.getAttribute("email_id") == "" || session.getAttribute("email_id") == null) {
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
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

</head>
<body>
	<div class="w3-top">
		<div class="w3-bar w3-white w3-wide w3-padding w3-card">
			<a href="/onlineCourse/mainActivity.jsp"
				class="w3-bar-item w3-button"><span
				class="w3-padding w3-black w3-opacity-min">TUTORN</span></a>
			<!-- <div class="col-sm-4 col-sm-offset-1">
				<div id="imaginary_container">
					<div class="input-group stylish-input-group">
						<input type="text" class="form-control" placeholder="Search">
						<span class="input-group-addon">
							<button type="submit">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</span>
					</div>
				</div>
			</div>  -->
			<!-- Float links to the right. Hide them on small screens -->
			<div class="w3-right w3-hide-small">
				<a href="/onlineCourse/userProfileActivity.jsp"
					class="w3-bar-item w3-button"><%=session.getAttribute("first_name")%>&nbsp;<%=session.getAttribute("last_name")%></a>
				<a href="logoutUser.jsp" class="w3-bar-item w3-button"><span
					class="glyphicon glyphicon-off"></span>Logout</a>

			</div>
		</div>
	</div>

	<br>
	<br>
	<br>
	<br>
	<%@page import="getdatabase.*,java.sql.*,java.util.*"%>
	<div class="container">
	<h1>Questions:</h1>
	<form action="result.jsp" method="post">
	<%
		try{
			Connection cn = DataConn.getData();
			String course_id = request.getParameter("course_id");
			String chapter_id = request.getParameter("chapter_id");
			session.setAttribute("course_id", course_id);
			session.setAttribute("chapter_id", chapter_id);
			
			String sql="select * from quiz_tab where qus_id in (select qus_id from quiz_course where chapter_id=? and course_id=?)";
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setString(1, chapter_id);
			ps.setString(2, course_id);
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while(rs.next()){
	%>
		<div class="container well" style="font-size: large;">
			<%=i%>.&nbsp;&nbsp;<%=rs.getString(2) %><br><br>
			<input type="radio" value="<%=rs.getString(3) %>" name="op<%=i%>"/>&nbsp;&nbsp;<%=rs.getString(3) %><br>
			<input type="radio" value="<%=rs.getString(4) %>" name="op<%=i%>"/>&nbsp;&nbsp;<%=rs.getString(4) %><br>
			<input type="radio" value="<%=rs.getString(5) %>" name="op<%=i%>"/>&nbsp;&nbsp;<%=rs.getString(5) %><br>
			<input type="radio" value="<%=rs.getString(6) %>" name="op<%=i%>"/>&nbsp;&nbsp;<%=rs.getString(6) %><br>
		</div>
	<%
			i++;
			}
			
		}catch(Exception exception){
			System.out.println(exception);
		}
	%>
	<button type="submit" class="btn btn-lg btn-success" style="" value="Submit">Submit</button>
	</form>
	</div>
	<br><br>
	<!-- Footer -->
	<footer class="w3-center w3-green w3-padding-16">
		<p>
			2018 <a href="/onlineCourse/mainActivity.jsp"
				class="w3-bar-item w3-button"><span
				class="w3-padding w3-black w3-opacity-min"> Online</span> <span
				class="w3-hide-small" style="color: white;">Course</span></a>
		</p>
	</footer>
</body>
</html>