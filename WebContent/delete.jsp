<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="getdatabase.*,java.sql.*,java.util.*"%>
<%try{
	Connection cn = DataConn.getData();
	String qus_id = request.getParameter("qus_id");
	
	String sql2 = "select * from quiz_course where qus_id=?";
	PreparedStatement ps2 = cn.prepareStatement(sql2);
	ps2.setString(1, qus_id);
	ResultSet rs = ps2.executeQuery();
	
	
	String sql = "delete from quiz_course where qus_id=?";
	PreparedStatement ps = cn.prepareStatement(sql);
	ps.setString(1, qus_id);
	ps.execute();
	
	
	String sql1 = "delete from quiz_tab where qus_id=?";
	PreparedStatement ps1 = cn.prepareStatement(sql1);
	ps1.setString(1, qus_id);
	ps1.execute();
	
	
	if(rs.next()){
		response.sendRedirect("viewQuiz.jsp?chapter_id="+rs.getString(2)+"&course_id="+rs.getString(1));
	}
	%>
<%}catch(Exception e){
	System.out.println(e);
}

	%>
