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
 * Servlet implementation class create
 */
@WebServlet("/create")
public class create extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			Connection cn=DataConn.getData();
			String question_id=String.valueOf(Math.random()*100000);
			String qus=request.getParameter("qus");
			String op1=request.getParameter("op1");
			String op2=request.getParameter("op2");
			String op3=request.getParameter("op3");
			String op4=request.getParameter("op4");
			String ans=request.getParameter("ans");
			String course_id = request.getSession(false).getAttribute("course_id").toString();
			String chapter_id = request.getSession(false).getAttribute("chapter_id").toString();
			
			String sql="insert into quiz_tab(qus_id,qus,op1,op2,op3,op4,ans)values(?,?,?,?,?,?,?)";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, question_id);
			ps.setString(2, qus);
			ps.setString(3, op1);
			ps.setString(4, op2);
			ps.setString(5, op3);
			ps.setString(6, op4);
			ps.setString(7, ans);
			ps.execute();
			
			String sql1= "insert into quiz_course values(?,?,?)";
			PreparedStatement ps1=cn.prepareStatement(sql1);
			ps1.setString(1, course_id);
			ps1.setString(2, chapter_id);
			ps1.setString(3, question_id);
			ps1.execute();
			
			response.sendRedirect("createQuiz.jsp?chapter_id="+chapter_id+"&course_id="+course_id);
			
		}catch(Exception e){
			System.out.println(e);
		}
	}



}

	           
