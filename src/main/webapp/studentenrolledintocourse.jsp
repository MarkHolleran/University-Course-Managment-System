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
	
	<%try {

		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		
		Statement stmt = con.createStatement();

			
		String studentusername = request.getParameter("studentusername");
		String courseid = request.getParameter("courseid");
		
		
		String coursesection = request.getParameter("coursesection");
		
		
		
		PreparedStatement mystatement = con.prepareCall("{call get_semester() }");
		
	
		
		
		

		ResultSet result = mystatement.executeQuery();
		
		if (result.next()){
			
			
			String coursesemester = result.getString(1);
		

			int year = result.getInt(2);
			
		
			
			
			

		
		
		
		
		
		
		
		String insert = "INSERT INTO enrollment(cid, section, semester, yr, sid, grade)"
				+ "VALUES (?, ?, ?, ?, ?, null)";
		
		
		PreparedStatement ps = con.prepareStatement(insert);
		
		ps.setString(1, courseid);
		
		ps.setInt(2, Integer.valueOf(coursesection));
		ps.setString(3, coursesemester);
		ps.setInt(4, year);
		


		ps.setInt(5, Integer.valueOf(studentusername));
		

		ps.executeUpdate();
		
		
		out.println("Course registered!");
			
			

		con.close();
		}
	
	}catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>
</body>
</html>