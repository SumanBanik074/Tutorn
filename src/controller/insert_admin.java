package controller;
import getdatabase.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class insert_admin
 */
@WebServlet("/insert_admin")
public class insert_admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			Connection cn=DataConn.getData();
			String email_id=request.getParameter("email_id");
			String name=request.getParameter("name");
			String password=request.getParameter("password");
			String sql="insert into admin_tab values(?,?,?)";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, email_id);
			ps.setString(2, name);
			ps.setString(3, password);
			ps.execute();
			
			HttpSession ses=request.getSession();
			ses.setAttribute("name", name);
			response.sendRedirect("admin.jsp");
			
		}catch(Exception e){
			System.out.println(e);
		}
	}



}
