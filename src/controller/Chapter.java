package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import getdatabase.DataConn;

/**
 * Servlet implementation class Chapter
 */
@WebServlet("/Chapter")
public class Chapter extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			Connection cn = DataConn.getData();
			String chapter_id =	request.getSession(false).getAttribute("chapter_id").toString();
			String sql = "select * from chapter where chapter_id=?";
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setString(1, chapter_id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				HttpSession ses=request.getSession();
				ses.setAttribute("file_url", rs.getString(3));
				response.sendRedirect("chapter.jsp");
			}
			
		}catch(Exception e){
			System.out.println(e);
		}
	}

}
