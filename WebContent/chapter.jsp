<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="Access-Control-Allow-Headers; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>TUTORN</title>
</head>
<body>
<%@page import="getdatabase.*,java.sql.*,java.util.*"%>
<%try{
	 Connection cn = DataConn.getData();
	 String file_url = request.getSession(false).getAttribute("file_url").toString();
	%>
	<div id="pdf">
		<iframe src="<%=file_url %>" style="width: 100%; height: 100%;" frameborder="0" scrolling="no">
		</iframe>
	</div>
	<%}catch(Exception exception){
		System.out.println(exception);
	}%>

</body>
</html>