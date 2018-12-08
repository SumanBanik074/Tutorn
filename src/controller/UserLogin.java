package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import getdatabase.DataConn;;

/**
 * Servlet implementation class UserLogin
 */
@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			Connection cn=DataConn.getData();
			
			String email_id=request.getParameter("email");
			String password=request.getParameter("pwd");
			
			String sql="select * from user_tab where email_id=? and password=?";
			PreparedStatement ps=cn.prepareStatement(sql);
			
			ps.setString(1, email_id);
			ps.setString(2, password);
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()){
				HttpSession ses=request.getSession();
				ses.setAttribute("email_id", rs.getString(1));
				ses.setAttribute("first_name", rs.getString(2));
				ses.setAttribute("last_name", rs.getString(3));
				
				response.sendRedirect("mainActivity.jsp");
				//RequestDispatcher rd=request.getRequestDispatcher("mainActivity.jsp");
				//rd.forward(request, response);					
			}else{
				request.setAttribute("error","*Invalid Username or Password");
				RequestDispatcher rd=request.getRequestDispatcher("startActivity.jsp");            
				rd.include(request, response);
				//response.sendRedirect("startActivity.jsp");
			}
			
		}catch(Exception e){
			System.out.println(e);
		}
		
	}

}
