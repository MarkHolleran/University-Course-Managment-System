<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
	<%
	try {%>
		
		
		
	<%	ApplicationDB db = new ApplicationDB();	%>
	<%	Connection con = db.getConnection();%>

	<%	Statement stmt = con.createStatement();%>

	<%	String username = request.getParameter("username");%>
	<%	String password = request.getParameter("password");%>

			
	
	<%	PreparedStatement mystatement = con.prepareCall("{call get_user(?,?) }");%>
	<%	mystatement.setString(1,username);%>
	<%	mystatement.setString(2,password);%>

	<%	ResultSet result = mystatement.executeQuery();%>
		
		
	<%	if (result.next()){%>
			
			
		<%	if (result.getString(1).equals("Admin")){%>
				
				
			<%	out.println("Click Continue to enter the Administrator Panel");%>
			
			<br>
			
				<br>
			
				<% out.println("Administrator Panel"); %>
	<br>
	<br>
	
	<% out.println("Add Course"); %>
		
		<form method="post" action="newcourseadded.jsp">
		    <!-- note the show.jsp will be invoked when the choice is made -->
			<!-- The next lines give HTML for radio buttons being displayed -->
	
		  <br>
		  <table>
				<tr>    
					<td>Course ID</td><td><input type="text" name="courseid"></td> <td>(Format: ddd:ddd)</td>
				</tr>
				
				<tr>
					<td>Name</td><td><input type="text" name="coursename"></td>
				</tr>
								
				<tr>
					<td>Department</td><td><input type="text" name="coursedepartment"></td>
				</tr>
				
				<tr>
					<td>Prereqs</td><td><input type="text" name="courseprerequisites"></td><td>(Separate each by a space. Must be pre-existing course)</td>
				</tr>
								
				<tr>
					<td># Credits</td><td><input type="text" name="numberofcredits"></td>
				</tr>
				
			</table>
			<br>
		  <input type="submit" value="Add Course" />
		</form>
		<br>
		
		
		
		<% out.println("Add Course to a Semester"); %>
		
		<form method="post" action="addcoursetoasemester.jsp">
		    <!-- note the show.jsp will be invoked when the choice is made -->
			<!-- The next lines give HTML for radio buttons being displayed -->
	
		  <br>
		  <table>
				<tr>    
					<td>Course ID</td><td><input type="text" name="addcourseidtosemester"></td><td>(Format: ddd:ddd)</td>
				</tr>
				
				<tr>
					<td>Teaching Professor ID(PID)</td><td><input type="text" name="teachingprofessorid"></td>
				</tr>
				
				<tr>    
					<td>Section</td><td><input type="text" name="coursesection"></td> <td>(Integer)</td>
				</tr>
				
				<tr>
					<td>Semester</td><td><input type="text" name="coursesemester"></td><td>(Fall or Spring)</td>
				</tr>
				
				<tr>
					<td>Meetings</td><td><input type="text" name="coursemeeting1"></td><td><input type="text" name="coursemeeting2"></td><td><input type="text" name="coursemeeting3"></td> <td>(EX:"MON 2:40 to 3:50pm" up to 3 different meeting days/times")</td>
				</tr>
				
				<tr>
					<td>Year</td><td><input type="text" name="year"></td>
				</tr>
				
			</table>
			<br>
		  <input type="submit" value="Add Course to Semester" />
		</form>
		<br>
	
	
	
	
	

		<% out.println("Add new Student"); %>
		
		<form method="post" action="newstudentadded.jsp">
		    <!-- note the show.jsp will be invoked when the choice is made -->
			<!-- The next lines give HTML for radio buttons being displayed -->
	
		 
		  <table>
				<tr>    
					<td>Username/CID</td><td><input type="text" name="studentid"></td> <td>(Unique integer)</td>
				</tr>
				<tr>
					<td>Password</td><td><input type="text" name="studentpassword"></td>
				</tr>
				
				
				
				<tr>
					<td>Name</td><td><input type="text" name="studentname"></td>
				</tr>
				
				<tr>
					<td>Phone #</td><td><input type="text" name="studentphonenumber"></td>
				</tr>
				
				<tr>
					<td>Birth Date</td><td><input type="text" name="studentbirthdate"></td> <td>(YYYY:MM:DD)</td>
				</tr>
				
			</table>
			<br>
		  <input type="submit" value="Add Student" />
		</form>
		<br>
		
		
		<% out.println("Add new Professor"); %>
		
		<form method="post" action="newprofessoradded.jsp">
		    <!-- note the show.jsp will be invoked when the choice is made -->
			<!-- The next lines give HTML for radio buttons being displayed -->
	
		  <br>
		  <table>
				<tr>    
					<td>Username/PID</td><td><input type="text" name="professorid"></td> <td>(Unique integer)</td>
				</tr>
				
				<tr>
					<td>Password</td><td><input type="text" name="professorpassword"></td>
				</tr>
				
				
				
				<tr>
					<td>Name</td><td><input type="text" name="professorname"></td>
				</tr>
				
				
				<tr>
					<td>Phone #</td><td><input type="text" name="professorphonenumber"></td>
				</tr>
				
				<tr>
					<td>Office #</td><td><input type="text" name="professorofficenumber"></td>
				</tr>
				
			</table>
			<br>
		  <input type="submit" value="Add Professor" />
		</form>
		<br>
		
	
		<br>
		
		
		<% out.println("Add new Administrator"); %>
		
		<form method="post" action="newadministratoradded.jsp">
		    <!-- note the show.jsp will be invoked when the choice is made -->
			<!-- The next lines give HTML for radio buttons being displayed -->
	
		  <br>
		  <table>
				<tr>    
					<td>Username/ID</td><td><input type="text" name="administratorid"></td><td>(Unique integer)</td>
				</tr>
				
				<tr>
					<td>Password</td><td><input type="text" name="administratorpassword"></td>
				</tr>
				
			</table>
			<br>
		  <input type="submit" value="Add Administrator" />
		</form>
		<br>
	
	
			
			
			
			<%}else if (result.getString(1).equals("Professor")){%>
			
			
			<% out.println("Professor Panel"); %>
	
	<br>
	<br>
	<% out.println("Assign Grade to Student currently in one of your Courses"); %>
		
		<form method="post" action="assigngradetostudent.jsp">
		    <!-- note the show.jsp will be invoked when the choice is made -->
	
		  <br>
		  <table>
		  
		  <tr>
					<td>Student ID</td><td><input type="text" name="studentid"></td>
				</tr>
				
				<tr>    
					<td>Course ID</td><td><input type="text" name="courseid"></td>
				</tr>
				
				<tr>    
					<td>Course Section</td><td><input type="text" name="coursesection"></td>
				</tr>
				
				
				<tr>
					<td>Semester</td><td><input type="text" name="semester"></td>
				</tr>
				
				<tr>
					<td>Year</td><td><input type="text" name="year"></td>
				</tr>
				
				
				
				<tr>
					<td>Grade</td><td><input type="text" name="studentgradeincourse"></td><td>(A,B,C,D,E,F)</td>
				
				
			</table>
			<br>
		  <input type="submit" value="Submit Grade" />
		</form>
		<br>
		
		
		<% out.println("View List of Students in a Course you're currently teaching"); %>
		
		<form method="post" action="viewlistofstudentsincourseteaching.jsp">
		    <!-- note the show.jsp will be invoked when the choice is made -->
			<!-- The next lines give HTML for radio buttons being displayed -->
	
		  <br>
		  <table>
				<tr>    
					<td>Course ID</td><td><input type="text" name="courseid"></td>
				</tr>
				
				<tr>    
					<td>Section</td><td><input type="text" name="coursesection"></td>
				</tr>
				
				<tr>
					<td>Semester</td><td><input type="text" name="coursesemester"></td><td>(current Semester)</td>
				</tr>
				
				<tr>
					<td>Year</td><td><input type="text" name="year"></td>
				</tr>
				
			</table>
			<br>
		  <input type="submit" value="View List of Students" />
		</form>
			
			

			<br>
			
				<br>
			
		<%	}else if (result.getString(1).equals("Student")){%>
				
				
<% out.println("Student Panel"); %>
	
	<br>
	<br>
	
		
		<% out.println("All offered courses"); %>
		<form method="get" action="viewalloffered.jsp">
		
		  <br>
		  
		  <input type="submit" value="View all courses" />
		</form>
		<br>
		
		<% out.println("List of prereqs"); %>
		<form method="get" action="viewprereqs.jsp">
		
		  <br>
		  
		  <input type="submit" value="View all prereqs" />
		</form>
		<br>
		
		<% out.println("All courses where prereqs are met"); %>
		<form method="get" action="viewcurrentcoursesenrollinto.jsp">
		

		
		 <input type="hidden" name="studentusername" value="<%= request.getParameter("username") %>">
		    <!-- note the show.jsp will be invoked when the choice is made -->
	
		  <br>
		  
		  <input type="submit" value="View Courses you can take" />
		</form>
		<br>
		
		<% out.println("View List of Courses Previously taken"); %>
	
		
		<form method="get" action="viewcoursestaken.jsp">
		

		
		 <input type="hidden" name="studentusername" value="<%= request.getParameter("username") %>">
		    <!-- note the show.jsp will be invoked when the choice is made -->
	
		  <br>
		  
		  <input type="submit" value="View Courses" />
		</form>
		<br>
		
		<% out.println("View current enrollment"); %>
	
		
		<form method="get" action="viewcurrentenrolledin.jsp">
		

		
		 <input type="hidden" name="studentusername" value="<%= request.getParameter("username") %>">
		    <!-- note the show.jsp will be invoked when the choice is made -->
	
		  <br>
		  
		  <input type="submit" value="View Current Enrollment" />
		</form>
		<br>
		
		<% out.println("Register for a Course"); %>
								
				
				<form method="get" action="studentenrolledintocourse.jsp">
		     <input type="hidden" name="studentusername" value="<%= request.getParameter("username") %>">
		  <br>
		  <table>
				<tr>    
					<td>Course ID</td><td><input type="text" name="courseid"></td>
				</tr>
				
				<tr>    
					<td>Section</td><td><input type="text" name="coursesection"></td>
				</tr>
				

				
			</table>
			<br>
		  <input type="submit" value="Register" />
		</form>
		<br>
				

			<br>
			
				<br>
			
				
					<%	}%>
				
		<%	}
		
	else if (result.next() == false){
						out.println("Username doesn't exist or password is incorrect");}%>
		
		
	<%	con.close();%>


		
	<%	} catch (Exception ex) {%>
		<%	out.print(ex);%>
		<%out.print("Username doesn't exist or password is incorrect"); }%>
</body>
</html>