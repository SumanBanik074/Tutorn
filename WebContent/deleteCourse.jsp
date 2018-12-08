<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="getdatabase.*,java.sql.*,java.util.*"%>
<%try{
	Connection cn = DataConn.getData();
	String course_id = request.getParameter("course_id");
	
	
	String sql = "delete from admin_course where course_id=?";
	PreparedStatement ps = cn.prepareStatement(sql);
	ps.setString(1, course_id);
	ps.execute();
	
	
	String sql1 = "delete from course where course_id=?";
	PreparedStatement ps1 = cn.prepareStatement(sql1);
	ps1.setString(1, course_id);
	ps1.execute();
	
	response.sendRedirect("admin.jsp");
	%>
<%}catch(Exception e){
	System.out.println(e);
}

	%>
