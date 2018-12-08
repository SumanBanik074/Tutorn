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
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<link rel='stylesheet prefetch'
	href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="CSS/userProfile.css">
</head>
<body>

	<!-- Navbar (sit on top) -->
	<div class="w3-top">
		<div class="w3-bar w3-white w3-wide w3-padding w3-card">
			<a href="/onlineCourse/mainActivity.jsp"
				class="w3-bar-item w3-button"><span
				class="w3-padding w3-black w3-opacity-min">TUTORN</span></a>
			<div class="col-sm-4 col-sm-offset-1">
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
			</div>
			<!-- Float links to the right. Hide them on small screens -->
			<div class="w3-right w3-hide-small">
				<a href="mainActivity.jsp#Courses" class="w3-bar-item w3-button">Courses</a> <a
					href="quizCenter.jsp" class="w3-bar-item w3-button">Quiz</a> <a
					class="w3-bar-item w3-button"><%=session.getAttribute("first_name")%>&nbsp;<%=session.getAttribute("last_name")%></a>
				<a href="logoutUser.jsp" class="w3-bar-item w3-button"><span
					class="glyphicon glyphicon-off"></span>Logout</a>
				<!-- <a href="#contact" class="w3-bar-item w3-button">Contact</a> -->
			</div>
		</div>
	</div>

	<%@page import="getdatabase.*,java.sql.*,java.util.*"%>
	<%
		try {
			Connection cn = DataConn.getData();
			String email_id = session.getAttribute("email_id").toString();
			String sql = "select * from user_tab where email_id=?";
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setString(1, email_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
	%>

	<div class="w3-content w3-padding responsive"
		style="max-width: 1564px; background-image: url('image/pattern.jpg');">
		<br>
		<br>
		<br>
		<div class="container">
			<section id="about" class="section-content about">
				<div class="container">
					<div class="row">
						<div class="col-md-6 col-md-offset-3">
							<img alt="" src="image/maleUser.png"
								class="img responsive img-thumbnail" id="userimg">

							<h2 class="name"><%=rs.getString(2)%>
								<%=rs.getString(3)%></h2>
							<h3 class="email">
								Email address:&nbsp;<%=rs.getString(1)%></h3>
							<h4 class="text-center date_of_birth">
								Date of Birth:&nbsp;<%=rs.getString(11)%></h4>
							<br> <a href="#"
								class="btn btn-default page-scroll primary-bg btn-lg">Quiz
								Point:&nbsp<%=rs.getString(9)%></a>
							<div class="title-divider">
								<span class="hr-divider col-xs-5"></span> <span
									class="icon-separator col-xs-2"><i class="fa fa-star"></i></span>
								<span class="hr-divider col-xs-5"></span>
							</div>

						</div>

						<div class="col-md-8 col-md-offset-2 text-center">
							<p class="address">
								Address:&nbsp;<%=rs.getString(5)%>,<br>City-&nbsp;<%=rs.getString(6)%>,&nbsp;
								State-&nbsp;<%=rs.getString(7)%>,<br>Postal Code-&nbsp;<%=rs.getString(8)%></p>
							<a href="#" class="btn btn-default secondary-bg btn-lg"
								data-toggle="modal" data-target="#myModal">Edit Profile</a> <a
								href="#" class="btn btn-default page-scroll primary-bg btn-lg"
								data-toggle="modal" data-target="#myModal2">Change Password</a>
							<%
								String login_msg = (String) request.getAttribute("error1");
										if (login_msg != null)
											out.println("<font color=red size=2px>" + login_msg + "</font>");
							%>
						</div>


						<script type="text/javascript">
							var gender = "<%=rs.getString(10)%>";
							if (gender == "male") {
								document.getElementById("userimg").src = "image/maleUser.png";
							} else if (gender == "female") {
								document.getElementById("userimg").src = "image/femaleUser.png";
							}
						</script>


						<div class="modal" id="myModal" role="dialog">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header"
										style="background-color: #65ce65; text-align: center; padding: 35px 50px; font-size: large;">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h3 class="modal-title">Edit your details here</h3>
									</div>
									<div class="modal-body" style="padding: 40px 50px;">
										<form role="form" method="post" name="update_details">

											<div class="form-group">
												<label for="email_id">Email ID</label> <input type="email"
													class="form-control" name="email_id"
													value="<%=session.getAttribute("email_id")%>"
													readonly="readonly">
											</div>
											<div class="form-group">
												<label for="fname">First name</label> <input type="text"
													class="form-control" name="fname"
													value="<%=rs.getString(2)%>" required="required">
											</div>
											<div class="form-group">
												<label for="lname">Last name</label> <input type="text"
													class="form-control" name="lname"
													value="<%=rs.getString(3)%>" required="required">
											</div>
											<div class="form-group">
												<label for="date_of_birth">Date of Birth</label> <input
													type="date" class="form-control" name="date_of_birth"
													value="<%=rs.getString(11)%>" required="required">
											</div>
											<div class="form-group">
												<label for="gender" style="padding-right: 40px;">Gender</label>
												<input type="radio" name="gender" value="male" checked>
												Male <input type="radio" name="gender" value="female">
												Female <input type="radio" name="gender" value="other">
												Other
											</div>
											<div class="form-group">
												<h3>
													<label for="address">Address</label>
												</h3>
												<input type="text" class="form-control"
													name="house_street_local" value="<%=rs.getString(5)%>"
													required="required">
											</div>
											<div class="form-group">
												<label for="city">City</label> <input type="text"
													class="form-control" name="city"
													value="<%=rs.getString(6)%>" required="required">
											</div>
											<div class="form-group">
												<label for="state">State</label> <input type="text"
													class="form-control" name="state"
													value="<%=rs.getString(7)%>" required="required">
											</div>
											<div class="form-group">
												<label for="zip_code">Postal code</label> <input
													type="number" class="form-control" name="zip_code"
													value="<%=rs.getString(8)%>" required="required">
											</div>
											<button type="submit" class="btn btn-success btn-block"
												formaction="UpdateDetails">Update</button>
										</form>
									</div>
								</div>
							</div>
						</div>

						<%
							}
						%>
						<%
							} catch (Exception e) {
								System.out.print(e);
							}
						%>
						<div class="col-md-6 col-md-offset-3">
							<h1 style="color: gray;">Selected Courses</h1>
							<table class="table table-hover">
								<tbody>
							<%
								try{
									Connection cn = DataConn.getData();
									String email_id = session.getAttribute("email_id").toString();
									String sql = "select * from course where course_id in (select course_id from user_course where email_id=?)";
									PreparedStatement ps = cn.prepareStatement(sql);
									ps.setString(1, email_id);
									ResultSet rs = ps.executeQuery();
									while (rs.next()) {
							%>
								<tr>
									<td colspan="3"><h3><%=rs.getString(2)%></h3></td>
									<td><h3><a class="btn btn-default secondary-bg btn-lg" href="courseDetails.jsp?course_id=<%=rs.getString(1)%>">View</a></h3></td>
								</tr>
							<%}%>
								</tbody>
							</table>
							<%}catch(Exception exception){
								System.out.println(exception);
							}
							%>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>

	<div class="modal fade" id="myModal2" role="dialog">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title" style="text-align: center;">Change
						Password</h3>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<form role="form" action="" method="post" name="change_password">
						<div class="form-group">
							<label for="old_psw">Old Password</label> <input
								title="Password must contain at least 6 characters, including UPPER/lowercase and numbers"
								pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" type="password"
								class="form-control" name="old_psw"
								placeholder="Enter Old Password" id="old_psw"
								required="required"
								onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');">

						</div>
						<div class="form-group">
							<label for="old_psw">New Password</label> <input
								title="Password must contain at least 6 characters, including UPPER/lowercase and numbers"
								pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" type="password"
								class="form-control" name="new_psw"
								placeholder="Enter New Password" id="new_psw"
								required="required"
								onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');">
						</div>
						<div class="form-group">
							<label for="repsw">Re-enter New Password</label> <input
								title="Password must contain at least 6 characters, including UPPER/lowercase and numbers"
								pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" type="password"
								class="form-control" name="repsw"
								placeholder="Re-Enter New Password" id="repsw"
								required="required"
								onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');">
						</div>
						<div>
							<button type="submit" class="btn btn-success btn-block"
								onclick="return validate()" formaction="ChangePassword">Submit</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function validate() {
			if (document.change_password.old_psw.value == document.change_password.new_psw.value) {
				alert("Old and New Password Should not be same");
				document.change_password.new_psw.focus();
				return false;
			}
			if (!(document.change_password.new_psw.value == document.change_password.repsw.value)) {
				alert("New and Re-Entered Password Should be Same");
				document.change_password.repsw.focus();
				return false;
			}
		}
	</script>

	<!-- Footer -->
	<footer class="w3-center w3-green w3-padding-16">
		<p>
			2018 <a href="/onlineCourse/mainActivity.jsp" class="w3-bar-item"><span
				class="w3-padding w3-black w3-opacity-min"> Online</span> <span
				class="w3-hide-small" style="color: white;">Course</span></a>
		</p>
	</footer>
</body>
</html>
