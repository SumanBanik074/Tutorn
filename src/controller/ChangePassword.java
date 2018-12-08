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

import getdatabase.DataConn;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			Connection cn=DataConn.getData();
			
			String old_psw=request.getParameter("old_psw");	
			String sql="select password from user_tab where password=?";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, old_psw);
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()){
				String new_psw=request.getParameter("new_psw");
				String sql1="update user_tab set password=? where password=?";
				PreparedStatement ps1=cn.prepareStatement(sql1);
				ps1.setString(1, new_psw);
				ps1.setString(2, old_psw);
				ps1.executeUpdate();
				
				response.sendRedirect("userProfileActivity.jsp");
			}else{
				request.setAttribute("error1","*Invalid Password");
				RequestDispatcher rd=request.getRequestDispatcher("userProfileActivity.jsp");            
				rd.include(request, response);
			}
			
		}catch(Exception e){
			System.out.println(e);
		}
	}

}
