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

        ApplicationDB db = new ApplicationDB();    
        Connection con = db.getConnection();

            
        
   
        
        PreparedStatement mystatement = con.prepareCall("{call get_prereqs() }");
    
        ResultSet result = mystatement.executeQuery();
            
        
        
            
        if (result.next()){
        	

    		out.print("[Department : "+result.getString(1)+"]");
            out.print( " [Course ID  : "+result.getString(2)+"]");
            out.print( " [PreReqs  : "+result.getString(3)+"]");
          
        	
			out.println("<br>");

        	
        	while (result.next()){
        		
        		
        		out.print("[Department : "+result.getString(1)+"]");
                out.print( " [Course ID  : "+result.getString(2)+"]");
                out.print( " [PreReqs  : "+result.getString(3)+"]");
                
                
    			out.println("<br>");


        		
        		
        	}
        
            
        con.close();
        
    }else{
    	
    	
    	out.print("There are currently no prereqs for any course");
        con.close();

    }

%>
</body>
</html>