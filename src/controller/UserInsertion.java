package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import getdatabase.DataConn;

//import getdatabase.DataConn;

/**
 * Servlet implementation class UserInsertion
 */
@WebServlet("/UserInsertion")
public class UserInsertion extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try{
			Connection cn=DataConn.getData();
			String email_id=request.getParameter("email");
			String sql = "select email_id from user_tab where email_id=?";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, email_id);
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()){
				request.setAttribute("error","*Email id is already registered.");
				RequestDispatcher rd=request.getRequestDispatcher("signUpActivity.jsp");            
				rd.include(request, response);
			}else{
				String first_name=request.getParameter("fname");
				String last_name=request.getParameter("lname");
				String password=request.getParameter("psw");
				String date_of_birth=request.getParameter("date_of_birth");
				String gender=request.getParameter("gender");
				String house_street_local=request.getParameter("house_street_local");
				String city=request.getParameter("city");
				String state=request.getParameter("state");
				int zip_code=Integer.parseInt(request.getParameter("zip_code"));
			
				Date date=new Date();
				SimpleDateFormat ft=new SimpleDateFormat("yyyy-MM-dd");
				String date1=ft.format(date);
			
				int quiz_point = 0;
			
				String sql1="insert into user_tab values(?,?,?,?,?,?,?,?,?,?,?,?)";
				PreparedStatement ps1=cn.prepareStatement(sql1);
				ps1.setString(1, email_id);
				ps1.setString(2, first_name);
				ps1.setString(3, last_name);
				ps1.setString(4, password);
				ps1.setString(5, house_street_local);
				ps1.setString(6, city);
				ps1.setString(7, state);
				ps1.setInt(8, zip_code);
				ps1.setInt(9, quiz_point);
				ps1.setString(10, gender);
				ps1.setString(11, date_of_birth);
				ps1.setString(12, date1);
				ps1.execute();
			
			
				request.getSession().setAttribute("email_id", email_id);
				request.getSession().setAttribute("first_name", first_name);
				request.getSession().setAttribute("last_name", last_name);
				response.sendRedirect("mainActivity.jsp");
			}
		}catch(Exception e){
			System.out.println(e);
		}
		
	}
}
