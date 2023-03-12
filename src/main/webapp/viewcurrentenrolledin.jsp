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

            
        String entity = request.getParameter("studentusername");
        
   
        
        PreparedStatement mystatement = con.prepareCall("{call student_enrolledin(?) }");
            mystatement.setString(1,entity);
    

        ResultSet result = mystatement.executeQuery();
            
        
        
            
        if (result.next()){
        	

    		out.print("[Course ID : "+result.getString(1)+"]");
            out.print( " [Course Section  : "+result.getString(2)+"]");
            out.print( " [Professor  : "+result.getString(3)+"]");
            out.print( " [Grade :  "+result.getString(4)+"]");
            out.print( " [Schedule : "+result.getString(5)+"]");
            out.print( " [Semester : "+result.getString(6)+"]");
            out.print( " [Year : "+result.getString(7)+"]");

        	
			out.println("<br>");

        	
        	while (result.next()){
        		
        		
        		out.print("[Course ID : "+result.getString(1)+"]");
                out.print( " [Course Section  : "+result.getString(2)+"]");
                out.print( " [Professor  : "+result.getString(3)+"]");
                out.print( " [Grade :  "+result.getString(4)+"]");
                out.print( " [Schedule : "+result.getString(5)+"]");
                out.print( " [Semester : "+result.getString(6)+"]");
                out.print( " [Year : "+result.getString(7)+"]");

                
    			out.println("<br>");


        		
        		
        	}
        
            
        con.close();
        
    }else{
    	
    	
    	out.print("There are currently no classes you can register for");
        con.close();

    }
    }catch (Exception ex) {
        out.print(ex);
        out.print("insert failed");
    }
%>
</body>
</html>