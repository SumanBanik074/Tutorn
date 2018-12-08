<%@page import="getdatabase.DataConn"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!--Import materialize.css-->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="shortcut icon"
	href="https://inspiredcourses.com/wp-content/uploads/2018/01/Inspired-Courses-Favicon.png" />
<title>Admin Section</title>


</head>
<body>
	<%@page import="getdatabase.*,java.sql.*,java.util.*"%>

		<%
			try {
				Connection cn = DataConn.getData();
				String course_id = request.getParameter("course_id");
				String chapter_id = request.getParameter("chapter_id");
				String sql = "select * from quiz_tab where qus_id in (select qus_id from quiz_course where course_id=? and chapter_id=?)";
				String sql1 = "select * from chapter where chapter_id = ?";
				PreparedStatement ps = cn.prepareStatement(sql);
				PreparedStatement ps1 = cn.prepareStatement(sql1);
				ps.setString(1, course_id);
				ps.setString(2, chapter_id);
				ps1.setString(1, chapter_id);
				ResultSet rs = ps.executeQuery();
				ResultSet rs1 = ps1.executeQuery();
				int i=1;
				if(rs1.next()){
		%>
	<h2 align="center" class="">
		<font color="#EC7063"><strong>All Questions of <%=rs1.getString(2) %></strong></font>
	</h2>
	<table align="center" cellpadding="6" cellspacing="6" border="1">



		<tr bgcolor="#46BF8A">
			<td><b><font color="#F0F7F4"><center>Question no.</center></font></b></td>
			<td><b><font color="#F0F7F4"><center>Question</center></font></b></td>
			<td><b><font color="#F0F7F4"><center>Option1</center></font></b></td>
			<td><b><font color="#F0F7F4"><center>Option2</center></font></b></td>
			<td><b><font color="#F0F7F4"><center>Option3</center></font></b></td>
			<td><b><font color="#F0F7F4"><center>Option4</center></font></b></td>
			<td><b><font color="#F0F7F4"><center>Answer</center></font></b></td>
			<td><b><font color="#F0F7F4"><center>Action</center></font></b></td>
		</tr>
		<%
				}
				while (rs.next()) {
		%>
		<tr>
			<td><%=i%></td>
			<td><%=rs.getString("qus")%></td>
			<td><%=rs.getString("op1")%></td>
			<td><%=rs.getString("op2")%></td>
			<td><%=rs.getString("op3")%></td>
			<td><%=rs.getString("op4")%></td>
			<td><%=rs.getString("ans")%></td>
			<td><a href="delete.jsp?qus_id=<%=rs.getString(1)%>" class="btn">Delete</a></td>
		</tr>
		<%
			i++;
				}
				cn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</table>
</body>
</html>