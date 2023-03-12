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

		String courseid = request.getParameter("courseid");
		String studentid = request.getParameter("studentid");
		String semester = request.getParameter("semester");
		String year = request.getParameter("year");
		String grade = request.getParameter("studentgradeincourse");
		String section = request.getParameter("coursesection");
		
		
		PreparedStatement mystatement = con.prepareCall("{call section_enrollment(?,?,?,?) }");
		
		mystatement.setString(1,semester);
		mystatement.setInt(2,Integer.valueOf(year));
		mystatement.setString(3,(courseid));
		mystatement.setInt(4,Integer.valueOf(section));
		
		
		ResultSet result = mystatement.executeQuery();
		
		
		if (result.next()){
			
			
			PreparedStatement mystatement2 = con.prepareCall("{call assign_grade(?,?,?,?,?,?) }");
			
			mystatement2.setString(1,(courseid));
			
			mystatement2.setInt(2,Integer.valueOf(section));

			mystatement2.setString(3,semester);
			
			mystatement2.setInt(4,Integer.valueOf(year));
			
			mystatement2.setInt(5,Integer.valueOf(studentid));
			
			mystatement2.setString(6,grade);
			
			mystatement2.executeUpdate();
			
			out.println("Grade of student updated!");


			con.close();


			
		}else{
			
			
			out.println("Student doesn't exist in section "+section+" or is not enrolled in class "+"courseid for the current year and semester");
					
			con.close();

		}


		
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>
</body>
</html>