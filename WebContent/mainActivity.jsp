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
<title> TUTORN</title>
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
<style type="text/css">
.stylish-input-group .input-group-addon {
	background: white !important;
}

.stylish-input-group .form-control {
	border-right: 0;
	box-shadow: 0 0 0;
	border-color: #ccc;
}

.stylish-input-group button {
	border: 0;
	background: transparent;
}
</style>
</head>
<body>

	<!-- Navbar (sit on top) -->
	<div class="w3-top">
		<div class="w3-bar w3-white w3-wide w3-padding w3-card">
			<a href="/onlineCourse/mainActivity.jsp"
				class="w3-bar-item w3-button"><span
				class="w3-padding w3-black w3-opacity-min">TUTORN</span> </a>
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
				<a href="#Courses" class="w3-bar-item w3-button">Courses</a> 
				<a href="quizCenter.jsp" class="w3-bar-item w3-button">Quiz</a>
				<a	href="/onlineCourse/userProfileActivity.jsp"
					class="w3-bar-item w3-button"><%=session.getAttribute("first_name")%>&nbsp;<%=session.getAttribute("last_name")%></a>
				<a href="logoutUser.jsp" class="w3-bar-item w3-button"><span
					class="glyphicon glyphicon-off"></span>Logout</a>

			</div>
		</div>
	</div>

	<!-- Header -->
	<header class="w3-display-container w3-content w3-wide"
		style="max-width: 1500px;" id="home">
		<img class="w3-image responsive" src="image/education-858cc07046.jpg"
			alt="image1" width="1500" height="800">
		<div class="w3-display-middle w3-margin-top w3-center">
			<h1 class="w3-xxlarge w3-text-white">
				<span class="w3-padding w3-black w3-opacity-min"><b>TUTORN</b></span>
				
			</h1>
		</div>
	</header>


	<!-- Page content -->
	<div class="w3-content w3-padding" style="max-width: 1564px">
		<!-- course Section -->
		<div class="w3-container w3-padding-32" id="Courses">
			<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Courses</h3>
		</div>
		<!-- course content -->
		<div id="exTab2" class="container">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#1" data-toggle="tab"><h4>Offered
							Courses</h4></a></li>
				<li><a href="#2" data-toggle="tab"><h4>My Courses</h4></a></li>
			</ul>

			<div class="tab-content ">
				<div class="tab-pane fade in active" id="1">
					<br> <br> <br>
					<div class="container">
						<div class="row">
							<div class="col-sm-12">
								<div class="row">
									<%@page import="getdatabase.*,java.sql.*,java.util.*"%>
									<%
										try {
											Connection cn = DataConn.getData();
											String email_id = session.getAttribute("email_id").toString();
											String sql = "select * from course";
											String sql2 = "select * from user_course where email_id=?";
											PreparedStatement ps = cn.prepareStatement(sql);
											PreparedStatement ps2 = cn.prepareStatement(sql2);
											ps2.setString(1, email_id);
											ResultSet rs = ps.executeQuery();
											ResultSet rs2 = ps2.executeQuery();
											ArrayList<String> list = new ArrayList<String>();
											int flag = 0;
											int count = 0;
											while (rs.next()) {
												count++;
												String s1 = rs.getString(1);
												while(rs2.next()){
													String s = rs2.getString(2);
													list.add(s);	
												}
												if(list.contains(s1)){
													flag++;
												}
												else{	
									%>
									<div class="col-sm-3">
										<div>
											<div class="w3-card-4" style="width: 250px;">
												<img class="card-img-top"
													src="image/computer-programmer-coding-on-laptop.jpg"
													alt="Card image" style="width: 100%;">
												<div class="card-body" style="text-align: center;">
													<h3 class="card-title" style="color: gray;"><%=rs.getString(2)%></h3>
													<p class="card-text" style="font-family: monospace;">
														A complete
														<%=rs.getString(2)%>
														course for beginners.
													</p>
													<a
														href="/onlineCourse/enrollCourse.jsp?course_id=<%=rs.getString(1)%>"
														class="btn btn-success">Know more</a>
												</div>
												<br>
											</div>
										</div>
									</div>
									<%
												}
											}
											if(flag == count){
									%>
										<div>
											<h2><%=session.getAttribute("first_name")%>, you have enrolled all courses.</h2>
										</div>
									<%
											}
										} catch (Exception e) {
											System.out.println(e);
										}
									%>
								</div>

							</div>
							<br> <br>
						</div>
					</div><br><br>
				</div>

				<div class="tab-pane fade" id="2">
					<br> <br> <br>
					<div class="container">
						<div class="row">
							<div class="col-sm-12">
								<div class="row">
									<%
										try {
											Connection cn = DataConn.getData();
											String email_id = session.getAttribute("email_id").toString();
											String sql1 = "select * from course where course_id in (select course_id from user_course where email_id=?)";
											PreparedStatement ps1 = cn.prepareStatement(sql1);
											ps1.setString(1, email_id);
											ResultSet rs1 = ps1.executeQuery();
											while (rs1.next()) {
									%>
									<div class="col-sm-3">
										<div>
											<div class="w3-card-4" style="width: 250px;">
												<img class="card-img-top"
													src="image/about_featured-2000x1200.jpg" alt="Card image"
													style="width: 100%;">
												<div class="card-body" style="text-align: center;">
													<h3 class="card-title" style="color: gray;"><%=rs1.getString(2)%></h3>
													<p class="card-text" style="font-family: monospace;">
														A complete
														<%=rs1.getString(2)%>
														course for beginners.
													</p>
													<a
														href="/onlineCourse/courseDetails.jsp?course_id=<%=rs1.getString(1)%>"
														class="btn btn-success lg">View</a>
												</div>
												<br>
											</div>
										</div>
									</div>
									<%
										}
									%>
									<%
										} catch (Exception e) {
											System.out.println(e);
										}
									%>
								</div>

							</div>
							<br> <br>
						</div>
					</div><br><br>
				</div>
			</div>
		</div>
	</div>

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
