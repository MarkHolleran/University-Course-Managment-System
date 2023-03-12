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

		String professorID = request.getParameter("professorid");
		String professorPassword = request.getParameter("professorpassword");
		String professorName = request.getParameter("professorname");
		String professorPhoneNumber = request.getParameter("professorphonenumber");
		
		String professorOfficeNumber = request.getParameter("professorofficenumber");
		
		String insert = "INSERT INTO users(id, password, name, phone, dob, office)"
				+ "VALUES (?, ?, ?, ?, null, ?)";
		
		PreparedStatement ps = con.prepareStatement(insert);


		ps.setInt(1, Integer.valueOf((professorID)));
		ps.setString(2, professorPassword);
		ps.setString(3, professorName);
		ps.setString(4, professorPhoneNumber);
		ps.setInt(5, Integer.valueOf((professorOfficeNumber)));

		ps.executeUpdate();
		
		con.close();
		out.print("Professor added!");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>
</body>
</html>