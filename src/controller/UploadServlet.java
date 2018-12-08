package controller;

import java.awt.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Iterator;
import java.io.File;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.*;

import getdatabase.DataConn;
import java.util.*;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private boolean _isMultipart;
    private String _path;
    private File _file;
    
    private static final String filePath = "C:\\Users\\home pc\\workspace\\onlineCourse\\upload\\";
    private static final String beyondMaxMemSizeFilePath = "C:\\Users\\home pc\\workspace\\onlineCourse\\upload\\";
    private static final int maxFileSize = 10 * 1024 * 1024; //10 MB
    private static final int maxMemSize = 1 * 1024 * 1024; // 1 MB

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   _isMultipart = ServletFileUpload.isMultipartContent(request);
	        //response.setContentType("text/html");
	        java.io.PrintWriter out = response.getWriter();
	        String htmlFirstPart = "<html><head><title>servlet</title></head><body>";
	        String htmlLastPart = "</body></html>";
	        String bodyText = "";
	        if (!_isMultipart)
	            bodyText = "Sorry! No Multipart Request Found";
	        else {
	            DiskFileItemFactory factory = new DiskFileItemFactory();
	            factory.setSizeThreshold(maxMemSize);
	            factory.setRepository(new File(beyondMaxMemSizeFilePath));
	            ServletFileUpload upload = new ServletFileUpload(factory);
	            upload.setSizeMax(maxFileSize);
	            try {
	                java.util.List<FileItem> fileItems = upload.parseRequest(request);
	                Iterator<FileItem> i = fileItems.iterator();
	                while (i.hasNext()) {
	                    FileItem fi = (FileItem) i.next();
	                    if (!fi.isFormField()) {
	                        String fileName = fi.getName();
	                        System.out.println(fileName);
	                        int positionOfLastBackSlash = fileName.lastIndexOf("\\");
	                        if (positionOfLastBackSlash >= 0) {
	                            //Absolute Path
	                            _path = filePath + fileName.substring(positionOfLastBackSlash);
	                        } else {
	                            //Only File Name no Back Slash
	                            _path = filePath + fileName.substring(fileName.lastIndexOf("\\") + 1);
	                        }
	                        String filepath = _path;
	                        _file = new File(_path);
	                        fi.write(_file);
	                        
	                        
	                        //insert into database
	                        Connection cn = DataConn.getData();
	                        String chapter_id=String.valueOf(Math.random()*100000);
	            			
	            			String chapter_name = fileName.substring(0, fileName.indexOf('.'));
	            			System.out.println(chapter_name);
	            			System.out.println(chapter_id);
	            			String course_id = request.getSession(false).getAttribute("course_id").toString();
	            			System.out.println(course_id);
	            			System.out.println(filepath);
	            			String sql1="insert into chapter values(?,?,?,?)";
	            			PreparedStatement ps1= cn.prepareStatement(sql1);
	            			ps1.setString(1, chapter_id);
	            			ps1.setString(2, chapter_name);
	            			ps1.setString(3, filepath);
	            			ps1.setString(4, course_id);
	            			ps1.execute();
	            			
	            			
	            			//increase the no of chapter
	            			String sql2="update course set no_of_chapter=no_of_chapter+1 where course_id=?";
	            			PreparedStatement ps2= cn.prepareStatement(sql2);
	            			ps2.setString(1, course_id);
	            			ps2.executeUpdate();
	            			
	            			response.sendRedirect("viewCourse.jsp?course_id="+course_id);
	                    }
	                }
	          
	            } catch (Exception ex) {
	                System.out.println(ex);
	            }
	        }
	       out.println(htmlFirstPart + bodyText + htmlLastPart);
	    }

}
