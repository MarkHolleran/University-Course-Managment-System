<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	try {

		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		
		Statement stmt = con.createStatement();

		String courseID = request.getParameter("courseid");
		String courseName = request.getParameter("coursename");
		String departmentName = request.getParameter("coursedepartment");
	    String numberOfCredits = request.getParameter("numberofcredits");
	    
		String prereqs = request.getParameter("courseprerequisites");
		
		String insert = "INSERT INTO course(cid, name, dept, credits)"
				+ "VALUES (?, ?, ?, ?)";
		
		PreparedStatement ps = con.prepareStatement(insert);

		ps.setString(1, (courseID));
		ps.setString(2, courseName);
		ps.setString(3, departmentName);
		ps.setInt(4,Integer.valueOf((numberOfCredits)));
		
		

		ps.executeUpdate();
		
		
if (prereqs.isEmpty() == false){
			
			String[] splitArray = prereqs.split("\\s+");
			
			
			for (int i = 0; i != splitArray.length; i++){
				
				String insert1 = "INSERT INTO requirement(course_cid, prereq_cid)"
						+ "VALUES (?, ?)";
				

				PreparedStatement ps1 = con.prepareStatement(insert1);

				ps1.setString(1, courseID);
				ps1.setString(2, splitArray[i]);
				
				ps1.executeUpdate();
					
			}
			
			}
		
		
		con.close();
		out.print("Course added!");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>
</body>
</html>