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
<title>Tutorn</title>
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
	<br><br><br><br><br>
	<div class="container">
		<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6 well">
<%@page import="java.sql.*,java.util.*,getdatabase.*"%>
<%
	try {
		Connection cn = DataConn.getData();
		ArrayList<String> arlst = new ArrayList<String>();
		for (int i = 0; i < 5; i++) {
			arlst.add(request.getParameter("op" + (i+1)));
		}		
		
		String course_id = session.getAttribute("course_id").toString();
		String chapter_id = session.getAttribute("chapter_id").toString();
		
		String sql = "select ans from quiz_tab";
		PreparedStatement ps = cn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<String> ans = new ArrayList<String>();
		
		while (rs.next()) {
			ans.add(rs.getString("ans"));
		}
		int count = 0;
		int wrong_answer = 0;
		for (int i = 0; i < arlst.size(); i++) {
			if (ans.contains(arlst.get(i))) {
				count++;
			}
			else{
				wrong_answer ++;
			}
		}
		int point = count*5;
%>
		<br><br>
		<h1 style="text-align: center;">Your number of correct answer : <%=count %><br>
		and wrong answer : <%=wrong_answer %><br>
		Your total marks : <%=point %></h1><br><br>
		<div align="center">
		<a href="quizCenter.jsp" class="btn btn-success btn-lg"><span class="glyphicon glyphicon-chevron-left"></span>Back</a>
		<a href="contest.jsp?course_id=<%=course_id %>&chapter_id=<%=chapter_id %>" class="btn btn-success btn-lg">Re-test again</a><br><br>
		</div>
<%	
		String email_id = session.getAttribute("email_id").toString();
		String sql1 = "update user_tab set quiz_point=quiz_point+? where email_id=?";
		PreparedStatement ps1 = cn.prepareStatement(sql1);
		ps1.setInt(1, point);
		ps1.setString(2, email_id);
		ps1.execute();
		
	} catch (Exception e) {
		System.out.println(e);
	}
%>

</div>
</div>
</div>
<br><br><br><br><br><br><br>
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