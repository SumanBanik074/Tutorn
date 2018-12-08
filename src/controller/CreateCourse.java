package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//import java.text.SimpleDateFormat;
//import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import getdatabase.DataConn;

/**
 * Servlet implementation class CreateCourse
 */
@WebServlet("/CreateCourse")
public class CreateCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			Connection cn=DataConn.getData();
			String course_id=request.getParameter("course_id");
			String sql = "select course_id from course where course_id=?";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, course_id);
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()){
				request.setAttribute("error1","*Course id is already present.");
				RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");            
				rd.include(request, response);
			}else{
				String course_name=request.getParameter("course_name");
				String course_objective=request.getParameter("course_objective");
				String course_audience=request.getParameter("course_audience");
				String course_prerequisite=request.getParameter("course_prerequisite");
				String course_outcome=request.getParameter("course_outcome");
				int no_of_chapter = 0;
				
				String sql1="insert into course values(?,?,?,?,?,?,?)";
				PreparedStatement ps1=cn.prepareStatement(sql1);
				ps1.setString(1, course_id);
				ps1.setString(2, course_name);
				ps1.setString(3, course_objective);
				ps1.setString(4, course_audience);
				ps1.setString(5, course_prerequisite);
				ps1.setString(6, course_outcome);
				ps1.setInt(7, no_of_chapter);
				ps1.execute();
				
				String email_id=request.getSession(false).getAttribute("email_id").toString();
				PreparedStatement ps2=cn.prepareStatement("insert into admin_course values(?,?)");
				ps2.setString(1, email_id);
				ps2.setString(2, course_id);
				ps2.execute();
		
				response.sendRedirect("admin.jsp");
			}
		}catch(Exception e){
			System.out.println(e);
		}
	}

}
