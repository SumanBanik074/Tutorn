<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% 
    if(session.getAttribute("email_id") == "" || session.getAttribute("email_id") == null) {
		session.setAttribute("flash_msg", "Please login to view content!");
		response.sendRedirect("adminStartActivity.jsp");
	} 
	%>
<!DOCTYPE html>
<html>
	<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--Import Google Icon Font-->
    	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->  
	  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
    <!--Let browser know website is optimized for mobile-->
      	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
      	<link rel="shortcut icon" href="https://inspiredcourses.com/wp-content/uploads/2018/01/Inspired-Courses-Favicon.png" />
		<title>Admin Section</title>    
	</head>
    <body>
    	<nav class="nav-extended green darken-1">
    		<div class="nav-wrapper">
      			<a href="/onlineCourse/admin.jsp" class="w3-bar-item w3-button brand-logo"><span class="w3-padding w3-black w3-opacity-min">
    TUTORN</span></a>
      			
      			<ul id="nav-mobile" class="right hide-on-med-and-down">
        			<li><a href=""><%=session.getAttribute("name")%></a></li>
         			<li><a href="logout_admin.jsp">Logout</a></li>
      			</ul>
    		</div>
    		<div class="nav-content">
      			<ul class="tabs tabs-transparent">
      				<li class="tab"><a href="#test1">COURSES</a></li>
        			<!-- <li class="tab"><a href="#test2">VIEW RESULTS</a></li> -->
        			<li class="tab"><a href="#test4">CREATE COURSE</a></li>
        			<li class="tab"><a href="#test5">ABOUT US</a></li>
        			<li class="tab"><a href="#test6">PRIVACY POLICY</a></li>
      			</ul>
    		</div>
  		</nav>
  <br><br><br>
   		<div id="test5" class="col s12 center-align">
    		<div class="row">
    			<div class="col s5 m12 z-depth-5">
      				<div class="card green darken-1">
        				<div class="card-content">
       						<span class="card-title" style="color: white">About Us</span>
       						<div style="background-color: white;">
							<p class="z-depth-5" style="padding-bottom: 30px; font-size: 12pt; color: green"><br><br>We are a team of diversely talented individuals
							 aimed solely to help you climb the ladder of success and achieve your individual dreams. Incorporated in 2018 our aim is to
							  provide a helping hand to blossom one's talent and polish it to the best, we initially started with offering practice questions for languages like C,C++, Java, Sql etc. Many of AYUDANTE's users and members have reached soaring heights of recognition over the years. Gradually we added aptitude and reasoning practice
						papers to the portfolio to aid management and engineering aspirants.We aim at creating and delivering all round questions, basic concepts and approaches, easy to understand solutions, enabling our clients to achieve their education goals and enhance their competitiveness. Keeping in pace with changing times our team consistently innovates to provide up-to-date solutions. Our mission is to help aspirants, provide knowledge and help shape the future and allow others the goodwill to do so</p>
        				</div></div>
      				</div>
    			</div>
  			</div>
		</div>
    	<div id="test6" class="col s12">
    		<div class="row">
    			<div class="col s5 m12 z-depth-5">
      				<div class="card green darken-1">
        				<div class="card-content" align="center">
          					<span class="card-title" style="color: white">Privacy Policy</span>
          					<div style="background-color: white;">
          					<p class="z-depth-5" align="center" style="padding-bottom: 20px; font-size: 12pt;color: green">
          <br><br>
          This privacy statement applies to the treatment of personally identifiable information submitted by, or otherwise obtained from you.
The Application is provided by us.By using or otherwise accessing the Application, you acknowledge that you accept the practices and policies outlined in this Privacy Statement.
        
Personal Information Sharing:
Personal information about our users is an integral part of our business. We neither rent nor sell your personal information to anyone (with the exception of sharing your
information with an applicable Application Partner)You hereby consent to our sharing of personal information for the above purposes.
What Personal Information can I Access?
This website allows you to access the following information about you for the purpose of viewing, and in certain situations,
updating that information. This list may change in the event the Application changes.
Account and user profile information
User e-mail address, if applicable.
 Facebook profile information, if applicable.
User preferences.
Application specific data.</div><br><br>
          
          				</div>
      				</div>
     			</div>
      		</div>
    	</div> 
    	
    	<div class="container" id="test4">
    		<div class="row">
    			<h2 class="black-text">Create a new Course</h2><br><br>
    			<p class="black">
    			<form action="CreateCourse" method="post">
  					<div class="form-group">
    					<label for="course_id"><font color="black"><h4>Course id:</h4></font></label>
    					<input type="text" class="form-control" id="course_id" name="course_id">
  					</div>
  					<%
						String signup_msg=(String)request.getAttribute("error1");  
						if(signup_msg!=null)
						out.println("<font color=red size=2px>"+signup_msg+"</font>");
					%>
  					<div class="form-group">
    					<label for="course_name"><font color="black"><h4>Course name:</h4></font></label>
    					<input type="text" class="form-control" id="course_name" name="course_name">
  					</div>
  					<div class="form-group">
    					<label for="course_objective"><font color="black"><h4>Course objective:</h4></font></label>
    					<input type="text" class="form-control" id="course_objective" name="course_objective">
  					</div>
  					<div class="form-group">
    					<label for="course_audience"><font color="black"><h4>Course audience:</h4></font></label>
    					<input type="text" class="form-control" id="course_audience" name="course_audience">
  					</div>
  					<div class="form-group">
    					<label for="course_prerequisite"><font color="black"><h4>Course prerequisite:</h4></font></label>
    					<input type="text" class="form-control" id="course_prerequisite" name="course_prerequisite">
  					</div>
  					<div class="form-group">
    					<label for="course_outcome"><font color="black"><h4>Course outcome:</h4></font></label>
    					<input type="text" class="form-control" id="course_outcome" name="course_outcome">
  					</div>
  					<br>
  					<div style="text-align: left;">
  						<button type="reset" class="btn btn-primary">Clear</button>
  						<button type="submit" class="btn btn-success">Create</button>
  					</div>	
				</form>
			</div>
    	</div>
    	<div class="container" id="test1">
    		<div class="row">
    			<h2 class="black-text"><%=session.getAttribute("name") %>, Your created courses...</h2><br><br>
    			<p class="black">
    			<table class="striped">
					<tbody>
    			<%@page import="getdatabase.*,java.sql.*,java.util.*" %>
    			<%try{
					Connection cn=DataConn.getData();
					String email_id=session.getAttribute("email_id").toString();
					String sql="select course_id,course_name from course where course_id in (select course_id from admin_course where email_id=?)";
					PreparedStatement ps=cn.prepareStatement(sql);
					ps.setString(1, email_id);
					ResultSet rs=ps.executeQuery();
					while(rs.next()){
				%>
						<tr>
							<td>
								<h3><%=rs.getString(2) %></h3>
							</td>
							<td>
								<a class="waves-effect waves-light btn"  href="viewCourse.jsp?course_id=<%=rs.getString(1) %>">VIEW</a>
							</td>
						</tr>
				<%} %>
					</tbody>
				</table>
				<%}catch(Exception e){
					System.out.println(e);
				}%>
			</div>
    	</div>
    	
    	
      <!--Import jQuery before materialize.js-->
      <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script><br><br>
<footer class="w3-center w3-padding-16 green darken-1">
  <p>2018 <a href="/onlineCourse/admin.jsp" class="w3-bar-item w3-button"><span class="w3-padding w3-black w3-opacity-min">
    Online</span> <span class="w3-hide-small" style="color: white;">Course</span></a></p>
</footer>
       
	</body>
</html>
