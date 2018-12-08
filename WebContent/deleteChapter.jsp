<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="getdatabase.*,java.sql.*,java.util.*"%>
<%try{
	Connection cn = DataConn.getData();
	String chapter_id = request.getParameter("chapter_id");
	String course_id = request.getParameter("course_id");
	String sql = "update course set no_of_chapter=no_of_chapter-1 where course_id in (select course_id from chapter where chapter_id=?)";
	PreparedStatement ps = cn.prepareStatement(sql);
	ps.setString(1, chapter_id);
	ps.executeUpdate();
	
	String sql1 = "delete from chapter where chapter_id=?";
	PreparedStatement ps1 = cn.prepareStatement(sql1);
	ps1.setString(1, chapter_id);
	ps1.execute();
	
	response.sendRedirect("viewCourse.jsp?course_id="+course_id);
	%>
<%}catch(Exception e){
	System.out.println(e);
}

	%>
