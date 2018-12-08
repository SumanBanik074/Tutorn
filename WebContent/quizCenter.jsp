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
				class="w3-padding w3-black w3-opacity-min"> TUTORN</span></a>
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
		<div class="row">
			<div class="col-sm-12">
				<div class="row">
					<%
						try {
							Connection cn = DataConn.getData();
							String email_id = session.getAttribute("email_id").toString();
							String sql1 = "select * from course where course_id in (select course_id from user_course where email_id=?)";
							String sql2 = "select * from chapter where course_id in (select course_id from user_course where email_id=?)";
							PreparedStatement ps = cn.prepareStatement(sql1);
							PreparedStatement ps1 = cn.prepareStatement(sql2);
							ps.setString(1, email_id);
							ps1.setString(1, email_id);
							ResultSet rs = ps.executeQuery();
							ResultSet rs1 = ps1.executeQuery();
							while (rs.next()) {
					%>
					<div class="col-sm-3">
						<div>
							<div class="w3-card-4" style="width: 250px;">
								<img class="card-img-top"
									src="image/about_featured-2000x1200.jpg" alt="Card image"
									style="width: 100%;">
								<div class="card-body" style="text-align: center;">
									<h3 class="card-title" style="color: gray;"><%=rs.getString(2)%></h3>
									<a class="btn btn-success" data-toggle="modal" data-target="#myModal">Take a Quiz</a>
								</div>
								<br>
							</div>
						</div>
					</div>
					<%
						}
					%>

				</div>

			</div>
			<br> <br>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Select Chapter</h4>
				</div>
				<div class="modal-body">
				<table>
				<tbody>
				<%
					while(rs1.next()){
						%>
						<tr>
							<td><h3><a href="contest.jsp?course_id=<%=rs1.getString(4)%>&chapter_id=<%=rs1.getString(1)%>"><%=rs1.getString(2) %></a></h3></td>
						</tr>
						<%
					}
				%>	
				</tbody>
				</table>	
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	<%
		} catch (Exception e) {
			System.out.println(e);
		}
	%>

	<br>
	<br>
	<br>

</body>
</html>