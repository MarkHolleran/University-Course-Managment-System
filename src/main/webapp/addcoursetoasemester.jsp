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

		String courseID = request.getParameter("addcourseidtosemester");
		String professorID = request.getParameter("teachingprofessorid");
		String courseSection = request.getParameter("coursesection");
		String courseSemester = request.getParameter("coursesemester");
	    String courseMeeting1 = request.getParameter("coursemeeting1");
	    String courseMeeting2 = request.getParameter("coursemeeting2");
	    String courseMeeting3 = request.getParameter("coursemeeting3");

		String courseYear = request.getParameter("year");
		
		Boolean courseAv = true;
		
		String insert = "INSERT INTO offered(cid, section, semester, yr, available, pid)"
				+ "VALUES (?, ?, ?, ?, ?, ?)";
		
		PreparedStatement ps = con.prepareStatement(insert);

		ps.setString(1, (courseID));
		ps.setInt(2, Integer.valueOf((courseSection)));
		ps.setString(3, courseSemester);
		ps.setInt(4,Integer.valueOf((courseYear)));
		ps.setBoolean(5, courseAv);
		ps.setInt(6, Integer.valueOf((professorID)));
		
		ps.executeUpdate();
		
		
if (!courseMeeting1.isEmpty()){
	
	String insert1 = "INSERT INTO meetings(cid, section, semester, yr, meeting)"
			+ "VALUES (?, ?, ?, ?, ?)";
	

	PreparedStatement ps1 = con.prepareStatement(insert1);
	ps1.setString(1, (courseID));
	ps1.setInt(2, Integer.valueOf((courseSection)));
	ps1.setString(3, courseSemester);
	ps1.setInt(4,Integer.valueOf((courseYear)));
	ps1.setString(5, courseMeeting1);
	ps1.executeUpdate();
		
}
		
if (!courseMeeting2.isEmpty()){
			
			String insert2 = "INSERT INTO meetings(cid, section, semester, yr, meeting)"
					+ "VALUES (?, ?, ?, ?, ?)";
			

			PreparedStatement ps2 = con.prepareStatement(insert2);
			ps2.setString(1, (courseID));
			ps2.setInt(2, Integer.valueOf((courseSection)));
			ps2.setString(3, courseSemester);
			ps2.setInt(4,Integer.valueOf((courseYear)));
			ps2.setString(5, courseMeeting2);
			ps2.executeUpdate();
				
		}
			


if (!courseMeeting3.isEmpty()){
	
	String insert3 = "INSERT INTO meetings(cid, section, semester, yr, meeting)"
			+ "VALUES (?, ?, ?, ?, ?)";
	

	PreparedStatement ps3 = con.prepareStatement(insert3);
	ps3.setString(1, (courseID));
	ps3.setInt(2, Integer.valueOf((courseSection)));
	ps3.setString(3, courseSemester);
	ps3.setInt(4,Integer.valueOf((courseYear)));
	ps3.setString(5, courseMeeting3);
	ps3.executeUpdate();
		
}


PreparedStatement mystatement = con.prepareCall("{call update_availability }");

mystatement.execute();

con.close();
out.println("Course successfully added to Semester!");

		
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>
</body>
</html>