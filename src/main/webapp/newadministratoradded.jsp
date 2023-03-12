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

		String administratorID = request.getParameter("administratorid");
		String administratorPassword = request.getParameter("administratorpassword");
		
		String insert = "INSERT INTO users(id, password, name, phone, dob, office)"
				+ "VALUES (?, ?, null, null, null, null)";
		
		PreparedStatement ps = con.prepareStatement(insert);

		ps.setInt(1, Integer.valueOf((administratorID)));
		ps.setString(2, administratorPassword);

		ps.executeUpdate();
		
		con.close();
		out.print("Administrator added!");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>
</body>
</html>