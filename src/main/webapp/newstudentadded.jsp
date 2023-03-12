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

		//Get parameters from the HTML form at the index.jsp
		String studentID = request.getParameter("studentid");
		String studentPassword = request.getParameter("studentpassword");
		String studentName = request.getParameter("studentname");
		String studentPhoneNumber = request.getParameter("studentphonenumber");
	    String studentBirthDate = request.getParameter("studentbirthdate");
	    
		java.text.SimpleDateFormat sdf1 = new java.text.SimpleDateFormat("yyyy-MM-dd");
		java.util.Date studentBirthDateObject = sdf1.parse(studentBirthDate);
		java.sql.Date sqlDate = new java.sql.Date(studentBirthDateObject.getTime());

		String insert = "INSERT INTO users(id, password, name, phone, dob, office)"
				+ "VALUES (?, ?, ?, ?, ?, null)";
		
		PreparedStatement ps = con.prepareStatement(insert);

		ps.setInt(1, Integer.valueOf((studentID)));
		ps.setString(2, studentPassword);
		ps.setString(3, studentName);
		ps.setString(4, studentPhoneNumber);
		ps.setDate(5,sqlDate);
		
		ps.executeUpdate();
		
		con.close();
		out.print("new Student added!");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>
</body>
</html>