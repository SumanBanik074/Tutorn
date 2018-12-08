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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<head>
<!--Import Google Icon Font-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!--Import materialize.css-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">

<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="shortcut icon"
	href="https://inspiredcourses.com/wp-content/uploads/2018/01/Inspired-Courses-Favicon.png" />
<title>Admin Section</title>
</head>
<body bgcolor="white">
	<%@page import="getdatabase.*,java.sql.*,java.util.*"%>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!--JavaScript at end of body for optimized loading-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
	<div class="container" id="test3">
		<div class="row">
			<div class="col l6 l12">
				<h5 class="black-text">Create Questions</h5>
				<p class="black">
				<div class="row">
					<form class="col l12" action="create" method="post">

						<div class="row">


							<div class="input-field col l12">
								<i class="material-icons prefix">create</i> <input
									id="icon_prefix1" type="text" class="validate" name="qus">
								<label for="icon_prefix1"><font color="black">Type
										a Question</font></label>
							</div>

							<div class="input-field col l12">
								<i class="material-icons prefix">chevron_right</i> <input
									id="icon_prefix2" type="text" class="validate" name="op1">
								<label for="icon_prefix2"><font color="black">Type
										Option 1</font></label>
							</div>
							<div class="input-field col l12">
								<i class="material-icons prefix">chevron_right</i> <input
									id="icon_prefix3" type="text" class="validate" name="op2">
								<label for="icon_prefix3"><font color="black">Type
										Option 2</font></label>
							</div>
							<div class="input-field col l12">
								<i class="material-icons prefix">chevron_right</i> <input
									id="icon_prefix4" type="text" class="validate" name="op3">
								<label for="icon_prefix4"><font color="black">Type
										Option 3</font></label>
							</div>
							<div class="input-field col l12">
								<i class="material-icons prefix">chevron_right</i> <input
									id="icon_prefix5" type="text" class="validate" name="op4">
								<label for="icon_prefix5"><font color="black">Type
										Option 4</font></label>
							</div>
							<br>
							<div class="input-field col l12">
								<i class="material-icons prefix">done</i> <input
									id="icon_prefix6" type="text" class="validate" name="ans">
								<label for="icon_prefix6"><font color="black">Type
										The Correct Option</font></label>
							</div>
						</div>
						<%
							String course_id = request.getParameter("course_id");
							String chapter_id = request.getParameter("chapter_id");
							session = request.getSession(true);
							session.setAttribute("course_id", course_id);
							session.setAttribute("chapter_id", chapter_id);
							int count = 0;
							int max_level = 5;

							try {
								Connection conn = DataConn.getData();
								String sql = "select * from quiz_course where course_id = ? and chapter_id = ?";
								PreparedStatement ps = conn.prepareStatement(sql);
								ps.setString(1, course_id);
								ps.setString(2, chapter_id);
								ResultSet rs = ps.executeQuery();
								while (rs.next()) {
									count++;
								}
								if (count < max_level) {
						%>
						<p>
							<span id="quiz_count" style="color: red; font-style: italic;">*
								You have to create <%=max_level%> questions, <%=(max_level - count)%>
								more please...
							</span>
						<div class="center">
							<input type="button" value="Back"
								class="waves-effect waves-light btn"
								onclick="location.href='viewCourse.jsp?course_id=<%=course_id%>'">
							<input type="submit" value="Submit"
								class="waves-effect waves-light btn">
						</div>
						<%
							} else if (count > max_level || count == max_level) {
						%>
						<p>
							<span id="quiz_count" style="color: red; font-style: italic;">*
								You are successfully created a Quiz for this chapter.</span>
						<div class="center">
							<input type="button" value="Back"
								class="waves-effect waves-light btn"
								onclick="location.href='viewCourse.jsp?course_id=<%=course_id%>'">
						</div>

						<%
							}
							} catch (Exception exception) {
								System.out.println(exception);
							}
						%>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>