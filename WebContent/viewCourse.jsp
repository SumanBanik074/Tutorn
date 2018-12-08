<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	if (session.getAttribute("email_id") == "" || session.getAttribute("email_id") == null) {
		session.setAttribute("flash_msg", "Please login to view content!");
		response.sendRedirect("adminStartActivity.jsp");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--Import Google Icon Font-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!--Import materialize.css-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/js/materialize.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/css/materialize.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="shortcut icon"
	href="https://inspiredcourses.com/wp-content/uploads/2018/01/Inspired-Courses-Favicon.png" />
<title>Admin Section</title>
</head>
<body>
	<nav class="nav-extended green darken-1">
	<div class="nav-wrapper">
		<a href="/onlineCourse/admin.jsp"
			class="w3-bar-item w3-button brand-logo"><span
			class="w3-padding w3-black w3-opacity-min"> TUTORN</span></a>

		<ul id="nav-mobile" class="right hide-on-med-and-down">
			<li><a href=""><%=session.getAttribute("name")%></a></li>
			<li><a href="logout_admin.jsp">Logout</a></li>
		</ul>
	</div>
	</nav>
	<br>
	<br>
	<br>
	<%@page import="getdatabase.*,java.sql.*,java.util.*"%>
	<%
		try {
			Connection cn = DataConn.getData();
			String course_id = request.getParameter("course_id");
			String sql = "select * from course where course_id=?";
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setString(1, course_id);
			session = request.getSession(true);
			session.setAttribute("course_id", course_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
	%>
	<div class="container">
		<div class="row">
			<p class="black">
			<table class="highlight">
				<thead>
					<tr>
						<th colspan=4><h1 class="black-text">Course Details</h1></th>
						<th class="right-align"><a
							class="waves-effect waves-light btn"
							href="deleteCourse.jsp?course_id=<%=rs.getString(1)%>">Delete
								course</a></th>
					</tr>
				</thead>
				<tbody style="font-size: 18px;">
					<tr>
						<td colspan=2><b>Course ID:</b></td>
						<td><%=rs.getString(1)%></td>
						<td><b>Course Name:</b></td>
						<td><%=rs.getString(2)%></td>
					</tr>
					<tr>
						<td><b>Course Objective:</b></td>
						<td colspan=4><%=rs.getString(3)%></td>
					</tr>
					<tr>
						<td><b>Course Audience:</b></td>
						<td colspan=4><%=rs.getString(4)%></td>
					</tr>
					<tr>
						<td><b>Course Prerequisite:</b></td>
						<td colspan=4><%=rs.getString(5)%></td>
					</tr>
					<tr>
						<td><b>Course Outcome:</b></td>
						<td colspan=4><%=rs.getString(6)%></td>
					</tr>
					<tr>
						<td><b>No of Chapters:</b></td>
						<td colspan=4><%=rs.getString(7)%></td>
					</tr>
				</tbody>
				<%
					}
				%>

			</table>
			<br>
			<br>
			<table class="highlight">
				<thead>
					<tr>
						<th style="font-size: 22px;" colspan=3>Chapters:</th>
						<th class="right-align">
							<form action="UploadServlet" method="post"
								enctype="multipart/form-data">
								<div class="form-group">
									<input type="file" name="file_name" id="file_name"><input
										type="submit">
									<p style="color: red; text-align: right; font: italic;">*File
										name should be same as chapter name and file should be in .pdf
										format</p>
								</div>
							</form>
						</th>
					</tr>
					<%
						} catch (Exception e) {
							System.out.println(e);
						}
					%>
					<tr>
						<th>Chapter ID</th>
						<th>Chapter Name</th>
						<th>--------</th>
						<th>--------</th>
						<th>--------</th>
					</tr>
				</thead>
				<tbody>
					<%@page import="getdatabase.*,java.sql.*,java.util.*"%>
					<%
						try {
							Connection cn = DataConn.getData();
							String course_id = request.getParameter("course_id");
							String sql = "select * from chapter where course_id=?";
							PreparedStatement ps = cn.prepareStatement(sql);
							ps.setString(1, course_id);
							ResultSet rs = ps.executeQuery();
							while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getString(1)%></td>
						<td><%=rs.getString(2)%></td>
						<td><a class="waves-effect waves-light btn"
							href="deleteChapter.jsp?chapter_id=<%=rs.getString(1)%>&course_id=<%=rs.getString(4)%>">Delete</a></td>
						<td><a class="waves-effect waves-light btn"
							href="createQuiz.jsp?chapter_id=<%=rs.getString(1)%>&course_id=<%=rs.getString(4)%>">Create Quiz</a></td>
						<td><a class="waves-effect waves-light btn"
							href="viewQuiz.jsp?chapter_id=<%=rs.getString(1)%>&course_id=<%=rs.getString(4)%>">View Quiz</a></td>
					</tr>
					<%
						}
					%>
					<%
						} catch (Exception e) {
							System.out.println(e);
						}
					%>
				</tbody>
			</table>
		</div>
	</div>






	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
	<br>
	<br>


	<footer class="w3-center w3-padding-16 green darken-1">
	<p>
		2018 <a href="/onlineCourse/admin.jsp" class="w3-bar-item w3-button"><span
			class="w3-padding w3-black w3-opacity-min"> Online</span> <span
			class="w3-hide-small" style="color: white;">Course</span></a>
	</p>
	</footer>
</body>
</html>