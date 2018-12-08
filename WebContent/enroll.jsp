<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="getdatabase.*,java.sql.*,java.util.*"%>
<%try{
	Connection cn = DataConn.getData();
	String course_id = request.getParameter("course_id");
	String email_id = session.getAttribute("email_id").toString();
	
	String sql = "insert into user_course values(?,?)";
	PreparedStatement ps = cn.prepareStatement(sql);
	ps.setString(1, email_id);
	ps.setString(2, course_id);
	ps.execute();
	
	
	response.sendRedirect("courseDetails.jsp?course_id="+course_id);
	%>
<%}catch(Exception e){
	System.out.println(e);
}

	%>
