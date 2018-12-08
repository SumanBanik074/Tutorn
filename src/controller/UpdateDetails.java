package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import getdatabase.DataConn;

/**
 * Servlet implementation class UpdateDetails
 */
@WebServlet("/UpdateDetails")
public class UpdateDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			Connection cn = DataConn.getData();
			String email_id = request.getParameter("email_id");
			String first_name = request.getParameter("fname");
			String last_name = request.getParameter("lname");
			String date_of_birth = request.getParameter("date_of_birth");
			String gender = request.getParameter("gender");
			String house_street_local=request.getParameter("house_street_local");
			String city=request.getParameter("city");
			String state=request.getParameter("state");
			int zip_code=Integer.parseInt(request.getParameter("zip_code"));
			
			String sql = "update user_tab set first_name=?,last_name=?,date_of_birth=?,gender=?,house_street_local=?,city=?,state=?,zip_code=? where email_id=?";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, first_name);
			ps.setString(2, last_name);
			ps.setString(3, date_of_birth);
			ps.setString(4, gender);
			ps.setString(5, house_street_local);
			ps.setString(6, city);
			ps.setString(7, state);
			ps.setInt(8, zip_code);
			ps.setString(9, email_id);
			ps.executeUpdate();
			
			response.sendRedirect("userProfileActivity.jsp");
		}catch(Exception e){
			System.out.println(e);
		}
	}

}
