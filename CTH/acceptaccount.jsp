<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Untitled Document</title>
</head>

<body>
<%

 try {
				       Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
					   Connection con = DriverManager.getConnection("Jdbc:Odbc:cth");
					   java.sql.Statement stmt = con.createStatement();
					   stmt.executeUpdate("update students set status='Confirm' where sid="+request.getParameter("id")+"");	
					   con.close();			  
					   response.sendRedirect("newstdaccount.jsp");
					   }
					   catch(Exception e)
					   {
					   out.println(e);
					   }
					   %>
</body>
</html>
