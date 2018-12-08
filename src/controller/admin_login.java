package controller;
import getdatabase.*;
import java.util.*;
import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class admin_login
 */
@WebServlet("/admin_login")
public class admin_login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			Connection cn=DataConn.getData();
			String email_id=request.getParameter("email_id");
			String password=request.getParameter("password");
			String sql="select * from admin_tab where email_id =? and password=?";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1,email_id );
			ps.setString(2,password);
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()){
				HttpSession ses=request.getSession();
				ses.setAttribute("email_id", rs.getString(1));
				ses.setAttribute("name", rs.getString(2));
				response.sendRedirect("admin.jsp");
			}else{
				response.sendRedirect("adminStartActivity.jsp");
			}
		}catch(Exception e){
			System.out.println(e);
		}
	}

}
